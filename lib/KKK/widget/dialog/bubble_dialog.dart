import 'package:flutter/material.dart';
import 'package:flutter_bet/widget/custom_bubble.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BubbleDialog extends StatelessWidget {
  ///气泡箭头的方向 left, right, top, bottom, none
  final ArrowDirection bubbleDirection;

  ///气泡区域中的view
  final Widget bubbleChild;

  ///箭头的宽度
  final double bubbleArrowWidth;

  ///箭头的高度
  final double bubbleArrowHeight;

  ///气泡的四角弧度
  final double bubbleBorderRadius;

  final double arrowBasisOffset;

  final double width ;

  final double height;

  final Color backgroundColor ;
  const BubbleDialog({
    super.key,
    required this.bubbleChild,
    required this.width ,
    this.height = 0.0,
    this.bubbleDirection = ArrowDirection.top,
    this.bubbleArrowWidth = 13,
    this.bubbleArrowHeight = 8,
    this.bubbleBorderRadius = 4,
    this.arrowBasisOffset = 0,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width,
      height: height==0.0?null:height,
      child: Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: _bubble(context)),
    );
  }

  Widget _bubble(BuildContext context) {
    return SingleChildScrollView(
      // padding: EdgeInsets.zero,
      child: BubbleView(
        arrowBasisOffset: arrowBasisOffset,
        backgroundColor: backgroundColor,
        width: width,
        height: height,
        direction: bubbleDirection,
        arrowWidth: bubbleArrowWidth.w,
        arrowHeight: bubbleArrowHeight.w,
        borderRadius: Radius.circular(bubbleBorderRadius.w),
        child: bubbleChild,
      ),
    );
  }
}
