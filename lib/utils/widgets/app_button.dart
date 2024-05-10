import 'package:doctor_app/utils/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final IconData? icon;
  final VoidCallback? onPressed;

  const AppButton({
    super.key,
    required this.buttonText,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 30.w, // Adjust the width as needed
        height: 6.h, // Adjust the height as needed
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(25.0), // Adjust the border radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null ? Icon(icon) : SizedBox(),
              // SizedBox(
              //   width: 3.w,
              // ),
              Text(
                buttonText,
                style: const TextStyle(
                  color: AppColors.buttonTextColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
