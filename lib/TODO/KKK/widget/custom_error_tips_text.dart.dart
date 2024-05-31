import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_bet/widget/custom_icon.dart';
import 'package:flutter_bet/widget/custom_text.dart';

class CustomErrorTipsText extends StatelessWidget {
  final String text;
  final double iconSize;
  final TextStyle? textStyle;
  const CustomErrorTipsText(
      {super.key, required this.text, this.iconSize = 20,this.textStyle});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
         CustomIcon(
          asset: 'assets/images/normal/ic_text_filed_error.png',
          size: iconSize,
          color: AppThemes.errorColor,
        ),
        const SizedBox(
          width: 4,
        ),
        Expanded(
          child: CustomText(
            text,
            style: textStyle ?? ThemeService().textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: ThemeService().colorScheme.error),
          ),
        ),
      ],
    );
  }
}
