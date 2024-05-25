import 'dart:io';

import 'package:flutter/services.dart';

import 'SPUtil.dart';

class FlutterPluginName {
  static const MethodChannel _channel = MethodChannel('tiktok_events');
  static const MethodChannel _channelAndroid = MethodChannel('flutter_plugin_tiktok'); //Android 渠道

  static Future<String> callMethod(String name, {Map? params}) async {
    if (Platform.isAndroid) {
      return callAndroidMethod(name, params: params);
    } else if (Platform.isIOS) {
      return callIOSMethod(name, params: params);
    } else {
      return '';
    }
  }

  static Future<String> callAndroidMethod(String name, {Map? params}) async {
    try {
      return await _channelAndroid.invokeMethod(
          'androidMethodTiktok', <String, dynamic>{'name': name, 'params': params ?? {}});
    } on PlatformException catch (e) {
      return e.toString();
    }
  }

  static Future<String> callIOSMethod(String name, {Map? params}) async {
    try {
      return await _channel.invokeMethod(
          'tiktok_events_ios', <String, dynamic>{'name': name, 'params': params ?? {}});
    } on PlatformException catch (e) {
      return e.toString();
    }
  }

  ///是否首次启动app
  static void installApp(String installApp) {
    bool isFirstInstallApp = SPUtil().getBool("firstInstallApp") ?? false;
    if (!isFirstInstallApp) {
      callMethod(installApp);
      SPUtil().setBool("firstInstallApp", true);
    }
  }
}
