import 'dart:developer';
import 'dart:math' as math;
import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'sport_image_model.dart';
import 'dart:ui' as ui;

import 'spot_wrapper.dart';
import 'spot_wrapper.dart';

///自定义 图片画笔
/// This class is an implementation of a [FlDotPainter] that draws,[FlDotCirclePainter]
class SportImagePainter extends FlDotPainter {
  SportImagePainter({
    required Map<int, SportImageModel> images,
    required double imageSize,
    required SpotWrapper spot,
    double? heightOffset,
    Color? color,
    double? radius,
    Color? strokeColor,
    double? strokeWidth,
  })  : imageMap = images,
        spotWrapper = spot,
        allImageSize = imageSize,
        offsetHeight = heightOffset ?? 0.0,
        color = color ?? Colors.green,
        radius = radius ?? 4.0,
        strokeColor = strokeColor ?? Colors.green,
        strokeWidth = strokeWidth ?? 1.0;

  Map<int, SportImageModel> imageMap;
  double allImageSize;
  SpotWrapper spotWrapper;
  double offsetHeight;

  /// The fill color to use for the circle
  Color color;

  /// Customizes the radius of the circle
  double radius;

  /// The stroke color to use for the circle
  Color strokeColor;

  /// The stroke width to use for the circle
  double strokeWidth;

  ///点位图片大小半径偏移处理
  double get imageRadiusOffset => allImageSize / 2;

  @override
  void draw(ui.Canvas canvas, FlSpot spot, ui.Offset offsetInCanvas) {
    ///貌似会被掉用2次，第一次是spot，第二次才是自己的强制类型SpotWrapper
    ///所以导致在判断的时候，对一个点进行2次的绘制，所以会出现闪烁的现象
    ///解决的方法：不进行类型判断，直接通过index  来获取列表对应的点数据。
    ///
    ///点位偏移处理
    // double imageSizeOffset = allImageSize / 2;
    Offset offset;
    if (spot.y > 0) {
      offset = ui.Offset(offsetInCanvas.dx - imageRadiusOffset, 0);
    } else {
      // offset = ui.Offset(offsetInCanvas.dx, offsetHeight);
      offset = ui.Offset(offsetInCanvas.dx - imageRadiusOffset, offsetHeight);
    }
    // super.draw(canvas, spot, offset);
    drawCopyWith(canvas, spot, offset);
    // drawTest(canvas, spot, offsetInCanvas);
    // log("开发日志：SportImagePainter...new..."+ this.hashCode.toString());
  }

  void drawCopyWith(Canvas canvas, FlSpot spot, Offset offsetInCanvas) {
    //【picture模式可以显示】有事件才开始绘制 事件图片
    // if(spot is FlSpotWrapper && spot.hasEvent){
    //   ui.Image image = picture.toImageSync(14, 14);
    //   Paint paint = Paint()..style = PaintingStyle.fill;
    //   canvas.drawImage(image, offsetInCanvas, paint);
    // }

    // canvas.drawImage(imageMap[1]!.image, offsetInCanvas, Paint());
    // return;
    //【image模式】
    if (spotWrapper.hasEvent) {
      Paint paint = Paint();
      drawImageFromType(canvas, offsetInCanvas, paint);
      //是否需要添加 加号➕ 标签
      if (spotWrapper.addNew) {
        //在上面
        if (spot.y > 0) {
          canvas.drawImage(imageMap[SportImageType.add.type]!.image,
              offsetInCanvas.translate(imageRadiusOffset + 1, -imageRadiusOffset), paint);
        }
        //在下面
        else {
          canvas.drawImage(imageMap[SportImageType.add.type]!.image,
              offsetInCanvas.translate(imageRadiusOffset + 1, imageRadiusOffset), paint);
        }
      }
    } else {
      ///必须给个默认的点位绘制，即使是0
      canvas.drawCircle(offsetInCanvas, 0, Paint()
          // ..color = Colors.red
          // ..style = PaintingStyle.fill,
          );
    }
  }

  ///根据事件类型绘画 图片
  drawImageFromType(Canvas canvas, Offset offsetInCanvas, Paint paint) {
    //如果是圆点
    if (spotWrapper.eventType == SportImageType.pointFill.type ||
        spotWrapper.eventType == SportImageType.pointStroke.type) {
      ///对于使用drawImage 与 drawCircle， 的偏移不一样，所以在这里还原一下Offset 给 drawCircle
      ///重新处理偏移
      Offset offset;
      if (spotWrapper.y > 0) {
        offset = ui.Offset(offsetInCanvas.dx + imageRadiusOffset + 1, imageRadiusOffset - 1);
      } else {
        // offset = ui.Offset(offsetInCanvas.dx, offsetHeight);
        offset =
            ui.Offset(offsetInCanvas.dx + imageRadiusOffset, offsetHeight + imageRadiusOffset );
      }
      //还分 实心和空心，以及上下颜色不同
      canvas.drawCircle(
        offset,
        spotWrapper.eventType == SportImageType.pointFill.type ? radius : radius - strokeWidth / 2,
        Paint()
          ..color = spotWrapper.y > 0 ? Colors.blue : Colors.green
          ..strokeWidth = strokeWidth
          ..style = spotWrapper.eventType == SportImageType.pointFill.type
              ? PaintingStyle.fill
              : PaintingStyle.stroke,
      );
    } else {
      canvas.drawImage(imageMap[spotWrapper.eventType]!.image, offsetInCanvas, paint);
    }
  }

  ///测试用的
  void drawTest(ui.Canvas canvas, FlSpot spot, Offset offsetInCanvas) {
    //有事件的点位
    if (spotWrapper.hasEvent) {
      if (spotWrapper.addNew) {
        canvas.drawCircle(
          offsetInCanvas,
          radius,
          Paint()
            ..color = Colors.yellow
            ..strokeWidth = 1
            ..style = PaintingStyle.stroke,
        );
      } else {
        canvas.drawCircle(
          offsetInCanvas,
          radius,
          Paint()
            ..color = Colors.green
            ..strokeWidth = 1
            ..style = PaintingStyle.stroke,
        );
      }
      // canvas.restore();
    } else {
      canvas.drawCircle(
        // offsetInCanvas.translate(0, 20),
        offsetInCanvas,
        radius,
        Paint()
          ..color = Colors.white
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke, //alphaPaint
      );
      // canvas.restore();
      // canvas.save();
    }
  }

  /// Implementation of the parent class to get the size of the circle
  @override
  Size getSize(FlSpot spot) {
    return Size(10, 10);
  }

  /// Used for equality check, see [EquatableMixin].
  @override
  List<Object?> get props => [
        imageMap,
        spotWrapper,
        radius,
        strokeColor,
        strokeWidth,
      ];
}
