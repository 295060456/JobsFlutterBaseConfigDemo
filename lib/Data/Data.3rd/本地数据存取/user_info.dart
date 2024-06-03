class UserInfo {
  String name;
  int age;

  // 私有构造函数
  UserInfo._privateConstructor() : name = '', age = 0;

  // 单例实例
  static final UserInfo _instance = UserInfo._privateConstructor();

  // 工厂构造函数，返回单例实例
  factory UserInfo() {
    return _instance;
  }

  // 将用户信息转换为 JSON 格式
  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };

  // 从 JSON 格式解析用户信息
  factory UserInfo.fromJson(Map<String, dynamic> json) {
    _instance.name = json['name'];
    _instance.age = json['age'];
    return _instance;
  }
}
