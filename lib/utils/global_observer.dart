import 'package:flutter/material.dart';

class GlobalRouteObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    debugPrint('👈 Popped: ${route.settings.name}');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    debugPrint('👉 Pushed: ${route.settings.name}');
  }
}
