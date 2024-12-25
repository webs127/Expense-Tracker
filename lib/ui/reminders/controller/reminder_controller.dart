import 'package:expense_tracker/core/models/notification_model.dart';
import 'package:expense_tracker/core/models/reminder_model.dart';
import 'package:expense_tracker/services/service.dart';
import 'package:expense_tracker/ui/notification/controller/notification_controller.dart';
import 'package:flutter/material.dart';

class ReminderController with ChangeNotifier {
  late DatabaseHelper _databaseHelper;
  late TextEditingController name;
  late TextEditingController dueDate;
  late TextEditingController reminderDate;
  late TextEditingController price;
  late GlobalKey<FormState> key;
  late NotificationController _notification;

  ReminderController() {
    _databaseHelper = DatabaseHelper();
    name = TextEditingController();
    dueDate = TextEditingController();
    reminderDate = TextEditingController();
    price = TextEditingController();
    key = GlobalKey<FormState>();
    _notification = NotificationController();
  }

  //insert
  void insertReminder(ReminderModel reminderModel) async {
    await _databaseHelper.insertReminder(reminderModel.toJson());
    notifyListeners();
  }

  //get
  Future<List<ReminderModel>> getReminders() async {
    List<Map<String, dynamic>> goals = await _databaseHelper.getReminders();
    List<ReminderModel> goalsList =
        goals.map((data) => ReminderModel.fromJson(data)).toList();
    return goalsList;
  }

  //delete
  void deleteReminder(ReminderModel reminderModel) async {
    await _databaseHelper.deleteReminder(reminderModel.id!);
    notifyListeners();
  }

  //validate
  void validateinsert() {
    if (!key.currentState!.validate()) {
    } else {
      ReminderModel reminderModel = ReminderModel(
        name: name.text,
        dueDate: dueDate.text,
        reminderDate: reminderDate.text,
        price: double.tryParse(price.text)!,
      );
      DateTime dateTime = DateTime.now();
      NotificationModel notificationModel = NotificationModel(
        title: name.text,
        type: name.text,
        timestamp: "${dateTime.month}/${dateTime.day}/${dateTime.year}"
      );
      insertReminder(reminderModel);
      _notification.insertNotification(notificationModel);
    }
    notifyListeners();
  }
}
