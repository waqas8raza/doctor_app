import 'package:doctor_app/utils/constants/text_style_constant.dart';
import 'package:doctor_app/utils/widgets/app_bar.dart';
import 'package:doctor_app/utils/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 246, 238),
        appBar: const MyAppBar(title: 'Details'),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 20.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                      // image: DecorationImage(
                      //     image: AssetImage('assets/doctor.jpg'),
                      //     fit: BoxFit.cover),
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Device Descriptions',
                  style: AppTextStyles.heading2,
                ),
              ),
              Container(
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
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const AppButton(
                buttonText: 'Test Device',
                //  icon: Icons.text_snippet_sharp,
              )
            ],
          ),
        ));
  }
}
