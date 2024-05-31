import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/function.dart';
import '../costom_video_play.dart';
import '../chart/custom_sport_statistics_view.dart';

///体育 实时统计 浮动框 mixin
mixin CustomSportStatisticsWindowMixin {
  List<OverlayEntry> overlayEntries = [];

  //显示体育 实时统计浮动框
  Future showSportStatistics(double left, double top, BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(builder: (BuildContext context) {
      return AppSportFloatBox(callback: () {
        ///点击关闭当前悬浮播放器
        overlayEntry?.remove();

        ///从列表中删除当前overlayEntry
        overlayEntries.remove(overlayEntry);
      });
    });

    /// 赋值  方便移除
    overlayState.insert(overlayEntry);
    overlayEntries.add(overlayEntry);
  }
}

class AppSportFloatBox extends StatefulWidget {
  ParamVoidCallback? callback;

  AppSportFloatBox({super.key, this.callback});

  @override
  _AppSportFloatBoxState createState() => _AppSportFloatBoxState();
}

class _AppSportFloatBoxState extends State<AppSportFloatBox> {
  // static double screenHeight = window.physicalSize.height;
  static double screenHeight =700;
  double offsetY = kToolbarHeight + 100;
  Offset offset = Offset(10, kToolbarHeight + 100);
  double width = 350;
  double height =580;//更改动态设置
  // double height = screenHeight - offsetY;

  Offset _calOffset(Size size, Offset offset, Offset nextOffset) {
    double dx = 0;
    //水平方向偏移量不能小于0不能大于屏幕最大宽度
    if (offset.dx + nextOffset.dx <= 0) {
      dx = 0;
    } else if (offset.dx + nextOffset.dx >= (size.width - width)) {
      dx = size.width - width;
    } else {
      dx = offset.dx + nextOffset.dx;
    }
    double dy = 0;
    //垂直方向偏移量不能小于0不能大于屏幕最大高度
    if (offset.dy + nextOffset.dy >= (size.height - height)) {
      dy = size.height - height;
    } else if (offset.dy + nextOffset.dy <= kToolbarHeight) {
      dy = kToolbarHeight;
    } else {
      dy = offset.dy + nextOffset.dy;
    }
    return Offset(
      dx,
      dy,
    );
  }

  @override
  Widget build(BuildContext context) {
    // log('开发日志：offset...' + offset.toString());
    //固定 屏幕大小
    // width = Get.width - offset.dx * 4;
    // height = 300;
    return Positioned(
      left: offset.dx * 2,
      top: offset.dy + 10,
      child: Container(
        color: Colors.transparent,
        child: GestureDetector(
          onPanUpdate: (detail) {
            setState(() {
              offset = _calOffset(MediaQuery.of(context).size, offset, detail.delta);
            });
          },
          onPanEnd: (detail) {},
          child: Container(
            color: Colors.transparent,
            width: width,
            height: height,
            child: CustomSportStatisticsView(onRemoveCallback: widget.callback),
          ),
        ),
      ),
    );
  }
}
