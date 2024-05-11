import 'package:doctor_app/pages/auth_pages/login_page.dart';
import 'package:doctor_app/pages/bottom_navigation_bar_pages/bottom_navigation_bar_page.dart';
import 'package:doctor_app/pages/splash_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationCheckerPage extends StatelessWidget {
  const AuthenticationCheckerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator if authentication state is loading
          return const CircularProgressIndicator();
        }

        if (snapshot.hasData && snapshot.data != null) {
          // User is authenticated, navigate to home screen
          return BottomNavBarPage();
        } else {
          // User is not authenticated, navigate to login screen
          return const SplashPage();
        }
      },
    );
  }
}
