import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CountdownBtn extends StatefulWidget {
  final Color backgroundColor;
  final String textFront;
  final String textBack;
  final bool isVertical;
  final int duration;
  final TextStyle textStyle;
  final bool autoStart;
  final int timeStep;
  final bool countUp;
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
    this.timeStep = 1,
    this.countUp = false,
    this.initialTime,
  });

  @override
  _CountdownBtnState createState() => _CountdownBtnState();
}

class _CountdownBtnState extends State<CountdownBtn> {
  late DateTime _remainingTime;
  late Timer? _timer;
  bool isCountingDown = false;
  bool isPaused = false;

  @override
  void initState() {
    super.initState();
    _remainingTime = widget.initialTime ??
        DateTime.now().add(Duration(seconds: widget.duration));
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
                  RichText(text: _coloredTimeSpan(formatDate(_remainingTime))),
                  Text(widget.textBack, style: widget.textStyle),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.textFront, style: widget.textStyle),
                  RichText(text: _coloredTimeSpan(formatDate(_remainingTime))),
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

  // 切换
  void _toggleCountdown() {
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

  // 开始倒计时
  void _startCountdown() {
    setState(() {
      isCountingDown = true;
      isPaused = false;
    });
    _timer = Timer.periodic(
      Duration(seconds: widget.timeStep.abs()),
      (timer) {
        setState(() {
          _remainingTime = widget.countUp
              ? _remainingTime.add(Duration(seconds: widget.timeStep))
              : _remainingTime
                  .subtract(Duration(seconds: widget.timeStep.abs()));

          if (_remainingTime.isBefore(DateTime.now())) {
            timer.cancel();
            isCountingDown = false;
          }
        });
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

  String formatDate(DateTime dateTime) {
    return '${dateTime.year}年${dateTime.month}月${dateTime.day}日'
        ' ${dateTime.hour}时${dateTime.minute}分${dateTime.second}秒';
  }

  TextSpan _coloredTimeSpan(String time) {
    List<InlineSpan> spans = [];
    time.split(RegExp(r'(\d+)')).forEach((segment) {
      if (segment.isNotEmpty) {
        if (RegExp(r'\d+').hasMatch(segment)) {
          switch (segment[segment.length - 1]) {
            case '年':
              spans.add(TextSpan(
                  text: segment,
                  style: widget.textStyle.copyWith(color: Colors.blue)));
              break;
            case '月':
              spans.add(TextSpan(
                  text: segment,
                  style: widget.textStyle.copyWith(color: Colors.orange)));
              break;
            case '日':
              spans.add(TextSpan(
                  text: segment,
                  style: widget.textStyle.copyWith(color: Colors.brown)));
              break;
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
