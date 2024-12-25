import 'package:expense_tracker/core/models/goal_model.dart';
import 'package:expense_tracker/core/models/notification_model.dart';
import 'package:expense_tracker/services/notification_manager.dart';
import 'package:expense_tracker/services/service.dart';
import 'package:expense_tracker/ui/notification/controller/notification_controller.dart';
import 'package:flutter/material.dart';

class SavingsController with ChangeNotifier {
  late DatabaseHelper _databaseHelper;
  late TextEditingController title;
  late TextEditingController savedAmount;
  late TextEditingController targetAmount;
  late TextEditingController type;
  late TextEditingController deadline;
  late GlobalKey<FormState> key;
  late NotificationController _notification;

  SavingsController() {
    _databaseHelper = DatabaseHelper();
    title = TextEditingController();
    savedAmount = TextEditingController();
    targetAmount = TextEditingController();
    type = TextEditingController();
    key = GlobalKey<FormState>();
    deadline = TextEditingController();
    _notification = NotificationController();
  }

  //insert
  void insertGoal(GoalModel goalModel) async {
    await _databaseHelper.insertGoal(goalModel.toJson());
    notifyListeners();
  }

  //get
  Future<List<GoalModel>> getGoals({int? limit}) async {
    List<Map<String, dynamic>> goals =
        await _databaseHelper.getGoals(limit: limit);
    List<GoalModel> goalsList =
        goals.map((data) => GoalModel.fromJson(data)).toList();
    return goalsList;
  }

  //update
  void updateGoal(GoalModel goalModel) async {
    await _databaseHelper.updateGoal(goalModel.toJson());
    notifyListeners();
  }

  //delete
  void deleteGoal(GoalModel goalModel) async {
    await _databaseHelper.deleteGoal(goalModel.id!);
    notifyListeners();
  }

  //validate
  void validateinsert() async {
    if (!key.currentState!.validate()) {
    } else {
      GoalModel goalModel = GoalModel(
          title: title.text,
          savedAmount: double.parse(savedAmount.text),
          targetAmount: double.parse(targetAmount.text),
          type: type.text,
          deadline: deadline.text);
      DateTime dateTime = DateTime.now();
      NotificationModel notificationModel = NotificationModel(
          title: title.text,
          type: title.text,
          timestamp: "${dateTime.month}/${dateTime.day}/${dateTime.year}");
      insertGoal(goalModel);
      _notification.insertNotification(notificationModel);

      await NotificationManager.createNotification(
          id: goalModel.id ?? 1,
          title: "Savings",
          body:
              "You have successfully saved \$${goalModel.savedAmount} for ${goalModel.title}");
    }
    notifyListeners();
  }
}
