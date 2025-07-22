import 'package:flutter/material.dart';

class AppConfig {
  static const Size designSize = Size(1125, 2436); // iPhone 14 Pro
}

TextStyle normalTextStyle({
  double fontSize = 16,
  Color color = Colors.blue,
  FontWeight fontWeight = FontWeight.normal,
}) =>
    TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      decoration: TextDecoration.none,
    );

void debugLog(Object? message) {
  final trace = StackTrace.current.toString().split('\n')[1];
  final location = trace.contains('(')
      ? trace.substring(trace.indexOf('('), trace.indexOf(')') + 1)
      : '';
  debugPrint('🧭 $location 👉 $message');
}
