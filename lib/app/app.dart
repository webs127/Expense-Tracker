import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static MyApp instance = const MyApp._internal();
  factory MyApp() => instance;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}