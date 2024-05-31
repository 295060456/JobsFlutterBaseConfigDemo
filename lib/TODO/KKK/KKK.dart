import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/KKK/session_change_notifier.dart';
import 'package:jobs_flutter_base_config/KKK/splash/binding.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;
import '../TODO/routes.dart';
import 'generated/l10n.dart';
import 'splash/view.dart';
import 'utils/sp_util.dart';

Future<void> main() async {
  // 初始化时区数据库
  tz.initializeTimeZones();
  // 用于确保Flutter框架已经初始化(某些情况下可以省略，最新版本的Flutter中不需要显示调用，但是为了确保向下兼容，还是加上)
  WidgetsFlutterBinding.ensureInitialized();

  // SPUtil必须启动时预初始化
  await SPUtil.perInit();
  _initUI();
  // 设置应用的屏幕方向为竖屏。
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => CurrentLocale())],
      child: const MyApp(),
    ));
  });
  if(Platform.isAndroid){
    SystemUiOverlayStyle style = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.light
    );
    SystemChrome.setSystemUIOverlayStyle(style);
  }
  // 获取设备的高级ID信息。
  // await DeviceService.instance.getAdvanceDeviceId();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // ///统计首次安装app
    // FlutterPluginName.installApp(CacheKey.installApp);

    // ///统计启动app
    // FlutterPluginName.callMethod(CacheKey.launchApp);

    // WidgetsBinding.instance.addObserver(this);

    // ///根据设计稿，这个App默认使用暗黑模式的风格
    // ThemeService.instance.initTheme(ThemeMode.dark);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          hideKeyboard(context);
        },
        child: _buildMaterialApp(context));
  }

  Widget _buildMaterialApp(BuildContext mContext) {
    // log('当前语言包---：${Get.locale}---${Get.deviceLocale}----${LangService().lang.toLocaleValue}');
    return Consumer<CurrentLocale>(
      builder: (context, currentLocale, child) {
        return GetMaterialApp(
          locale: currentLocale.getLocale(),
          fallbackLocale: Get.deviceLocale,
          // fallbackLocale: LangService().lang.toLocaleValue,
          debugShowCheckedModeBanner: false,
          navigatorObservers: [
            // CustomRouteListenWidget.routeObserver,
            CustomGlobalNavigatorObserver()
          ],
          initialRoute: '/',
          getPages: [...Routes.routePage],
          // theme: ThemeService.instance.lightTheme,
          // darkTheme: ThemeService.instance.darkTheme,
          // themeMode: ThemeService.instance.themeMode,
          defaultTransition: Transition.cupertino,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          initialBinding: SplashBinding(),
          home: SplashPage(
            onFinish: (context) async {
              // _initThirdSDK();
              // await AccountService().initAsync();
              // Future.delayed(const Duration(seconds: 1), () {
              //   RouteUtil.pushToView(Routes.mainPage, offAll: true);
              // });
            },
          ),
        );
      },
    );
  }
}

///关闭软键盘
void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}

// void _initThirdSDK() async {
//   ULogService.instance;

// //Remove this method to stop OneSignal Debugging    推送初始化方法
//   OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
//   OneSignal.initialize("af0766d6-ec19-4b29-bb78-718d1961380f");
// // The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
//   OneSignal.Notifications.requestPermission(true);

//   AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
//       afDevKey: "LkQ6kpwrrmBYiAwehr6Wkh",
//       appId: "com.tggroup.flutter_bet",
//       showDebug: true);

//   AppsflyerSdk appsflyerSdk = AppsflyerSdk(appsFlyerOptions);

//   appsflyerSdk.initSdk(
//       registerConversionDataCallback: true,
//       registerOnAppOpenAttributionCallback: true,
//       registerOnDeepLinkingCallback: true
//   );

//   // AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
//   //   afDevKey: "LkQ6kpwrrmBYiAwehr6Wkh",
//   //   appId: "com.tggroup.fb4748",
//   //   showDebug: true,
//   //   timeToWaitForATTUserAuthorization: 50, // for iOS 14.5
//   //   // appInviteOneLink: oneLinkID, // Optional field
//   //   disableAdvertisingIdentifier: false, // Optional field
//   //   disableCollectASA: false, //Optional field
//   //   manualStart: false, ); // Optional field
//   //
//   // AppsflyerSdk appsflyerSdk = AppsflyerSdk(appsFlyerOptions);
//   // appsflyerSdk.initSdk(
//   //     registerConversionDataCallback: true,
//   //     registerOnAppOpenAttributionCallback: true,
//   //     registerOnDeepLinkingCallback: true);

//   //Here we start the SDK
//   appsflyerSdk.startSDK();

//   bool? result = false;
//   try {
//     Map<String, String> eventValues = Map<String, String>();
//     eventValues['af_re_engage1'] = 'value1';
//     eventValues['af_re_engage2'] = 'value2';
//     result = await appsflyerSdk.logEvent("af_login", eventValues);
//   } on Exception catch (e) {
//     print("Result logEvent87222: -------------失败了！！！！！！");
//   }
//   print("Result logEvent87222: $result");

//   // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//   //请求获取设备id需要的权限，iOS-ATT广告追踪，Android-根据系统版本oaid或者imie
//   // final success = await FlutterAdvertisingId.requestPermissionIfNecessary();
//   // ULog.i("请求获取设备id需要的权限：$success");
//   // final deviceId = await FlutterAdvertisingId.getDeviceId();
//   // ULog.i("设备id：$deviceId");

//   // PushService.instance.initSDK(AppValues.jPushKey, AppValues.channel);
//   // Future.delayed(const Duration(seconds: 1), () {
//   //   RouteUtil.pushToView(Routes.mainPage, offAll: true);
//   // });

//   //   if (flag) {
//   //     _showSplashAdView();
//   //   } else {
//   //     RouteUtil.pushToView(Routes.mainPage, offAll: true);
//   //   }
//   // });
// }

void _initUI() {}

class CustomGlobalNavigatorObserver extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    // TODO: implement didPop
    super.didPop(route, previousRoute);
    // CustomSnackBar.dismiss();
    // CustomToast.dismiss();
  }
}
