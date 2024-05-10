import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/models/add_note_model.dart';
import 'package:get/get.dart';

import 'get_note_controller.dart';

class AddNoteController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addPatientNote(AddNote addNote) async {
    try {
      await _firestore.collection('notes').add(addNote.toJson()).then((value) {
        Get.snackbar('Note', 'Note added');

        Get.find<GetNoteController>().notes.add(addNote);
        update();
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
