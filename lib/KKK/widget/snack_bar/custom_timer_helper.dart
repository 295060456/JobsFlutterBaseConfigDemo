import '../../utils/time/stop_watch_timer.dart';

/// 定时器辅助类
class CustomTimerHelper {
  CustomTimerHelper({
    required this.durationTime,
    this.onChangeValue,
    this.onTimeStop,
    this.onTimeFinish,
  });

  final int durationTime; //持续时间

  final Function(int value, StopWatchTimer? timer)? onChangeValue; //值发生变化时，被调用；
  final Function(StopWatchTimer? timer)? onTimeStop; //暂停
  final Function(StopWatchTimer? timer)? onTimeFinish; //结束

  ///不是用late 的原因是， late 无法判断是否位null
   StopWatchTimer? _watchTimer;

  ///创建定时器
  StopWatchTimer? newTimer() {
    _watchTimer = StopWatchTimer(
      mode: StopWatchMode.countDown,
      presetMillisecond: StopWatchTimer.getMilliSecFromSecond(durationTime),
      onChangeRawSecond: (value) {
        // print('onChangeRawSecond $value');
      },
      onChangeRawMinute: (value) {
        // print('onChangeRawMinute $value');
      },
      onChange: (value) {
        // progressValue.value = value / 4000;
        // print('onChange $value');
        ///返回的是毫秒
        if (onChangeValue != null) onChangeValue!(value, _watchTimer);
      },
      onStopped: () {
        // print('onStopped');
        if (onTimeStop != null) onTimeStop!(_watchTimer);
      },
      onEnded: () {
        // print('onEnded');
        if (onTimeFinish != null) onTimeFinish!(_watchTimer);
      },
    );
    return _watchTimer;
  }

  ///开启倒计时
  void startTimer() {
    _watchTimer?.onStartTimer();
  }

  ///暂停倒计时
  void stopTimer() {
    _watchTimer?.onStopTimer();
  }

  ///重置时间
  void onResetTimer() {
    _watchTimer?.onResetTimer;
  }

  ///注意 关闭也是调用，避免内存泄漏
  void closeTimer() async {
    await _watchTimer?.dispose();
  }
}
