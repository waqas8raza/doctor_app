import 'package:doctor_app/utils/constants/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget profileContainer(
    {String? image,
    String? headingText,
    String? subHeading,
    required double height}) {
  return Container(
    height: height,
    width: 100.w,
    decoration: const BoxDecoration(
      color: Color.fromARGB(255, 231, 246, 238),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          CircleAvatar(
            radius: 12.h,
            foregroundImage: const AssetImage('assets/doctor.jpg'),
          ),
          const Text(
            'Mr Ahmad',
            style: AppTextStyles.heading2,
          ),
          const Text(
            'Doctor of heartd',
            style: AppTextStyles.bodyRegular,
          ),
          SizedBox(
            height: 2.h,
          ),
        ],
      ),
    ),
  );
}
