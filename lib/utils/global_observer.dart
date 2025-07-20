import 'package:flutter/material.dart';

/// 全局路由观察器，用于监听页面跳转并扩展功能：
/// 1. 埋点上报页面路径
/// 2. 记录日志
class GlobalRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);

    final routeName = route.settings.name;
    final prevName = previousRoute?.settings.name;

    /// ✅ 路由日志
    debugPrint('👉 Pushed: $routeName (from: $prevName)');

    /// ✅ 埋点上报
    _trackPageView(routeName);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);

    final routeName = route.settings.name;
    final prevName = previousRoute?.settings.name;

    debugPrint('👈 Popped: $routeName (back to: $prevName)');
    _trackPageView(prevName); // 回退后也上报新页面
  }

  // ✅ 模拟埋点上报
  void _trackPageView(String? routeName) {
    if (routeName == null) return;
    debugPrint('📊 页面埋点上报: $routeName');
    // TODO: 替换成你自己的上报 SDK
    // Analytics.logPageView(routeName);
  }
}
