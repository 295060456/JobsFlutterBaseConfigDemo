/// 需要序列化存储到sp中的数据bean需要实现此接口
abstract class AppJsonSerializable {
  Map<String, dynamic> toJson();
  factory AppJsonSerializable.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError('fromJson must be implemented');
  }
}
