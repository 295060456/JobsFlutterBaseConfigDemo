import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../constant/app_values.dart';

import '../../services/theme/theme_service.dart';
import '../auto_layout_tab_bar_view/custom_auto_layout_tabbar_widget.dart';
import '../tab_bar/custom_tab_bar_with_icon.dart';
import 'logic.dart';

class CustomBetList extends GetView {
  final logic = Get.put(BettinglistLogic());

  CustomBetList({super.key});

  @override
  Widget build(BuildContext context) {
    logic.buildData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Container(
            decoration: BoxDecoration(
              color: ThemeService().theme.colorScheme.surface, // 设置背景色
              borderRadius: BorderRadius.circular(30.0), // 设置圆角的半径
            ),
            child: CustomTabBarWithIcon(
              tabs: logic.tabs,
              tabController: logic.tabController,
              backgroundColor: ThemeService().theme.colorScheme.tertiary,
              radius: 25,
              height: 50,
              buttonMargin: const EdgeInsets.all(5),
            ),
          ),
        ),
        const SizedBox(
          height: AppValues.defaultMargin,
        ),
        CustomAutoLayoutTabBarView(
          controller: logic.tabController,
          children: [
            FrontSportCompetitionView(
              listData: logic.betSportList,
            ),
            FrontSportCompetitionView(
              listData: logic.betSportList,
            ),
            FrontCompetitionView(
              listData: logic.competitonList,
            ),
          ],
        ),
      ],
    );
  }
}
