import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData? actionIcon;
  final Widget? leadingWidget;
  final VoidCallback? onActionPressed;

  const MyAppBar({
    Key? key,
    required this.title,
    this.actionIcon,
    this.leadingWidget,
    this.onActionPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 231, 246, 238),
      leading: leadingWidget,
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
