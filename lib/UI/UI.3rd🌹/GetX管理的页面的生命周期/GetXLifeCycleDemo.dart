import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../UI.3rd/GetX管理的页面的生命周期/GetX.PageA/views/pageA_View.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PageAView(),
    );
  }
}
