import 'package:json_annotation/json_annotation.dart';
part 'UserModel.g.dart'; // （第一个名字必须和本文件名一致，区分大小写）必须自动化生成代码前就要写这一句，否则会报错

@JsonSerializable()
class UserModel {
  final String name;
  final int age;

  UserModel({
    required this.name,
    required this.age,
  });

  /// 从 JSON 转 Model
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// 从 Model 转 JSON
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
