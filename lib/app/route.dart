import 'package:expense_tracker/core/models/goal_model.dart';
import 'package:expense_tracker/ui/auth/auth.dart';
import 'package:expense_tracker/ui/auth/forgotpassword/forgot_password.dart';
import 'package:expense_tracker/ui/auth/login/login.dart';
import 'package:expense_tracker/ui/auth/register/register.dart';
import 'package:expense_tracker/ui/landing/landing.dart';
import 'package:expense_tracker/ui/notification/notification.dart';
import 'package:expense_tracker/ui/onboarding/onboarding.dart';
import 'package:expense_tracker/ui/overview/add_expense.dart';
import 'package:expense_tracker/ui/overview/entries.dart';
import 'package:expense_tracker/ui/overview/expense.dart';
import 'package:expense_tracker/ui/overview/overview.dart';
import 'package:expense_tracker/ui/reminders/add_reminder.dart';
import 'package:expense_tracker/ui/reminders/reminder.dart';
import 'package:expense_tracker/ui/savings/addgoal.dart';
import 'package:expense_tracker/ui/savings/goals.dart';
import 'package:expense_tracker/ui/savings/savings.dart';
import 'package:expense_tracker/ui/savings/updategoal.dart';
import 'package:expense_tracker/ui/splash/splash.dart';
import 'package:flutter/material.dart';

class RouteManager {
  static const String splash = "/";
  static const String onboarding = "/onboarding";
  static const String auth = "/auth";
  static const String login = "/auth/login";
  static const String register = "/auth/register";
  static const String forgotPassword = "/forgotPassword";
  static const String landing = "/landing";
  static const String overview = "/overview";
  static const String expense = "/overview/expense";
  static const String entries = "/overview/entries";
  static const String addexpense = "/overview/expense/add";
  static const String savings = "/savings";
  static const String goals = "/savings/goals";
  static const String addgoal = "/savings/addgoal";
  static const String updategoal = "/savings/updategoal";
  static const String notifications = "/notifications";
  static const String reminders = "/reminders";
  static const String addreminder = "/reminders/addreminder";
}

class Routes {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteManager.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RouteManager.onboarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case RouteManager.auth:
        return MaterialPageRoute(builder: (_) => const AuthenticationScreen());
      case RouteManager.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RouteManager.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case RouteManager.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());
      case RouteManager.landing:
        return MaterialPageRoute(builder: (_) => const LandingScreen());
      case RouteManager.overview:
        return MaterialPageRoute(builder: (_) => const OverViewScreen());
      case RouteManager.savings:
        return MaterialPageRoute(builder: (_) => const SavingsScreen());
      case RouteManager.reminders:
        return MaterialPageRoute(builder: (_) => const ReminderScreen());
      case RouteManager.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case RouteManager.expense:
        return MaterialPageRoute(builder: (_) => const ExpenseScreen());
      case RouteManager.addexpense:
        return MaterialPageRoute(builder: (_) => const AddExpenseScreen());
      case RouteManager.entries:
        return MaterialPageRoute(builder: (_) => const EntriesScreen());
      case RouteManager.goals:
        return MaterialPageRoute(builder: (_) => const GoalsScreen());
      case RouteManager.addgoal:
        return MaterialPageRoute(builder: (_) => const AddGoalScreen());
      case RouteManager.addreminder:
        return MaterialPageRoute(builder: (_) => const AddReminderScreen());
      case RouteManager.updategoal:
        final goals = settings.arguments as GoalModel;
        return MaterialPageRoute(
          builder: (_) => UpdateGoalScreen(
            model: goals,
          ),
        );
      default:
        return undefined();
    }
  }

  static Route<dynamic> undefined() {
    return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
