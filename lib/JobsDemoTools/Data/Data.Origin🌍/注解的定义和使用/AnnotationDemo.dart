// 定义一个自定义注解
import 'package:flutter/material.dart';
// 注解是一种元数据，它们被用来为代码添加额外的信息。
// 这些信息在编译时或运行时可以被工具、框架或库所使用，以改变程序的行为或生成额外的代码。
// 但是，注解本身并不直接执行任何代码。
void main() {
  // 检查类是否有 MyAnnotation 注解
  var classAnnotation = getAnnotation<MyAnnotation>(MyClass);
  if (classAnnotation != null) {
    debugPrint("找到了类 MyClass 上的注解，消息是: ${classAnnotation.message}");
  }

  // 检查方法是否有 MyAnnotation 注解
  var methodAnnotation = getAnnotation<MyAnnotation>(MyClass().myMethod);
  if (methodAnnotation != null) {
    debugPrint("找到了方法 myMethod 上的注解，消息是: ${methodAnnotation.message}");
  }
}

// 用于获取类和方法上的注解的通用函数
T? getAnnotation<T>(Object element) {
  var annotations = element.runtimeType.toString();
  var annotationType = T.toString();
  var index = annotations.indexOf(annotationType);
  if (index != -1) {
    var startIndex = index + annotationType.length + 1; // Skip @ and space
    var endIndex = annotations.indexOf(')', startIndex);
    var message = annotations.substring(startIndex, endIndex);
    return MyAnnotation(message) as T; // 使用工厂函数创建注解对象
  }return null;
}

class MyAnnotation {
  final String message;
  const MyAnnotation(this.message);
}

// 使用自定义注解的类
@MyAnnotation("这是一个自定义注解的示例")
class MyClass {
  // 在方法上应用注解
  @MyAnnotation("这是一个方法上的自定义注解")
  void myMethod() {
    debugPrint("执行了 myMethod");
  }
}