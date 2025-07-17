// ignore_for_file: non_constant_identifier_names

import 'package:flutter_plugin_engagelab/flutter_plugin_engagelab.dart';
import 'package:get/get.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class JobsCommonUtil {
  final ok = false.obs;

  /// 日志打印输出文件和行
  /// 如果要打印类的实例，需要在类中添加 Map<String, dynamic> toJson() 方法
  void JobsPrint(Object? message) {
    /// 获取当前调用栈，目的是找到谁调用了这个日志函数。
    final StackTrace stackTrace = StackTrace.current;

    /// 把堆栈信息按行切割为数组。每一行大概表示一个方法的调用栈帧。
    final List<String> stackTraceLines = stackTrace.toString().split('\n');

    /// 取第2行（stackTraceLines[1]）：因为第1行是当前函数本身的调用，第2行才是调用 JobsPrint() 的地方。
    /// 然后传给 _formatStackTraceLine() 方法提取出文件和行号信息。
    final String logLine = stackTraceLines.length > 1
        ? _formatStackTraceLine(stackTraceLines[1])
        : 'Unknown location';
    FlutterPluginEngagelab.printMy('[$logLine] ${_messageToString(message)}');
  }

  ///比较版本号大小  app版本号跟服务器版本号比高低，这是一道中等难度的Leetcode算法题
  ///version1 新版本号
  ///version2 当前版本号
  ///true 有最新版本
  ///false 没有最新版本
  static bool compareVersion(String version1, String version2,
      [int length = 3]) {
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

  /// 获取当前时间
  static String getNowTime() {
    final time = DateTime.now();
    DateFormat formatter = DateFormat('yyyy/MM/ddTHH:mm:ss.SSS');
    String formattedDate = formatter.format(time);
    DateFormat amPmFormatter = DateFormat('a');
    String amPm = amPmFormatter.format(time);
    return '$formattedDate ${amPm == 'AM' ? 'AM' : 'PM'}';
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
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
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
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    // 判断年龄是否大于等于18
    return age >= 18;
  }

  ///检查文本是否是email
  ///text 需要检查的文本
  static bool isEmail(String text) {
    final RegExp emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(text);
  }

  ///检查文本是否是number
  ///text 需要检查的文本
  static bool isNumber(String text) {
    final RegExp emailRegex =
        RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$');
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

  /// 将给定的UTC时间戳（秒或毫秒）转换为本地时间的DateTime对象
  /// utcTimestamp second / millisecond
  static DateTime getLocalDate(int utcTimestamp) {
    DateTime epochDateTime = DateTime.utc(1980, 1, 1);
    utcTimestamp = utcTimestamp < epochDateTime.millisecondsSinceEpoch
        ? utcTimestamp * 1000
        : utcTimestamp;
    DateTime utcDateTime =
        DateTime.fromMillisecondsSinceEpoch(utcTimestamp, isUtc: true);
    return utcDateTime.toLocal();
  }

  /// 是否只包含空格
  static bool isStringOnlyWhitespace(String input) {
    return input.trim().isEmpty;
  }
}

/// 日志打印输出文件和行
/// 如果要打印类的实例，需要在类中添加 Map<String, dynamic> toJson() 方法
void JobsPrint(Object? message) {
  /// 获取当前调用栈，目的是找到谁调用了这个日志函数。
  final StackTrace stackTrace = StackTrace.current;

  /// 把堆栈信息按行切割为数组。每一行大概表示一个方法的调用栈帧。
  final List<String> stackTraceLines = stackTrace.toString().split('\n');

  /// 取第2行（stackTraceLines[1]）：因为第1行是当前函数本身的调用，第2行才是调用 JobsPrint() 的地方。
  /// 然后传给 _formatStackTraceLine() 方法提取出文件和行号信息。
  final String logLine = stackTraceLines.length > 1
      ? _formatStackTraceLine(stackTraceLines[1])
      : 'Unknown location';
  FlutterPluginEngagelab.printMy('[$logLine] ${_messageToString(message)}');
}

String _formatStackTraceLine(String stackTraceLine) {
  final RegExp pattern = RegExp(r'#\d+\s+(.+)\s+\((.+):(\d+):(\d+)\)');
  final Match? match = pattern.firstMatch(stackTraceLine);
  if (match != null && match.groupCount == 4) {
    final String fileName = match.group(2) ?? 'unknown file';
    final String lineNumber = match.group(3) ?? 'unknown line';
    return '$fileName:$lineNumber';
  }
  return stackTraceLine;
}

String _messageToString(Object? message) {
  if (message == null) {
    return 'null';
  } else if (message is List) {
    return _listToString(message);
  } else if (message is Map) {
    return _mapToString(message);
  } else if (_isBasicType(message)) {
    return message.toString();
  } else {
    return _objectToString(message);
  }
}

String _mapToString(Map map) {
  return '{${map.entries.map((e) => '${e.key}: ${_messageToString(e.value)}').join(', ')}}';
}

bool _isBasicType(Object object) {
  return object is String ||
      object is num ||
      object is bool ||
      object is DateTime;
}

String _objectToString(Object object) {
  if (object is List) {
    return _listToString(object);
  }

  if (_isBasicType(object)) {
    return object.toString();
  }

  final buffer = StringBuffer();
  buffer.write('${object.runtimeType} ');

  if (object is Map) {
    return _mapToString(object);
  }

  // 尝试调用 toJson 方法
  try {
    dynamic jsonData = (object as dynamic).toJson();
    if (jsonData is Map) {
      const JsonEncoder encoder = JsonEncoder.withIndent('  ');
      buffer.write(encoder.convert(jsonData));
    } else {
      buffer.write(jsonData.toString());
    }
  } catch (_) {
    // 如果没有 toJson 方法，直接使用 toString
    buffer.write(object.toString());
  }

  return buffer.toString();
}

String _listToString(List list) {
  final buffer = StringBuffer();
  buffer.writeln('[');
  for (var i = 0; i < list.length; i++) {
    var item = list[i];
    buffer.write('  ${_objectToString(item).replaceAll('\n', '\n  ')}');
    if (i < list.length - 1) {
      buffer.writeln(',');
    } else {
      buffer.writeln();
    }
  }
  buffer.write(']');
  return buffer.toString();
}
