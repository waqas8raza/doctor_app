import 'package:doctor_app/utils/constants/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget appContainer(
    {String? heding,
    String? subheading,
    IconData? editIcon,
    String? date,
    String? time,
    Widget? widget,
    IconData? deleteIcons}) {
  return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 18.h,
        width: 90.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 20.w,
                    child: CircleAvatar(
                      radius: 4.h,
                      foregroundImage: const AssetImage('assets/doctor.jpg'),
                    ),
                  ),
                  SizedBox(
                    width: 50.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          heding!,
                          // 'Mr Ahmad',
                          style: AppTextStyles.bodyBold,
                        ),
                        Text(
                          subheading!,
                          style: AppTextStyles.bodyRegular,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  widget!
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.timer),
                  const Text(
                    'Wed',
                    style: AppTextStyles.bodyRegular,
                  ),
                  Text(
                    date!,
                    style: AppTextStyles.bodyRegular,
                  ),
                  Text(
                    time!,
                    style: AppTextStyles.bodyRegular,
                  ),
                  const Text(
                    'ID:122233',
                    style: AppTextStyles.caption,
                  ),
                ],
              ),
              // SizedBox(
              //   height: 0.2.h,
              // )
            ],
          ),
        ),
      ));
}
