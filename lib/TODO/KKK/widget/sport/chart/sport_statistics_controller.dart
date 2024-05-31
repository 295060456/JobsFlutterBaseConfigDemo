import 'dart:async';
import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'dart:math' as math;

import 'sport_image_model.dart';
import 'spot_wrapper.dart';

/// 体育-实时统计对话框 controller
class SportStatisticsController extends GetxController with GetTickerProviderStateMixin {
  static const limitCount = 91;

  // final xValues = ['0', "15'", "30'", "45'", "60'", "75'", "90'"];
  final xValues = List.generate(limitCount, (index) {
    return index == 0 ? "" : "${index}'";
  });

  var imageMap = <int, SportImageModel>{};
  final spotList = <SpotWrapper>[].obs;
  double xValue = 0;
  final initFinish = false.obs;

  late Timer timer;

  @override
  void onInit() {
    super.onInit();
    loadUiImageList();
    initTimeData();
    // initAnimation();
  }

  @override
  void onReady() {
    super.onReady();
    // doAnimation();
  }

  @override
  void onClose() {
    timer.cancel();
    // animController.dispose();
    super.onClose();
    log("开发日志：controller...onClose...");
  }


  ///测量chart高度
  final GlobalKey chartKey = GlobalKey();
  var chartHeight = 0.0;

  double measureChartHeight() {
    if (chartHeight != 0) {
      return chartHeight;
    }
    // final containerHeight = chartKey.currentContext.size.height;
    // 获取 RenderBox 的大小
    // final Size size = renderBox.size;
    final RenderBox renderBox = chartKey.currentContext!.findRenderObject() as RenderBox;

    // 获取组件大小
    Size size = renderBox.size;
    print('Size: $size');

    // 获取组件相对于屏幕的坐标
    // Offset offset = renderBox.localToGlobal(Offset.zero);
    // print('Position relative to screen: $offset');

    // 获取组件相对于其父widget的坐标
    // Offset positionInParent = renderBox.localToGlobal(Offset.zero, ancestor: renderBox);
    // print('Position relative to parent: $positionInParent');
    // log('开发日志：measureChartHeight...size...' + size.toString());
    chartHeight = size.height;
    return chartHeight;
  }

  ///定时器模拟数据xx
  void initTimeData() {
    //定时器生产数据点
    int index = 0;
    double step = 1;
    timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (index < limitCount) {
        var point = SpotWrapper.copyWith(
          // FlSpot(xValue, math.sin(xValue) * 3 + math.Random().nextInt(2) - 0.5),
          FlSpot(xValue, math.sin(xValue) + math.Random().nextInt(5) - math.Random().nextInt(4)),
          hasEvent: index > 1 && index % 4 == 0 ? math.Random().nextBool() : false,
          //SportImageType.yellowCard.type
          eventType: math.Random().nextInt(5) + 2,
          addNew: math.Random().nextBool(),
        );

        //修改对应位置数据
        // spotList[index] = point;
        spotList.add(point);
        // log('开发日志：定时器...index...' + index.toString());
        xValue += step;
        index++;
      } else {
        timer.cancel();
      }
    });
  }

  void loadUiImageList() async {
    if (initFinish.value && imageMap.isNotEmpty) {
      return;
    }
    var width = 10;
    var height = 10;
    var imageMapTemp = <int, SportImageModel>{};
    var addFlag =
        await loadUiImage("assets/images/sport/ic_sport_add_flag.webp", width - 2, height - 2);
    imageMapTemp[SportImageType.add.type] = SportImageModel(SportImageType.add, addFlag);
    var footballFlag =
        await loadUiImage("assets/images/sport/ic_sport_football_flag.webp", width, height);
    imageMapTemp[SportImageType.football.type] =
        (SportImageModel(SportImageType.football, footballFlag));
    var upDownFlag =
        await loadUiImage("assets/images/sport/ic_sport_up_down_flag.webp", width, height);
    imageMapTemp[SportImageType.upDown.type] = (SportImageModel(SportImageType.upDown, upDownFlag));
    var yellowFlag =
        await loadUiImage("assets/images/sport/ic_sport_yellow_card_flag.webp", width, height);
    imageMapTemp[SportImageType.yellowCard.type] =
        (SportImageModel(SportImageType.yellowCard, yellowFlag));
    imageMap = imageMapTemp;
    initFinish.value = true;
  }

  ///加载本地图片 转换成 ui.image
  Future<ui.Image> loadUiImage(String imageAssetPath, int width, int height) async {
    //log('开发日志：loadUiImage...子线程...');
    final ByteData data = await rootBundle.load(imageAssetPath);
    final Completer<ui.Image> completer = Completer();
    // 不该改变大小写法
    // ui.decodeImageFromList(Uint8List.view(data.buffer), (ui.Image img) {
    //   return completer.complete(img);
    // });

    _decodeImageFromListAsync(Uint8List.view(data.buffer), width, height, (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

  ///复制官方api
  Future<void> _decodeImageFromListAsync(
    Uint8List list,
    int width,
    int height,
    ui.ImageDecoderCallback callback,
  ) async {
    final ui.Codec codec =
        await ui.instantiateImageCodec(list, targetWidth: width, targetHeight: height);
    final ui.FrameInfo frameInfo = await codec.getNextFrame();
    callback(frameInfo.image);
  }

  ///还是会闪烁
  Future<ui.Image> loadUiImage2(String imageAssetPath, int width, int height) async {
    final data = await rootBundle.load(imageAssetPath);
    final bytes = data.buffer.asUint8List();
    final codec = await ui.instantiateImageCodec(bytes);
    final frameInfo = await codec.getNextFrame();
    // print('帧数数量：${codec.frameCount}');
    // print('持续时间：${frameInfo.duration * frameCount}');
    var image = frameInfo.image;
    return image;
  }




}
