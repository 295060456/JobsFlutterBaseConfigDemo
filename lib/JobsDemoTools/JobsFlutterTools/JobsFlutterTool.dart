import 'package:flutter/material.dart';

void JobsScreenListener() {
  /// 需要监听，以获取最新的值
  WidgetsBinding.instance.platformDispatcher.onMetricsChanged = () {
    final window = WidgetsBinding.instance.platformDispatcher.views.first;
    final newWidth  = window.physicalSize.width / window.devicePixelRatio;
    final newHeight = window.physicalSize.height / window.devicePixelRatio;
    debugPrint('屏幕变化了: $newWidth x $newHeight');
  };
}
