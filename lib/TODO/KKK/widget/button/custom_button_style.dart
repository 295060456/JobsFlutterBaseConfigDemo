import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';

enum CustomButtonColorStyle {
  normal,
  secondary,
  secondaryIcon,
  tertiary, //绿色
  login,
  transparent,
}

extension CustomTextColorStyleExtension on CustomButtonColorStyle {
  Color get backgroundColor {
    Color color = Colors.blue;
    switch (this) {
      case CustomButtonColorStyle.normal:
        color = ThemeService().colorScheme.primary;
        break;
      case CustomButtonColorStyle.secondary:
        color = ThemeService().colorScheme.secondary;
        break;
      case CustomButtonColorStyle.tertiary:
        color = ThemeService().colorScheme.primaryContainer;
        break;
      case CustomButtonColorStyle.secondaryIcon:
        color = AppThemes.secondaryIconColor;
        break;
      case CustomButtonColorStyle.login:
        color = AppThemes.reverseStateColor;
        break;
      case CustomButtonColorStyle.transparent:
        color = Colors.transparent;
        break;
    }
    return color;
  }

  Color get textColor {
    Color color = Colors.white;
    if (this == CustomButtonColorStyle.tertiary) {
      color = ThemeService().colorScheme.onInverseSurface;
    } else {
      color = ThemeService().colorScheme.inverseSurface;
    }
    return color;
  }
}
