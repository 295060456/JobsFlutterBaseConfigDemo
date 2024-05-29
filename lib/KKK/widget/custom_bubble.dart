import 'dart:developer';

import 'package:flutter/material.dart';

///自定义气泡View
typedef OffsetCallback = double? Function(Size size , Offset offset);
class BubbleView extends StatelessWidget {
  final ArrowDirection direction;
  final Widget child;
  final EdgeInsets? padding;
  final Radius borderRadius;
  final Color backgroundColor;
  final double arrowWidth;
  final double arrowHeight;
  final double arrowWidthWeight;
  final double arrowHeightWeight;
  final double arrowBasisOffset;
  final double arrowPeakOffset;
  final double conicWeight;
  final double? width;
  final double? height;
  //手动定位偏移
  final OffsetCallback? offsetCallback;

  const BubbleView({
    Key? key,
    required this.direction,
    this.borderRadius = const Radius.circular(10.0),
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.all(0.0),
    required this.child,
    this.arrowWidth = 0,
    this.arrowHeight = 0,
    this.arrowWidthWeight = 0.1,
    this.arrowHeightWeight = 0.1,
    this.arrowBasisOffset = 0,
    this.arrowPeakOffset = 0,
    this.conicWeight = 20.0,
    this.width,
    this.height,
    this.offsetCallback,
  })  : assert(arrowWidth > 0 ? arrowHeight > 0 : arrowWidth == 0),
        assert(arrowHeight > 0 ? arrowWidth > 0 : arrowHeight == 0),
        assert(arrowWidthWeight > 0
            ? arrowHeightWeight > 0
            : arrowWidthWeight == 0),
        assert(arrowHeightWeight > 0
            ? arrowWidthWeight > 0
            : arrowHeightWeight == 0),
        assert(arrowWidthWeight < 1),
        assert(arrowHeightWeight < 1),
        super(key: key);

  _padding() {
    switch (direction) {
      case ArrowDirection.bottom:
        return EdgeInsets.only(bottom: arrowHeight).add(padding!);
      case ArrowDirection.left:
        return EdgeInsets.only(left: arrowHeight).add(padding!);
      case ArrowDirection.right:
        return EdgeInsets.only(right: arrowHeight).add(padding!);
      case ArrowDirection.top:
        return EdgeInsets.only(top: arrowHeight).add(padding!);
      case ArrowDirection.none:
        return padding;
    }
  }

  _alignment(ArrowDirection direction) {
    switch (direction) {
      case ArrowDirection.left:
        return Alignment.centerRight;
      case ArrowDirection.right:
        return Alignment.centerLeft;
      case ArrowDirection.top:
        return Alignment.bottomCenter;
      case ArrowDirection.bottom:
        return Alignment.topCenter;
      case ArrowDirection.none:
        return Alignment.center;
    }
  }

  _box() {
    switch (direction) {
      case ArrowDirection.left:
      case ArrowDirection.right:
        return FractionallySizedBox(
          widthFactor: 1 - arrowHeightWeight,
          child: child,
        );
      case ArrowDirection.top:
      case ArrowDirection.bottom:
        return FractionallySizedBox(
          heightFactor: 1 - arrowHeightWeight,
          child: child,
        );
      case ArrowDirection.none:
        return FractionallySizedBox(
          child: child,
        );
    }
  }

  _container() {
    if (arrowWidth > 0) {
      return Container(
        color: backgroundColor,
        padding: _padding(),
        alignment: _alignment(direction),
        width: width,
        height: height==0.0?null:height,
        child: child,
      );
    } else {
      return Container(
        alignment: _alignment(direction),
        padding: padding,
        color: backgroundColor,
        child: _box(),
        width: width,
        height: height==0.0?null:height,

      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: ClipPath(
        clipper: _BubbleViewClipper(
          direction: direction,
          arrowWidth: arrowWidth,
          arrowHeight: arrowHeight,
          widthWeight: arrowWidthWeight,
          heightWeight: arrowHeightWeight,
          radius: borderRadius,
          arrowBasisOffset: arrowBasisOffset,
          arrowPeakOffset: arrowPeakOffset,
          conicWeight: conicWeight,
          basisPointXCallBack: offsetCallback,
        ),
        child: Material(child: _container()),
      ),
    );
  }
}

///方向
enum ArrowDirection { left, right, top, bottom, none }

///路径剪切，用于三角形箭头和矩形拼接，这里三角形均为等腰三角，以顶角所在的点为路径起始点
class _BubbleViewClipper extends CustomClipper<Path> {
  ///三角形箭头的方向
  final ArrowDirection direction;

  ///矩形圆角半径
  final Radius radius;

  ///三角形的宽，即与矩形相邻的底边长度
  final double arrowWidth;

  ///三角形的高
  final double arrowHeight;

  ///三角形的宽与矩形较长边长度的比例，如果指定了[arrowWidth]则无效
  final double widthWeight;

  ///三角形的宽与矩形较窄边长度的比例，如果指定了[arrowHeight]则无效
  final double heightWeight;

  ///三角形底边中心点相对矩形邻边中心点的偏移量，值为[-1,1]时为比例偏移(以矩形邻边长度为基准)，否则为真实偏移；
  ///如0代表三角形底边中心位于邻边中心，箭头则位于矩形某一边的中部
  final double arrowBasisOffset;

  ///三角形顶角顶点相对于三角形底边中心点的偏移量，为比例偏移(以底边长度为基准);
  ///如为0时则为等腰三角形，即中线与底边垂直，为0.5或-0.5时为直角三角形，否则为普通斜三角
  final double arrowPeakOffset;

  ///圆锥曲线权重，权重越小，箭头越扁越接近椭圆曲线，权重越大，箭头越尖锐越接近三角形
  final double conicWeight;

  //手动定位偏移
  final OffsetCallback? basisPointXCallBack;

  _BubbleViewClipper(
      {required this.direction,
      required this.radius,
      this.arrowWidth = 0,
      this.arrowHeight = 0,
      this.widthWeight = 0.05,
      this.heightWeight = 0.2,
      required this.arrowBasisOffset,
      required this.arrowPeakOffset,
      required this.conicWeight,
        this.basisPointXCallBack,
      });

  @override
  Path getClip(Size size) {
    log("w=${size.width},h=${size.height}");

    final pathTriangle = Path();
    final pathRect = Path();

    //若有指定值，则宽高为指定值，
    //若无指定值，宽高以各自平行的矩形边作为基准
    final arrowW = arrowWidth == 0
        ? (direction == ArrowDirection.left || direction == ArrowDirection.right
                ? size.height
                : size.width) *
            widthWeight
        : arrowWidth;
    final arrowH = arrowHeight == 0
        ? (direction == ArrowDirection.left || direction == ArrowDirection.right
                ? size.width
                : size.height) *
            heightWeight
        : arrowHeight;

    log("arrowW=$arrowW,arrowH=$arrowH");

    //箭头为水平方向（左右）时，三角形底边中心的纵坐标
    final basisPointY = arrowBasisOffset < -1 || arrowBasisOffset > 1
        ? size.height / 2 + arrowBasisOffset
        : size.height / 2 * (1 + arrowBasisOffset);
    //箭头为水平方向（左右）时，三角形顶角顶点的纵坐标
    final peakPointY = basisPointY + arrowW * arrowPeakOffset;

    log("arrowBasisOffset=$arrowBasisOffset, arrowPeakOffset=$arrowPeakOffset");
    //箭头为垂直方向（上下）时，三角形底边中心的横坐标
    // final basisPointX = arrowBasisOffset < -1 || arrowBasisOffset > 1
    //     ? size.width / 2 + arrowBasisOffset
    //     : size.width / 2 * (1 + arrowBasisOffset);
    // currentContext
     // findRenderObject() as RenderBox

    final basisPointX = basisPointXCallBack?.call(size,Offset.zero)??( arrowBasisOffset < -1 || arrowBasisOffset > 1
        ? size.width / 2 + arrowBasisOffset
        : size.width / 2 * (1 + arrowBasisOffset));
    //箭头为垂直方向（上下）时，三角形顶角顶点的横坐标
    final peakPointX = basisPointX + arrowW * arrowPeakOffset;
    log("peakX=$peakPointX, basisX=$basisPointX");

    switch (direction) {
      case ArrowDirection.left:
        //绘制位于左边的三角形箭头，即画一个顶角朝左的三角形
        drawArrow(pathTriangle, arrowH, basisPointY - arrowW / 2, 0, peakPointY,
            arrowH, basisPointY + arrowW / 2, conicWeight);
        //绘制位于右方的矩形
        pathRect.addRRect(RRect.fromRectAndRadius(
            Rect.fromLTWH(arrowH, 0, (size.width - arrowH), size.height),
            radius));
        break;
      case ArrowDirection.right:
        //绘制位于右边的三角形箭头，画一个顶角朝右的三角形
        drawArrow(
            pathTriangle,
            size.width - arrowH,
            basisPointY - arrowW / 2,
            size.width,
            peakPointY,
            size.width - arrowH,
            basisPointY + arrowW / 2,
            conicWeight);
        //绘制位于左边的矩形
        pathRect.addRRect(RRect.fromRectAndRadius(
            Rect.fromLTWH(0, 0, (size.width - arrowH), size.height), radius));
        break;
      case ArrowDirection.top:
        //绘制位于顶部的三角形箭头，画一个顶角朝上的三角形
        drawArrow(pathTriangle, basisPointX - arrowW / 2, arrowH, peakPointX, 0,
            basisPointX + arrowW / 2, arrowH, conicWeight);
        //绘制位于下边的矩形
        pathRect.addRRect(RRect.fromRectAndRadius(
            Rect.fromLTWH(0, arrowH, size.width, size.height - arrowH),
            radius));
        break;
      case ArrowDirection.bottom:
        //绘制位于底部的三角形箭头，画一个顶角朝下的三角形
        drawArrow(
            pathTriangle,
            basisPointX - arrowW / 2,
            size.height - arrowH,
            peakPointX,
            size.height,
            basisPointX + arrowW / 2,
            size.height - arrowH,
            conicWeight);
        // 绘制位于下边的矩形
        pathRect.addRRect(RRect.fromRectAndRadius(
            Rect.fromLTWH(0, 0, size.width, size.height - arrowH), radius));
        break;
      default:
        pathRect.addRRect(RRect.fromRectAndRadius(
            Rect.fromLTWH(0, 0, size.width, size.height), radius));
        break;
    }
    //合并
    pathTriangle.addPath(pathRect, const Offset(0, 0));
    return pathTriangle;
  }

  ///根据三点坐标与权重画圆锥三角形
  drawArrow(Path pathTriangle, double startX, double startY, double peakX,
      double peakY, double endX, double endY, double weight) {
    pathTriangle.moveTo(startX, startY);
    pathTriangle.conicTo(peakX, peakY, endX, endY, weight);
    pathTriangle.close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
