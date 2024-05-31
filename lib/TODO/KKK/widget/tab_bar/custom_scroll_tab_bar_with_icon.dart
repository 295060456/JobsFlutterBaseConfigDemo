import 'package:flutter/material.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_bet/widget/tab_bar/button_scroll_tabbar.dart';

class CustomScrollTabBarWithIcon extends StatelessWidget {
  const CustomScrollTabBarWithIcon({
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

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = ThemeService().theme.textTheme;
    return RawScrollbar(
      trackVisibility: true,
      thumbVisibility: true,
      padding: EdgeInsets.zero,
      minOverscrollLength: 80,
      minThumbLength: 80,
      thumbColor: ThemeService().colorScheme.tertiary,
      radius: const Radius.circular(6),
      scrollbarOrientation: ScrollbarOrientation.bottom,
      child: ButtonScrollTabBar(
            height: height ?? 54,
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
          ),
    );
  }
}
