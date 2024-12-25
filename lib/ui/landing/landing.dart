import 'package:expense_tracker/app/route.dart';
import 'package:expense_tracker/core/manager/color_manager.dart';
import 'package:expense_tracker/ui/landing/controller/landing_controller.dart';
import 'package:expense_tracker/ui/reminders/reminder.dart';
import 'package:expense_tracker/ui/savings/savings.dart';
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
                  icon: SvgPicture.asset(data.landingObjects[index].icon,
                  color: (data.currenIndex == index) ? ColorManager.primary : ColorManager.grey8,
                  ),
                  label: data.landingObjects[index].name)),
        ),
        floatingActionButton: (data.currenIndex == 0 || data.currenIndex == data.length - 1)
            ? null
            : InkWell(
                onTap: () {
                  if (data.view is SavingsScreen) {
                    Navigator.pushNamed(context, RouteManager.addgoal);
                  }
                  if (data.view is ReminderScreen) {
                    Navigator.pushNamed(context, RouteManager.addreminder);
                  }
                },
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          ColorManager.primaryLight1,
                          ColorManager.primary,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        stops: const [.1, .7]),
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Icon(
                    Icons.add,
                    color: ColorManager.white,
                  ),
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );
    });
  }
}
