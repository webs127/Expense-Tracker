import 'package:expense_tracker/core/manager/image_manager.dart';
import 'package:expense_tracker/ui/notification/notification.dart';
import 'package:expense_tracker/ui/overview/overview.dart';
import 'package:expense_tracker/ui/reminders/reminder.dart';
import 'package:expense_tracker/ui/savings/savings.dart';
import 'package:flutter/material.dart';

class LandingController with ChangeNotifier {
  final List<LandingObject> landingObjects = [
    LandingObject(view: const OverViewScreen(), icon: ImageManager.home, name: "Home"),
    LandingObject(view: const SavingsScreen(), icon: ImageManager.savings, name: "Savings"),
    LandingObject(
        view: const NotificationScreen(), icon: ImageManager.notification, name: "Notification"),
    LandingObject(view: const ReminderScreen(), icon: ImageManager.reminder, name: "Reminder"),

  ];

  int currenIndex = 0;
  int get length => landingObjects.length;

  Widget get view => landingObjects[currenIndex].view;

  void onTap(int index) {
    currenIndex = index;
    notifyListeners();
  }
}

class LandingObject {
  final Widget view;
  final String icon;
  final String name;

  LandingObject({required this.view, required this.icon, required this.name});
}
