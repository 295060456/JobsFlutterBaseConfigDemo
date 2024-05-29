import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bet/constant/app_common.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/generated/l10n.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_bet/widget/custom_icon.dart';
import 'package:flutter_bet/widget/custom_ripple_widget.dart';
import 'package:flutter_bet/widget/custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_themes.dart';
import '../../../controllers/global_state_controller.dart';
import 'main_page_bottom_bar_controller.dart';

///首页底部导航
class MainPageBottomBarWidget extends StatefulWidget {
  static final double contentHeight = (ScreenUtil().bottomBarHeight > 0) ? 102 : 68;

  const MainPageBottomBarWidget({
    super.key,
    required this.initSelectdIndex,
    this.onMenuTap,
    this.onCenterTap,
    required this.controller,
    this.themeData,
  });

  final int initSelectdIndex;
  final ValueChanged<int>? onMenuTap;
  final Function? onCenterTap;
  final BottomNavigationBarThemeData? themeData;
  final MainPageBottomBarController controller;

  @override
  State<StatefulWidget> createState() {
    return _MainPageBottomBarWidgetState();
  }
}

class _MainPageBottomBarWidgetState extends State<MainPageBottomBarWidget> {
  //用来获取BottomBar的高度
  final GlobalKey bottomBarKey = GlobalKey();
  final GlobalStateController globalController = Get.find<GlobalStateController>();

  int? selectdIndex;
  int? selectIndexSport;

  @override
  void initState() {
    super.initState();
    selectdIndex = widget.initSelectdIndex;
    selectIndexSport = globalController.betSlipType.value;
    ever(globalController.betSlipType, (callback) {
      int type = globalController.betSlipType.value;
      Future.microtask(() {
        setState(() {
          selectIndexSport = type;
        });
      });
    });
    ever(globalController.buttonSelectIndex, (value) {
      int index = value;
      // log("底部菜单...切换监听...index...$index");
      setState(() {
        selectdIndex = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _buildBottomBar();
  }

  _buildBottomBar() {
    final defaultTheme = widget.themeData ?? ThemeService().theme.bottomNavigationBarTheme;
    return Container(
      alignment: Alignment.topCenter,
      key: bottomBarKey,
      color: defaultTheme.backgroundColor,
      height: MainPageBottomBarWidget.contentHeight,
      padding: const EdgeInsets.symmetric(horizontal: AppValues.defaultPadding),
      child: Container(
        alignment: Alignment.topCenter,
        height: 68,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: _buildAnimatedText(
                    barName: S.current.tab_bar_menu,
                    iconName: "ic_tab_bar_menu.png",
                    index: 0,
                    themeData: defaultTheme)),
            Expanded(
                flex: 1,
                child: _buildAnimatedText(
                    barName: S.current.tab_bar_ent,
                    iconName: "ic_tab_bar_ent.png",
                    index: 1,
                    themeData: defaultTheme)),
            Expanded(
              flex: 1,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  _buildAnimatedText(
                      barName: selectIndexSport == 0
                          ? S.current.tab_bar_order
                          : S.current.tab_bar_orders,
                      iconName: selectIndexSport == 0
                          ? "ic_tab_bar_order.png"
                          : "ic_tab_bar_order_2.webp",
                      index: 2,
                      themeData: defaultTheme),
                  Positioned(
                    top: 5,
                    right: 23,
                    child: Obx(() {
                      return Visibility(
                        visible: globalController.bets.isNotEmpty,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                          decoration: BoxDecoration(
                              color: ThemeService().colorScheme.primary,
                              borderRadius: BorderRadius.circular(25)),
                          child: CustomText(
                            '${globalController.bets.length}',
                            style: TextStyle(color: AppThemes.widgetColorDark, fontSize: 10),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: _buildAnimatedText(
                    barName: S.current.tab_bar_sports,
                    iconName: "ic_tab_bar_pe.png",
                    index: 3,
                    themeData: defaultTheme)),
            Expanded(
                flex: 1,
                child: _buildAnimatedText(
                    barName: S.current.tab_bar_chat_room,
                    iconName: "ic_tab_bar_chat_room.png",
                    index: 4,
                    themeData: defaultTheme)),
          ],
        ),
      ),
    );
  }

  _buildAnimatedText(
      {required String barName,
      required String iconName,
      required int index,
      required BottomNavigationBarThemeData themeData}) {
    return CustomRippleWidget(
        style: CustomRippleStyle.stadium,
        onTap: () {
          if (index == 1) {
            globalController.betSlipType.value == 0;
          } else if (index == 3) {
            globalController.betSlipType.value == 1;
          }
          setState(() {
            selectdIndex = index;
          });
          if (widget.onMenuTap != null) {
            widget.onMenuTap!(index);
          }
        },
        child: Column(children: [
          (index != selectdIndex)
              ? const SizedBox(
                  height: 4,
                )
              : Container(
                  alignment: Alignment.centerRight,
                  height: 4,
                  width: 42,
                  color:GlobalState.instance.myGlobalVariable ? ThemeService().theme.colorScheme.secondary: Colors.transparent,
                ),
          const SizedBox(height: AppValues.defaultPadding),
          CustomIcon(
              asset: "assets/images/tab_bar/$iconName",
              color: (index == selectdIndex)
                  ? ThemeService().theme.colorScheme.onBackground
                  : themeData.unselectedItemColor),
          const SizedBox(height: 1),
          CustomText(
            barName,
            textAlign: TextAlign.center,
            style: ThemeService().theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600)
          )
        ]));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

