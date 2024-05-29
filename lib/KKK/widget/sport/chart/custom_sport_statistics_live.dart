import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bet/widget/sport/chart/spot_wrapper.dart';
import 'package:get/get.dart';

import '../../button/custom_button.dart';
import 'sport_live_controller.dart';
import 'sport_live_model.dart';

///体育直播 场馆动画
class CustomSportStatisticsLive extends StatefulWidget {
   CustomSportStatisticsLive({super.key,required this.spotWrapper});

 final SpotWrapper? spotWrapper;

  @override
  State<CustomSportStatisticsLive> createState() => _CustomSportStatisticsLiveState();
}

class _CustomSportStatisticsLiveState extends State<CustomSportStatisticsLive> {
  final controller = Get.put<SportLiveController>(SportLiveController());
  final GlobalKey _keyPlayScreen = GlobalKey();
  @override
  void dispose() {
    Get.delete<SportLiveController>();
    super.dispose();
  }

  @override
  void initState() {
    //监听Widget是否绘制完毕
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  void _afterLayout(_) {
    _getPositions();
  }

  _getPositions() {
    //【注意：在flutter sdk 2.0.4 上，需要as RenderBox强转下】
    final RenderBox renderBoxRed = _keyPlayScreen.currentContext!.findRenderObject() as RenderBox;
    final Size size =   renderBoxRed.size;
    final positionsRed = renderBoxRed.localToGlobal(Offset(0, 0));
    print("size of red:$size");
    print("positions of red:$positionsRed");
    controller.playScreenWidth = size.width;
    controller.playScreenHeight = size.height;
  }

  @override
  Widget build(BuildContext context) {
    // print("spotWrapper ...:${widget.spotWrapper}");
    // controller.doChangePosition(controller.sportLiveModel.value);
    return Obx(() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            Container(
              key: _keyPlayScreen,
              // padding: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.zero,
              child: Image.asset(
                'assets/images/sport/bg_sport_play_screen.webp',
                fit: BoxFit.fill,
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: controller.intervalTimer),
              // curve: Curves.fastOutSlowIn,
              // curve: Curves.easeInOutBack,//有一次回弹
              // curve: Curves.bounceOut,//有自由落体回弹
              // curve: Curves.elasticIn,//先后退一点再加速前进
              // curve: Curves.elasticOut,//先后退一点再加速前进
              curve: Curves.elasticInOut,//先后退一点再加速前进
              child: Image.asset(
                width: 10,
                height: 10,
                fit: BoxFit.cover,
                'assets/images/sport/ic_sport_football_flag.webp',
                // color: Colors.red,
              ),
              left: controller.sportLiveModel.value.x,
              top: controller.sportLiveModel.value.y,
              // left: 0,
              // top: 0,

            ),
            Positioned(
              right: 10,
              child: CustomButton(
                title: '',
                textColor: Colors.red,
                onTap: () {
                  // final controller = Get.find<SportLiveController>();
                  // controller.doAnimation();
                  controller.doResetPosition();
                },
              ),
            )
          ],
        ),
      );
    });
  }

  @override
  Widget build2(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      // log("开发日志：_buildLiveAnima..."+c.toString());
      return Stack(
        children: [
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 16),
            padding: EdgeInsets.zero,
            child: Image.asset(
              'assets/images/sport/bg_sport_play_screen_old.webp',
              fit: BoxFit.fill,
            ),
          ),
          // AnimatedPositioned(
          //   child: Image.asset(
          //     fit: BoxFit.fitWidth,
          //     'assets/images/sport/ic_sport_football_flag.webp',
          //   ),
          //   duration: Duration(seconds: 10),
          //   curve: Curves.easeInCubic,
          //   bottom: 10,
          // ),
          Positioned(
            left: 16,
            child: SlideTransition(
              position: controller.animation,
              //将要执行动画的子view
              child: Image.asset(
                fit: BoxFit.cover,
                'assets/images/sport/ic_sport_football_flag.webp',
              ),
            ),
          ),
          // Container(
          //   //SlideTransition 用于执行平移动画
          //   child: SlideTransition(
          //     position: controller.animation,
          //     //将要执行动画的子view
          //     child: Image.asset(
          //       fit: BoxFit.cover,
          //       'assets/images/sport/ic_sport_football_flag.webp',
          //     ),
          //   ),
          // ),
        ],
      );
    });
  }
}
