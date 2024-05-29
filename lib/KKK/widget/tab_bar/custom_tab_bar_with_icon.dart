import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';

import 'button_tabbar.dart';

class CustomTabBarWithIcon extends StatelessWidget {
  const CustomTabBarWithIcon({
    super.key,
    required this.tabs,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.backgroundColor,
    this.unselectedBackgroundColor,
    this.radius,
    this.height,
    this.tabController,
    this.buttonMargin = const EdgeInsets.all(4),
    this.contentPadding,
    this.onTap,
    this.isSport,
    this.isLogin,
    this.prohibits = const [],
    this.isShowScrollBar = false,
  });

  final List<Tab> tabs;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final Color? backgroundColor;
  final Color? unselectedBackgroundColor;
  final double? radius;
  final double? height;
  final TabController? tabController;
  final EdgeInsets buttonMargin;
  final EdgeInsets? contentPadding;
  final void Function(int)? onTap;
  final bool? isSport;
  final bool? isLogin;
  final bool isShowScrollBar;//是否显示滚动条
  // 禁止交互index
  final List<int> prohibits;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = ThemeService().theme.textTheme;

    return ButtonsTabBar(
      height: height ?? 60,
      controller: tabController,
      contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 20),
      backgroundColor: backgroundColor ?? ThemeService().theme.colorScheme.primary,
      unselectedBackgroundColor: unselectedBackgroundColor ?? Colors.transparent,
      labelStyle: labelStyle ?? textTheme.titleMedium,
      unselectedLabelStyle: unselectedLabelStyle ?? textTheme.titleMedium,
      radius: radius ?? 100,
      tabs: tabs,
      buttonMargin: buttonMargin,
      onTap: onTap,
      isSport: isSport,
      isLogin: isLogin,
      isShowScrollBar: isShowScrollBar,
      prohibits: prohibits
    );
  }
}
