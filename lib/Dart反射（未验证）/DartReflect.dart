import 'package:flutter/material.dart';
import 'DynamicForm.dart';

// 在 Dart 中，你可以使用 dart:mirrors 库进行反射。
// 然而，请注意，dart:mirrors 并不适用于 Flutter。
// 这个示例展示了如何使用 Dart 的 json 库和 Flutter 动态生成表单，而不是依赖于反射。
// 虽然这不是传统意义上的反射，但它提供了类似的灵活性和动态性。

// dependencies:
//   flutter:
//     sdk: flutter
//   json_annotation: 

// dev_dependencies:
//   build_runner: 
//   json_serializable: 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const jsonString = '''
    {
      "name": "",
      "email": "",
      "age": ""
    }
    ''';

    return const MaterialApp(
      home: DynamicForm(jsonString: jsonString),
    );
  }
}
