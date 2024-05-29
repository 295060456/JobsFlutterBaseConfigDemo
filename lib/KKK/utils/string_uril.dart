

import 'package:flutter/material.dart';

class StringUtil {
  /// todo：手机号 正则
  static RegExp  phoneExp = RegExp(r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');

  /// todo：手机号 正则
  static RegExp  idExp = RegExp(r"\d{17}[\d|x]|\d{15}");

  /// todo：中文 正则
  static RegExp  chineseExp = RegExp(r"[\u4e00-\u9fa5]");

  /// todo：邮箱 正则
  static RegExp  emailExp = RegExp(r"^\w+([-+.]\w+)*@\w+([-.]\w+)*.\w+([-.]\w+)*$");

  /// todo：URL正则
  static RegExp  urlExp = RegExp(r"^((https|http|ftp|rtsp|mms)?://)[^\s]+");

  /// todo：数字 正则
  static RegExp  numberOnlyExp = RegExp(r"^[0-9]*$");

  /// todo：字母+数字 正则
  static RegExp  numberABCExp = RegExp(r"^[ZA-ZZa-z0-9_]+$");

  /// todo：小写字母+数字 正则
  static RegExp  numberAbcExp = RegExp(r"^[Za-z0-9_]+$");

  /// todo：忽略特殊字符 正则
  static RegExp  ignoreOtherExp = RegExp(r"^[\u4E00-\u9FA5A-Za-z0-9_]+$");



  // 只能输入数字："^[0-9]*$"。 
  // 只能输入n位的数字："^\d{n}$"。 
  // 只能输入至少n位的数字："^\d{n,}$"。 
  // 只能输入m~n位的数字：。"^\d{m,n}$" 
  // 只能输入零和非零开头的数字："^0|[1-9][0-9]*$"。 
  // 只能输入有两位小数的正实数："^[0-9]+(\.[0-9]{2})?$"。 
  // 只能输入有1~3位小数的正实数："^[0-9]+(\.[0-9]{1,3})?$"。 
  // 只能输入非零的正整数："^\+?[1-9][0-9]*$"。 
  // 只能输入非零的负整数："^\-[1-9][0-9]*$"。 
  // 只能输入长度为3的字符："^.{3}$"。 
  // 只能输入由26个英文字母组成的字符串："^[A-Za-z]+$"。 
  // 只能输入由26个大写英文字母组成的字符串："^[A-Z]+$"。 
  // 只能输入由26个小写英文字母组成的字符串："^[a-z]+$"。 
  // 只能输入由数字和26个英文字母组成的字符串："^[A-Za-z0-9]+$"。 
  // 只能输入由数字、26个英文字母或者下划线组成的字符串："^\w+$"。 
  // 验证用户密码："^[a-zA-Z]\w{5,17}$"正确格式为：以字母开头，长度在6~18之间，只能包含字符、数字和下划线。
  // 验证是否含有^%&',;=?$\"等字符："[^%&',;=?$\x22]+"。 
  // 只能输入汉字："^[\u4e00-\u9fa5]{0,}$" 
  // 验证Email地址："^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"。 
  // 验证InternetURL："^http://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?$"。 
  // 验证电话号码："^(\(\d{3,4}-)|\d{3.4}-)?\d{7,8}$"正确格式为："XXX-XXXXXXX"、"XXXX-XXXXXXXX"、"XXX-XXXXXXX"、"XXX-XXXXXXXX"、"XXXXXXX"和"XXXXXXXX"。 
  // 验证身份证号（15位或18位数字）："^\d{15}|\d{18}$"。 
  // 验证一年的12个月："^(0?[1-9]|1[0-2])$"正确格式为："01"～"09"和"1"～"12"。 
  // 验证一个月的31天："^((0?[1-9])|((1|2)[0-9])|30|31)$"正确格式为；"01"～"09"和"1"～"31"。
  // -----------------------------------
  // java 正则只能输入整数 java正则表达式只能是数字
  // https://blog.51cto.com/u_16099204/6305999


  /// 判断字符串是否包含中文
  static bool containsChinese(String str) {
    RegExp exp = RegExp(r'[\u4e00-\u9fa5]');
    return exp.hasMatch(str);
  }

  /// 计算字符串中中文的个数
  static int chineseLength(String str) {
    RegExp exp = RegExp(r'[\u4e00-\u9fa5]');
    int length = 0;
    for (int i = 0; i < str.length; i++) {
      if (exp.hasMatch(str[i])) {
        length++;
      }
    }
    return length;
  }

  /// 判断字符串是否包含中文
  static bool isNumberOnly(String str) {
    RegExp exp = RegExp(r"^[0-9]*$");
    return exp.hasMatch(str);
  }

  // //只能输入m~n位的数字 "^\d{m,n}$"
  // static bool isNumberMinMaxLong(String str,int min, int max) {
  //   RegExp exp = RegExp(r"^\d{4,30}$");
  //   return exp.hasMatch(str);
  // }

  /// 判断文本内容是否为空
  static bool isEmpty(String text) {
    return text.isEmpty;
  }

  /// 判断文本内容是否不为空
  static bool isNotEmpty(String text) {
    return !isEmpty(text);
  }

  /// 判断字符串是以xx开头
  static bool startsWith(String str, Pattern prefix, [int index = 0]) {
    return str.startsWith(prefix, index);
  }

  /// 判断一个字符串以任何给定的前缀开始
  static bool startsWithAny(String str, List<Pattern> prefixes, [
    int index = 0,]) {
    return prefixes.any((prefix) => str.startsWith(prefix, index));
  }

  /// 判断字符串中是否包含xx
  static bool contains(String str, Pattern searchPattern, [int startIndex = 0]){
    return str.contains(searchPattern, startIndex);
  }

  /// 判断一个字符串是否包含任何给定的搜索模式
  static bool containsAny(String str, List<Pattern> searchPatterns, [
    int startIndex = 0,]) {
    return searchPatterns.any((prefix) => str.contains(prefix, startIndex));
  }

  /// 使用点缩写字符串
  static String? abbreviate(String str, int maxWidth, {int offset = 0}) {
    if (str == null) {
      return null;
    } else if (str.length <= maxWidth) {
      return str;
    } else if (offset < 3) {
      return '${str.substring(offset, (offset + maxWidth) - 3)}...';
    } else if (maxWidth - offset < 3) {
      return '...${str.substring(offset, (offset + maxWidth) - 3)}';
    }
    return '...${str.substring(offset, (offset + maxWidth) - 6)}...';
  }

  /// 比较两个字符串是否相同
  static int compare(String str1, String str2) {
    if (str1 == str2) {
      return 0;
    }
    if (str2 == null) {
      return str1 == null ? -1 : 1;
    }
    return str1.compareTo(str2);
  }

  /// 比较两个长度一样的字符串有几个字符不同
  static int hammingDistance(String str1, String str2) {
    if (str1.length != str2.length) {
      throw FormatException('Strings must have the same length');
    }
    var l1 = str1.runes.toList();
    var l2 = str2.runes.toList();
    var distance = 0;
    for (var i = 0; i < l1.length; i++) {
      if (l1[i] != l2[i]) {
        distance++;
      }
    }
    return distance;
  }

  /// 每隔 x位 加 pattern。比如用来格式化银行卡
  static String formatDigitPattern(String text,
      {int digit = 4, String pattern = ' '}) {
    text = text.replaceAllMapped(RegExp('(.{$digit})'), (Match match) {
      return '${match.group(0)}$pattern';
    });
    if (text.endsWith(pattern)) {
      text = text.substring(0, text.length - 1);
    }
    return text;
  }

  /// 每隔 x位 加 pattern, 从末尾开始
  static String formatDigitPatternEnd(String text,
      {int digit = 4, String pattern = ' '}) {
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
  static String formatDoubleComma3(Object num,
      {int digit = 3, String pattern = ','}) {
    List<String> list = num.toString().split('.');
    String left =
    formatDigitPatternEnd(list[0], digit: digit, pattern: pattern);
    String right = list[1];
    return '$left.$right';
  }

  /// 隐藏手机号中间n位
  static String hideNumber(String phoneNo,
      {int start = 3, int end = 7, String replacement = '****'}) {
    return phoneNo.replaceRange(start, end, replacement);
  }

  /// 替换字符串中的数据
  static String replace(String text, Pattern from, String replace) {
    return text.replaceAll(from, replace);
  }

  /// 按照正则切割字符串
  static List<String> split(String text, Pattern pattern) {
    return text.split(pattern);
  }

  /// 反转字符串
  static String reverse(String text) {
    if (isEmpty(text)){
      return '';
    }
    StringBuffer sb = StringBuffer();
    for (int i = text.length - 1; i >= 0; i--) {
      var codeUnitAt = text.codeUnitAt(i);
      sb.writeCharCode(codeUnitAt);
    }
    return sb.toString();
  }

  String currencyFormat(int money) {
    if (money == null) {
      return "";
    }
    String moneyStr = money.toString();
    String finalStr = "";
    int groupSize = 3;
    int oddNumberLength = moneyStr.length -
        (moneyStr.length ~/ groupSize) * groupSize;
    if (oddNumberLength > 0) {
      finalStr += moneyStr.substring(0, oddNumberLength);
      if (moneyStr.length > groupSize) {
        finalStr += ",";
      }
    }
    for (int i = oddNumberLength; i < moneyStr.length; i += groupSize) {
      finalStr += moneyStr.substring(i, i + groupSize);
      if (i + groupSize < moneyStr.length - 1) {
        finalStr += ",";
      }
    }
    return finalStr;
  }

  String truncateString(String inputString, int length) {
    if(inputString == null){
      return '';
    }

    if (inputString.length > length) {
      return inputString.substring(0, length);
    } else {
      return inputString;
    }
  }

  /// 文本宽度计算
  static double textWidth(String text, TextStyle style) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    return textPainter.width;
  }

  /// 字符串数组文本宽度最长获取
  static double textMaxWidth(List<String> texts, TextStyle style) {
    var doubleWidth= 0.0;
    for (var text in texts) {
      final indexTextWidth = StringUtil.textWidth(text, style);
      if(indexTextWidth > doubleWidth) {
        doubleWidth = indexTextWidth;
      }
    }
    return doubleWidth;
  }
}