import 'package:flutter/material.dart';

extension HexColor on Color {
  static Color hexString(String color) {
    color = color.replaceAll("#", "");
    if(color.length == 6) {
      color = "FF$color";
    }
    return Color(int.parse(color, radix: 16));
  }
}

class ColorManager {
  static Color black = HexColor.hexString("#000000");
  static Color white = HexColor.hexString("#ffffff");
  static Color primary = HexColor.hexString("#0E33F3");
  static Color primaryLight1 = HexColor.hexString("#2FDAFF");
  static Color primaryLight = HexColor.hexString("#A0CCF8");
  static Color primaryDark = HexColor.hexString("#57A4F2");
  static Color grey2 = HexColor.hexString("#EBEEF0");
  static Color grey5 = HexColor.hexString("#F5F6F7");
  static Color grey6 = HexColor.hexString("#DCDFE3");
  static Color grey7 = HexColor.hexString("#9BA1A8");
  static Color grey8 = HexColor.hexString("#B0B8BF");
  static Color grey3 = HexColor.hexString("#707070");
  static Color grey4 = HexColor.hexString("#6B7580");
  static Color dark = HexColor.hexString("#242D35");
  static Color error = HexColor.hexString("#EF4E4E");
}