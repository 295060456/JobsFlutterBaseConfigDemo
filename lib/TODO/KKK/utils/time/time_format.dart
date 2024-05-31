import 'package:date_format/date_format.dart';

const YMD = [yyyy, '/', mm, '/', dd];
const DMY = ['ngày ', dd, ' tháng ', mm, ', ', yyyy]; //越语
const DMY_Thai = [dd, '-', mm, '-', yyyy]; //泰语
const MDY = [mm, '-', dd, '-', yyyy];
const YMDzh = [yyyy, '年', mm, '月', dd, '日 '];
const YMDHMS = [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn, ':', ss];
const YMDHMSzh = [yyyy, '年', mm, '月', dd, '日 ', HH, ':', nn, ':', ss];
const DMYHMSzh = [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn, ':', ss];
const YMDHMSzh1 = [yyyy, '/', mm, '/', dd, ' ', HH, ':', nn, ':', ss];
const minute = [  nn, '' ];
const YMDHM = [HH, ':', nn, ' ', yyyy, '/', mm, '/', dd];
const MDWHS = [mm, '月', dd, '日', '/', HH, ':', nn];

const weekText = ['一', '二', '三', '四', '五', '六', '日'];

///返回格式 枚举
enum TimeFormatterEnum {
  // "start_time": "2024-01-21 00:00:00",
  // "end_time": "2024-01-23 23:59:59",
  start(formatter: "yyyy-MM-dd 00:00:00"),
  current(formatter: "yyyy-MM-dd HH:mm:ss"),
  end(formatter: "yyyy-MM-dd 23:59:59");

  final String formatter;

  const TimeFormatterEnum({required this.formatter});
}
