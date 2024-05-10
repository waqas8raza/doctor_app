import 'package:doctor_app/pages/bottom_navigation_bar_pages/bottom_navigation_bar_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginContoller extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final auth = FirebaseAuth.instance;

  Future loginUser() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: emailController.value.text,
              password: passwordController.value.text)
          .then((value) {
        Get.snackbar('Success', 'User login successfully');
        Get.offAll(() => BottomNavBarPage());
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
