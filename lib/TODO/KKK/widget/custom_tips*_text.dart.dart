import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_bet/widget/custom_text.dart';

enum CustomAsterisksTipsOrientationStyle {
  left,
  right,
}

///带有星号提示文本且*为红色 金额*
class CustomAsterisksTipsText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final CustomAsterisksTipsOrientationStyle asterisksTipsOrientationStyle;

  const CustomAsterisksTipsText(
      {super.key,
      required this.text,
      this.textStyle,
      this.asterisksTipsOrientationStyle = CustomAsterisksTipsOrientationStyle.right});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomAsterisksTipsOrientationStyle.right == asterisksTipsOrientationStyle
        ? Row(
            children: [
              CustomText(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textStyle ??
                    ThemeService().textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                textColorStyle: CustomTextColorStyle.normal,
              ),
              Baseline(
                baseline: 16,
                baselineType: TextBaseline.ideographic,
                child: CustomText(
                  "\t*",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: ThemeService()
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500, color: AppThemes.reverseStateColor),
                ),
              )
            ],
          )
        : Row(
            children: [
              Baseline(
                baseline: 16,
                baselineType: TextBaseline.ideographic,
                child: CustomText(
                  "*\t",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: ThemeService()
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w500, color: AppThemes.reverseStateColor),
                ),
              ),
              CustomText(
                text,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textStyle ??
                    ThemeService().textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                textColorStyle: CustomTextColorStyle.normal,
              ),
            ],
          );
  }
}
