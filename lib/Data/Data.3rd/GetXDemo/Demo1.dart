import 'package:flutter/material.dart';

// 要在Flutter中实现类似iOS的viewWillAppear和viewDidAppear的方法，
// 你可以使用WidgetsBindingObserver来检测应用的生命周期状态。
// 以下是一个示例代码，展示如何在Flutter中实现视图即将显示和视图已经显示的功能：
void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    _onViewWillAppear(); // Called each time the widget is built
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lifecycle Demo'),
      ),
      body: const Center(
        child: Text('Hello, World!'),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        // 应用程序处于非活动状态
        debugPrint('应用程序处于非活动状态');
        break;
      case AppLifecycleState.paused:
        // 应用程序处于后台
        _onViewWillDisappear();
        debugPrint('应用程序处于后台');
        break;
      case AppLifecycleState.resumed:
        // 应用程序处于前台并可交互
        _onViewDidAppear();
        debugPrint('应用程序处于前台并可交互');
        break;
      case AppLifecycleState.detached:
        // 应用程序没有关联的 Flutter 引擎
        debugPrint('应用程序没有关联的 Flutter 引擎');
        break;
      case AppLifecycleState.hidden:
        // AppLifecycleState.hidden 是 Flutter 中的一个枚举值，它表示应用程序的状态在 iOS 平台上被隐藏时的状态。
        // 具体来说，AppLifecycleState.hidden 是在 iOS 上当用户按下主屏幕按钮或切换到另一个应用程序时，Flutter 应用程序进入后台并且不再可见的状态。
        // 在 Android 平台上没有完全对应的状态。
        // 在 Android 上，当应用程序进入后台时，通常会接收到 AppLifecycleState.paused 状态。
        debugPrint('Handle this case');
    }
    super.didChangeAppLifecycleState(state);
  }

  void _onViewWillAppear() {
    // Code to run when the view is about to appear
    debugPrint("View will appear");
  }

  void _onViewDidAppear() {
    // Code to run when the view has appeared
    debugPrint("View did appear");
  }

  void _onViewWillDisappear() {
    // Code to run when the view is about to disappear
    debugPrint("View will disappear");
  }
}
