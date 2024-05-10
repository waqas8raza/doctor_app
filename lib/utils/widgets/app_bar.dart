import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? actionIcon;
  final VoidCallback? onActionPressed;

  const MyAppBar({
    Key? key,
    required this.title,
    this.actionIcon,
    this.onActionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 231, 246, 238),
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: const Icon(Icons.keyboard_arrow_left_outlined),
      ),
      title: Center(child: Text(title)), // Centered title
      actions: <Widget>[
        IconButton(
          icon: Icon(actionIcon),
          onPressed: onActionPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
