import 'package:doctor_app/pages/auth_pages/login_page.dart';
import 'package:doctor_app/pages/auth_pages/sign_up_page.dart';
import 'package:doctor_app/utils/widgets/profile_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../utils/widgets/app_button.dart';
import '../utils/widgets/app_stackWidget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AppStack(
      position: 70.h,
      height: 30.h,
      width: 100.w,
      topWidget: profileContainer(height: 100.h),
      subWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AppButton(
            // icon: Icons.login,
            buttonText: 'Login',
            onPressed: () {
              Get.to(() => LoginPAge());
            },
          ),
          AppButton(
            //  icon: Icons.person_2_outlined,
            buttonText: 'Register',
            onPressed: () {
              Get.to(() => SignUpPage());
            },
          ),
        ],
      ),
    ));
  }
}
