import 'package:flutter/services.dart';

class NonChineseInputFormatter extends TextInputFormatter{
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // 使用正则表达式匹配中文字符
    String newText = newValue.text.replaceAll(RegExp(r'[\u4e00-\u9fa5]'), '');

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}