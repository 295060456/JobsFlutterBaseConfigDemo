import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_themes.dart';
// import 'package:flutter_bet/app/routes/app_pages.dart';
import 'package:flutter_bet/constant/app_urls_values.dart';
import 'package:flutter_bet/pages/account/logout/view.dart';
import 'package:flutter_bet/pages/betting/both/betting_both_view.dart';
import 'package:flutter_bet/pages/personal_center/vip/logic.dart';
import 'package:flutter_bet/routes/routes.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_bet/utils/route_util.dart';
import 'package:flutter_bet/widget/custom_asset_icon.dart';
import 'package:flutter_bet/widget/custom_text.dart';
import 'package:flutter_bet/widget/dialog/bubble_dialog.dart';
import 'package:flutter_bet/widget/sport/custom_sport_odd_type.dart';
import 'package:get/get.dart';

import '../../app/modules/vault/views/vault_dialog_view.dart';
import '../../app/modules/wallet/views/wallet_dialog_view.dart';
import '../../controllers/global_state_controller.dart';
import '../../generated/l10n.dart';
import '../../pages/alliance_plan/alliance_plan_view.dart';
import '../../pages/chat_room/user_info/view.dart';
import '../../pages/personal_center/responsible/responsible_view.dart';
import '../../utils/url_launch_util.dart';
import '../custom_rotating_arrow.dart';

class DialogUtils {
  static final GlobalStateController _globalStateController = Get.find<GlobalStateController>();

  static var localToGlobal;
  static var size;

  static void _resetAnimation(GlobalKey<RotatingArrowState> key) {
    key.currentState?.resetAnimation();
  }

  static void _resetScaleAnimation(GlobalKey<ScalingTextState> key) {
    key.currentState?.resetAnimation();
  }

  ///[context]上下文
  ///[child]气泡中的view
  ///[width]气泡的宽度
  ///[widgetKey]唯一标识Widget的对象
  static showCustomBubbleDialog(
    BuildContext context,
    Widget child,
    double width, {
    required GlobalKey? widgetKey, //锚点 组件key
    double height = 0.0,
    double dyHeight = 0.0,
    double dxWidth = 0.0,
    Color backgroundColor = Colors.white,
    double bubbleArrowWidth = 13,
    double bubbleArrowHeight = 8,
    SportWinningStyleClick? filterCall,
    GlobalKey<RotatingArrowState>? globalKey,
    GlobalKey<ScalingTextState>? globalKeyScaling,
    VoidCallback? onDismissCallback,
    VoidCallback? onCloseCallback,
    double arrowBasisOffset = 0.0,
    double bubbleLeftOffset = 0.0,
    double? positionedLeft, //防止右边溢出
    double? positionedRight, //防止右边溢出
  }) {
    final RenderBox? renderBox = widgetKey?.currentContext?.findRenderObject() as RenderBox?;
    localToGlobal = renderBox?.localToGlobal(Offset.zero);
    size = renderBox?.size;
    showDialog(
      barrierColor: Colors.transparent,
      useRootNavigator: false,
      useSafeArea: false,
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              top: localToGlobal?.dy + size?.height + dyHeight + 3,
              //优先自定义定位,left 和 right 只能一个，
              //positionedRight 如果没有定义，默认都不定义， 使用left定位
              left: positionedRight != null
                  ? positionedLeft
                  : (bubbleLeftOffset != 0
                      ? bubbleLeftOffset
                      : localToGlobal?.dx + size?.width / 2 - width / 2 + dxWidth),
              right: positionedRight,
              child: BubbleDialog(
                arrowBasisOffset: arrowBasisOffset,
                backgroundColor: backgroundColor,
                width: width,
                height: height,
                bubbleArrowHeight: bubbleArrowHeight,
                bubbleArrowWidth: bubbleArrowWidth,
                bubbleChild: child,
              ),
            ),
          ],
        );
      },
    ).then((value) {
      if (onCloseCallback != null) {
        onCloseCallback();
      }
      if (globalKey != null) {
        _resetAnimation(globalKey);
        if (onDismissCallback != null) {
          onDismissCallback();
        }
      }
      if (globalKeyScaling != null) {
        _resetScaleAnimation(globalKeyScaling);
      }
      if (filterCall != null) {
        filterCall(value);
      }
    });
  }

  static void showCustomBubbleCopyDialog(BuildContext context, Widget child, double width,
      {required GlobalKey? key,
      double height = 0.0,
      Color backgroundColor = Colors.white,
      double bubbleArrowWidth = 13,
      double bubbleArrowHeight = 8,
      SportWinningStyleClick? filterCall,
      GlobalKey<RotatingArrowState>? globalKey,
      arrowBasisOffset = 0.0}) {
    var isShowing = true; //是否在显示
    final RenderBox? renderBox = key?.currentContext?.findRenderObject() as RenderBox?;
    localToGlobal = renderBox?.localToGlobal(Offset.zero);
    size = renderBox?.size;
    showDialog(
      barrierColor: Colors.transparent,
      useRootNavigator: false,
      useSafeArea: false,
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              top: localToGlobal?.dy + size?.height,
              // left: localToGlobal?.dx - 56,
              right: localToGlobal?.dx,
              child: BubbleDialog(
                  arrowBasisOffset: arrowBasisOffset,
                  backgroundColor: backgroundColor,
                  width: width,
                  height: height,
                  bubbleArrowHeight: bubbleArrowHeight,
                  bubbleArrowWidth: bubbleArrowWidth,
                  bubbleChild: child),
            ),
          ],
        );
      },
    ).then((value) => {
          isShowing = false,
          if (filterCall != null) {filterCall(value)}
        });
    // 在延迟后关闭对话框
    Future.delayed(const Duration(seconds: 2), () {
      if (isShowing != false) {
        Navigator.of(context).pop();
      } else {
        log("关闭失败");
      }
    });
  }

  static void showCustomMineRightDialogV2(
      BuildContext context, GlobalKey globalKey, VoidCallback? onCloseCallback) {
    DialogUtils.showCustomBubbleDialog(
        context, _rightList(context), _globalStateController.isChinese() ? 112 : 180,
        widgetKey: globalKey,
        onCloseCallback: onCloseCallback,
        dxWidth: _globalStateController.isChinese() ? 0.0 : -30,
        arrowBasisOffset: _globalStateController.isChinese() ? 0.0 : 30.0,
        backgroundColor: AppThemes.textColorWhite,
        bubbleArrowHeight: 8,
        bubbleArrowWidth: 13);
  }

  static Widget _rightList(BuildContext context) {
    List list = [
      {
        "title": S.current.wallet,
        "icon": "assets/images/personal_center_icon/wallet.webp",
        "id": 1
      },
      {"title": S.current.vault, "icon": "assets/images/personal_center_icon/vault.webp", "id": 2},
      {"title": S.current.vip, "icon": "assets/images/personal_center_icon/vip_cup.webp", "id": 3},
      {
        "title": S.current.alliance_program,
        "icon": "assets/images/personal_center_icon/affiliate program.webp",
        "id": 4
      },
      {
        "title": S.current.tab_bar_title_data_statistics_text,
        "icon": "assets/images/personal_center_icon/count_data.webp",
        "id": 5
      },
      {
        "title": S.current.transaction_records,
        "icon": "assets/images/personal_center_icon/transaction_records.webp",
        "id": 6
      },
      {
        // "title": S.current.sport_bet,
        "title": S.current.sport_tabbar_mybet,
        // "icon": "assets/images/personal_center_icon/sport_bettors.webp",
        "icon": "assets/images/bet_slip/ic_casino_my_bet.webp",
        "id": 7
      },
      {
        "title": S.current.setting,
        "icon": "assets/images/personal_center_icon/set_up.webp",
        "id": 8
      },
      //负责任博彩 已下架
      // {
      //   "title": S.current.responsible_gaming,
      //   "icon": "assets/images/personal_center_icon/responsible_gaming.webp",
      //   "id": 9
      // },

      // {
      //   "title": S.current.tab_bar_exchange_text,
      //   "icon": "assets/images/personal_center_icon/preferential_exchange.webp",
      //   "id": 10
      // },
      {
        "title": S.current.live_support,
        "icon": "assets/images/personal_center_icon/online_support.webp",
        "id": 11
      },
      {
        "title": S.current.about_us,
        "icon": "assets/images/personal_center_icon/about_ic.webp",
        "id": 13
      },
      {
        "title": S.current.logout_text,
        "icon": "assets/images/personal_center_icon/logout.webp",
        "id": 12
      },
      // {
      //   "title": S.current.confirm_button_text, //暂时入口
      //   "icon": "assets/images/personal_center_icon/logout.webp",
      //   "id": 1002
      // },
      //仅测试时用
      if (AppUrlsValues.appEnv != EnvName.release)
        {
          "title": const String.fromEnvironment('APP_TIME'),
          "icon": "assets/images/personal_center_icon/logout.webp",
          "id": 14
        },
    ];
    return Container(
      constraints: const BoxConstraints(),
      child: SingleChildScrollView(
        child: Column(
          children: list.map((bean) {
            return _itemView(context, bean);
          }).toList(),
        ),
      ),
    );
  }

  static Widget _itemView(BuildContext context, dynamic bean) {
    return GestureDetector(
      onTap: () {
        var id = bean['id'];
        RouteUtil.popView();
        switch (id) {
          case 1:
            // RouteUtil.popView();
            // showCustomWalletWidget(context: context);
            RouteUtil.popView();
            WalletDialogView.openDialog();
            // RouteUtil.pushToView(Routes.personalWallet);
            break;
          case 2:
            // RouteUtil.popView();
            // showCustomVaultWidget(context: context);
            RouteUtil.popView();
            // RouteUtil.pushToView(Routes.personalVault);
            VaultDialogView.openDialog();
            break;
          case 3:
            // RouteUtil.popView();
            // showCustomVipWidget(context: context);
            RouteUtil.popView();
            Timer(Duration(milliseconds: 500), () {
              RouteUtil.pushToView(Routes.personalVip);
            });
            break;
          case 4:
            // RouteUtil.popView();
            // RouteUtil.pushToView(Routes.lianMengJiHuaPage);
            // CustomSafeDialog.dismiss(context: context, tag: kCustomAllianceWidget);
            // showCustomAllianceWidget(context: context);
            //打开 新版联盟计划 对话框
            // showAlliancePlanDialog(context: context);
            RouteUtil.popView();
            AlliancePlanPage.openPage();
            break;
          case 5:
            //数据统计
            // RouteUtil.popView();
            // showDataCountWidget(context: context);
            RouteUtil.popView();
            // DataCountPage.openPage();
            // StatisticalDataView.openPage();
            showCustomChatRoomUserInfoWidget(context: context);
            break;
          case 6:
            //交易记录
            RouteUtil.popView();
            RouteUtil.pushToView(Routes.personalTransaction);
            break;
          case 7:
            RouteUtil.popView();
            // RouteUtil.pushToView(Routes.betListPage BettingBothPage);
            // RouteUtil.pushToView(Routes.browseMenuMyBetting);
            BettingBothPage.openPage();
            break;
          case 8:
            RouteUtil.popView();
            RouteUtil.pushToView(Routes.setupPage);
            // showCustomSetupWidget(context: context);
            break;
          case 9:
            // RouteUtil.popView();
            // dismissResponsibleWidget(context: context);
            // showResponsibleWidget(context: context);
            //负责任博彩
            RouteUtil.popView();
            ResponsiblePage.openPage();
            break;
          case 10:
            //优惠兑换
            RouteUtil.popView();
            RouteUtil.pushToView(Routes.personalDiscount);
            break;
          case 11:
            RouteUtil.popView();
            if (_globalStateController.csUrl.isEmpty) {
              _globalStateController.brandCS();
              return;
            }
            UrlLaunchUtil.jumpCs();
            break;
          case 12:
            RouteUtil.popView();
            showCustomLogoutWidget(context: context);
            break;
          case 1002:
            RouteUtil.popView();
            RouteUtil.pushToView(Routes.redPacket);
            break;
          case 13:
            //关于我们
            RouteUtil.popView();
            RouteUtil.pushToView(Routes.personalAboutUs);
            break;
        }
      },
      child: Container(
        color: Colors.transparent,
        height: 45,
        margin: const EdgeInsets.only(left: 16),
        child: Row(
          children: [
            CustomAssetIcon(
              color: ThemeService().colorScheme.tertiary,
              name: bean['icon'],
              size: 18,
            ),
            const SizedBox(
              width: 8,
            ),
            CustomText(
              bean['title'],
              textColorStyle: CustomTextColorStyle.dark,
              style:
                  ThemeService().theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  ///侧滑栏
  static void showCustomMineRightDialog(BuildContext context) {
    final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
    List<dynamic> items = [];
    // log("neco top ${Get.statusBarHeight} bottom ${Get.bottomBarHeight}");
    List list = [
      {
        "title": S.current.wallet,
        "icon": "assets/images/personal_center_icon/wallet.webp",
        "id": 1
      },
      {"title": S.current.vault, "icon": "assets/images/personal_center_icon/vault.webp", "id": 2},
      {"title": S.current.vip, "icon": "assets/images/personal_center_icon/vip_cup.webp", "id": 3},
      {
        "title": S.current.alliance_program,
        "icon": "assets/images/personal_center_icon/affiliate program.webp",
        "id": 4
      },
      {
        "title": S.current.tab_bar_title_data_statistics_text,
        "icon": "assets/images/personal_center_icon/count_data.webp",
        "id": 5
      },
      {
        "title": S.current.transaction_records,
        "icon": "assets/images/personal_center_icon/transaction_records.webp",
        "id": 6
      },
      {
        // "title": S.current.sport_bet,
        "title": S.current.sport_tabbar_mybet,
        // "icon": "assets/images/personal_center_icon/sport_bettors.webp",
        "icon": "assets/images/bet_slip/ic_casino_my_bet.webp",
        "id": 7
      },
      {
        "title": S.current.setting,
        "icon": "assets/images/personal_center_icon/set_up.webp",
        "id": 8
      },
      {
        "title": S.current.responsible_gaming,
        "icon": "assets/images/personal_center_icon/responsible_gaming.webp",
        "id": 9
      },
      // {
      //   "title": S.current.tab_bar_exchange_text,
      //   "icon": "assets/images/personal_center_icon/preferential_exchange.webp",
      //   "id": 10
      // },
      {
        "title": S.current.live_support,
        "icon": "assets/images/personal_center_icon/online_support.webp",
        "id": 11
      },
      {
        "title": S.current.logout_text,
        "icon": "assets/images/personal_center_icon/logout.webp",
        "id": 12
      },
      {
        "title": S.current.about_us,
        "icon": "assets/images/personal_center_icon/logout.webp",
        "id": 13
      },
      //仅测试时用
      if (AppUrlsValues.appEnv != EnvName.release)
        {
          "title": const String.fromEnvironment('APP_TIME'),
          "icon": "assets/images/personal_center_icon/logout.webp",
          "id": 14
        },
    ];
    loadData(list, items, listKey, context);

    showDialog(
      barrierColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.centerRight,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  margin: EdgeInsets.only(top: AppBar().preferredSize.height, bottom: 49),
                  width: 160,
                  height: double.infinity,
                  color: ThemeService().theme.colorScheme.surface,
                  child: AnimatedList(
                    key: listKey,
                    initialItemCount: items.length,
                    itemBuilder: (BuildContext context, int index, Animation<double> animation) {
                      return _buildItem(context, items, index, animation);
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void loadData(var list, var items, var listKey, var context) async {
    for (int i = 0; i < list.length; i++) {
      items.add(list[i]);
      // 使用insertItem触发插入动画
      listKey.currentState?.insertItem(i);
      await Future.delayed(const Duration(milliseconds: 10));
    }
  }

  static Widget _buildItem(BuildContext context, List list, var index, var animation) {
    // 右到左的偏移动画
    final slideAnimation = Tween<Offset>(
      begin: const Offset(1, 0), //  右
      end: const Offset(0, 0),
    ).animate(animation);
    return SlideTransition(
      position: slideAnimation,
      child: GestureDetector(
        onTap: () {
          var id = list[index]['id'];
          switch (id) {
            case 1:
              // RouteUtil.popView();
              // showCustomWalletWidget(context: context);
              RouteUtil.popView();
              RouteUtil.pushToView(Routes.personalWallet);
              break;
            case 2:
              // RouteUtil.popView();
              // showCustomVaultWidget(context: context);
              RouteUtil.popView();
              RouteUtil.pushToView(Routes.personalVault);
              break;
            case 3:
              // RouteUtil.popView();
              // showCustomVipWidget(context: context);
              RouteUtil.popView();
              Timer(Duration(milliseconds: 500), () {
                RouteUtil.pushToView(Routes.personalVip);
              });

              break;
            case 4:
              // RouteUtil.popView();
              // RouteUtil.pushToView(Routes.lianMengJiHuaPage);
              // CustomSafeDialog.dismiss(context: context, tag: kCustomAllianceWidget);
              // showCustomAllianceWidget(context: context);
              //打开 新版联盟计划 对话框
              // showAlliancePlanDialog(context: context);
              RouteUtil.popView();
              AlliancePlanPage.openPage();
              break;
            case 5:
              //数据统计
              // RouteUtil.popView();
              // showDataCountWidget(context: context);
              RouteUtil.popView();
              // DataCountPage.openPage();
              showCustomChatRoomUserInfoWidget(context: context);
              break;
            case 6:
              //交易记录
              RouteUtil.popView();
              RouteUtil.pushToView(Routes.personalTransaction);
              break;
            case 7:
              RouteUtil.popView();
              // RouteUtil.pushToView(Routes.betListPage BettingBothPage);
              // RouteUtil.pushToView(Routes.browseMenuMyBetting);
              BettingBothPage.openPage();
              break;
            case 8:
              RouteUtil.pushToView(Routes.setupPage, offLast: true);
              // showCustomSetupWidget(context: context);
              break;
            case 9:
              // RouteUtil.popView();
              // dismissResponsibleWidget(context: context);
              // showResponsibleWidget(context: context);
              //负责任博彩
              RouteUtil.popView();
              ResponsiblePage.openPage();
              break;
            case 10:
              //优惠兑换
              RouteUtil.popView();
              RouteUtil.pushToView(Routes.personalDiscount);
              break;
            case 12:
              RouteUtil.popView();
              showCustomLogoutWidget(context: context);
              break;
            case 13:
              RouteUtil.popView();
              RouteUtil.pushToView(Routes.personalAboutUs);
              break;
          }
        },
        child: Container(
          color: Colors.transparent,
          height: 45,
          margin: const EdgeInsets.only(left: 16),
          child: Row(
            children: [
              CustomAssetIcon(
                color: AppThemes.onSurfaceVariant,
                name: list[index]['icon'],
                size: 18,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                list[index]['title'],
                style: ThemeService()
                    .theme
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
