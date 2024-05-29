import 'package:decimal/decimal.dart';
import 'package:flutter_bet/utils/num_util.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/global_state_controller.dart';

///赔率格式转换
class OddsUtil {
  ///获取本地存储的赔率格式
  final GlobalStateController globalController = Get.find<GlobalStateController>();

  ///根据本地的格式转换赔率
  String covertOdds(double odds) {
    switch (globalController.oddsType.value) {
      case 6:
        return convertToFractionalOdds(odds);
      case 7:
        return convertToAmericanOdds(odds);
      case 8:
        return convertToIndonesianOdds(odds);
      case 9:
        return convertToHongKongOdds(odds);
      case 10:
        return convertToMalayOdds(odds);
    }
    return '$odds';
  }
}

///分数式
String convertToFractionalOdds(double decimalOdds) {
  Decimal nd = (Decimal.parse('$decimalOdds') - Decimal.parse('1'))*Decimal.parse('100');
  int numerator = nd.toDouble().toInt();
  int denominator = 100;

  int gcd = findGCD(numerator, denominator);
  int simplifiedNumerator = numerator ~/ gcd;
  int simplifiedDenominator = denominator ~/ gcd;

  return '$simplifiedNumerator/$simplifiedDenominator';
}

int findGCD(int a, int b) {
  if (b == 0) {
    return a;
  } else {
    return findGCD(b, a % b);
  }
}

///美式
String convertToAmericanOdds(double decimalOdds) {
  if (decimalOdds >= 2.0) {
// 当小数式赔率大于等于2时，计算美式正赔
    int americanOdds = ((decimalOdds - 1) * 100).toInt();
    // return '+$americanOdds';
    //不使用四舍五入
    return '+${NumUtil.keepDecimals(americanOdds.toDouble(), digits: 2)}';
  } else {
// 当小数式赔率小于2时，计算美式负赔
    int americanOdds = -100 ~/ (decimalOdds - 1);
    // return '$americanOdds';
    //不使用四舍五入
    return '${NumUtil.keepDecimals(americanOdds.toDouble(), digits: 2)}';
  }
}

///印尼格式(相当于美式赔率除以100)
String convertToIndonesianOdds(double decimalOdds) {
  if (decimalOdds >= 2.0) {
// 当小数式赔率大于等于2时，计算美式正赔
    double americanOdds = decimalOdds - 1;
    // return '+${americanOdds.toStringAsFixed(2)}';
    //不使用四舍五入
    return '+${NumUtil.keepDecimals(americanOdds, digits: 2)}';
  } else {
// 当小数式赔率小于2时，计算美式负赔
    double americanOdds = -1 / (decimalOdds - 1);
    // return americanOdds.toStringAsFixed(2);
    //不使用四舍五入
    return NumUtil.keepDecimals(americanOdds, digits: 2);
  }
}

///香港格式（欧洲赔率-1）
String convertToHongKongOdds(double decimalOdds) {
  // 计算香港式赔率
  double hongKongOdds = decimalOdds - 1;
  // 格式化为字符串，保留两位小数
  // String formattedOdds = hongKongOdds.toStringAsFixed(2);
  //不使用四舍五入
  String formattedOdds = NumUtil.keepDecimals(hongKongOdds, digits: 2);
  return formattedOdds;
}


///马来格式
/// 若欧洲赔率<2：马来赔率=欧洲赔率-1
/// 若欧洲赔率≥2：马来赔率= 1 /（1-欧洲赔率）
String convertToMalayOdds(double decimalOdds) {
  if (decimalOdds < 2.0) {
    // 计算正马来赔率
    double malayOdds = decimalOdds - 1;
    // return '+${malayOdds.toStringAsFixed(2)}';
    //不使用四舍五入
    return '+${NumUtil.keepDecimals(malayOdds, digits: 2)}';
  } else {
    // 计算负马来赔率
    double malayOdds = 1 / (1 - decimalOdds);
    // return '${malayOdds.toStringAsFixed(2)}';
    return '${NumUtil.keepDecimals(malayOdds, digits: 2)}';
  }
}
