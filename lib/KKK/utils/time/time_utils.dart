import 'dart:math';

import 'package:date_format/date_format.dart';

import 'time_format.dart';

class TimeUtils {
  /// 获取当前时间戳（10位）
  static int getTimeStampTenDigits() {
    DateTime now = DateTime.now();
    int timestampInSeconds = now.millisecondsSinceEpoch ~/ 1000;
    return timestampInSeconds;
  }

  /// 获取当前时间戳（默认13位）
  static int getTimeStamp({isMicroseconds = false}) {
    DateTime currentTime = DateTime.now();
    return timeToTimeStamp(currentTime.toString());
  }

  /// 将某个格式时间转化成时间戳（默认13位）
  static int timeToTimeStamp(String time, {isMicroseconds = false}) {
    DateTime dateTime = DateTime.parse(_handleTime(time));
    int timeStamp = dateTime.millisecondsSinceEpoch; // 当前13位毫秒时间戳
    if (isMicroseconds) {
      timeStamp = dateTime.microsecondsSinceEpoch; // 当前16位微秒时间戳
    }
    return timeStamp;
  }

  static String timeStampToTimeYMD(int timeStamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String formattedDate = dateTimeToTime(dateTime, YMD);
    return formattedDate;
  }

  static String timeStampToTimeYMDHMS(int timeStamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String formattedDate = dateTimeToTime(dateTime, YMDHMSzh1);
    return formattedDate;
  }

  static String timeStampToTimeMinute(int timeStamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String formattedDate = dateTimeToTime(dateTime, minute);
    return formattedDate;
  }

  //日月年
  static String timeStampToTimeDMY(int timeStamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String formattedDate = dateTimeToTime(dateTime, DMY);
    return formattedDate;
  }

  //日月年
  static String timeStampToTimeDMYThia(int timeStamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String formattedDate = dateTimeToTime(dateTime, DMY_Thai);
    return formattedDate;
  }

  /// 获取当前时间戳（默认13位）
  static String timeStampToTime(int timeStamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String formattedDate = dateTimeToTime(dateTime, YMDHM);
    return formattedDate;
  }

  /// 获取当前时间戳（默认13位）
  static String timeStampToDate(int timeStamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    String formattedDate = dateTimeToTime(dateTime, MDWHS);
    return formattedDate;
  }

  /// 将某个格式时间转化为指定格式时间
  /// 支持格式：2022-07-03 14:59:31.202990 | 2019-02-02 | 2019-02-02 00:00:00
  /// 支持格式：2019/2/2 | 2019/02/02 |2019/2/2 00:00:00 |2019/02/02 00:00:00
  /// 支持格式：2019年2月2日 | 2019年02月02日 | 2019年2月2日 10:09:05 | 2019年02月02日 10:09:05
  /// 默认返回格式：2019-02-02 00:00:00
  static String timeToTime(String time, [List<String>? formats]) {
    DateTime dateTime = DateTime.parse(_handleTime(time));
    return dateTimeToTime(dateTime, formats);
  }

  /// 将某个DateTime格式时间转化为指定格式时间
  static String dateTimeToTime(DateTime date, [List<String>? formats]) {
    if (formats != null) {
      return formatDate(date, formats);
    } else {
      formats = YMDHMS;
      return formatDate(date, formats);
    }
  }

  /// 获取当前年
  /// 2019
  static String getYear() {
    return dateTimeToTime(DateTime.now(), [yyyy]);
  }

  /// 获取当前月
  /// 02
  static String getMonth() {
    return dateTimeToTime(DateTime.now(), [mm]);
  }

  /// 获取当前日
  /// 02
  static String getDay() {
    return dateTimeToTime(DateTime.now(), [dd]);
  }

  /// 获取当前周
  /// 日 或 7
  static String getWeek([isChinese = true]) {
    int week = DateTime.now().weekday;
    if (isChinese) {
      return weekText[week - 1];
    }
    return week.toString();
  }

  /// 获取当前时间
  /// 默认返回格式：2019-02-02 00:00:00
  static String getCurrentTime([List<String>? formats]) {
    return dateTimeToTime(DateTime.now(), formats);
  }

  /// 将某个格式时间转化为多久前
  static String formatTimeAgo(String time) {
    DateTime dateTime = DateTime.parse(_handleTime(time));
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays >= 365) {
      return '${(difference.inDays / 365).floor()}年前';
    } else if (difference.inDays >= 30) {
      return '${(difference.inDays / 30).floor()}个月前';
    } else if (difference.inDays >= 7) {
      return '${(difference.inDays / 7).floor()}周前';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays}天前';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours}小时前';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes}分钟前';
    } else {
      return '刚刚';
    }
  }

  ///nowTime 现在时间； targetTime 目标对比时间
  static String formatTimeBehind(int nowTime, int targetTime, {String languageCode = 'zh'}) {
    // DateTime dateTime = DateTime.parse(_handleTime(time));
    DateTime now = DateTime.fromMillisecondsSinceEpoch(nowTime);
    DateTime target = DateTime.fromMillisecondsSinceEpoch(targetTime);
    var label = "";
    //是否是中文
    var isZn = languageCode.contains('zh'); //'zh','en'
    if (languageCode.contains('zh')) {
      label = nowTime > targetTime ? "后" : "前";
    } else if (languageCode.contains('vi')) {
      label = nowTime > targetTime ? "after" : "before";//Phút Nữa
    } else {
      label = nowTime > targetTime ? "after" : "before";
    }

    final difference = now.difference(target);

    if (difference.inDays >= 365) {
      return '${(difference.inDays / 365).floor()}${isZn ? "年" : "year"}$label';
    } else if (difference.inDays >= 30) {
      return '${(difference.inDays / 30).floor()}${isZn ? "个月" : "month"}$label';
    } else if (difference.inDays >= 7) {
      return '${(difference.inDays / 7).floor()}${isZn ? "周" : "week"}$label';
    } else if (difference.inDays >= 1) {
      return '${difference.inDays}${isZn ? "天" : "day"}$label';
    } else if (difference.inHours >= 1) {
      // if (languageCode.contains('vi')) {
      //   return '${difference.inMinutes} $label';
      // }
      return '${difference.inHours}${isZn ? "小时" : "hour"}$label';
    } else if (difference.inMinutes >= 1) {
      // if (languageCode.contains('vi')) {
      //   return '${difference.inMinutes} $label';
      // }
      return '${difference.inMinutes}${isZn ? "分钟" : "min"}$label';
    } else if (difference.inSeconds < 60) {
      return '${difference.inMinutes}${isZn ? "秒" : "sec"}$label';
    } else {
      return isZn ? "刚刚" : "just";
    }
  }

  /// 处理传入的字符串时间
  /// 将2019年2月2日 | 2019年02月02日 10:09:05 | 2019/2/2 |2019/02/02 00:00:00
  /// 转换成 2019-02-02 00:00:00
  static String _handleTime(String time) {
    if (time.contains('-')) {
      return time;
    }
    time = time.replaceAll(RegExp(r'/'), '-');
    time = time.replaceAll(RegExp(r'年'), '-');
    time = time.replaceAll(RegExp(r'月'), '-');
    time = time.replaceAll(RegExp(r'日'), '');
    if (time.contains(':')) {
      // 带时分秒
      var tempArr = time.split(' ')[0].split('-');
      var year = tempArr[0];
      var month = tempArr[1];
      var day = tempArr[2];
      if (month.length < 2) {
        month = '0$month';
      }
      if (day.length < 2) {
        day = '0$day';
      }
      return '$year-$month-$day ${time.split(' ')[1]}';
    } else {
      var tempArr = time.split('-');
      var year = tempArr[0];
      var month = tempArr[1];
      var day = tempArr[2];
      if (month.length < 2) {
        month = '0$month';
      }
      if (day.length < 2) {
        day = '0$day';
      }
      return '$year-$month-$day';
    }
  }

  //2024-04-09 15:00 to 1712646000 10位
  static int getTimestamp(String time) {
    // print(" 时间$time");
    DateTime dateTime = DateTime.parse(time);
    return dateTime.millisecondsSinceEpoch ~/ 1000;
  }
}
