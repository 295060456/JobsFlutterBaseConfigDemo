import 'package:flutter_bet/pages/chat_room/index/logic.dart';
import 'package:flutter_bet/pages/find/logic.dart';
import 'package:flutter_bet/pages/find/yulechengtouzhurank/controller.dart';
import 'package:flutter_bet/pages/home/home_logic.dart';
import 'package:flutter_bet/pages/sport/logic.dart';
import 'package:flutter_bet/pages/mine/logic.dart';
import 'package:flutter_bet/pages/betting/betting_logic.dart';
import 'package:get/get.dart';
import '../front/front_logic.dart';
import '../betting/casino/betting_casino_logic.dart';
import '../betting/sport/betting_sport_logic.dart';
import 'logic.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainLogic>(
      () => MainLogic(),
      // fenix: true,
    );

    Get.lazyPut<HomeLogic>(
      () => HomeLogic(),
      // fenix: true,
    );
    Get.lazyPut<FindLogic>(
      () => FindLogic(),
    );
    Get.lazyPut<MineLogic>(
      () => MineLogic(),
    );
    Get.lazyPut<MessageLogic>(
      () => MessageLogic(),
    );
    Get.lazyPut<BettingLogic>(
      () => BettingLogic(),
    );
    Get.lazyPut(() => BettingCasinoLogic());
    Get.lazyPut(() => BettingSportLogic());
    Get.lazyPut(() => ChatRoomLogic());
    Get.lazyPut(() => FrontLogic());
  }
}
