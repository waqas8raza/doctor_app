import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../models/add_patient_model.dart';

class FirebaseService extends GetxService {
  RxBool isLoading = false.obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addPatientData(PatientData patient) async {
    try {
      await _firestore
          .collection('patients')
          .add(patient.toJson())
          .then((value) => Get.snackbar('Success', 'Patient added '));
      // print('Patient data added successfully');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future updatePatientStatus(String id, String newStatus) async {
    try {
      // Query documents where the "patientName" field matches the provided name
      final querySnapshot = await _firestore
          .collection('patients')
          .where('id', isEqualTo: id)
          .get();

      if (querySnapshot.docs.isEmpty) {
        // Handle the case where no document is found with the provided patient name
        return Get.snackbar('Error', 'Patient not found');
      }

      // Get the document reference from the first doc (assuming unique patient names)
      final docRef = querySnapshot.docs.first.reference;

      // Update the "status" field to "completed"
      await docRef.update({'status': newStatus});
      Get.snackbar('Success', 'Patient status updated');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
