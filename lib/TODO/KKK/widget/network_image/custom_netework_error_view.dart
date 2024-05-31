import 'package:flutter_bet/generated/l10n.dart';
import 'package:flutter_bet/widget/button/custom_small_mian_button.dart';
import 'package:flutter_bet/widget/button/custom_big_main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:lottie/lottie.dart';

class CustomNetWorkErrorView extends StatelessWidget {
  const CustomNetWorkErrorView(
      {Key? key,
      this.width,
      this.height,
      this.alignment = Alignment.center,
      this.color,
      this.onPressed,
      this.themeData})
      : super(key: key);
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Color? color;
  final VoidCallback? onPressed;
  final ThemeData? themeData;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final deaultTheme = themeData ?? ThemeService().theme;
    return Center(
      child: Container(
        width: width,
        height: height,
        alignment: alignment,
        decoration: BoxDecoration(color: color),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/refresh_error.json',
              repeat: true,
              reverse: true,
              animate: true,
              width: 200,
              height: 180,
            ),
            Text(
              "",
              style: deaultTheme.textTheme.bodySmall,
            ),
            Text("", style: deaultTheme.textTheme.bodySmall),
            const SizedBox(
              height: AppValues.defaultPadding,
            ),
            CustomSmallMainButton(
              width: 100,
              title: S.current.random_text_726,
              //controller.onErrorPageNext()
              onTap: () {
                if (onPressed != null) {
                  onPressed!();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
