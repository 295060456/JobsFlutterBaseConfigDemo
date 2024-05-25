// import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'Tools/SPUtil.dart';
// import 'Tools/Theme/theme_service.dart';
import 'Tools/channel_util.dart';
import 'Tools/device_service.dart';

// open -a Simulator
Future<void> main() async {
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
  debugPrint("Hi"); // 用这一句进行打印

  // 获取环境变量
  Map<String, String> environment = Platform.environment;
  // 获取 FLUTTER_TARGET 变量的值
  String? flutterTarget = environment['FLUTTER_TARGET'];
  // 打印 FLUTTER_TARGET 的值
  debugPrint('FLUTTER_TARGET: $flutterTarget');

  // 初始化时区数据库
  tz.initializeTimeZones();
  // SPUtil必须启动时预初始化
  await SPUtil.perInit();
  // 设置应用的屏幕方向为竖屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CurrentLocale())],
      // child: const MyApp1(),// 切换到MyApp1.无状态小部件
      child: const MyApp2(), // 切换到MyApp2.有状态小部件
    ));
  });

  // 获取设备的高级ID信息。
  await DeviceService.instance.getAdvanceDeviceId();

  // 修改安卓状态栏颜色
  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(style);
  } else if (Platform.isIOS) {
    SystemUiOverlayStyle style = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,

      /// iOS平台没有statusBarIconBrightness属性
      /// 可以通过设置statusBarBrightness来设置状态栏背景颜色
      /// 以及设置statusBarIconBrightness来设置状态栏的图标和字体颜色
      statusBarBrightness: Brightness.light, // 状态栏背景颜色
      statusBarIconBrightness: Brightness.light, // 状态栏图标和字体颜色
    );
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}
//=================================================有状态小部件====================================================
// 有状态小部件
class MyApp2 extends StatefulWidget {
  const MyApp2({super.key});

  @override
  // _MyAppState createState() => _MyAppState();
  State<MyApp2> createState() => _MyAppState();
}
// 有状态小部件的关联状态
class _MyAppState extends State<MyApp2> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ///统计首次安装app
    FlutterPluginName.installApp("installApp");

    ///统计启动app
    FlutterPluginName.callMethod("launchApp");

    WidgetsBinding.instance.addObserver(this);

    ///根据设计稿，这个App默认使用暗黑模式的风格
    // ThemeService.instance.initTheme(ThemeMode.dark);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          hideKeyboard(context);
        },
        child: null);
        // child: _buildMaterialApp(context));
  }

  //   Widget _buildMaterialApp(BuildContext mContext) {
  //   // log('当前语言包---：${Get.locale}---${Get.deviceLocale}----${LangService().lang.toLocaleValue}');
  //   return Consumer<CurrentLocale>(
  //     builder: (context, currentLocale, child) {
  //       return GetMaterialApp(
  //         locale: currentLocale.getLocale(),
  //         fallbackLocale: Get.deviceLocale,
  //         // fallbackLocale: LangService().lang.toLocaleValue,
  //         debugShowCheckedModeBanner: false,
  //         navigatorObservers: [
  //           CustomRouteListenWidget.routeObserver,
  //           CustomGlobalNavigatorObserver()
  //         ],
  //         initialRoute: '/',
  //         getPages: [...Routes.routePage],
  //         theme: ThemeService.instance.lightTheme,
  //         darkTheme: ThemeService.instance.darkTheme,
  //         themeMode: ThemeService.instance.themeMode,
  //         defaultTransition: Transition.cupertino,
  //         localizationsDelegates: const [
  //           S.delegate,
  //           GlobalMaterialLocalizations.delegate,
  //           GlobalWidgetsLocalizations.delegate,
  //           GlobalCupertinoLocalizations.delegate,
  //         ],
  //         supportedLocales: S.delegate.supportedLocales,
  //         initialBinding: SplashBinding(),
  //         home: SplashPage(
  //           onFinish: (context) async {
  //             _initThirdSDK();
  //             await AccountService().initAsync();
  //             Future.delayed(const Duration(seconds: 1), () {
  //               RouteUtil.pushToView(Routes.mainPage, offAll: true);
  //             });
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }
}
//=================================================无状态小部件====================================================
// 无状态小部件没有关联状态
class MyApp1 extends StatelessWidget {
  const MyApp1({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        centerTitle: true,

        /// 无论在 Android 还是在 iOS 上，标题都是居中显示
        /// 自定义返回按钮
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            debugPrint('menu');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              debugPrint('search');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
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
//=================================================一些功能性方法====================================================
// 自定义状态管理类，切换语言
class CurrentLocale with ChangeNotifier {
  Locale _locale = const Locale("en", "US");

  Locale get value => _locale;

  set setLocale(locale) {
    _locale = locale;
    notifyListeners();
  }

  Locale? getLocale() {
    var type = SPUtil().getInt(2);
    if (type == 1) {
      return const Locale('zh', 'CN');
    } else if (type == 2) {
      return const Locale("en", "US");
    } else if (type == 3) {
      return const Locale("pt", "BR");
    } else if (type == 4) {
      return const Locale("vi", "VN");
    } else if (type == 5) {
      return const Locale("th", "TH");
    } else if (type == 6) {
      return const Locale("hi", "IN");
    } else {
      return Get.deviceLocale;
    }
  }
}
///关闭软键盘
void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}