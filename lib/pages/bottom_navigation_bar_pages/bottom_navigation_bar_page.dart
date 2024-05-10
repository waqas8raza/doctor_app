import 'package:doctor_app/pages/bottom_navigation_bar_pages/home_page.dart';
import 'package:doctor_app/pages/bottom_navigation_bar_pages/profile_page.dart';
import 'package:doctor_app/pages/bottom_navigation_bar_pages/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarPage extends StatelessWidget {
  final BottomNavBarController controller = Get.put(BottomNavBarController());

  final List<Widget> screens = [
    const HomePage(),
    ToDoPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) => controller.changeTabIndex(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarController extends GetxController {
  final currentIndex = 0.obs;

  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
}
