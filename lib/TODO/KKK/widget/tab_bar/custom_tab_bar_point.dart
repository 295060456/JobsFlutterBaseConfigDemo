import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/widget/tab_bar/point_tab_indicator.dart';

import '../../constant/app_themes.dart';
@Deprecated("放弃该组件，该组件build 使用Expanded，回报错，兼容行不好；而又有代码引用，所以保留但不建议使用。请使用新的[CustomTabBarPointView]")
class CustomTabBarPoint extends StatelessWidget {
  const CustomTabBarPoint(
      {super.key,
      this.labeStyle,
      this.unselectedLabelStyle,
      this.labelColor,
      this.unselectedLabelColor,
      this.onTap,
      required this.indicatorColor,
      required this.tabs,
      this.tabController,
        this.isScrollable,
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          // alignment: Alignment.topLeft,
          child: TabBar(
            onTap:(index){
              if(onTap != null){
                onTap!(index);
              }
            },
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: PointTabIndicator(color: indicatorColor),
            isScrollable: isScrollable??true,
            labelColor: labelColor ?? AppThemes.textColorWhite,
            unselectedLabelColor: unselectedLabelColor ?? AppThemes.iconColor,
            labelStyle: labeStyle,
            unselectedLabelStyle: unselectedLabelStyle,
            tabs: tabs,
            controller: tabController,
          ),
        ),
      ],
    );
  }
}
