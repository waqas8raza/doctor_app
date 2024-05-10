import 'package:doctor_app/pages/auth_pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  Future registerUser() async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.value.text,
              password: passwordController.value.text)
          .then((value) {
        Get.snackbar('Success', 'User registerd successfully');
        Get.to(() => LoginPAge());
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
