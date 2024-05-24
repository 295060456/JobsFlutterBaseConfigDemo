import 'package:flutter/services.dart';
import 'package:flutter_bet/utils/common_util.dart';

/// 自定义限制只能输入数字
class CustomNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // TODO: implement formatEditUpdate
    if (CommonUtil.numberContainsSpecialCharacters(newValue.text)) return oldValue;
    return newValue;
  }
  
}