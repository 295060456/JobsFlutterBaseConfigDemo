import 'package:flutter/material.dart';

import 'constant/app_themes.dart';
import 'constant/app_values.dart';

class CustomBottomNavigationBarThemeData {
  static BottomNavigationBarThemeData defaultTheme(
      {required ColorScheme colorScheme}) {
    final defaultTheme = const BottomNavigationBarThemeData().copyWith(
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: AppThemes.iconColor,
      selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: colorScheme.onBackground,
          fontSize: AppValues.fontBodyMediumSize),
      unselectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: colorScheme.onBackground,
          fontSize: AppValues.fontBodyMediumSize),
    );
    return defaultTheme;
  }
}
