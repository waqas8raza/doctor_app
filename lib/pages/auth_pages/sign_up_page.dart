import 'package:doctor_app/controllers/auth/register_controller.dart';
import 'package:doctor_app/utils/constants/text_style_constant.dart';
import 'package:doctor_app/utils/form_validator.dart';
import 'package:doctor_app/utils/widgets/app_button.dart';
import 'package:doctor_app/utils/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/widgets/app_stackWidget.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final controller = Get.put(RegisterController());

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
                color: const Color.fromARGB(255, 230, 229, 229)
                    .withOpacity(0.9)
                    .withOpacity(0.5),
                image: const DecorationImage(
                    image: AssetImage(
                      'assets/login.jpg',
                    ),
                    fit: BoxFit.contain)),
            child: SizedBox(
              height: 10.h,
              width: 30.w,
              child: Padding(
                padding: EdgeInsets.only(left: 22.px),
                child: const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Hello \nSignUp',
                    style: AppTextStyles.heading1,
                  ),
                ),
              ),
            ),
          ),
          subWidget: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
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
                        controller: controller.emailController.value,
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
                        controller: controller.passwordController.value,
                        hintText: 'Password'),
                    SizedBox(
                      height: 5.h,
                    ),
                    Center(
                        child: AppButton(
                            buttonText: 'SignUp',
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                controller.registerUser();
                              }
                            }))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
