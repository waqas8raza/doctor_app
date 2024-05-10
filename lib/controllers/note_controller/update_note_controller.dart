import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/models/add_note_model.dart';
import 'package:get/get.dart';

class UpdateNoteController extends GetxController {
  final FirebaseFirestore firebase = FirebaseFirestore.instance;

  Future updateNote(AddNote note) async {
    try {
      // Query documents where the "note.id" field matches the provided ID
      final querySnapshot = await firebase
          .collection('notes') // Replace with your collection name
          .where("id", isEqualTo: note.id)
          .get();

      if (querySnapshot.docs.isEmpty) {
        // Handle the case where no document is found with the provided note ID
        return Get.snackbar('Error', 'Note not found');
      }

      // Get the document reference from the first doc (assuming unique note IDs)
      final docRef = querySnapshot.docs.first.reference;

      // Update the document with the new data
      await docRef.update(note.toJson());
      Get.snackbar('Success', 'Successfully Updated');
    } catch (e) {
      return Get.snackbar('Error', e.toString());
    }
  }
}
