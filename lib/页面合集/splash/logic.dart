import 'dart:io';
import 'package:flutter_bet/base/getx/base_controller.dart';
import 'package:flutter_bet/controllers/global_state_controller.dart';
import 'package:flutter_bet/services/lang_service.dart';
import 'package:flutter_bet/services/privacy_policy/privacy_policy_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashLogic extends BaseController {
  late Function onFinish;
  final GlobalStateController globalController = Get.find<GlobalStateController>();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    onFinish();
    Get.updateLocale(LangService.sharedInstance.lang.toLocaleValue);
  }

  Future<void> showPrivacyDialog() async {
    final isPass = await PrivacyPolicyService.checkStatus();
    if (kDebugMode) {
      print("隐私协议弹窗状态：$isPass");
    }
    if (isPass) {
      onFinish();
      return;
    }
  }
}
