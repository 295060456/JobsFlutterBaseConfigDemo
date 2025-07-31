import 'package:jobs_flutter_base_config/JobsDemoTools/Utils/JobsCommonUtil.dart';

/// 安全获取 Map 中的值，支持类型推断与默认值
T? safeGet<T>(Map map, dynamic key, [T? defaultValue]) {
  final value = map[key];
  if (value is T) return value;
  return defaultValue;
}

void main() {
  Map<String, dynamic> user = {
    "name": "Jobs",
    "age": 30,
    "isVip": true,
  };

  // ✅ 正常获取
  String? name = safeGet<String>(user, "name");
  JobsPrint(name); // 输出: Jobs

  // ✅ 获取不存在字段，返回 null
  String? gender = safeGet<String>(user, "gender");
  JobsPrint(gender); // 输出: null

  // ✅ 获取不存在字段，提供默认值
  String gender2 = safeGet<String>(user, "gender", "男")!;
  JobsPrint(gender2); // 输出: 男

  // ✅ 类型安全：不会返回错误类型
  bool? vip = safeGet<bool>(user, "isVip");
  JobsPrint(vip); // 输出: true

  // ❌ 错误类型不会强转：安全返回默认值
  int? wrongType = safeGet<int>(user, "name", -1);
  JobsPrint(wrongType); // 输出: -1
}
