import 'package:flutter/material.dart';

class AppStack extends StatelessWidget {
  final Widget? topWidget;
  final Widget? subWidget;
  final double? height;
  final double? width;
  final double? position;
  const AppStack(
      {super.key,
      this.subWidget,
      this.topWidget,
      this.height,
      this.width,
      this.position});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        topWidget!,
        Positioned(
          top: position,
          child: Container(
              height: height,
              width: width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: subWidget),
        )
      ],
    );
  }
}
