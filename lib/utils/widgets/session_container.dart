import 'package:doctor_app/utils/constants/color_constant.dart';
import 'package:doctor_app/utils/constants/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget sessionContainer({
  String? image,
  String? headingText,
  String? subHeading,
  String? status = '',
  String? time,
}) {
  return Container(
    height: 45.h,
    width: 90.w,
    decoration: BoxDecoration(
        color: AppColors.buttonColor, borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 2.h,
          ),
          Text(
            status!,
            style: AppTextStyles.heading2,
          ),
          SizedBox(
            height: 2.h,
          ),
          CircleAvatar(
            radius: 8.h,
            foregroundImage: const AssetImage('assets/doctor.jpg'),
          ),
          Text(
            headingText!,
            style: AppTextStyles.heading2,
          ),
          Text(
            subHeading!,
            style: AppTextStyles.bodyRegular,
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.timer),
              SizedBox(
                width: 2.w,
              ),
              Text(
                '$time min',
                style: AppTextStyles.heading2,
              )
            ],
          )
        ],
      ),
    ),
  );
}
