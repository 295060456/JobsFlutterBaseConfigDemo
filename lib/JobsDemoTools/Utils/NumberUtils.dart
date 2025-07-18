import 'dart:math';

extension NumTruncateExtension on num {
  /// 截断小数位，不四舍五入
  String truncateToFixed(int decimalPlaces) {
    num factor = pow(10, decimalPlaces).toDouble();
    return ((this * factor).truncate() / factor).toStringAsFixed(decimalPlaces);
  }
}
