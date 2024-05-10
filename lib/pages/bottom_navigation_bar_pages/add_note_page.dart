import 'package:doctor_app/controllers/note_controller/add_note_controller.dart';
import 'package:doctor_app/controllers/note_controller/update_note_controller.dart';
import 'package:doctor_app/models/add_note_model.dart';
import 'package:doctor_app/utils/constants/text_style_constant.dart';
import 'package:doctor_app/utils/widgets/app_bar.dart';
import 'package:doctor_app/utils/widgets/app_button.dart';
import 'package:doctor_app/utils/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:uuid/uuid.dart';

// ignore: must_be_immutable
class AddNewNotePage extends StatelessWidget {
  final AddNote? note;
  AddNewNotePage({super.key, this.note});

  final updateNoteController = Get.put(UpdateNoteController());

  final noteController = Get.put(AddNoteController());
  String value = '';
  final List<String> buttonTexts = ['Critical', 'Normal', 'Urgent'];
  final RxInt selectedIndex = 0.obs;

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  Uuid uuid = Uuid();
  @override
  Widget build(BuildContext context) {
    nameController.text = note == null ? '' : note!.patientName;
    descriptionController.text = note == null ? '' : note!.description;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 246, 238),
      appBar: MyAppBar(
        title: note == null ? 'New Note' : 'Update Note',
        actionIcon: Icons.delete_outline,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextFormField(
                controller: nameController,
                hintText: 'Topic Name',
              ),
              SizedBox(
                height: 2.h,
              ),
              AppTextFormField(
                controller: descriptionController,
                maxLines: 10,
                hintText: 'Start Writing',
              ),
              const Text(
                'Priority',
                style: AppTextStyles.heading2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 0; i < buttonTexts.length; i++)
                    Expanded(
                      child: Obx(
                        () => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              selectedIndex.value = i;
                              value = buttonTexts[selectedIndex.value];
                              print(value);
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
                                    ? Colors.transparent
                                    : Colors.blue,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: Text(buttonTexts[i]),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: AppButton(
                  buttonText: note == null ? 'Save' : 'Update',
                  onPressed: () {
                    if (note != null) {
                      updateNoteController.updateNote(AddNote(
                          id: note!.id,
                          patientName: nameController.text,
                          description: descriptionController.text,
                          priority: value));
                    } else {
                      noteController.addPatientNote(AddNote(
                          id: uuid.v1(),
                          patientName: nameController.text,
                          description: descriptionController.text,
                          priority: value));
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Color getButtonColor(int index) {
    switch (index) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.blue;
      case 2:
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
