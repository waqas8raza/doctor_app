import 'package:doctor_app/models/add_patient_model.dart';
import 'package:doctor_app/pages/session_pages/session_timer_page.dart';
import 'package:doctor_app/utils/widgets/app_bar.dart';
import 'package:doctor_app/utils/widgets/app_button.dart';
import 'package:doctor_app/utils/widgets/session_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class SessionStartPage extends StatelessWidget {
  PatientData patient;

  SessionStartPage({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 246, 238),
      appBar: const MyAppBar(title: 'Start Session'),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            sessionContainer(
                time: patient.sessionTime.toString(),
                headingText: patient.patientName,
                subHeading: patient.sessionFor),
            SizedBox(
              height: 10.h,
            ),
            AppButton(
              buttonText: 'Start',
              onPressed: () => Get.to(() => SessionTimerPage(
                    name: patient.patientName!,
                    sessionFor: patient.sessionFor!,
                    id: patient.id!,
                    time: 5000,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
