import 'package:flutter/material.dart';
import 'package:flutter_plugin_engagelab/flutter_plugin_engagelab.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/DemoTools/Utils/AppManager.dart';

class AppLifecycleCtrl extends GetxController with WidgetsBindingObserver {
  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void onClose() {
    WidgetsBinding.instance.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.resumed) {
      // 应用从后台进入前台
      // print("App resumed: 从后台进入前台");
      // App 启动后将角标置为0
      FlutterPluginEngagelab.setNotificationBadge(0);
      FlutterPluginEngagelab.resetNotificationBadge();
      AppManager.instance.isFront = true;
    } else if (state == AppLifecycleState.paused) {
      // 应用进入后台
      // print("App pausÍed: 进入后台");
      AppManager.instance.isFront = false;
    } else if (state == AppLifecycleState.inactive) {
      // debugPrint("App 处于非活动状态（可能是切换任务或者电话等）");
      AppManager.instance.isFront = false;
    } else if (state == AppLifecycleState.detached) {
      // debugPrint("App 彻底退出（通常是 Android 上的任务管理器手动关闭）");
      AppManager.instance.isFront = false;
    }
  }
}
