import 'package:flutter/material.dart';

class AppTextStyles {
  // Base font family (customize as per your app's design)
  static const String _fontFamily = 'Inter';

  // Regular Text Style
  static const TextStyle regular = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w400, // Regular weight
    color: Colors.black,
  );

  // Medium Text Style
  static const TextStyle medium = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w500, // Medium weight
    color: Colors.black,
  );

  // Bold Text Style
  static const TextStyle semiBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w600, // Bold weight
    color: Colors.black,
  );

  // Bold Text Style
  static const TextStyle bold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w700, // Bold weight
    color: Colors.black,
  );

  // Extra Bold Text Style
  static const TextStyle extraBold = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w800, // Extra Bold weight
    color: Colors.black,
  );

  // Light Text Style
  static const TextStyle light = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w300, // Light weight
    color: Colors.black,
  );

  // Dynamic Text Style Generator
  static TextStyle custom({
    double fontSize = 16.0,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
    double letterSpacing = 0.0,
  }) {
    return TextStyle(
      fontFamily: _fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
    );
  }
}
