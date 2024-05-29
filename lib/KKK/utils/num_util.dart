import 'package:decimal/decimal.dart';
import 'package:rational/rational.dart';

/// Num Util.
class NumUtil {
  /// The parameter [fractionDigits] must be an integer satisfying: `0 <= fractionDigits <= 20`.
  static num? getNumByValueStr(String valueStr, {int? fractionDigits}) {
    double? value = double.tryParse(valueStr);
    return fractionDigits == null ? value : getNumByValueDouble(value, fractionDigits);
  }

  /// The parameter [fractionDigits] must be an integer satisfying: `0 <= fractionDigits <= 20`.
  static num? getNumByValueDouble(double? value, int fractionDigits) {
    if (value == null) return null;
    String valueStr = value.toStringAsFixed(fractionDigits);
    return fractionDigits == 0 ? int.tryParse(valueStr) : double.tryParse(valueStr);
  }

  /// get int by value str.
  static int? getIntByValueStr(String valueStr, {int? defValue = 0}) {
    return int.tryParse(valueStr) ?? defValue;
  }

  /// get double by value str.
  static double? getDoubleByValueStr(String valueStr, {double? defValue = 0}) {
    return double.tryParse(valueStr) ?? defValue;
  }

  ///isZero
  static bool isZero(num? value) {
    return value == null || value == 0;
  }

  /// 加 (精确相加,防止精度丢失).
  /// add (without loosing precision).
  static double add(num a, num b) {
    return addDec(a, b).toDouble();
  }

  /// 减 (精确相减,防止精度丢失).
  /// subtract (without loosing precision).
  static double subtract(num a, num b) {
    return subtractDec(a, b).toDouble();
  }

  /// 乘 (精确相乘,防止精度丢失).
  /// multiply (without loosing precision).
  static double multiply(num a, num b) {
    return multiplyDec(a, b).toDouble();
  }

  /// 除 (精确相除,防止精度丢失).
  /// divide (without loosing precision).
  static double divide(num a, num b) {
    return divideDec(a, b).toDouble();
  }

  /// 加 (精确相加,防止精度丢失).
  /// add (without loosing precision).
  static Decimal addDec(num a, num b) {
    return addDecStr(a.toString(), b.toString());
  }

  /// 减 (精确相减,防止精度丢失).
  /// subtract (without loosing precision).
  static Decimal subtractDec(num a, num b) {
    return subtractDecStr(a.toString(), b.toString());
  }

  /// 乘 (精确相乘,防止精度丢失).
  /// multiply (without loosing precision).
  static Decimal multiplyDec(num a, num b) {
    return multiplyDecStr(a.toString(), b.toString());
  }

  /// 除 (精确相除,防止精度丢失).
  /// divide (without loosing precision).
  static Decimal divideDec(num a, num b) {
    return divideDecStr(a.toString(), b.toString());
  }

  /// 余数
  static Decimal remainder(num a, num b) {
    return remainderDecStr(a.toString(), b.toString());
  }

  /// Relational less than operator.
  static bool lessThan(num a, num b) {
    return lessThanDecStr(a.toString(), b.toString());
  }

  /// Relational less than or equal operator.
  static bool thanOrEqual(num a, num b) {
    return thanOrEqualDecStr(a.toString(), b.toString());
  }

  /// Relational greater than operator.
  static bool greaterThan(num a, num b) {
    return greaterThanDecStr(a.toString(), b.toString());
  }

  /// Relational greater than or equal operator.
  static bool greaterOrEqual(num a, num b) {
    return greaterOrEqualDecStr(a.toString(), b.toString());
  }

  /// 加
  static Decimal addDecStr(String a, String b) {
    return Decimal.parse(a) + Decimal.parse(b);
  }

  /// 减
  static Decimal subtractDecStr(String a, String b) {
    return Decimal.parse(a) - Decimal.parse(b);
  }

  /// 乘
  static Decimal multiplyDecStr(String a, String b) {
    return Decimal.parse(a) * Decimal.parse(b);
  }

  /// 除
  static Decimal divideDecStr(String a, String b) {
    Rational value = Decimal.parse(a) / Decimal.parse(b);
    return value.toDecimal();
  }

  /// 余数
  static Decimal remainderDecStr(String a, String b) {
    return Decimal.parse(a) % Decimal.parse(b);
  }

  /// Relational less than operator.
  static bool lessThanDecStr(String a, String b) {
    return Decimal.parse(a) < Decimal.parse(b);
  }

  /// Relational less than or equal operator.
  static bool thanOrEqualDecStr(String a, String b) {
    return Decimal.parse(a) <= Decimal.parse(b);
  }

  /// Relational greater than operator.
  static bool greaterThanDecStr(String a, String b) {
    return Decimal.parse(a) > Decimal.parse(b);
  }

  /// Relational greater than or equal operator.
  static bool greaterOrEqualDecStr(String a, String b) {
    return Decimal.parse(a) >= Decimal.parse(b);
  }

  ///todo: 0113.添加。保留小数位数， 不四舍五入
  ///【0318】【需求变更】
  ///24. 2024-03-17 数值显示规则调整
  // 1.金额小数位数：btc  8    eth  8
  // 其它币种 2
  // * 如果是0值，只能显示0.00，任何币种都一样
  // * 如果btc或eth是299.29384000，要显示299.29384
  // 如果：0.0000001 要显示全部数值
  ///=========================分割线===============================================///
  ///digits默认保留2位；minDigits 最小保留几位，不够补0，,do45  是否四舍五入，doZero 是否补0
  static String keepDecimals(double? num,
      {int? digits, int minDigits = 2, bool? do45 = false, bool doZero = false}) {
    num ??= 0.00;
    digits ??= 2;
    var targetStr = "0.00";
    //【情况1】如果是0值，只能显示0.00，任何币种都一样
    if (num == 0) {
      return targetStr;
    }
    //【情况2】不是0 的情况
    if (do45 != null && do45) {
      targetStr = num.toStringAsFixed(digits);
    } else {
      //没有超过digits
      //小数多少位
      var length = (num.toString().length - num.toString().lastIndexOf(".") - 1);
      if (length < digits) {
        //小数点后有几位小数
        // print( num.toStringAsFixed(postion).substring(0,num.toString().lastIndexOf(".")+postion+1).toString());
        //如果小于保留最小位数,
        if (length <= minDigits) {
          //补0
          targetStr = num.toStringAsFixed(minDigits);
        } else {
          //是否补齐位数
          if (doZero) {
            //补0操作
            targetStr = num.toStringAsFixed(digits)
                .substring(0, num.toString().lastIndexOf(".") + digits + 1)
                .toString();
          } else {
            targetStr = num.toString();
          }
        }
      } else {
        // print( num.toString().substring(0,num.toString().lastIndexOf(".")+postion+1).toString());
        // 超过的直接截取
        targetStr =
            num.toString().substring(0, num.toString().lastIndexOf(".") + digits + 1).toString();
      }
    }
    return targetStr;
  }
}
