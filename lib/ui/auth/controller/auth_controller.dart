import 'package:expense_tracker/core/models/user_model.dart';
import 'package:expense_tracker/services/service.dart';
import 'package:flutter/material.dart';

class AuthController with ChangeNotifier {
  bool state = true;
  late DatabaseHelper _databaseHelper;
  late TextEditingController username;
  late TextEditingController password;
  late TextEditingController confirmPassword;
  late TextEditingController email;
  late TextEditingController age;
  late TextEditingController gender;
  late GlobalKey<FormState> key;

  void changeSatate() {
    state = !state;
    notifyListeners();
  }

  AuthController() {
    _databaseHelper = DatabaseHelper();
    username = TextEditingController();
    password = TextEditingController();
    email = TextEditingController();
    age = TextEditingController();
    key = GlobalKey<FormState>();
    gender = TextEditingController();
    confirmPassword = TextEditingController();
  }

  //insert
  void insertUser(UserModel userModel) async {
    await _databaseHelper.insertUser(userModel.toJson());
    notifyListeners();
  }

  //get
  Future<List<UserModel>> getUsers({int? limit}) async {
    List<Map<String, dynamic>> users = await _databaseHelper.getAllUsers();
    List<UserModel> usersList =
        users.map((data) => UserModel.fromJson(data)).toList();
    return usersList;
  }

  //update
  void updateUser(UserModel userModel) async {
    await _databaseHelper.updateUser(userModel.toJson());
    notifyListeners();
  }

  //delete
  void deleteUser(UserModel userModel) async {
    await _databaseHelper.deleteUser(userModel.id!);
    notifyListeners();
  }

  void validateUser() async {
    if (!key.currentState!.validate()) {
    } else {
      UserModel userModel = UserModel(
          username: username.text,
          password: password.text,
          email: email.text,
          age: int.parse(age.text),
          gender: gender.text);
          print(userModel.toString());
      insertUser(userModel);
    }
    notifyListeners();
  }
}
