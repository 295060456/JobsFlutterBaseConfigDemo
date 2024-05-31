import 'package:flutter_bet/generated/l10n.dart' as l10n;
import 'dart:developer';

import 'package:date_format/date_format.dart';
import 'package:flutter_bet/utils/lang_util.dart';

class CommonUtil {
  ///比较版本号大小  app版本号跟服务器版本号比高低，这是一道中等难度的Leetcode算法题
  ///version1 新版本号
  ///version2 当前版本号
  ///true 有最新版本
  ///false 没有最新版本
  static bool compareVersion(String version1, String version2, [int length = 3]) {
    final v1 = version1.split('.')
      ..remove('')
      ..addAll(List.filled(length, '0'))
      ..sublist(0, length);
    final v2 = version2.split('.')
      ..remove('')
      ..addAll(List.filled(length, '0'))
      ..sublist(0, length);

    for (final i in List.generate(length, (i) => i)) {
      final v11 = int.parse(v1[i]);
      final v22 = int.parse(v2[i]);
      if (v11 > v22) {
        return true;
      } else if (v11 < v22) {
        return false;
      }
    }
    return false;
  }

  ///检查文本是否是a-z的字母组成
  ///text 需要检查的文本
  static bool isAlphabet(String text) {
    final RegExp alphaRegex = RegExp(r'^[a-zA-Z]+$');
    return alphaRegex.hasMatch(text);
  }

  static bool containsAlphabetAndNumbers(String text) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');
    return regex.hasMatch(text);
  }

  ///检查一个字符串是否包含大写字母
  static bool containsUppercase(String text) {
    final RegExp regExp = RegExp(r'[A-Z]');
    return regExp.hasMatch(text);
  }

  static bool ageVerification(String inputTime) {
    var isValid = false;
    // 获取输入的出生日期
    DateTime? dob = DateTime.tryParse(inputTime);

    // 检查是否成功解析日期
    if (dob == null) {
      return false;
    }

    // 获取当前日期
    DateTime now = DateTime.now();

    // 计算年龄
    int age = now.year - dob.year;

    // 如果生日还未到，年龄减1
    if (now.month < dob.month || (now.month == dob.month && now.day < dob.day)) {
      age--;
    }

    // 检查年龄是否超过120岁
    if (age >= 120) {
      isValid = true;
    }
    return isValid;
  }

  ///最大的天数
  static int getMaxDays(int year, int month) {
    if (year == null || month == null) {
      // 处理空值的情况
      return 0;
    }

    if (month < 1 || month > 12) {
      // 月份无效
      return 0;
    }

    return DateTime(year, month + 1, 0).day;
  }

  ///检查日期是否合法
  static bool isDateValid(int year, int month, int day) {
    try {
      // 尝试创建日期对象
      DateTime date = DateTime(year, month, day);

      // 检查创建的日期是否与输入的年月日相同，以处理一些边界情况
      return date.year == year && date.month == month && date.day == day;
    } catch (ex) {
      // 如果发生异常，日期无效
      return false;
    }
  }

  ///检查是否超过18岁
  static bool isOver18Years(int birthYear, int birthMonth, int birthDay) {
    // 获取当前日期
    DateTime currentDate = DateTime.now();

    // 创建出生日期
    DateTime birthDate = DateTime(birthYear, birthMonth, birthDay);

    // 计算年龄
    int age = currentDate.year - birthDate.year;

    // 如果生日还没到，减去一年
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      age--;
    }

    // 判断年龄是否大于等于18
    return age >= 18;
  }

  ///检查文本是否是email
  ///text 需要检查的文本
  static bool isEmail(String text) {
    final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(text);
  }

  ///检查文本是否是number
  ///text 需要检查的文本
  static bool isNumber(String text) {
    final RegExp emailRegex = RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
    return emailRegex.hasMatch(text);
  }

  ///检查文本是否至少包含一个大写字母和一个小写字母
  ///text 需要检查的文本
  static bool containsUppercaseAndLowercase(String text) {
    return text.contains(RegExp(r'[A-Z]')) && text.contains(RegExp(r'[a-z]'));
  }

  ///检查文本是否是包含0-9
  ///text 需要检查的文本
  static bool containsNumbers(String text) {
    return text.contains(RegExp(r'[0-9]'));
  }

  ///检查数字是否包含特殊字符
  ///text 需要检查的文本
  static bool numberContainsSpecialCharacters(String text) {
    // 使用正则表达式匹配非数字字符
    final RegExp regex = RegExp(r'[^\d]');
    return regex.hasMatch(text);
  }

  static String getRecentTime(int timestamp) {
    DateTime epochDateTime = DateTime.utc(1980, 1, 1);
    DateTime currentTime   = DateTime.now();
    timestamp = timestamp < epochDateTime.millisecondsSinceEpoch ? timestamp * 1000 : timestamp;
    DateTime timestampDateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);

    // 计算几分钟之前
    Duration minutesDifference = currentTime.difference(timestampDateTime);
    int minutesAgo = minutesDifference.inMinutes;
    int hoursAgo   = minutesAgo ~/ 60;
    int daysAgo    = hoursAgo ~/ 24;
    int monthsAgo  = daysAgo ~/ 30;
    int yearsAgo   = daysAgo ~/ 365;

    if (yearsAgo > 0) return '$yearsAgo ${l10n.S.current.random_text_771}';
    if (monthsAgo > 0) return '$monthsAgo ${l10n.S.current.random_text_772}';
    if (daysAgo > 0) {
      var daysAgoText = '$daysAgo ${l10n.S.current.random_text_773}';
      if (LangUtil().isEnIn() && daysAgo == 1) {
        daysAgoText = l10n.S.current.random_text_773copy2;
      }
      return daysAgoText;
    }
    if (hoursAgo > 0) return '$hoursAgo ${l10n.S.current.random_text_774}';
    if (minutesAgo > 0) return '$minutesAgo ${l10n.S.current.random_text_775}';

    return l10n.S.current.random_text_776;
  }

  ///UTC时间戳转设备时区时间
  ///utcTimestamp second / millisecond
  static DateTime getLocalDate(int utcTimestamp) {
    DateTime epochDateTime = DateTime.utc(1980, 1, 1);
    utcTimestamp =
        utcTimestamp < epochDateTime.millisecondsSinceEpoch ? utcTimestamp * 1000 : utcTimestamp;
    DateTime utcDateTime = DateTime.fromMillisecondsSinceEpoch(utcTimestamp, isUtc: true);
    return utcDateTime.toLocal();
  }

  ///UTC时间戳获过去格式日期
  ///utcTimestamp second / millisecond
  static String getLocalRecentTime(int utcTimestamp) {
    final localDate = CommonUtil.getLocalDate(utcTimestamp);
    final localTimestampSecond = localDate.millisecondsSinceEpoch ~/ 1000;
    // 超过3年 格式"月/日/年 时:分"
    Duration minutesDifference = DateTime.now().difference(localDate);
    if(minutesDifference.inMinutes > 60 * 24 * 365 * 3) {
      return CommonUtil.getLocalTimeTitle(
          utcTimestamp,
          cIncludeFormats:[yyyy, mm, dd, HH, nn],
      );
    }
    return CommonUtil.getRecentTime(localTimestampSecond);
  }

  ///UTC时间戳获取当前语言对应日期格式化顺序Title
  ///utcTimestamp second / millisecond
  ///cIncludeFormats [需要展示的日期日期Code]
  ///(如只需月、日、小时、分钟 [mm, dd, HH, nn])
  ///dateInterval/timeInterval/dateTimeInterval
  ///间隔符号(日期之间 / 小时分钟之间 / 日期与小时分钟)
  ///customFormat 自定义格式顺序 [yyyy, mm, dd, HH, nn, ss]
  static String getLocalTimeTitle(int utcTimestamp,
      {List<String> cIncludeFormats = const [yyyy, mm, dd, HH, nn],
      String dateInterval = "/",
      String timeInterval = ":",
      String dateTimeInterval = " ",
      List<String> customFormat = const []}) {
    final localDate = CommonUtil.getLocalDate(utcTimestamp);
    final languageCode = LangUtil().getLangType();
    var includeFormats = List.from(cIncludeFormats);
    includeFormats.add(dateTimeInterval);

    // 目标数组-参考数组的顺序排序
    List<String> referenceFormats = [];
    switch (languageCode) {
      case 'zh_CN':
      case 'pt_BR':
      case 'en_US':
      case 'vi_VN':
      case 'th_TH':
        referenceFormats = [yyyy, mm, dd, dateTimeInterval, HH, nn, ss];
        break;
      // case 'vi_VN':
      //   referenceFormats = [HH, nn, ss, dateTimeInterval, dd, mm, yyyy];
      //   break;
      // case 'th_TH':
      //   referenceFormats = [HH, nn, ss, dateTimeInterval, mm, dd, yyyy];
      //   break;
      default:
        referenceFormats = [yyyy, mm, dd, dateTimeInterval, HH, nn, ss];
    }
    if (customFormat.isNotEmpty) {
      referenceFormats = customFormat;
    }

    // 根据参考数组的顺序对目标数组进行排序
    includeFormats
        .sort((a, b) => referenceFormats.indexOf(a).compareTo(referenceFormats.indexOf(b)));

    // 格式化输出
    final List<String> formats = [];
    for (String formatsCode in includeFormats) {
      if ([dateTimeInterval, timeInterval, dateInterval].contains(formatsCode)) {
        if (formats.isNotEmpty) {
          formats.removeLast();
        }
      }
      formats.add(formatsCode);
      if ([yyyy, mm, dd].contains(formatsCode)) {
        formats.add(dateInterval);
      }
      if ([HH, nn, ss].contains(formatsCode)) {
        formats.add(timeInterval);
      }
    }
    while ([timeInterval, dateInterval, dateTimeInterval].contains(formats.last)) {
      formats.removeLast();
    }
    return formatDate(localDate, formats);
  }

  /// 是否只包含空格
  static bool isStringOnlyWhitespace(String input) {
    return input.trim().isEmpty;
  }
}
