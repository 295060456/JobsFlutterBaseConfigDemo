import 'package:flutter/foundation.dart';

class MyClass {
  String? senderId;
  String? type;
  String? senderName;
  String? content;
  dynamic receiveIds;
  dynamic gift;
  // 构造方法
  MyClass({this.senderId, this.type, this.senderName, this.content, this.receiveIds, this.gift});
  // 定义一个实例方法
  void instanceMethod() {
    debugPrint('This is an instance method');
  }
  // 定义一个类方法
  Message.fromJson(Map<String, dynamic>? json) {
    debugPrint('MyClass的类方法');
    return Message(
      senderId: json?['senderID'],
      type: json?['type'],
      senderName: json?['senderName'],
      content: json?['content'],
      receiveIds: json?['receiveIds'] ?? 0,
    );
  }
}

void main() {
  // 调用实例方法
  MyClass myObject = MyClass();
  myObject.instanceMethod(); // 输出：MyClass的实例方法
  // 调用类方法，无需创建类的实例
  MyClass.fromJson(); // 输出：MyClass的类方法
}