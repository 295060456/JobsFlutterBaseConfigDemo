/// Text Util.
class TextUtil {
  /// isEmpty
  static bool isEmpty(String? text) {
    return text == null || text.isEmpty;
  }

  /// 每隔 x位 加 pattern
  static String formatDigitPattern(String text, {int digit = 4, String pattern = ' '}) {
    text = text.replaceAllMapped(RegExp('(.{$digit})'), (Match match) {
      return '${match.group(0)}$pattern';
    });
    if (text.endsWith(pattern)) {
      text = text.substring(0, text.length - 1);
    }
    return text;
  }

  /// 每隔 x位 加 pattern, 从末尾开始
  static String formatDigitPatternEnd(String text, {int digit = 4, String pattern = ' '}) {
    String temp = reverse(text);
    temp = formatDigitPattern(temp, digit: digit, pattern: pattern);
    temp = reverse(temp);
    return temp;
  }

  /// 每隔4位加空格
  static String formatSpace4(String text) {
    return formatDigitPattern(text);
  }

  /// 每隔3三位加逗号
  /// num 数字或数字字符串。int型。
  static String formatComma3(Object num) {
    return formatDigitPatternEnd(num.toString(), digit: 3, pattern: ',');
  }

  /// 每隔3三位加逗号
  /// num 数字或数字字符串。double型。
  static String formatDoubleComma3(Object num, {int digit = 3, String pattern = ','}) {
    List<String> list = num.toString().split('.');
    String left = formatDigitPatternEnd(list[0], digit: digit, pattern: pattern);
    String right = list[1];
    return '$left.$right';
  }

  /// hideNumber
  static String hideNumber(String phoneNo,
      {int start = 3, int end = 7, String replacement = '****'}) {
    return phoneNo.replaceRange(start, end, replacement);
  }

  /// replace
  static String replace(String text, Pattern from, String replace) {
    return text.replaceAll(from, replace);
  }

  /// split
  static List<String> split(String text, Pattern pattern) {
    return text.split(pattern);
  }

  /// reverse
  static String reverse(String text) {
    if (isEmpty(text)) return '';
    StringBuffer sb = StringBuffer();
    for (int i = text.length - 1; i >= 0; i--) {
      sb.writeCharCode(text.codeUnitAt(i));
    }
    return sb.toString();
  }

  ///超过几个字符的，显示...
  ///length 长度。space是否补足空间长度，算上...
  ///三种不同的”空格”Unicode(\u00A0,\u0020,\u3000)
  ///U+2008 英文半角句号“.”的宽度
  static String clipping(String? text, int length, {bool space = false, String pad = ' '}) {
    if (text == null) {
      //是否补齐空间
      return space ? "".padRight(length + 3, pad) : "";
    } else if (text.length <= length) {
      // var diff = length - text.length;
      return space ? text.padRight(length + 3, pad) : text;
    } else {
      return "${text.substring(0, length)}...";
    }

    // if (text == null) {
    //   return "";
    // } else if (text.length <= length) {
    //   return text;
    // } else {
    //   return "${text.substring(0, length)}...";
    // }
  }
}
