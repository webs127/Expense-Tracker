import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final double width;
  final double height;
  final Gradient? gradient;
  final Widget child;
  final Color? color;
  const CustomCircleAvatar({
    super.key,
    required this.width,
    required this.height,
    this.gradient,
    required this.child,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: gradient,
            color: color,
          ),
          child: Center(child: child),
        ));
  }
}
