import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';
// Android 配置
// 在 android/app/src/main/AndroidManifest.xml 文件中添加以下权限：
// <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
// 并在 <application> 标签内添加以下内容：
// <receiver
//     android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver"
//     android:exported="true">
//     <intent-filter>
//         <action android:name="android.intent.action.BOOT_COMPLETED"/>
//     </intent-filter>
// </receiver>
// <receiver
//     android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver"
//     android:exported="true"/>

// iOS 配置
// 在 ios/Runner/Info.plist 文件中添加以下内容：
// <key>UIBackgroundModes</key>
// <array>
//     <string>fetch</string>
//     <string>remote-notification</string>
// </array>

// 如果是 Swift，则配置AppDelegate.swift文件：
// import UIKit
// import Flutter
// import flutter_local_notifications

// @main
// @objc class AppDelegate: FlutterAppDelegate {
//   override func application(
//     _ application: UIApplication,
//     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//   ) -> Bool {
//     FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
//       GeneratedPluginRegistrant.register(with: registry)
//     }
//     if #available(iOS 10.0, *) {
//       UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
//     }
//     GeneratedPluginRegistrant.register(with: self)
//     return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//   }
// }

// 如果是 Objective-C，则配置AppDelegate.m文件：
// #import "AppDelegate.h"
// #import "GeneratedPluginRegistrant.h"
// #import "FlutterLocalNotificationsPlugin.h"

// @implementation AppDelegate

// - (BOOL)application:(UIApplication *)application
//     didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//   [GeneratedPluginRegistrant registerWithRegistry:self];
//   if (@available(iOS 10.0, *)) {
//     [UNUserNotificationCenter currentNotificationCenter].delegate = (id<UNUserNotificationCenterDelegate>)self;
//   }
//   [FlutterLocalNotificationsPlugin setPluginRegistrantCallback:^(FlutterPluginRegistry* registry) {
//     [GeneratedPluginRegistrant registerWithRegistry:registry];
//   }];
//   return [super application:application didFinishLaunchingWithOptions:launchOptions];
// }

// @end

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    // 在 AndroidInitializationSettings 构造函数中使用的 app_icon 是指 Android 项目中的应用图标资源。
    // iOS 项目，无需配置 app_icon。因为 iOS 通知会自动使用应用的主图标。

    // Android项目，将你的图标文件（例如 app_icon.png）添加到以下路径：
    // android/app/src/main/res/drawable/app_icon.png（适用于一般图标）
    // 或者放到不同密度的文件夹中，例如：
    // android/app/src/main/res/mipmap-mdpi/app_icon.png
    // android/app/src/main/res/mipmap-hdpi/app_icon.png
    // android/app/src/main/res/mipmap-xhdpi/app_icon.png
    // android/app/src/main/res/mipmap-xxhdpi/app_icon.png
    // android/app/src/main/res/mipmap-xxxhdpi/app_icon.png
    // 如果这些文件夹不存在，可以自行创建。
    
    // 在 pubspec.yaml 中引用资源（可选）
    // 通常在 Android 项目中不需要在 pubspec.yaml 中显式引用这些资源，但为了完整性，可以确保资源文件夹结构正确。

    const initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
    final initializationSettingsIOS = DarwinInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    // 展示一个对话框
    showDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title ?? 'Notification'),
        content: Text(body ?? ''),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              // 处理点击事件
            },
          )
        ],
      ),
    );
  }

  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) {
    // 处理通知响应
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: ${notificationResponse.payload}');
    }
    // 其他处理逻辑
  }

  Future<void> _showNotification() async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      channelDescription: 'This channel is used for important notifications',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      enableVibration: true,
      groupAlertBehavior: GroupAlertBehavior.all,
      autoCancel: true,
      ongoing: false,
      styleInformation: BigTextStyleInformation(''),
      color: Color(0xFF9D50DD),
      largeIcon: DrawableResourceAndroidBitmap('app_icon'),
      showWhen: true,
    );

    const iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    const platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'Hello!',
      'This is a local notification.',
      platformChannelSpecifics,
      payload: 'item id 123',
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Local Notification Demo'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: _showNotification,
            child: const Text('Show Notification'),
          ),
        ),
      ),
    );
  }
}
