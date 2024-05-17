import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountdownBtn extends StatefulWidget {
  final Color backgroundColor;
  final String textFront;
  final String textBack;
  final bool isVertical;
  final double duration; // 修改为 double 类型
  final TextStyle textStyle;
  final bool autoStart;
  final double timeStep; // double 类型
  final DateTime? initialTime;

  const CountdownBtn({
    super.key,
    this.backgroundColor = Colors.grey,
    required this.textFront,
    required this.textBack,
    required this.isVertical,
    required this.duration,
    required this.textStyle,
    this.autoStart = false,
    this.timeStep = 0.5,
    this.initialTime,
  });

  @override
  _CountdownBtnState createState() => _CountdownBtnState();
}

class _CountdownBtnState extends State<CountdownBtn> {
  late Duration _remainingDuration;
  late Timer? _timer;
  bool isCountingDown = false;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    _remainingDuration = Duration(milliseconds: (widget.duration * 1000).toInt());
    if (widget.autoStart) {
      _startCountdown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleCountdown,
      child: Container(
        color: widget.backgroundColor,
        padding: const EdgeInsets.all(10.0),
        child: widget.isVertical
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.textFront, style: widget.textStyle),
                  RichText(text: _coloredTimeSpan(formatDuration(_remainingDuration))),
                  Text(widget.textBack, style: widget.textStyle),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.textFront, style: widget.textStyle),
                  RichText(text: _coloredTimeSpan(formatDuration(_remainingDuration))),
                  Text(widget.textBack, style: widget.textStyle),
                ],
              ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // 手势切换
  void _toggleCountdown() {
    debugPrint("手势切换");
    if (isCountingDown) {
      if (isPaused) {
        _resumeCountdown();
      } else {
        _pauseCountdown();
      }
    } else {
      _startCountdown();
    }
  }

  // 开始倒计时(核心方法)
  void _startCountdown() {
    setState(() {
      isCountingDown = true;
      isPaused = false;
    });
    _timer = Timer.periodic(
      Duration(milliseconds: (widget.timeStep.abs() * 1000).toInt()), // 毫秒为单位
      (timer) {
        setState(() {
          _remainingDuration -= Duration(milliseconds: (widget.timeStep * 1000).toInt()); // 更新剩余时间
          if (_remainingDuration <= Duration.zero) {
            timer.cancel();
            isCountingDown = false;
            _remainingDuration = Duration.zero;
          }
        });
        // 打印当前时间
        // debugPrint('打印当前时间: ${DateTime.now()}');
      },
    );
    _playSound();
  }

  // 暂停定时器
  void _pauseCountdown() {
    setState(() {
      isPaused = true;
    });
    _timer?.cancel();
    _playSound();
  }

  // 重启定时器
  void _resumeCountdown() {
    setState(() {
      isPaused = false;
    });
    _startCountdown();
  }

  // 播放声音
  void _playSound() {
    SystemSound.play(SystemSoundType.click);
  }

  String formatDuration(Duration duration) {
    debugPrint('打印duration: ${duration.inHours}时${duration.inMinutes.remainder(60)}分${duration.inSeconds.remainder(60)}秒');
    return '${duration.inHours}时${duration.inMinutes.remainder(60)}分${duration.inSeconds.remainder(60)}秒';
  }

  TextSpan _coloredTimeSpan(String time) {
    List<InlineSpan> spans = [];
    time.split(RegExp(r'(\d+)')).forEach((segment) {
      if (segment.isNotEmpty) {
        if (RegExp(r'\d+').hasMatch(segment)) {
          switch (segment[segment.length - 1]) {
            case '时':
              spans.add(TextSpan(
                  text: segment,
                  style: widget.textStyle.copyWith(color: Colors.red)));
              break;
            case '分':
              spans.add(TextSpan(
                  text: segment,
                  style: widget.textStyle.copyWith(color: Colors.yellow)));
              break;
            case '秒':
              spans.add(TextSpan(
                  text: segment,
                  style: widget.textStyle.copyWith(color: Colors.green)));
              break;
            default:
              spans.add(TextSpan(text: segment, style: widget.textStyle));
          }
        } else {
          spans.add(TextSpan(text: segment, style: widget.textStyle));
        }
      }
    });
    return TextSpan(children: spans);
  }
}
