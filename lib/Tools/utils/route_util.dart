import 'package:flutter/material.dart';
import 'package:flutter_bet/pages/main/code.dart';
import 'package:flutter_bet/pages/main/logic.dart';
import 'package:get/get.dart';

class RouteUtil {
  ///offLast 关闭上个页面
  ///notRepeat 防止重复
  static void pushToView(String pagName,
      {dynamic arguments,
      bool offAll = false,
      bool offLast = false,
      bool notRepeat = true,
      ValueChanged<dynamic>? onBack}) {
    if (offAll == true) {
      Get.offAllNamed(pagName, arguments: arguments)?.then((value) {
        if (onBack != null) {
          onBack(value);
        }
      });
    } else if (offLast == true) {
      //清除当前页面， 并跳转指定路由页面
      //进入下一个页面，但没有返回上一个页面的选项（用于SplashScreens，登录页面等）
      Get.offNamed(pagName, arguments: arguments)?.then((value) {
        if (onBack != null) {
          onBack(value);
        }
      });
    } else {
      Get.toNamed(pagName, arguments: arguments, preventDuplicates: notRepeat)?.then((value) {
        if (onBack != null) {
          onBack(value);
        }
      });
    }
  }

  static void popView({dynamic result}) {
    Get.back(result: result);
  }

  static void popToFirst(String pagName, {MenuCode code = MenuCode.GAME}) {
    Get.until((route) => route.settings.name == pagName);
    if (Get.isRegistered<MainLogic>()) {
      Get.find<MainLogic>().onMenuSelected(code);
    }

    // Get.until((pagName) => pagName.isFirst);
  }
}
