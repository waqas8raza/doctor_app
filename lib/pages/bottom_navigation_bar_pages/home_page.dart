import 'package:doctor_app/pages/patient_pages/add_patient_page.dart';
import 'package:doctor_app/pages/patient_pages/details_page.dart';
import 'package:doctor_app/pages/patient_pages/patient_list_page.dart';
import 'package:doctor_app/pages/session_pages/session_page.dart';
import 'package:doctor_app/utils/constants/text_style_constant.dart';
import 'package:doctor_app/utils/widgets/app_bar.dart';
import 'package:doctor_app/utils/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 246, 238),
        appBar: const MyAppBar(title: 'Home'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25.h,
              width: 100.w,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 20.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/login.jpg'),
                              opacity: 0.9,
                              colorFilter: ColorFilter.mode(
                                  Color.fromARGB(255, 194, 238, 217),
                                  BlendMode.darken),
                              filterQuality: FilterQuality.low,
                              fit: BoxFit.cover),
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Positioned(
                      bottom: 2,
                      right: 5,
                      child: AppButton(
                        buttonText: 'Details',
                        icon: Icons.details_outlined,
                        onPressed: () {
                          Get.to(const DetailsPage());
                        },
                      ))
                ],
              ),
            ),
            const Text(
              'Patient',
              style: AppTextStyles.heading2,
            ),
            SizedBox(
              height: 25.h,
              width: 100.w,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 20.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                          // image: DecorationImage(
                          //     image: AssetImage('assets/doctor.jpg'),
                          //     fit: BoxFit.cover),
                          color: const Color.fromARGB(255, 209, 245, 221),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Total Sessions\n38',
                              style: AppTextStyles.bodyBold,
                            ),
                            Container(
                              height: 8.h,
                              width: 16.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage('assets/doctor.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 2,
                      right: 20,
                      left: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AppButton(
                            buttonText: 'Add',
                            icon: Icons.add_box_outlined,
                            onPressed: () => Get.to(AddPatientPage()),
                          ),
                          AppButton(
                            buttonText: 'View',
                            icon: Icons.view_array_rounded,
                            onPressed: () {
                              Get.to(PatientLiatPage());
                            },
                          ),
                        ],
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            AppButton(
                buttonText: 'TODO',
                icon: Icons.note_alt,
                onPressed: () => Get.to(SessionsPage()))
          ],
        ));
  }
}
