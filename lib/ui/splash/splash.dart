import 'package:expense_tracker/app/route.dart';
import 'package:expense_tracker/core/manager/image_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void start() {
    Future.delayed(const Duration(seconds: 1), nextPage);
  }

  void nextPage() {
    Navigator.pushReplacementNamed(context, RouteManager.onboarding);
  }

  @override
  void initState() {
    super.initState();
    start();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(ImageManager.applogo),
      ),
    );
  }
}