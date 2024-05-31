import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/constant/app_values.dart';

class CustomAppBarTheme {
  static AppBarTheme defaultTheme({required ColorScheme colorScheme}) {
    final defaultTheme = const AppBarTheme().copyWith(
      backgroundColor: colorScheme.background,
      titleTextStyle: TextStyle(
          color: colorScheme.onBackground,
          fontSize: AppValues.fontTitleMediumSize),
      elevation: AppValues.customAppBarElevation,
      shadowColor: AppThemes.appBarShadowColor,
      iconTheme: IconThemeData(color: colorScheme.onBackground),
    );
    return defaultTheme;
  }
}
