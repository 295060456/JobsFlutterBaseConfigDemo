import 'package:flutter/material.dart';
import 'package:get/get.dart';
// 在GetX（一个Flutter的状态管理和依赖注入框架）中，ever是一个监听器，用于在某个可观察对象（如变量、控制器的属性等）发生变化时执行特定的回调函数。
// 具体来说，ever可以用来在某个变量的值每次发生变化时，执行某些逻辑操作。

// ever<T>(
//   RxInterface<T> listener, // 是你要监听的可观察对象，比如一个RxInt、RxString等。
//   void Function(T) callback // 是当监听的对象发生变化时要执行的函数，函数的参数是变化后的新值。
// )

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 确保在MyApp中初始化GetX的控制器
    return GetMaterialApp(
      title: 'GetX Ever Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    // 当在一个 const 构造函数中使用 Get.put(MyController()) 初始化控制器时，会出现错误。
    // 这是因为 const 构造函数中的所有成员变量必须是编译时常量，而 Get.put(MyController()) 不是编译时常量。
    // 解决这个问题的方法是将控制器的初始化移到 build 方法中
    final MyController controller = Get.put(MyController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Ever Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() => const Text(
              'You have pushed the button this many times:',
            )),
            Obx(() => Text(
              '${controller.count}',
              style: Theme.of(context).textTheme.headlineMedium,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyController extends GetxController {
  var count = 0.obs; // 定义一个可观察的整数变量

  @override
  void onInit() {
    super.onInit();
    // 使用 ever 监听 count 的变化
    ever(count, (value) {
      debugPrint("Count has changed to $value");
    });
  }

  void increment() {
    count++;
  }
}