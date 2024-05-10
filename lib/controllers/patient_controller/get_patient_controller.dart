import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../models/add_patient_model.dart';

class PatientController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//RxList<PatientData> PatientData=[].obs;

  Future<List<PatientData>> getAllPatients() async {
    try {
      final querySnapshot = await _firestore.collection('patients').get();
      return querySnapshot.docs.map((doc) {
        return PatientData.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    } catch (e) {
      print('Error fetching patients: $e');
      return []; // Return empty list on error
    }
  }

  Future<void> deletePatient(String patientId) async {
    try {
      final querySnapshot = await _firestore
          .collection('patients')
          .where('id', isEqualTo: patientId)
          .get();

      if (querySnapshot.docs.isEmpty) {
        Get.snackbar('Error', 'Patient with ID $patientId not found');
        return;
      }

      final document = querySnapshot.docs.first;
      await document.reference
          .delete()
          .then((_) => Get.snackbar('Success', 'Patient deleted'));
      update();
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete patient: $e');
    }
  }

  Future updatePatient(PatientData patient) async {
    try {
      // Query documents where the "note.id" field matches the provided ID
      final querySnapshot = await _firestore
          .collection('patients') // Replace with your collection name
          .where('id', isEqualTo: patient.id)
          .get();

      if (querySnapshot.docs.isEmpty) {
        // Handle the case where no document is found with the provided note ID
        return Get.snackbar('Error', 'Note not found');
      }

      // Get the document reference from the first doc (assuming unique note IDs)
      final docRef = querySnapshot.docs.first.reference;

      // Update the document with the new data
      await docRef.update(patient.toJson());
      Get.snackbar('Success', 'Successfully Updated');
    } catch (e) {
      return Get.snackbar('Error', e.toString());
    }
  }
}
