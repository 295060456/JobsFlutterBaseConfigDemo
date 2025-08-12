import 'dart:convert';

import 'package:jobs_flutter_base_config/JobsDemoTools/Data/Data.3rd/%E6%95%B0%E6%8D%AE%E5%A4%84%E7%90%86/example_model.dart';

void main() {
  final jsonData = {
    'cfg': '{"name":"single","value":1}',
    'cfgList': jsonEncode([
      {'name': 'list1', 'value': 10},
      {'name': 'list2', 'value': 20}
    ]),
    'cfgMap': {
      'a': {'name': 'map-a', 'value': 100},
      'b': {'name': 'map-b', 'value': 200}
    }
  };

  print('=== 原始 JSON ===');
  print(const JsonEncoder.withIndent('  ').convert(jsonData));

  final model = ExampleModel.fromJson(jsonData);
  print('\n=== 解析结果 ===');
  print(model.toJson());

  print('\n=== 再转回 JSON（验证一致性） ===');
  print(const JsonEncoder.withIndent('  ').convert(model.toJson()));
}

