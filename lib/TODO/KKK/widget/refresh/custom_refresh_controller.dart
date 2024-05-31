import 'dart:developer';

import 'package:easy_refresh/easy_refresh.dart';

///上下拉[CustomEasyRefreshView]组件控制器
class CustomRefreshController extends EasyRefreshController {
  CustomRefreshController({
    super.controlFinishRefresh = false,
    super.controlFinishLoad = false,
  });


  ///加载数据后调用，
  void setRefreshFinish() {
    finishRefresh(IndicatorResult.success, true);
    resetFooter();
    log("刷新结束。。。");
  }

  ///加载数据后调用，hasMore是否还是有数据
  ///加载失败，不设置hasMore，而是还可以触发加载更多去拉取数据
  void setLoadMoreFinish(bool hasMore) {
    finishLoad(hasMore ? IndicatorResult.success : IndicatorResult.noMore);
    log("刷新结束。。。");
  }
}
