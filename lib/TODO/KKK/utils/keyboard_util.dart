import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// @class : KeyboardUtils
/// @name : alvin
/// @description :软键盘相关工具类
class KeyboardUtils {
  ///隐藏软键盘
  ///[context] 上下文
  static hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  /// 关闭键盘并保留焦点
  static Future<void> hideKeyShowFocus() async{
    await SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  /// 关闭键盘并失去焦点
  static Future<void> hideKeyShowUnFocus() async{
    FocusManager.instance.primaryFocus!.unfocus();
  }
}
