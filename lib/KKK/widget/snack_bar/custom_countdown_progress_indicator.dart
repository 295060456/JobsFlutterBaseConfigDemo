import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bet/services/event/event_service.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:get/get.dart';
import '../../utils/time/stop_watch_timer.dart';
import 'custom_countdown_progress_indicator_controller.dart';

class CustomCountDownProgressIndicator extends StatefulWidget {
  final int countdown; //时间单位秒
  final double? height;
  final ColorScheme? colorScheme;
  final CustomCountDownProgressIndicatorController controller;
  final double progressValue ; //进度初始值

  const CustomCountDownProgressIndicator({
    super.key,
    required this.countdown,
    this.colorScheme,
    this.height,
    required this.controller,
    required this.progressValue,
  });

  @override
  State<StatefulWidget> createState() => _CustomCountDownProgressIndicator();
}

class _CustomCountDownProgressIndicator extends State<CustomCountDownProgressIndicator>
    with EventListener {
  final GlobalKey _globalKey = GlobalKey();
  double _progressWidth = 0.0;
  Timer? _timer;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EventService.instance.addListener(kStartCountDownProgressIndicatorAnimation, this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final defaultColorScheme = widget.colorScheme ?? ThemeService().theme.colorScheme;
    return Container(
        key: _globalKey,
        alignment: Alignment.centerRight,
        height: widget.height,
        // color: Colors.orange[200],
        // child: AnimatedContainer(
        //   duration: Duration(seconds: widget.countdown),
        //   curve: Curves.linear,
        //   height: widget.height,
        //   // color: defaultColorScheme.surfaceVariant,
        //   width: _progressWidth,
        // ),
        child: LinearProgressIndicator(
          value: widget.progressValue,
          // backgroundColor: Colors.orange[200],
          // backgroundColor: defaultColorScheme.surfaceVariant,
          // color: Colors.orange[200],
            backgroundColor:defaultColorScheme.tertiary,
            color:Colors.blue[200]!.withOpacity(0.3)
        ));
  }

  @override
  void onEvent(String eventId, event) {
    // TODO: implement onEvent
    if (eventId == kStartCountDownProgressIndicatorAnimation) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        if (mounted) {
          final canvasBox = _globalKey.currentContext?.findRenderObject() as RenderBox;
          setState(() {
            _progressWidth = canvasBox.size.width;
            // print("_progressWidth....$_progressWidth");
          });
        }
      });
    }
  }

}
