import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/ui/landing/controller/landing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LandingController>(builder: (context, data, __) {
      return Scaffold(
        body: data.view,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorManager.white,
          elevation: 0,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ColorManager.primary,
          showUnselectedLabels: false,
          currentIndex: data.currenIndex,
          onTap: data.onTap,
          items: List.generate(
              data.length,
              (index) => BottomNavigationBarItem(
                  icon: SvgPicture.asset(data.landingObjects[index].icon),
                  label: data.landingObjects[index].name)),
        ),
        floatingActionButton: FloatingActionButton(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: BorderSide(color: ColorManager.primary)),
            backgroundColor: ColorManager.primary,
            child: Icon(
              Icons.add,
              color: ColorManager.white,
            ),
            onPressed: () {}),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
