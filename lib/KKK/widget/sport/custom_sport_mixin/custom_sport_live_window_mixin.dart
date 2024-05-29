import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/function.dart';
import '../costom_video_play.dart';

mixin CustomSportLiveWindowMixin{
  List<OverlayEntry> overlayEntries = [];
  Future addOverlayEntry(double left, double top,BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(builder: (BuildContext context) {
      return AppFloatBox(callback: () {
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

class AppFloatBox extends StatefulWidget {
  ParamVoidCallback? callback;

  AppFloatBox({super.key, this.callback});

  @override
  _AppFloatBoxState createState() => _AppFloatBoxState();
}

class _AppFloatBoxState extends State<AppFloatBox> {
  Offset offset = Offset(10, kToolbarHeight + 100);
  double width = 300;
  double height = 260;

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
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Container(
        color: Colors.transparent,
        child: GestureDetector(
            onPanUpdate: (detail) {
              setState(() {
                offset =
                    _calOffset(MediaQuery.of(context).size, offset, detail.delta);
              });
            },
            onPanEnd: (detail) {},
            child: Container(
                color: Colors.transparent,
                width: width,
                height: height,
                child: CostomVideoPlay(
                  onRemoveCallback: widget.callback,
                ))),
      ),
    );
  }
}