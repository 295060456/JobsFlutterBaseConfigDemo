import 'dart:developer';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';

import '../../base/getx/page_state.dart';
import '../../model/page_common_model.dart';
import 'custom_refresh_controller.dart';

///联盟计划， 对列表提供 状态管理mixin
mixin CustomRefreshStateMixinHelper {
  ///属于刷新列表自己的， 整体
  final pageStateObs = PageState.DEFAULT.obs;

  // ///listView 上下拉控制器
  // final CustomEasyRefreshController refreshController = CustomEasyRefreshController(
  //   controlFinishRefresh: true,
  //   controlFinishLoad: true,
  // );

  ///是否显示loading
  ///设计逻辑， 如果第一次，loading 不透明，非第一次，看openVisible 是否要透明,
  ///overlay是否遮住
  ///preload 优先级最高
  void showLoading([bool isShow = false, bool overlay = false, bool preload = false]) {
    // pageStateObs.value = PageState.PRELOAD;
    // return;
    //骨架屏优先级最大
    if (preload) {
      // pageStateObs.value = PageState.PRELOAD_UPDATED;
      pageStateObs.value = PageState.PRELOAD;
      return;
    }
    if (isShow && overlay) {
      pageStateObs.value = PageState.LOADING;
    } else if (isShow && !overlay) {
      pageStateObs.value = PageState.UPDATED;
    }
  }

  ///有可能刷新 返回空数据
  void successFinish(
      bool isRefresh, PageCommonModel model, CustomRefreshController refreshController) {
    //延迟处理，避免刷新组件更新ui 和 数据列表更新数据重叠
    Future.delayed(const Duration(milliseconds: 200), () {
      //【1】上下拉组件状态处理
      if (isRefresh) {
        refreshController.setRefreshFinish();
        // 还有一种情况就是，第一页就没有更多
        // if (!model.hasMore()) {
        //   log("第一次加载,就没有更多数据...");
        //   refreshController.setLoadMoreFinish(false);
        // }
      } else {
        //是否有更多
        refreshController.setLoadMoreFinish(model.hasMore());
      }

      //【2】多状态布局组件处理
      if (isRefresh && model.content.isEmpty) {
        pageStateObs.value = PageState.EMPTY;
        // pageStateObs.value = PageState.FAILED;
        // pageStateObs.value = PageState.FAILED_SERVER;
      } else {
        pageStateObs.value = PageState.SUCCESS;
        // pageStateObs.value = PageState.EMPTY;
        // pageStateObs.value = PageState.FAILED;
        // pageStateObs.value = PageState.FAILED_SERVER;
      }
    });
  }

  // logic.loadNetData(isRefresh: true, isShowLoad: true, isFirst: false);
  void failFinish(
      bool isConnect, bool isRefresh, bool isFirst, CustomRefreshController refreshController) {
    //延迟处理，避免刷新组件更新ui 和 数据列表更新数据重叠
    //【1、刷新情况】
    Future.delayed(const Duration(milliseconds: 200), () {
      //todo: 200的异常直接给空数据显示。 考虑到未登陆情况
      if (isRefresh && isFirst) {
        // pageStateObs.value = isConnect ? PageState.FAILED : PageState.FAILED_SERVER;
        pageStateObs.value = isConnect ? PageState.EMPTY : PageState.FAILED_SERVER;
        refreshController.setRefreshFinish();
      } else if (isRefresh && !isFirst) {
        // pageStateObs.value = isConnect ? PageState.FAILED : PageState.FAILED_SERVER;
        pageStateObs.value = isConnect ? PageState.EMPTY : PageState.FAILED_SERVER;
        refreshController.setRefreshFinish();
      } else {
        //【2、加载更多情况】
        //处理{"status":false,"data":"操作太频繁"}
        //不是刷新， 是加载更多，pageStateObs不处理
        // refreshController.setLoadMoreFinish(true);
        refreshController.setLoadMoreFinish(true);
        // refreshController.resetFooter();
        // refreshController.finishLoad( IndicatorResult.fail,true);
        // pageStateObs.value = PageState.FAILED_SERVER;
      }
    });
  }
}
