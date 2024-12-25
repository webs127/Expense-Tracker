import 'package:expense_tracker/app/route.dart';
import 'package:expense_tracker/ui/auth/controller/auth_controller.dart';
import 'package:expense_tracker/ui/landing/controller/landing_controller.dart';
import 'package:expense_tracker/ui/notification/controller/notification_controller.dart';
import 'package:expense_tracker/ui/onboarding/controller/onboarding_controller.dart';
import 'package:expense_tracker/ui/overview/controller/expense_controller.dart';
import 'package:expense_tracker/ui/overview/controller/overview_controller.dart';
import 'package:expense_tracker/ui/reminders/controller/reminder_controller.dart';
import 'package:expense_tracker/ui/savings/controller/savings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static MyApp instance = const MyApp._internal();
  factory MyApp() => instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OnboardingController()),
        ChangeNotifierProvider(create: (_) => LandingController()),
        ChangeNotifierProvider(create: (_) => OverviewController()),
        ChangeNotifierProvider(create: (_) => SavingsController()),
        ChangeNotifierProvider(create: (_) => ReminderController()),
        ChangeNotifierProvider(create: (_) => ExpenseController()),
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => NotificationController()),
      ],
      child: const MaterialApp(
        onGenerateRoute: Routes.getRoute,
        title: "Monex",
        initialRoute: RouteManager.splash,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}