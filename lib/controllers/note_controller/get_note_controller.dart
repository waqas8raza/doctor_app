import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../models/add_note_model.dart';

class GetNoteController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxList<AddNote> notes = <AddNote>[].obs;

  Future<void> getAllNotes() async {
    try {
      final querySnapshot = await _firestore.collection('notes').get();

      final fetchedNotes = querySnapshot.docs.map((doc) {
        return AddNote.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      notes.value = fetchedNotes; // Update directly using value
    } catch (e) {
      // Handle errors gracefully
      print('Error fetching notes: $e');
    }
  }

  Future<void> updateNote(AddNote note) async {
    try {
      final querySnapshot = await _firestore
          .collection('notes')
          .where("id", isEqualTo: note.id)
          .get();

      if (querySnapshot.docs.isEmpty) {
        Get.snackbar('Error', 'Note not found');
        return;
      }

      final docRef = querySnapshot.docs.first.reference;

      await docRef.update(note.toJson());
      Get.snackbar('Success', 'Successfully Updated');

      // Update the local list efficiently
      final index =
          notes.indexWhere((existingNote) => existingNote.id == note.id);
      if (index != -1) {
        notes[index] = note; // Update the specific note in the list
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> deleteNote(String noteId) async {
    try {
      final querySnapshot = await _firestore
          .collection('notes')
          .where('id', isEqualTo: noteId)
          .get();

      if (querySnapshot.docs.isEmpty) {
        Get.snackbar('Error', 'Note with ID $noteId not found');
        return;
      }

      final document = querySnapshot.docs.first;
      await document.reference.delete().then((_) {
        Get.snackbar('Success', 'Note deleted');
        notes.removeWhere((note) => note.id == noteId); // Remove from list
        Get.back(); // Navigate back if needed
      });
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete note: $e');
    }
  }
}
