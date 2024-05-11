import 'package:doctor_app/controllers/note_controller/get_note_controller.dart';
import 'package:doctor_app/models/add_note_model.dart';
import 'package:doctor_app/pages/bottom_navigation_bar_pages/add_note_page.dart';
import 'package:doctor_app/utils/constants/text_style_constant.dart';
import 'package:doctor_app/utils/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToDoPage extends StatelessWidget {
  final getNoteController = Get.put(GetNoteController());

  final List<String> buttonTexts = ['All', 'Critical', 'Normal', 'Urgent'];
  final RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 246, 238),
      appBar: MyAppBar(
        title: 'Notes',
        actionIcon: Icons.add,
        onActionPressed: () {
          Get.to(AddNewNotePage());
        },
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < buttonTexts.length; i++)
                Expanded(
                  child: Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: ElevatedButton(
                        onPressed: () {
                          selectedIndex.value = i;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedIndex.value == i
                              ? getButtonColor(i)
                              : Colors.white,
                          foregroundColor: selectedIndex.value == i
                              ? Colors.white
                              : Colors.blue,
                          side: BorderSide(
                            color: selectedIndex.value == i
                                ? getBorderColor(i)
                                : Colors.blue,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          buttonTexts[i],
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Obx(
              () {
                RxList<AddNote>? notes = getNoteController.notes;

                if (notes == null || notes.isEmpty) {
                  return const Center(
                    child: Text('No notes found.'),
                  );
                }

                final filteredNotes = selectedIndex.value == 0
                    ? notes // Show all notes
                    : notes
                        .where((note) =>
                            note.priority == buttonTexts[selectedIndex.value])
                        .toList();

                return ListView.builder(
                  itemCount: filteredNotes.length,
                  itemBuilder: (context, index) {
                    final note = filteredNotes[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16, top: 6, bottom: 6),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.greenAccent,
                                    ),
                                    child: Text(
                                      note.priority,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Get.to(
                                              () => AddNewNotePage(note: note));
                                        },
                                        icon: const Icon(Icons.edit),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Get.defaultDialog(
                                              backgroundColor:
                                                  Colors.greenAccent,
                                              content: const Text(
                                                  'Note will be permanantly deleted'),
                                              title: 'Do you want to delete?',
                                              onConfirm: () {
                                                getNoteController.deleteNote(
                                                    notes[index].id);

                                                notes.removeWhere((patient) =>
                                                    patient.id ==
                                                    notes[index].id);
                                                Get.back();
                                              },
                                              onCancel: () {
                                                Get.back();
                                              },
                                            );
                                          },
                                          icon: const Icon(Icons.delete))
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                note.patientName,
                                style: AppTextStyles.heading2,
                              ),
                              Text(
                                note.description,
                                style: AppTextStyles.bodyRegular,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color getButtonColor(int index) {
    switch (index) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.red;
      case 2:
        return Colors.green;
      case 3:
        return Colors.yellow;
      default:
        return Colors.white;
    }
  }

  Color getTextColor(int index) {
    return index == selectedIndex.value ? Colors.white : Colors.blue;
  }

  Color getBorderColor(int index) {
    return index == selectedIndex.value ? Colors.transparent : Colors.blue;
  }

  Color getPriorityColor(String priority) {
    switch (priority) {
      case 'Critical':
        return Colors.red;
      case 'Normal':
        return Colors.green;
      case 'Urgent':
        return Colors.yellow;
      default:
        return Colors.blue;
    }
  }
}
