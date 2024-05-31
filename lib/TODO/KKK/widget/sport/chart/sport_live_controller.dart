import 'package:flutter_bet/generated/l10n.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'sport_live_model.dart';
import 'spot_wrapper.dart';

/// 体育-实时统计对话框-直播动画 controller
class SportLiveController extends GetxController with GetTickerProviderStateMixin {
  static const limitCount = 91;
  late AnimationController animController;
  late Animation<Offset> animation;

  final topPosition = 0.0.obs;
  final leftPosition = 0.0.obs;

  double playScreenWidth = 0.0;
  double playScreenHeight = 0.0;
  late Timer timer;
  final intervalTimer = 500;//模拟动画间隔，毫秒单位
  final sportLiveModel = SportLiveModel(0, 0).obs;

  @override
  void onInit() {
    super.onInit();
    initAnimation();
    log("开发日志：SportLiveController...onInit...");
  }

  @override
  void onReady() {
    super.onReady();
    // doAnimation();
    log("开发日志：SportLiveController...onReady...");
    initTimeData();
  }

  @override
  void onClose() {
    animController.dispose();
    timer.cancel();
    super.onClose();
    log("开发日志：SportLiveController...onClose...");
  }

  initAnimation() {
    //需要 with TickerProviderStateMixin， controller 的话使用get的
    animController = AnimationController(duration: Duration(milliseconds: 3 * 1000), vsync: this);
    animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //AnimationStatus.completed 动画在结束时停止的状态
        debugPrint(S.current.done_text);
        // animController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //AnimationStatus.dismissed 表示动画在开始时就停止的状态
        debugPrint(S.current.random_text_731);
        // animController.forward();
//        controller.dispose();
      }
    });
    animation = Tween(begin: Offset.zero, end: Offset(10.0, 10.0)).animate(animController);
  }

  ///开始执行动画
  doAnimation() {
    //开始执行动画
    if (animation.isCompleted) {
      animController.reverse();
    } else if (animation.isDismissed) {
      animController.forward();
    }
  }

  double randomTopPosition(double top) => math.Random().nextDouble() * top;

  double randomLeftPosition(double left) => math.Random().nextDouble() * left;

  ///重置位置
  doResetPosition() {
    leftPosition.value = playScreenWidth / 2;
    topPosition.value = playScreenHeight / 2;
  }

  doChangePosition(SportLiveModel model) {
    leftPosition.value = model.x;
    topPosition.value = model.y;
  }

  doGetPositionX(SpotWrapper? spotWrapper) {
    if (spotWrapper != null) {
      leftPosition.value = randomLeftPosition(spotWrapper.x);
    } else {
      leftPosition.value = 0;
    }
  }

  doGetPositionY(SpotWrapper? spotWrapper) {
    if (spotWrapper != null) {
      topPosition.value = randomTopPosition(spotWrapper.y.abs() * 10);
    } else {
      topPosition.value = 0;
    }
  }

  ///定时器模拟数据
  void initTimeData() {
    //定时器生产数据点
    int index = 0;
    timer = Timer.periodic(Duration(milliseconds: intervalTimer), (timer) {
      if (index < limitCount) {
        var x = randomLeftPosition(playScreenWidth-20);
        var y = randomTopPosition(playScreenHeight-20);
        sportLiveModel.value = SportLiveModel(x, y);
        index++;
      } else {
        timer.cancel();
      }
    });
  }
}
