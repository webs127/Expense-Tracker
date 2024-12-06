import 'package:flutter/material.dart';

class OverviewController with ChangeNotifier {
  List<EntryObject> entries = [
    EntryObject(name: "Total Salary", amount: 1244.38),
    EntryObject(name: "Total Expense", amount: 844.38),
    EntryObject(name: "Monthly Budget", amount: 3544.38)
  ];

  final List navs = [
    "Savings",
    "Remind",
    "Budget"
  ];
  int currentIndex = 0;
  int currentValue = 0;

  void onSelected(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void onchanged(int index) {
    currentValue = index;
    notifyListeners();
  }
}

class EntryObject {
  final String name;
  final double amount;

  EntryObject({required this.name, required this.amount});
  
}