import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/widget/tab_bar/point_tab_indicator.dart';

import '../../constant/app_themes.dart';
import '../../services/theme/theme_service.dart';
import 'point_tab_size_indicator.dart';

///tabbar  含有默认的上画线 指示器
class CustomTabBarPointView extends StatelessWidget {
  const CustomTabBarPointView({
    super.key,
    this.labeStyle,
    this.unselectedLabelStyle,
    this.labelColor,
    this.unselectedLabelColor,
    this.onTap,
    required this.indicatorColor,
    required this.tabs,
    this.tabController,
    this.isScrollable,
    this.isIndicatorTop = true,
    this.borderRadius,
    this.indicatorWidth,
    this.labelPadding,
  });

  final TextStyle? labeStyle;
  final TextStyle? unselectedLabelStyle;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final TabController? tabController;

  final ValueChanged<int>? onTap;

  ///自定义指示器颜色，必传参数
  final Color indicatorColor;

  ///必传参数
  final List<Tab> tabs;

  final bool? isScrollable; //是否可以滚动，false 不能滚动，tab铺开

  final bool isIndicatorTop; //是否在上面

  final BorderRadius? borderRadius;

  final double? indicatorWidth;
  final EdgeInsetsGeometry? labelPadding;//tab之间的间距

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (index) {
        if (onTap != null) {
          onTap!(index);
        }
      },
      indicatorSize: TabBarIndicatorSize.tab,
      // indicator: PointTabIndicator(color: indicatorColor),
      indicator: PointTabSizeIndicator(
        //TabSizeIndicator已有默认值，宽度默认20，颜色蓝色，高度2，不需要修改的可以不传参数
        // TabSizeIndicator();即可
        borderRadius: borderRadius ??
            const BorderRadius.only(
                bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4)),
        width: indicatorWidth ?? 30,
        position: isIndicatorTop ? TabIndicatorPosition.top : TabIndicatorPosition.bottom,
        borderSide: BorderSide(width: 4.0, color: indicatorColor),
      ),
      isScrollable: isScrollable ?? true,
      labelColor: labelColor ?? AppThemes.textColorWhite,
      unselectedLabelColor: unselectedLabelColor ?? AppThemes.iconColor,
      labelStyle: labeStyle,
      unselectedLabelStyle: unselectedLabelStyle,
      tabs: tabs,
      controller: tabController,
      labelPadding: labelPadding,
    );
  }
}
