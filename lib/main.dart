import 'package:expense_tracker/app/app.dart';
import 'package:expense_tracker/services/notification_manager.dart';
import 'package:expense_tracker/services/service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().database;
  await NotificationManager.initializeNotifications();
  runApp(MyApp());
}
