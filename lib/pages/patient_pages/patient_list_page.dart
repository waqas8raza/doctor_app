import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/controllers/patient_controller/get_patient_controller.dart';
import 'package:doctor_app/pages/patient_pages/add_patient_page.dart';
import 'package:doctor_app/utils/widgets/app_bar.dart';
import 'package:doctor_app/utils/widgets/app_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/add_patient_model.dart';

class PatientLiatPage extends StatelessWidget {
  PatientLiatPage({super.key});

  final patientController = Get.put(PatientController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 231, 246, 238),
      appBar: const MyAppBar(
        title: 'Patients List',
        actionIcon: Icons.edit,
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: patientController.getPatientsStream(), // Use the stream
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error fetching patients: ${snapshot.error}');
            return const Center(child: Text('Error fetching patients'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No patients found'));
          }

          final patients = snapshot.data!.docs.map((doc) {
            return PatientData.fromJson(doc.data() as Map<String, dynamic>);
          }).toList();

          return ListView.builder(
            itemCount: patients.length,
            itemBuilder: (context, index) {
              final data = patients[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: appContainer(
                  subheading: data.sessionFor,
                  time: data.time,
                  date: data.date,
                  widget: data.status == 'Completed'
                      ? const Text(
                          'Done',
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        )
                      : Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.to(AddPatientPage(
                                  patient: PatientData(
                                    id: data.id,
                                    patientName: data.patientName,
                                    date: data.date,
                                    time: data.time,
                                    sessionTime: data.sessionTime,
                                    sessionFor: data.sessionFor,
                                  ),
                                ));
                              },
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.defaultDialog(
                                  backgroundColor: Colors.greenAccent,
                                  content: const Text(
                                      'Patient will be permanently deleted'),
                                  title: 'Do you want to delete?',
                                  onConfirm: () {
                                    patientController.deletePatient(data.id!);
                                    // No need to remove from local list as the stream will update it
                                    Get.back();
                                  },
                                  onCancel: () => Get.back(),
                                );
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                  heding: data.patientName,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
