import 'package:expense_tracker/core/models/notification_model.dart';
import 'package:expense_tracker/services/service.dart';
import 'package:flutter/material.dart';

class NotificationController with ChangeNotifier {
  late DatabaseHelper _databaseHelper;

  NotificationController() {
    _databaseHelper = DatabaseHelper();
  }
  //insert
  void insertNotification(NotificationModel notificationModel) async {
    await _databaseHelper.insertNotification(notificationModel.toJson());
    notifyListeners();
  }

  //get
  Future<List<NotificationModel>> getNotifications() async {
    List<Map<String, dynamic>> notifications =
        await _databaseHelper.getAllNotifications();
    List<NotificationModel> notificationList =
        notifications.map((data) => NotificationModel.fromJson(data)).toList();
    return notificationList;
  }

  //delete
  void deleteNotification(NotificationModel notification) async {
    await _databaseHelper.deleteNotification(notification.id!);
    notifyListeners();
  }
}
