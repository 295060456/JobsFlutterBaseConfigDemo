import 'package:flutter/widgets.dart';

import '../../base/getx/page_state.dart';
import 'load_state_config_default.dart';

///多状态布局， 配置接口
abstract class LoadStateConfig {
  Widget? getConfigLoadingView();

  Widget? getConfigEmptyView(
    String? empty,
    String? image,
    bool? showRetry,
    VoidCallback? errorRetry,
  );

  Widget? getConfigErrorView(
    String? error,
    String? image,
    bool? showRetry,
    VoidCallback? errorRetry,
  );

  Widget? getConfigErrorServerView(
    String? error,
    String? image,
    bool? showRetry,
    VoidCallback? errorRetry,
  );
}

///类型枚举
enum LoadStateConfigType {
  def,
  sport;
}
