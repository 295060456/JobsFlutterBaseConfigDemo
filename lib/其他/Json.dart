import 'dart:convert';
import 'dart:developer';

void main() {
  handling_json_objects();
  handling_json_lists();
}

// 处理 JSON 对象
// ignore: non_constant_identifier_names
void handling_json_objects() {
  String jsonString = '{"month": "January", "num": "1", "isSelected": false}';
  Map<String, dynamic> jsonObject = jsonDecode(jsonString);

  log(jsonObject['month']); // 输出: January
  log(jsonObject['num']); // 输出: 1
  log(jsonObject['isSelected']); // 输出: false
}

// 处理 JSON 列表
// ignore: non_constant_identifier_names
void handling_json_lists() {
  String jsonString = '[{"month": "January", "num": "1", "isSelected": false},'
                       '{"month": "February", "num": "2", "isSelected": true}]';
  List<dynamic> jsonArray = jsonDecode(jsonString);

  // ignore: avoid_function_literals_in_foreach_calls
  jsonArray.forEach((item) {
    log(item['month']); // 分别输出: January 和 February
    log(item['num']); // 分别输出: 1 和 2
    log(item['isSelected']); // 分别输出: false 和 true
  });
}
