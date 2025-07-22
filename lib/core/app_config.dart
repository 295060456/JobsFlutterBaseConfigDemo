import 'package:flutter/material.dart';

class AppConfig {
  static const Size designSize = Size(1125, 2436); // iPhone 14 Pro
}

TextStyle normalTextStyle({
  double fontSize = 16,
  Color color = Colors.yellow,
  FontWeight fontWeight = FontWeight.normal,
}) =>
    TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      decoration: TextDecoration.none,
    );
