import 'package:doctor_app/controllers/auth/login_controller.dart';
import 'package:doctor_app/utils/constants/text_style_constant.dart';
import 'package:doctor_app/utils/form_validator.dart';
import 'package:doctor_app/utils/widgets/app_button.dart';
import 'package:doctor_app/utils/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/widgets/app_stackWidget.dart';

class LoginPAge extends StatelessWidget {
  LoginPAge({super.key});
  final loginContoller = Get.put(LoginContoller());

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 229, 229),
      body: SizedBox(
        height: 100.h,
        child: AppStack(
          position: 28.h,
          height: 70.h,
          width: 100.w,
          topWidget: Container(
            height: 30.h,
            width: 100.w,
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 23, 20, 20)
                    .withOpacity(0.9)
                    .withOpacity(0.5),
                image: const DecorationImage(
                    image: AssetImage(
                      'assets/login.jpg',
                    ),
                    fit: BoxFit.cover)),
          ),
          subWidget: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.greenAccent,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Email',
                          style: AppTextStyles.bodyRegular,
                        ),
                      ),
                      AppTextFormField(
                          validator: AppValidators.validateEmail,
                          controller: loginContoller.emailController.value,
                          hintText: 'Email'),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Password',
                          style: AppTextStyles.bodyRegular,
                        ),
                      ),
                      AppTextFormField(
                          validator: AppValidators.validatePassword,
                          controller: loginContoller.passwordController.value,
                          hintText: 'Password'),
                      SizedBox(
                        height: 5.h,
                      ),
                      Center(
                          child: AppButton(
                              buttonText: 'Login',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  loginContoller.loginUser();
                                }
                              }))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
