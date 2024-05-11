import 'package:doctor_app/pages/bottom_navigation_bar_pages/bottom_navigation_bar_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/patient_controller/add_patient_controller.dart';
import '../../models/add_patient_model.dart';
import '../../utils/constants/text_style_constant.dart';
import '../../utils/widgets/app_bar.dart';
import '../../utils/widgets/app_button.dart';

// ignore: must_be_immutable
class PatientDetailsPage extends StatelessWidget {
  PatientData patient;

  final firebaseService = Get.put(FirebaseService());

  PatientDetailsPage({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 246, 238),
      appBar: const MyAppBar(title: 'Patient Details'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Personal Details',
                      style: AppTextStyles.bodyBold,
                    ),
                    Text(
                      'ID: ${patient.id}',
                      style: AppTextStyles.caption,
                    ),
                    Card(
                      color: Colors.white,
                      elevation: 3,
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 6.h,
                          backgroundImage:
                              const AssetImage('assets/doctor.jpg'),
                        ),
                        title: Text(
                          patient.patientName!,
                          style: AppTextStyles.bodyBold,
                        ),
                        subtitle: Text(
                          patient.sessionFor!,
                          style: AppTextStyles.bodyRegular,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Session appointment package:',
                      style: AppTextStyles.bodyBold,
                    ),
                    Card(
                      color: Colors.white,
                      elevation: 3,
                      child: ListTile(
                        leading: const Icon(Icons.timer),
                        title: Text(
                          'Date: ${patient.date}',
                          style: AppTextStyles.bodyBold,
                        ),
                        trailing: Text(
                          'Time: ${patient.time}',
                          style: AppTextStyles.bodyBold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Card(
                      color: Colors.white,
                      elevation: 3,
                      child: ListTile(
                        leading: const Text(
                          'Package',
                          style: AppTextStyles.bodyBold,
                        ),
                        trailing: Text(
                          '${patient.packageType}',
                          style: AppTextStyles.bodyBold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8.0),
              AppButton(
                buttonText: 'Save',
                onPressed: () {
                  firebaseService.addPatientData(patient);
                  Get.offAll(() => BottomNavBarPage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
