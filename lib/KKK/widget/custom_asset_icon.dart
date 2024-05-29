import 'package:flutter/material.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';

class CustomAssetIcon extends StatelessWidget {
  final String name;
  final double? size;
  final IconThemeData? iconThemeData;
  final BoxFit? boxFit;
  final Color? color;
  final double? width; //兼容只有size 的弊端
  final double? height; //兼容只有size 的弊端

  const CustomAssetIcon({
    super.key,
    required this.name,
    this.size,
    this.iconThemeData,
    this.boxFit,
    this.color,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    final defaultIconTheme = iconThemeData ?? ThemeService().theme.iconTheme;
    if (width != null || height != null) {
      return Image.asset(
        name,
        width: width,
        height: height,
        fit: boxFit ?? BoxFit.contain,
        color: color,
      );
    } else {
      //什么情况返回该view
      return Image.asset(
        name,
        width: size ?? defaultIconTheme?.size,
        height: size ?? defaultIconTheme?.size,
        fit: boxFit ?? BoxFit.contain,
        color: color,
      );
    }
  }
}
