import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../models/add_note_model.dart';

class GetNoteController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<AddNote> notes = <AddNote>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllNotes();
  }

  Future<void> getAllNotes() async {
    try {
      final querySnapshot = await _firestore.collection('notes').get();

      List<AddNote> fetchedNotes = querySnapshot.docs.map((doc) {
        return AddNote.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      notes.assignAll(fetchedNotes);
    } catch (e) {
      //  print('Error fetching notes: $e');
    }
  }

  Future<void> deleteNote(String noteId) async {
    try {
      final querySnapshot = await _firestore
          .collection('notes')
          .where('id', isEqualTo: noteId)
          .get();

      if (querySnapshot.docs.isEmpty) {
        Get.snackbar('Error', 'Patient with ID $noteId not found');
        return;
      }

      final document = querySnapshot.docs.first;
      await document.reference
          .delete()
          .then((_) => Get.snackbar('Success', 'Note deleted'));
      update();
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete note: $e');
    }
  }
}
