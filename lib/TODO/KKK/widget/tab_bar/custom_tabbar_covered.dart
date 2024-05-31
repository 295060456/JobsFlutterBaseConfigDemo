import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_bet/widget/tab_bar/covered_tabbar.dart';

import 'button_tabbar.dart';

class CustomTabBarCoveredIcon extends StatelessWidget {
  const CustomTabBarCoveredIcon({
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
    this.sideMargin,
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
  final EdgeInsets? sideMargin;//整个组件最左右两边的边距,目的是给组件计算每个tab 需要分配多少

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = ThemeService().theme.textTheme;

    return CoveredTabBar(
      height: height ?? 60,
      controller: tabController,
      contentPadding: contentPadding?? const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor:
      backgroundColor ?? ThemeService().theme.colorScheme.primary,
      unselectedBackgroundColor:
      unselectedBackgroundColor ?? Colors.transparent,
      labelStyle: labeStyle ?? textTheme.titleMedium,
      unselectedLabelStyle: unselectedLabelStyle ?? textTheme.titleMedium,
      radius: radius ?? 100,
      tabs: tabs,
      buttonMargin: buttonMargin,
      sideMargin: sideMargin??const EdgeInsets.symmetric(horizontal: 32),
    );
  }
}
