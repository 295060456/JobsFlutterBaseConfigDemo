# <font color=red>[Dart.**`Flutter`**](https://flutter.dev/?utm_source=google&utm_medium=cpc&utm_campaign=brand_sem&utm_content=apac_apac&gad_source=1&gad_campaignid=13034410756&gbraid=0AAAAAC-INI-9jKGdZCm6a9Zp2RvENOQVv&gclid=Cj0KCQjwj8jDBhD1ARIsACRV2TuPZFDZ2Py9BmKbsRj_mVS18Mf58tJhFzuzJIuxzTe316eALXjyW0AaAhelEALw_wcB&gclsrc=aw.ds)靶场🧪项目 </font><基础配置的说明>

[toc]

当前总行数：

## 🔥<font id=前言>前言</font>

* **工欲善其事必先利其器**
* **站在巨人的肩膀上，才能看得更远**
* **面向信仰编程**

## 一、🎯目的 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

* 所有的项目根据这个根来进行统一配置和调用
* 将它作为所有项目的基类，做到全局的统一
* 千万要保证这个工程的编译通过，以后项目直接进行引用
* 作为某些代码实践的靶场，是非常有必要的
* 作为代码笔记，记录一些常用的代码，方便查阅
* 作为学习的资料，可以快速了解到一些常用的知识
* 作为项目的参考，可以快速的了解到项目的架构，代码规范，以及一些设计模式
* <font color=blue>**示例Demo可能因为相关Api的升级没有覆盖处理会出现闪退。修复即可**</font>

## 二、💥代码讲解 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

* 常用于设置 **状态栏和系统底部导航栏样式** 的配置。尤其在 APP 启动时、页面初始化时非常常见

  > 1、`SystemChrome`：来自 `package:flutter/services.dart`，用于设置系统级 UI 交互（如状态栏、导航栏）
  >
  > 2、`SystemUiOverlayStyle`：一个数据类，描述状态栏/导航栏的颜色、图标亮度等

  ```dart
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, // 状态栏背景颜色
      statusBarIconBrightness: Brightness.dark, // 状态栏图标颜色（黑色）
      statusBarBrightness: Brightness.light, // 适用于iOS
  
      systemNavigationBarColor: Colors.white, // 导航栏背景颜色
      systemNavigationBarIconBrightness: Brightness.dark, // 导航栏图标为黑色
      systemNavigationBarDividerColor: Colors.white, // 导航栏分割线颜色（可选）
    ));
  ```


* <font color=red>**Flutter 项目中比较标准且完整的启动流程**</font>

  > 1、`SystemChrome` 限制方向
  >
  > 2、`WakelockPlus` 保持屏幕常亮
  >
  > 3、`GetX` 依赖注入、路由
  >
  > 4、`SpUtil` 读取缓存
  >
  > 5、`ScreenUtil` 适配设计图尺寸
  >
  > 6、`EasyLoading` 全局 loading 提示
  >
  > 7、多语言支持
  >
  > 8、自定义生命周期监听

  ```dart
  SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,/// 强制设置 App 只允许竖屏朝上
    ]).then((_) async {
      WakelockPlus.enable();/// 保持屏幕常亮，不自动息屏
      Get.put(AppLifecycleController()); /// 注册生命周期监听
      String currentLanguage =
          await SpUtil.getString("currentLanguageType") ?? "zh";
      NetworkService().setLanguageNum(currentLanguage);
      /// 自定义路由监听器，可在页面切换时做记录、埋点、统计等。
      final AppNavigatorObserver appNavigatorObserver = AppNavigatorObserver();
      runApp(
        /// ScreenUtilInit 是 flutter_screenutil 提供的入口，配合设计稿尺寸进行尺寸适配；
        /// 1125x2436 是 iPhone X 的设计尺寸（单位是 px，不是 dp）；
        /// 可自动适配不同分辨率设备，保证 UI 不变形。
        ScreenUtilInit(
          designSize: const Size(1125, 2436), /// 目前给到的设计图尺寸，如有变动，后续再改
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'XXXXX',
              navigatorObservers: [appNavigatorObserver],
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: supportedLocales,/// 支持语言列表；
              initialRoute: AppPages.INITIAL,
              initialBinding: MainBindings(),
              getPages: AppPages.routes,
              builder: EasyLoading.init(),/// 配置全局 loading 样式；
              translations: AppTranslations(),/// 实现了 GetTranslations 的类，提供语言资源。
              locale: Locale(currentLanguage),/// 当前语言；
              fallbackLocale: const Locale("en"),/// 无匹配时的默认语言。
            );
          },
        ),
      );
      configLoading();/// 配置 EasyLoading 的样式，如动画、字体、遮罩等。
    });
  ```

* 告诉 [**GetX**](https://pub.dev/packages/get) **当有人第一次使用 `HomeRequestManager` 时，再去创建它的实例（懒加载）**。

  > <font color=red>**`fenix: false`（默认）**</font>：
  >
  > - 第一次用时创建实例；
  > - **被释放（GC）后不会自动再创建**；
  > - 再次访问时会报错：`Instance "HomeRequestManager" not found`.
  >
  > ✅ **`fenix: true`**：
  >
  > - 第一次用时创建；
  > - 即使被释放，**再次访问时仍然能自动重新创建！**
  > - 像“凤凰重生”一样（这就是名字 `fenix` 的来源）

  ```dart
  /// 注册
  Get.lazyPut(() => HomeRequestManager(), fenix: true);
  ```

  ```dart
  /// 使用
  final manager = Get.find<HomeRequestManager>();
  ```

* 确保 Flutter 框架与底层平台（如 MethodChannel、插件）之间的桥梁已完成初始化。

  > Flutter 有一个叫做 **`WidgetsBinding`** 的东西，它是所有 Widget 框架的核心，它负责：
  >
  > - 管理生命周期（如 `build`、`rebuild`）
  > - 管理 `SchedulerBinding`（帧调度）
  > - 管理平台通道（如使用 `MethodChannel` 调用原生方法）
  >
  > 在 `runApp()` 之前，你必须保证这个 Binding 已经初始化。

  ```dart
  WidgetsFlutterBinding.ensureInitialized();
  ```

  比如，在使用以下功能前，一定要进行初始化：

  - 使用 `SharedPreferences.getInstance()`
  - 调用 `SystemChrome.setPreferredOrientations(...)`
  - 使用 `await Firebase.initializeApp()`
  - 使用 `PathProvider.getApplicationDocumentsDirectory()`
  - 调用原生插件（任何与平台通道有关的）

  > 如果没有调用 `WidgetsFlutterBinding.ensureInitialized()`，可能会报错类似：
  >
  > ```shell
  > Binding has not yet been initialized.
  > ```

* 在 iOS 上启用 native 层实现的 ping 功能

  > 1、因为 iOS 的网络权限和限制较多，`dart_ping` 需要通过原生插件配合实现 `ping`，所以需要先进行手动注册
  >
  > 2、这个调用对 **Android 不需要**（在 Android 上使用 `Ping` 不需要额外处理，直接用即可）

  * 注册

    ```dart
    DartPingIOS.register();
    ```

  * 使用

    ```dart
    final ping = Ping('8.8.8.8', count: 4);
    
    ping.stream.listen((event) {
      print(event.summary); // 或 event.response
    });
    ```

  * 配置

    * `Info.plist `

      ```xml
      <key>NSAppTransportSecurity</key>
      <dict>
        <key>NSAllowsArbitraryLoads</key>
        <true/>
      </dict>
      ```

    * `pubspec.yaml`

      ```yaml
      dependencies:
        dart_ping: ^8.0.1
      # iOS 需要单独引入
      dart_ping_ios: ^4.0.0
      ```

* **SpUtil**

  > 1、封装原生 SharedPreferences 支持的所有类型
  >
  > 2、额外支持了自定义对象（Bean）的存取

  ```dart
  import 'dart:convert';
  import 'package:shared_preferences/shared_preferences.dart';
  import 'app_json_serializable.dart';
  /// 存储配置信息的工具类
  class SpUtil {
    /// 保存String类型数据
    static Future<void> saveString(String key, String value) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(key, value);
    }
    /// 获取String类型数据
    static Future<String?> getString(String key) async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(key);
    }
    /// 保存Int类型数据
    static Future<void> saveInt(String key, int value) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(key, value);
    }
    /// 获取Int类型数据
    static Future<int?> getInt(String key) async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getInt(key);
    }
    /// 保存Double类型数据
    static Future<void> saveDouble(String key, double value) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(key, value);
    }
    /// 获取Double类型数据
    static Future<double?> getDouble(String key) async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getDouble(key);
    }
    /// 保存Bool类型数据
    static Future<void> saveBool(String key, bool value) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(key, value);
    }
    /// 获取Bool类型数据
    static Future<bool?> getBool(String key) async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getBool(key);
    }
    /// 保存String类型列表数据
    static Future<void> saveStringList(String key, List<String> value) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(key, value);
    }
    /// 获取String类型列表数据
    static Future<List<String>?> getStringList(String key) async {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getStringList(key);
    }
    /// 通过key删除指定数据
    static Future<void> remove(String key) async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(key);
    }
    /// 清空数据
    static Future<void> clear() async {
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
    }
    /// 保存序列化的bean
    static Future<void> saveBean<T extends AppJsonSerializable>(
        String key, T value) async {
      final prefs = await SharedPreferences.getInstance();
      String jsonString = jsonEncode(value.toJson());
      await prefs.setString(key, jsonString);
    }
    /// 拿出bean
    static Future<T?> getBean<T extends AppJsonSerializable>(
        String key, T Function(Map<String, dynamic>) fromJson) async {
      final prefs = await SharedPreferences.getInstance();
      String? jsonString = prefs.getString(key);
      if (jsonString != null) {
        Map<String, dynamic> jsonMap = jsonDecode(jsonString);
        return fromJson(jsonMap);
      }
      return null;
    }
  }
  ```

* [**EasyLoading**](https://pub.dev/documentation/flutter_easyloading/latest/) 

  | 类型       | 方法                                    | 说明                |
  | ---------- | --------------------------------------- | ------------------- |
  | 加载中     | `EasyLoading.show()`                    | 显示默认加载动画    |
  | 自定义提示 | `EasyLoading.show(status: '加载中...')` | 自定义提示文本      |
  | 成功提示   | `EasyLoading.showSuccess('成功')`       | 显示带 ✅ 的成功提示 |
  | 失败提示   | `EasyLoading.showError('失败')`         | 显示带 ❌ 的错误提示 |
  | 信息提示   | `EasyLoading.showInfo('信息')`          | 显示 ℹ️ 的信息提示   |
  | 关闭提示   | `EasyLoading.dismiss()`                 | 隐藏所有提示        |

  ```dart
  void configLoading() {
    // EasyLoading.instance
    //   ..loadingStyle = EasyLoadingStyle.light
    //   ..backgroundColor = Colors.white // 自定义背景颜色
    //   ..dismissOnTap = true; // 点击不能关闭加载框
  
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..backgroundColor = Colors.white
      ..indicatorColor = const Color(theme01MainColor)
      ..textColor = const Color(theme01MainColor)
      ..dismissOnTap = true; // 点击不能关闭加载框
    // ..maskType = EasyLoadingMaskType.custom
    // ..maskColor = Colors.black.withOpacity(0.1)
  }
  ```

  ```yaml
  /// pubspec.yaml 
  dependencies:
    flutter_easyloading: ^3.0.5
  ```

* [**极光原生推送**](https://www.engagelab.com/zh_CN)：[FlutterPluginEngagelab](https://pub.dev/packages/flutter_plugin_engagelab) 

  > 来自于：`package:flutter_plugin_engagelab/flutter_plugin_engagelab.dart`
  >
  > 1、iOS / Android 推送消息接收与处理
  >
  > 2、获取设备注册 ID
  >
  > 3、设置角标
  >
  > 4、推送事件回调
  >
  > 5、设置调试模式等

  ```dart
  /// pubspec.yaml 
  dependencies:
    flutter_plugin_engagelab: ^1.2.4
  ```

## 三、📃其他 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

* **Getting Started**

  This project is a starting point for a Flutter application.

  A few resources to get you started if this is your first Flutter project:

  - [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
  - [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

  For help getting started with Flutter development, view the
  [online documentation](https://docs.flutter.dev/), which offers tutorials,
  samples, guidance on mobile development, and a full API reference.

* 安装[**fvm**]()的前提是先安装**dart**环境

  ```dart
  dart pub global activate fvm
  ```
  
* 如果[**VSCode**]()打开flutter项目以后没有办法通过`command`+`click`的形式点进去看，那么需要`command`+`shift`+`x` => 安装Dart/Flutter

  ![image-20250713101322760](./assets/README/image-20250713101322760.png)

  ![image-20250713101045523](./assets/README/image-20250713101045523.png)
  
* **项目文件（夹）功能**

  * `analysis_options.yaml` 是一个与 Dart 语言开发相关的文件，它通常用于配置 Dart 代码的静态分析和代码风格检查工具；
    
    ```yaml
    # This file configures the analyzer, which statically analyzes Dart code to
    # check for errors, warnings, and lints.
    #
    # The issues identified by the analyzer are surfaced in the UI of Dart-enabled
    # IDEs (https://dart.dev/tools#ides-and-editors). The analyzer can also be
    # invoked from the command line by running `flutter analyze`.
    
    # The following line activates a set of recommended lints for Flutter apps,
    # packages, and plugins designed to encourage good coding practices.
    analyzer:
      errors:
        # 警告忽略：在公共 API 中使用私有类型
        library_private_types_in_public_api: ignore
    include: package:flutter_lints/flutter.yaml
    
    linter:
      # The lint rules applied to this project can be customized in the
      # section below to disable rules from the `package:flutter_lints/flutter.yaml`
      # included above or to enable additional rules. A list of all available lints
      # and their documentation is published at https://dart.dev/lints.
      #
      # Instead of disabling a lint rule for the entire project in the
      # section below, it can also be suppressed for a single line of code
      # or a specific dart file by using the `// ignore: name_of_lint` and
      # `// ignore_for_file: name_of_lint` syntax on the line or in the file
      # producing the lint.
      rules:
        # avoid_print: false  # Uncomment to disable the `avoid_print` rule
        # prefer_single_quotes: true  # Uncomment to enable the `prefer_single_quotes` rule
    
    # Additional information about this file can be found at
    # https://dart.dev/guides/language/analysis-options
    ```
    
    * 这个文件定义了一系列的规则和配置，以指导静态分析工具（如 Dart Analyzer）和代码风格检查工具（如 Dart Linter）在检查 Dart 代码时应该遵循的规范和行为。
    * 在这个文件中，可以配置许多不同的选项。比如：代码格式化规则、代码风格规范、代码质量检查规则等；
    * 这个文件可以帮助团队确保他们的 Dart 代码在语法、风格和质量方面都保持一致性，并且符合团队或项目的规范，确保团队的代码质量和一致性；
    * 一个典型的 `analysis_options.yaml` 文件可能包含诸如以下内容的配置：
      * 代码风格规范，比如缩进、空格使用、命名约定等；
      * 静态分析工具的配置，比如是否启用强类型检查、未使用的变量警告等；
      * 代码质量检查规则，比如未使用的代码、不安全的操作等；
      * 项目特定的规则和配置，比如禁用特定的警告、自定义代码格式化等；
    
  * `pubspec.yaml` 是 Dart 语言中用于管理项目依赖和元数据的文件。这个文件通常位于 Dart 项目的根目录中，其中包含了项目的名称、版本、作者信息等基本元数据，以及项目所依赖的第三方库（通过 Dart 包管理器 pub 安装）；

    * 在这个文件中，可以做以下几件事情：
      * **指定项目元数据**：你可以指定项目的名称、版本、描述、作者信息等元数据，这些信息将在发布到 Dart 包仓库时显示。
      * **定义项目依赖**：通过 `dependencies` 和 `dev_dependencies` 部分，你可以指定项目所依赖的第三方库。其中，`dependencies` 指定项目运行时依赖的库，而 `dev_dependencies` 则是开发时依赖的库，比如测试框架、代码分析工具等。
      * **指定 Dart 版本**：你可以指定项目所需的 Dart SDK 版本，以确保项目的兼容性。
      * **添加其他配置**：除了上述内容外，你还可以在 `pubspec.yaml` 文件中添加其他配置，比如项目的环境依赖、脚本命令、资源文件等。
    * <font color=red>`assets` **路径名不能有中文，否则可能无法正常读取**</font>

    *`pubspec.yaml`*

    ```yaml
    name: my_project
    version: 1.0.0
    description: A sample Dart project
    
    dependencies:
      flutter:
        sdk: flutter
      http: ^0.13.3
      intl: ^0.17.0
    
    dev_dependencies:
      flutter_test:
        sdk: flutter
    
    flutter:
      uses-material-design: true
      
    assets: # 路径名不能有中文，否则可能无法正常读取
      - assets/
      - assets/i18n/
      - assets/CarouselAssets/
      - assets/AppLaunchAssets/
    
    #这个文件定义了一个名为 `my_project` 的 Dart 项目
    #它依赖于 Flutter SDK
    #并且还依赖于 `http` 和 `intl` 这两个第三方库
    #同时，它也声明了开发时的依赖 `flutter_test`
    ```

  * `pubspec.lock` 文件是 Dart 项目中的自动生成文件，用于锁定项目依赖的版本信息。

    * 是 Dart 项目中的重要文件之一，通常由 Dart 包管理器 pub 自动生成，并且会随着你运行 `pub get` 或 `pub upgrade` 命令而更新。
    * `pubspec.lock` 文件记录了项目依赖包的确切版本信息，包括主要依赖和间接依赖。这样做的目的是确保**在不同的环境中**（比如不同的开发者、不同的构建服务器）运行相同的 `pub get` 或 `pub upgrade` 命令时，使用的依赖版本都是一致的，从而避免因为依赖版本不一致而导致的问题，提高了项目的可重复性和稳定性；
    * 当运行 `pub get` 或 `pub upgrade` 命令时，pub 将会根据 `pubspec.yaml` 中指定的依赖关系生成或更新 `pubspec.lock` 文件；

    *`pubspec.lock`*

    ```yaml
    packages:
      flutter:
        description: flutter
        source: hosted
        version: "2.5.0"
      http:
        description: http
        source: hosted
        version: "0.13.3"
      intl:
        description: intl
        source: hosted
        version: "0.17.0"
    ```


  * `.metadata` 文件是一个二进制文件，Dart 项目中的一个隐藏文件，通常存储在项目的根目录下，用于保存与 Dart 包管理器 pub 相关的元数据信息。

    * 这个文件通常由 pub 自动生成和维护，其中包含了一些关于项目的信息，比如项目所使用的 SDK 版本、缓存路径、依赖包的路径等；
    * 不需要手动编辑或处理 `.metadata` 文件，因为它是由 pub 自动生成和管理的；
    * 在一些情况下，你可能会发现自己需要删除 `.metadata` 文件，例如当你遇到与 pub 相关的问题时，尝试删除 `.metadata` 文件并重新执行 `pub get` 或 `pub upgrade` 可能会有助于解决问题；
    * 删除 `.metadata` 文件后，pub 会重新生成一个新的 `.metadata` 文件，其中包含了当前项目的元数据信息；

  * `.flutter-plugins` 文件是 Flutter 项目中的一个隐藏文件，它用于跟踪 Flutter 插件的信息；

    * 是一个文本文件，通常使用 UTF-8 编码。只是一种简单的（键值对格式）配置文件格式，并没有特定的编程语言与之关联
    * 这个文件的存在使得 Flutter 工具能够轻松地知道项目中使用了哪些插件，以及它们的路径。这对于构建、编译和打包应用程序是非常有用的，因为 Flutter 工具需要知道哪些插件需要包含在最终的应用程序包中。
    * Flutter 插件是用来扩展 Flutter 应用程序功能的软件包，它们通常用于访问平台特定的功能，比如相机、地理位置、推送通知等；
    * 文件记录了项目中使用的 Flutter 插件的名称和路径信息。当你在 Flutter 项目中添加或移除 Flutter 插件时，Flutter 工具会自动更新这个文件；
    * 文件的格式通常是一个简单的键值对列表，其中键是插件的名称，值是插件所在的路径，如下所示：

    ```
    camera=plugins/camera/
    location=plugins/location/
    ```


  * `.flutter-plugins-dependencies` 文件是一个用来存储 Flutter 插件依赖信息的隐藏文件；

    * 这个文件通常由 Flutter 工具自动生成和维护，并且在使用 `flutter pub get` 或 `flutter pub upgrade` 命令时会被更新；

    * 文件记录了每个 Flutter 插件的依赖关系，包括主要插件和依赖插件。这些信息有助于 Flutter 工具更好地管理插件及其依赖关系，并确保项目中使用的所有插件及其相关的依赖都被正确地下载和管理；

    *`.flutter-plugins-dependencies`*

    ```yaml
    dependencies:
      camera:
        dependency: "direct main"
        description:
          name: camera
          url: "https://pub.dev/packages/camera"
          version: "0.9.4+9"
      image_picker:
        dependency: "direct main"
        description:
          name: image_picker
          url: "https://pub.dev/packages/image_picker"
          version: "0.8.4+3"
          
    # 在这个示例中，`camera` 和 `image_picker` 是两个插件，它们分别有自己的依赖关系记录，包括依赖类型（`dependency`）、名称（`name`）、URL 和版本号。
    ```


  * `.idea` 文件夹通常是 JetBrains 的集成开发环境（IDE）如 IntelliJ IDEA 或 Android Studio 在项目中生成的隐藏文件夹。这个文件夹中包含了与项目相关的配置文件、工程文件、模板文件等，**用于配置项目在 IDE 中的行为和外观**。

    在一个 Flutter 或 Dart 项目中，`.idea` 文件夹可能包含以下一些常见的文件和文件夹：

    * **workspace.xml**：保存了项目级别的工作区配置，比如编辑器的布局、窗口状态等。
    * **modules.xml**：包含了项目的模块信息，如果项目被分割成了多个模块，每个模块的配置信息都会在这个文件中。
    * **dart.xml** 或 **flutter.xml**：这些文件包含了与 Dart 或 Flutter 相关的配置信息，比如代码格式化规则、代码模板、SDK 路径等。
    * **libraries** 文件夹：保存了项目中使用的库的配置信息，比如 Dart SDK、Flutter SDK、第三方库等。
    * **inspectionProfiles** 文件夹：包含了代码检查和静态分析的配置文件，用于定义代码风格和质量检查的规则。
    * 其他可能的配置文件和文件夹，比如代码模板、文件模板、版本控制配置等。

    总的来说，`.idea` 文件夹是 JetBrains IDE 用于存储项目配置和元数据的文件夹，它通常不应该被版本控制系统跟踪，因为这些配置文件通常是特定于开发者的，并且可能会因为 IDE 版本的不同而有所变化。