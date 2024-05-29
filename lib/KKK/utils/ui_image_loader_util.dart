import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

///flutter ui.image 库图片加载工具
class ImageLoaderUtil {
  ImageLoaderUtil._(); //私有化构造
  static final ImageLoaderUtil loader = ImageLoaderUtil._(); //单例模式

  //通过 文件读取Image
  Future<ui.Image> loadImageByFile(
      String path, {
        int? width,
        int? height,
      }) async {
    var list = await File(path).readAsBytes();
    return loadImageByUint8List(list, width: width, height: height);
  }

//通过[Uint8List]获取图片,默认宽高[width][height]
  Future<ui.Image> loadImageByUint8List(
      Uint8List list, {
        int? width,
        int? height,
      }) async {
    ui.Codec codec = await ui.instantiateImageCodec(list, targetWidth: width, targetHeight: height);
    ui.FrameInfo frame = await codec.getNextFrame();
    return frame.image;
  }

  //通过ImageProvider读取Image
  Future<ui.Image> loadImageByProvider(
      ImageProvider provider, {
        ImageConfiguration config = ImageConfiguration.empty,
      }) async {
    Completer<ui.Image> completer = Completer<ui.Image>(); //完成的回调
    late ImageStreamListener listener;
    ImageStream stream = provider.resolve(config); //获取图片流
    listener = ImageStreamListener((ImageInfo frame, bool sync) {
      //监听
      final ui.Image image = frame.image;
      completer.complete(image); //完成
      stream.removeListener(listener); //移除监听
    });
    stream.addListener(listener); //添加监听
    return completer.future; //返回
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



  /// 保存图片到相册
  static Future<bool> saveImageToCamera(GlobalKey repaintKey) async {
    //检查是否有存储权限
    // var status = await Permission.storage.status;
    // if (!status.isGranted) {
    //   status = await Permission.storage.request();
    //   // print(status);
    //   return false;
    // }
    try{
      RenderRepaintBoundary? boundary = repaintKey.currentContext?.findRenderObject()! as RenderRepaintBoundary;
      // RenderRepaintBoundary boundary = repaintKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage();
      ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final result = await ImageGallerySaver.saveImage(byteData!.buffer.asUint8List(),quality:100,name: 'boss_Image'+DateTime.now().toString() );
      if (result['isSuccess'].toString()=='true') {
        debugPrint('保存成功');
        return true;
      }else{
        debugPrint('保存失败');
        return false;
      }
    }catch (e) {
      print(e);
      return false;
    }


  }
}