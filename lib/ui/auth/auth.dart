import 'package:expense_tracker/ui/auth/controller/auth_controller.dart';
import 'package:expense_tracker/ui/auth/login/login.dart';
import 'package:expense_tracker/ui/auth/register/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var state = context.watch<AuthController>();
    return (state.state) ? const LoginScreen() : const RegisterScreen();
  }
}
