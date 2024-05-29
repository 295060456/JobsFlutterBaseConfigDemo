import 'dart:developer';

import 'package:flutter_bet/controllers/global_state_controller.dart';
import 'package:flutter_bet/model/user.dart';
import 'package:flutter_bet/services/account_service.dart';
import 'package:get/get.dart';

class VaultUtil {
  /// 是否开启可以用双重验证
  static bool isSecret() {
    final GlobalStateController globalStateController = Get.find<GlobalStateController>();
    int check = globalStateController.getVerifyType(); //1谷歌验证 2资金密码 3全部
    //验证方式 1:二阶段验证 2:资金密码
    String isSecret = globalStateController.brandBase['is_secret'] ?? ''; //1:已配置 0:未配置
    return (check == 1 || check == 3) && isSecret == '1';
  }

  /// 开启了双重验证但没有绑定使用
  static bool isSecretNot() {
    final GlobalStateController globalStateController = Get.find<GlobalStateController>();
    int check = globalStateController.getVerifyType(); //1谷歌验证 2资金密码 3全部
    //验证方式 1:二阶段验证 2:资金密码
    String isSecret = globalStateController.brandBase['is_secret'] ?? ''; //1:已配置 0:未配置
    return (check == 1 || check == 3) && isSecret != '1';
  }

  /// 是否开启资金密码
  static bool isPayPassword() {
    final GlobalStateController globalStateController = Get.find<GlobalStateController>();
    int check = globalStateController.getVerifyType(); //1谷歌验证 2资金密码 3全部
    //验证方式 1:二阶段验证 2:资金密码
    String isPayPassword = globalStateController.brandBase['is_pay_password'] ?? ''; //1:已配置 0:未配置
    return (check == 2 || check == 3) && isPayPassword == '1';
  }

  /// 后台开启资金密码但是前台没设置
  static bool isPayPasswordNotSetting() {
    final GlobalStateController globalStateController = Get.find<GlobalStateController>();
    int check = globalStateController.getVerifyType(); //1谷歌验证 2资金密码 3全部

    //验证方式 1:二阶段验证 2:资金密码
    String isPayPassword = globalStateController.brandBase['is_pay_password'] ?? ''; //1:已配置 0:未配置
    return (check == 2 || check == 3) && isPayPassword != '1';
  }

  /// 后台开启资金密码但是前台没设置且绑定了邮箱
  static bool isPayPasswordNotSettingAndBindEmail() {
    final GlobalStateController globalStateController = Get.find<GlobalStateController>();
    int check = globalStateController.getVerifyType(); //1谷歌验证 2资金密码 3全部

    //验证方式 1:二阶段验证 2:资金密码
    String isPayPassword = globalStateController.brandBase['is_pay_password'] ?? ''; //1:已配置 0:未配置
    return (check == 2 || check == 3) && isPayPassword != '1' && !isEmailCheckStateNotBind();
  }

  /// 是否开启兑换货币
  static bool isShowExchangeCurrency() {
    final GlobalStateController globalStateController = Get.find<GlobalStateController>();
    bool check = globalStateController.getBrandBase['base']['exchange']; // 1:开启 2:关闭
    return check;
  }

  ///没有绑定邮箱
  static bool isEmailCheckStateNotBind() {
    User? currentUser = AccountService.sharedInstance.currentUser;
    if (currentUser != null) {
      log("neco 邮箱绑定的状态：${currentUser.emailCheckState}");
      var emailCheckState = currentUser.emailCheckState; //邮箱是否验证1=已验证,2=未验证
      if (emailCheckState == 1) {
        return false;
      } else {
        return true;
      }
    } else {
      return true;
    }
  }
}
