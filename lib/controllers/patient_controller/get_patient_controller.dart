import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/add_patient_model.dart';
import '../../pages/bottom_navigation_bar_pages/bottom_navigation_bar_page.dart';

class PatientController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  VoidCallback? onPatientUpdated;

  // Future<List<PatientData>> getAllPatients() async {
  //   try {
  //     final querySnapshot = await _firestore.collection('patients').get();
  //     return querySnapshot.docs.map((doc) {
  //       return PatientData.fromJson(doc.data() as Map<String, dynamic>);
  //     }).toList();
  //   } catch (e) {
  //     print('Error fetching patients: $e');
  //     return [];
  //   }
  // }
  Stream<QuerySnapshot<Map<String, dynamic>>> getPatientsStream() {
    return _firestore.collection('patients').snapshots();
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
      await document.reference.delete().then((_) {
        Get.snackbar('Success', 'Patient deleted');
        Get.to(() => BottomNavBarPage());
      });
      update();
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete patient: $e');
    }
  }

  Future updatePatient(PatientData patient) async {
    try {
      final querySnapshot = await _firestore
          .collection('patients') // Replace with your collection name
          .where('id', isEqualTo: patient.id)
          .get();

      if (querySnapshot.docs.isEmpty) {
        return Get.snackbar('Error', 'Note not found');
      }

      final docRef = querySnapshot.docs.first.reference;

      await docRef.update(patient.toJson());
      Get.snackbar('Success', 'Successfully Updated');
      //await getAllPatients();

      //  Get.back();
    } catch (e) {
      return Get.snackbar('Error', e.toString());
    }
  }
}
