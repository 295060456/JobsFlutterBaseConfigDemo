import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/route_util.dart';

// import '../pages/account/login/login_widget.dart';
// import '../pages/account/register/register_widget.dart';
// import '../utils/route_util.dart';

///业务级别的mixin, 账号管理
mixin GlobalBizAccountMixin {
  final isLogin = false.obs; //判断是否登录

  /// 登录注册 是否已弹窗 0 未弹窗 1 弹登录 2 弹注册
  final loginRegister = 0.obs;

  ///是否处于登陆状态
  bool isLoginState() {
    return isLogin.value;
  }

  ///当点击登陆, bool 是否需要登陆
  bool doGoToLogin(BuildContext? context, {int duration = 200}) {
    if (loginRegister.value != 1) {
      if (loginRegister.value == 2) {
        RouteUtil.popView();
      }
      Future.delayed(Duration(milliseconds: duration), () {
        // showCustomLoginWidget(context: context!);
      });
      return true;
    } else {
      return false;
    }
  }

  ///当点击注册, bool 是否需要登陆
  bool doGoToRegister(BuildContext? context, {int duration = 200}) {
    if (loginRegister.value != 2) {
      if (loginRegister.value == 1) {
        RouteUtil.popView();
      }
      Future.delayed(Duration(milliseconds: duration), () {
        // showCustomRegisterWidget(context: context!);
      });
      return true;
    } else {
      return false;
    }
  }
}
