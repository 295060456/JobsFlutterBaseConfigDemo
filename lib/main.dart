import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// open -a Simulator
void main() {
  // 捕获FlutterError，并打印到控制台
  // 注意：在Release模式下，应用会被系统终止，因此需要在Release模式下关闭此功能
 FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) {
      // 在Release模式下，将应用控制权交给系统
      exit(1);
    }
  };

  // 用于确保Flutter框架已经初始化(某些情况下可以省略，最新版本的Flutter中不需要显示调用，但是为了确保向下兼容，还是加上)
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint("Hi");// 用这一句进行打印

  // 获取环境变量
  Map<String, String> environment = Platform.environment;
  // 获取 FLUTTER_TARGET 变量的值
  String? flutterTarget = environment['FLUTTER_TARGET'];
  // 打印 FLUTTER_TARGET 的值
  debugPrint('FLUTTER_TARGET: $flutterTarget');

  runApp(const MyApp());
  // 修改安卓状态栏颜色
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      // initialRoute: '',/// 初始化的时候加载的路由
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,/// 无论在 Android 还是在 iOS 上，标题都是居中显示
        /// 自定义返回按钮
        leading: IconButton(
          icon:const Icon(Icons.menu),
          onPressed: (){
            debugPrint('menu');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon:const Icon(Icons.search),
            onPressed: (){
              debugPrint('search');
            },
        ),
          IconButton(
            icon:const Icon(Icons.settings),
            onPressed: (){
              debugPrint('settings');
            }, 
        ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
