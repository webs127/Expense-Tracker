import 'package:expense_tracker/core/models/expense_model.dart';
import 'package:expense_tracker/core/models/notification_model.dart';
import 'package:expense_tracker/services/service.dart';
import 'package:expense_tracker/ui/notification/controller/notification_controller.dart';
import 'package:flutter/material.dart';

class ExpenseController with ChangeNotifier {
  late DatabaseHelper _databaseHelper;
  late TextEditingController name;
  late TextEditingController category;
  late TextEditingController amount;
  late TextEditingController date;
  late TextEditingController paymentMethod;
  late GlobalKey<FormState> key;
  late NotificationController _notification;

  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay = DateTime.now();

  ExpenseController() {
    _databaseHelper = DatabaseHelper();
    name = TextEditingController();
    amount = TextEditingController();
    category = TextEditingController();
    date = TextEditingController();
    key = GlobalKey<FormState>();
    paymentMethod = TextEditingController();
    _notification = NotificationController();
  }

  void onDaySelected(DateTime date1, DateTime date2) {
    selectedDay = date1;
    focusedDay = date2;
    notifyListeners();
  }

  //insert
  void insertExpense(ExpenseModel expenseModel) async {
    await _databaseHelper.insertExpense(expenseModel.toJson());
    notifyListeners();
  }

  //get
  Future<List<ExpenseModel>> getExpenses() async {
    List<Map<String, dynamic>> expenses =
        await _databaseHelper.getAllExpenses();
    List<ExpenseModel> expensesList =
        expenses.map((data) => ExpenseModel.fromJson(data)).toList();
    return expensesList;
  }

  //Get Total Expected Expenses
  Future<double> getTotal() => _databaseHelper.getTotalExpenses();

  //update
  void updateExpense(ExpenseModel expenseModel) async {
    await _databaseHelper.updateExpense(expenseModel.toJson());
    notifyListeners();
  }

  //delete
  void deleteExpense(ExpenseModel expenseModel) async {
    await _databaseHelper.deleteExpense(expenseModel.id!);
    notifyListeners();
  }

  //validate
  void validateinsert() {
    if (!key.currentState!.validate()) {
    } else {
      ExpenseModel expenseModel = ExpenseModel(
          name: name.text,
          category: category.text,
          amount: double.parse(amount.text),
          date: date.text =
              "${selectedDay!.month}/${selectedDay!.day}/${selectedDay!.year}",
          paymentMethod: paymentMethod.text);
      DateTime dateTime = DateTime.now();
      NotificationModel notificationModel = NotificationModel(
          title: name.text,
          type: name.text,
          timestamp: "${dateTime.month}/${dateTime.day}/${dateTime.year}");
      insertExpense(expenseModel);
      _notification.insertNotification(notificationModel);
    }
    notifyListeners();
  }
}
