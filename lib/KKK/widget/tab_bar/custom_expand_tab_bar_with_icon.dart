import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';

import 'button_tabbar.dart';
import 'covered_tabbar_with_icon.dart';

class CustomExpandTabBarWithIcon extends StatelessWidget {
  const CustomExpandTabBarWithIcon({
    super.key,
    required this.tabs,
    this.labeStyle,
    this.unselectedLabelStyle,
    this.backgroundColor,
    this.unselectedBackgroundColor,
    this.radius,
    this.height,
    this.tabController,
    this.buttonMargin = const EdgeInsets.all(4),
    this.contentPadding,
  });

  final List<Tab> tabs;
  final TextStyle? labeStyle;
  final TextStyle? unselectedLabelStyle;
  final Color? backgroundColor;
  final Color? unselectedBackgroundColor;
  final double? radius;
  final double? height;
  final TabController? tabController;
  final EdgeInsets buttonMargin;
  final EdgeInsets? contentPadding;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = ThemeService().theme.textTheme;

    return CoveredTabBarWithIcon(
      height: height ?? 60,
      controller: tabController,
      contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor:
      backgroundColor ?? ThemeService().theme.colorScheme.primary,
      unselectedBackgroundColor:
      unselectedBackgroundColor ?? Colors.transparent,
      labelStyle: labeStyle ?? textTheme.titleMedium,
      unselectedLabelStyle: unselectedLabelStyle ?? textTheme.titleMedium,
      radius: radius ?? 100,
      tabs: tabs,
      buttonMargin: this.buttonMargin,
    );
  }
}
