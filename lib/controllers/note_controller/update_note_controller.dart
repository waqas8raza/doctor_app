// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:doctor_app/models/add_note_model.dart';
// import 'package:get/get.dart';

// import 'get_note_controller.dart';

// class UpdateNoteController extends GetxController {
//   final FirebaseFirestore firebase = FirebaseFirestore.instance;

//   Future updateNote(AddNote note) async {
//     try {
//       final querySnapshot = await firebase
//           .collection('notes')
//           .where("id", isEqualTo: note.id)
//           .get();

//       if (querySnapshot.docs.isEmpty) {
//         return Get.snackbar('Error', 'Note not found');
//       }

//       final docRef = querySnapshot.docs.first.reference;

//       await docRef.update(note.toJson());
//       Get.snackbar('Success', 'Successfully Updated');
//       Get.find<GetNoteController>().update();
//     } catch (e) {
//       return Get.snackbar('Error', e.toString());
//     }
//   }
// }
