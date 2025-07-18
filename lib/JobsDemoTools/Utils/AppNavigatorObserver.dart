import 'package:flutter/material.dart';
import 'package:flutter_plugin_engagelab/flutter_plugin_engagelab.dart';

/// 用于：路由变化的监听
class AppNavigatorObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    // 监听返回事件
    if (route.settings.name != null && route.settings.name!.isNotEmpty) {
      FlutterPluginEngagelab.printMy("页面返回了: ${route.settings.name}");
    }
  }
}
