import 'package:doctor_app/pages/auth_pages/login_page.dart';
import 'package:doctor_app/utils/widgets/app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/constants/text_style_constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 231, 246, 238),
        appBar: MyAppBar(
          title: 'Profile,',
          actionIcon: Icons.logout_outlined,
          onActionPressed: () async {
            await FirebaseAuth.instance.signOut().whenComplete(() {
              Get.snackbar('Logout', 'User logout successfully');
              Get.to(() => LoginPAge());
            });
          },
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 5.h,
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
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.tealAccent),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Padding(
                    padding:
                        EdgeInsets.only(top: 2.0, left: 5, right: 5, bottom: 2),
                    child: Text(
                      'Availablity: 8:00 to 9:00',
                      style: AppTextStyles.bodyRegular,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      'About',
                      style: AppTextStyles.bodyBold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // border: Border.all(color: Colors.tealAccent),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          'My name is Taylor, and Im an adaptable and experienced Therapist. I have 10 years of experience managing hospital operations to ensure that patients and their families receive comprehensive care and support.',
                          style: AppTextStyles.caption,
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      textAlign: TextAlign.left,
                      'Sessions',
                      style: AppTextStyles.bodyBold,
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    session_contianer_eidget(
                      text: '300\ncompleted',
                    ),
                    session_contianer_eidget(
                      text: 'Today\n7',
                    ),
                    session_contianer_eidget(
                      text: '29\nPending',
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class session_contianer_eidget extends StatelessWidget {
  final String text;
  const session_contianer_eidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: 25.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          textAlign: TextAlign.center,
          text,
          style: AppTextStyles.bodyRegular,
        )),
      ),
    );
  }
}
