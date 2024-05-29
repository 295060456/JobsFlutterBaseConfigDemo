import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/extentions/ex_widget.dart';
import 'package:flutter_bet/widget/tab_bar/point_tab_indicator.dart';

import '../../constant/app_themes.dart';

class CustomSportTabBarPoint extends StatelessWidget {
  const CustomSportTabBarPoint(
      {super.key,
        this.labeStyle,
        this.unselectedLabelStyle,
        this.labelColor,
        this.unselectedLabelColor,
        this.onTap,
        required this.indicatorColor,
        required this.tabs,
        this.tabController});

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

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap:(index){
        if(onTap != null){
          onTap!(index);
        }
      },
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: PointTabIndicator(color: indicatorColor),
      isScrollable: true,
      labelColor: labelColor ?? AppThemes.textColorWhite,
      unselectedLabelColor: unselectedLabelColor ?? AppThemes.iconColor,
      labelStyle: labeStyle,
      unselectedLabelStyle: unselectedLabelStyle,
      tabs: tabs,
      controller: tabController,
    );
  }
}
