// import 'package:flutter/foundation.dart';

// class MyClass {
//   String? senderId;
//   String? type;
//   String? senderName;
//   String? content;
//   dynamic receiveIds;
//   dynamic gift;
//   // 构造方法
//   MyClass({this.senderId, this.type, this.senderName, this.content, this.receiveIds, this.gift});
//   // 定义一个实例方法
//   void instanceMethod() {
//     debugPrint('This is an instance method');
//   }
//   // 定义一个类方法
//   Message.fromJson(Map<String, dynamic>? json) {
//     debugPrint('MyClass的类方法');
//     return Message(
//       senderId: json?['senderID'],
//       type: json?['type'],
//       senderName: json?['senderName'],
//       content: json?['content'],
//       receiveIds: json?['receiveIds'] ?? 0,
//     );
//   }
// }

// void main() {
//   // 调用实例方法
//   MyClass myObject = MyClass();
//   myObject.instanceMethod(); // 输出：MyClass的实例方法
//   // 调用类方法，无需创建类的实例
//   MyClass.fromJson(); // 输出：MyClass的类方法
// }

// void storageUsageDemo() {

//   // UserInfo 字段的使用
//   Storage.instance.userInfo.name = "汤山老王";
//   Storage.instance.userInfo.age = 33;
//   debugPrint(Storage.instance.userInfo.name);
//   debugPrint(Storage.instance.userInfo.age.toString());

//   // String 字段的使用
//   Storage.instance.key = "newKey";
//   debugPrint(Storage.instance.key);

//   // DateTime 字段的使用
//   Storage.instance.dateTime = DateTime(2023, 1, 1);
//   debugPrint(Storage.instance.dateTime?.toIso8601String());

//   // double 字段的使用
//   Storage.instance.doubleValue = 1.23;
//   debugPrint(Storage.instance.doubleValue.toString());

//   // int 字段的使用
//   Storage.instance.intValue = 42;
//   debugPrint(Storage.instance.intValue.toString());

//   // bool 字段的使用
//   Storage.instance.boolValue = true;
//   debugPrint(Storage.instance.boolValue.toString());
// }
