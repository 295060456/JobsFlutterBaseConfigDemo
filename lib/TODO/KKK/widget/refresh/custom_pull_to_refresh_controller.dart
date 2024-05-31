import 'package:flutter_bet/services/event/event_service.dart';

const String kUpdateRefreshResultEvent = 'kUpdateRefreshResultEvent';

enum CustomIndicatorResult {
  /// No state until the task is not triggered.
  none,

  /// Task succeeded.
  success,

  /// Task failed.
  fail,

  /// No more data.
  noMore,
}

enum CustomIndicatorMode {
  /// Default state, 不活跃的
  inactive,

  /// 滚动中...
  drag,

  // /// Overscroll and reach the trigger task distance.
  // /// This state is released and the list triggers the task.
  // armed,
  //
  // /// Overscroll and about to trigger a task.
  // /// This state indicates that the user has released.
  // ready,

  /// Task in progress.
  /// In progress until the task is completed.
  processing,

  /// Task completed.
  /// The task is over, but the whole process is not complete.
  /// Set the ending animation, which will be done after this state.
  processed,

  /// The whole process is done.
  /// When finished, go back to [inactive]
  done,
}


class CustomPullToRefreshController {
  final bool controlFinishRefresh;
  final bool controlFinishLoad;

  /// Task completion result.
  CustomIndicatorResult footIndicatorResult = CustomIndicatorResult.none;

  CustomIndicatorMode indicatorMode = CustomIndicatorMode.inactive;

  CustomPullToRefreshController({
    this.controlFinishRefresh = false,
    this.controlFinishLoad = false,
  });

  ///刷新结束，状态更新
  void finishRefresh() {
    indicatorMode = CustomIndicatorMode.done;
    footIndicatorResult = CustomIndicatorResult.none;
    EventService.instance.dispatchEvent(kUpdateRefreshResultEvent);
  }

  ///加载更多结束，状态更新
  void finishLoad({CustomIndicatorResult result = CustomIndicatorResult.success}) {
    footIndicatorResult = result;
    //todo: 旧代码有bug ，执行noMore 之后会再执行onLoadMore()方法
    // if(footIndicatorResult == CustomIndicatorResult.noMore){
    //   //不可再加载更多
    //   indicatorMode = CustomIndicatorMode.inactive;
    // }
    EventService.instance.dispatchEvent(kUpdateRefreshResultEvent);
  }


}
