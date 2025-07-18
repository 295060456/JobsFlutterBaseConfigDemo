import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NativeClipboard {
  static const MethodChannel _channel = MethodChannel('custom/clipboard');

  static Future<void> setText(String text) async {
    try {
      await _channel.invokeMethod('setClipboard', {'text': text});
    } catch (e) {
      debugPrint('❌ 原生剪贴板写入失败: $e');
    }
  }
}
