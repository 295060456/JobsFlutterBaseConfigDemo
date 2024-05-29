
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_bet/base/getx/base_view.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/pages/chat_room/index/view.dart';
import 'package:flutter_bet/pages/find/view.dart';
import 'package:flutter_bet/pages/home/home_view.dart';
import 'package:flutter_bet/pages/sport/view.dart';
import 'package:flutter_bet/pages/betting/betting_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/widget/button/custom_button.dart';
import 'package:flutter_bet/widget/network_image/custom_network_image.dart';
import 'package:get/get.dart';
import '../../controllers/global_state_controller.dart';
import '../../widget/custom_asset_icon.dart';
import '../activity/a_model/activity_quick_api_model.dart';
import '../activity/a_widget/custom_floating_action_widget.dart';
import '../front/front_view.dart';
import 'logic.dart';
import 'code.dart';
import 'widget/custom_floating_action_button_location.dart';

class MainPage extends BaseView<MainLogic> {
  MainPage({Key? key}) : super(key: key);
  final GlobalStateController appController = Get.find<GlobalStateController>();
  var offset = 0.0;

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return null;
  }

  @override
  Widget buildBody(BuildContext context) {
    controller.context = context;
    // showNoticeBannerWidget(context: context, list: appController.isLogin.value?controller.bannersWithLogin:controller.bannersWithNoLogin);
    return Obx(() => Container(
      key: UniqueKey(),
      margin: EdgeInsets.only(bottom: controller.selectedMenuCode == MenuCode.MINE ? 0 : 75),
      child:
          // getPageOnSelectedMenu(controller.selectedMenuCode),
          Obx(() => getPageOnSelectedMenu(controller.selectedMenuCode)),
    ));
  }

  @override
  FloatingActionButtonLocation? floatingActionButtonLocation() {
    return CustomFloatingActionButtonLocation(
      location: FloatingActionButtonLocation.endFloat,
      offsetX: 4,
      offsetY: -60,
    );
  }

  @override
  Widget? floatingActionButton() {
    return _buildFloatingActionView();
  }

  Widget _buildFloatingActionView(){
    return Obx(() {
      return CustomFloatingActionWidget(
        // isShowActivityQuick()
        isShow: logic.isShowActivityQuick(),
        // isShow:true,
        modelList: logic.activityFloatListObs,
        onClickItem: (ActivityQuickApiModel model) {
          logic.onQuickActivityItemClick(model);
        },
        onClickClose: () {
          logic.onQuickActivityClickClose();
        },
      );
    });
  }


  ///bottom navigation bar
  @override
  Widget? bottomNavigationBar() {
    return null;
    // return MainPageBottomBarWidget(
    //   onMenuTap: (int code) {
    //     controller.onMenuSelected(MenuCode.values[code]);
    //     bool isShow = (code == 0||code == 1||code == 3);
    //     appController.showOverlayView(isShowTopBarView: isShow);
    //     if (code == 3) {
    //       Future.delayed(const Duration(milliseconds: 20), () {
    //         msgView.controller.state.sc.jumpTo(offset);
    //       });
    //     } else {
    //       if (msgView.controller.state.sc.hasClients) {
    //         offset = msgView.controller.state.sc.offset;
    //       }
    //     }
    //   },
    //   initSelectdIndex: 1,
    //   controller: controller.bottomBarController,
    // );
  }

  //
  final homeMenuView = HomeMenuPage();
  final gameView = GamePage();
  final bettingView = BettingPage();
  final msgView = MessagePage();

  // final mineView = MinePage();
  // final casinoBetView = BettingCasinoPage();
  // final sportBetView = BettingSportPage();
  final chatRoomView = ChatRoomPage();
  final frontView = FrontPage();

  // final testView = HomeMenuPage();

  Widget getPageOnSelectedMenu(MenuCode menuCode) {
    switch (menuCode) {
      case MenuCode.HOME_MENU:
        return homeMenuView;
      case MenuCode.GAME:
        return gameView;
      case MenuCode.BETTING:
        return bettingView;
      case MenuCode.MSG:
        return msgView;
      case MenuCode.MINE:
        {
          return chatRoomView;
          // Get.delete<MineLogic>();
          // ignore: unrelated_type_equality_checks
          // if(AppConfigService.instance.getProjectType() == ProjectType.project2){
          //   return homeView;
          // }
          // return mineView;
        }
      case MenuCode.FRONT:
        return frontView;
      default:
        return frontView;
    }
  }
}
