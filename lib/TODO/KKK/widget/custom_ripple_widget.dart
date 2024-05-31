import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/constant/app_values.dart';

enum CustomRippleStyle {
  ///带默认圆角的矩形
  boundedRectangle,

  ///矩形
  rectangle,

  ///两端半圆
  stadium,

  ///圆
  circle,
}

class CustomRippleWidget extends StatelessWidget {
  final GestureTapCallback? onTap;

  ///overlayColor可以自定义水波纹颜色
  final MaterialStateProperty<Color?>? overlayColor;
  final Widget? child;

  ///水波纹风格，目前有normal（带默认圆角的矩形）矩形、两端半圆、圆
  final CustomRippleStyle? style;

  ///如果你的child是一个不规则widget按钮，建议使用customBorder
  ///优先级customBorder > style
  final ShapeBorder? customBorder;

  const CustomRippleWidget(
      {super.key,
      this.onTap,
      this.overlayColor,
      this.child,
      this.style = CustomRippleStyle.rectangle,
      this.customBorder});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultOverlayColor =
        overlayColor ?? MaterialStateProperty.all(AppThemes.rippleColor);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        overlayColor: defaultOverlayColor,
        customBorder: customBorder ?? _getBorder(),
        child: child,
      ),
    );
  }

  ShapeBorder _getBorder() {
    if (style == CustomRippleStyle.stadium) {
      return const StadiumBorder();
    } else if (style == CustomRippleStyle.circle) {
      return const CircleBorder();
    } else if (style == CustomRippleStyle.boundedRectangle) {
      return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppValues.defaultRadius));
    }
    return const RoundedRectangleBorder();
  }
}
