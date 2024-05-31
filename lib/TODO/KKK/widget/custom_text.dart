import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show TextHeightBehavior;

enum CustomTextColorStyle {
  ///默认暗合模式明亮模式自适应的方案
  normal,

  ///白天模式字体是黑色的,暗黑模式字体白色
  panda,
  dark,
  white,
  error,
  primary,
  secondary,
  grey,
  lightGrey,
  orange,
  ffd9d9d,
  tertiaryColor,
  green,
  blue,
  lightDarkText,
}

extension CustomTextColorStyleExtension on CustomTextColorStyle {
  Color? get value {
    final colorScheme = ThemeService().colorScheme;
    Color? textColor;
    switch (this) {
      case CustomTextColorStyle.tertiaryColor:
        textColor = const Color(0xFF2F4553);
        break;
      case CustomTextColorStyle.lightDarkText:
        textColor = const Color(0xFF353535);
        break;
      case CustomTextColorStyle.normal:
        textColor = colorScheme.onSurface;
        break;
      case CustomTextColorStyle.white:
        textColor = AppThemes.textColorWhite;
        break;
      case CustomTextColorStyle.dark:
        textColor = AppThemes.textColorDark;
        break;
      case CustomTextColorStyle.grey:
        textColor = AppThemes.textColorGrey;
        break;
      case CustomTextColorStyle.lightGrey:
        textColor = AppThemes.textColorLightGrey;
        break;
      case CustomTextColorStyle.primary:
        textColor = colorScheme.primary;
        break;
      case CustomTextColorStyle.secondary:
        textColor = AppThemes.textColorSecondary;
        break;
      case CustomTextColorStyle.panda:
        textColor =
            (ThemeService.instance.isDarkMode) ? AppThemes.textColorWhite : AppThemes.textColorDark;
        break;
      case CustomTextColorStyle.orange:
        textColor = (ThemeService.instance.isDarkMode)
            ? AppThemes.scoreTextColor
            : AppThemes.scoreTextColor;
        break;
      case CustomTextColorStyle.error:
        textColor = colorScheme.error;
        break;
      case CustomTextColorStyle.ffd9d9d:
        textColor = AppThemes.ffd9d9d9;
        break;
      case CustomTextColorStyle.green:
        textColor = AppThemes.primaryContainer;
        break;
      case CustomTextColorStyle.blue:
        textColor = ThemeService().colorScheme.primary;
        break;
      default:
        textColor =
            (ThemeService.instance.isDarkMode) ? AppThemes.textColorWhite : AppThemes.textColorDark;
    }
    return textColor;
  }
}

class CustomText extends StatelessWidget {
  const CustomText(
    this.data, {
    super.key,
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.selectionColor,
    this.textTheme,
    this.textColorStyle,
  });

  final String data;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final ui.TextHeightBehavior? textHeightBehavior;
  final Color? selectionColor;
  final TextTheme? textTheme;
  final CustomTextColorStyle? textColorStyle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultTextTheme = textTheme ?? ThemeService().theme.textTheme;
    return Text(
      data,
      style: _getTextStyle(defaultTextTheme),
      strutStyle: strutStyle,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      textScaleFactor: textScaleFactor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
      selectionColor: selectionColor,
    );
  }

  TextStyle? _getTextStyle(TextTheme textTheme) {
    final defaultTextStyle = style ?? textTheme.bodyMedium;
    if (textColorStyle != null) {
      Color? textColor;
      textColor = textColorStyle!.value;
      return defaultTextStyle?.copyWith(color: textColor!);
    }
    return defaultTextStyle;
  }
}
