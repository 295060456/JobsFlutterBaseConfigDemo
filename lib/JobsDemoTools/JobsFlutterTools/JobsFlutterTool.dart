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

/// JobsScreenUtil().width;
/// JobsScreenUtil().height;
class JobsScreenUtil {
  // 单例
  static final JobsScreenUtil _instance = JobsScreenUtil._internal();
  factory JobsScreenUtil() => _instance;
  JobsScreenUtil._internal() {
    // 初始化监听
    WidgetsBinding.instance.platformDispatcher.onMetricsChanged = _updateSize;
    _updateSize();
  }

  double _width = 0;
  double _height = 0;
  double _pixelRatio = 1;

  void _updateSize() {
    final view = WidgetsBinding.instance.platformDispatcher.views.first;
    _pixelRatio = view.devicePixelRatio;
    _width = view.physicalSize.width / _pixelRatio;
    _height = view.physicalSize.height / _pixelRatio;
    debugPrint('📐 屏幕变化: $_width × $_height (dp)');
  }

  double get width => _width;
  double get height => _height;
  double get pixelRatio => _pixelRatio;
}
