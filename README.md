# <font color=red>[Dart.**`Flutter`**](https://flutter.dev/?utm_source=google&utm_medium=cpc&utm_campaign=brand_sem&utm_content=apac_apac&gad_source=1&gad_campaignid=13034410756&gbraid=0AAAAAC-INI-9jKGdZCm6a9Zp2RvENOQVv&gclid=Cj0KCQjwj8jDBhD1ARIsACRV2TuPZFDZ2Py9BmKbsRj_mVS18Mf58tJhFzuzJIuxzTe316eALXjyW0AaAhelEALw_wcB&gclsrc=aw.ds)靶场🧪项目 </font><基础配置的说明>

<p align="left">
  <a><img src="https://img.shields.io/badge/flutter-3.22.1-blue" alt="Flutter"/></a>
  <a><img src="https://img.shields.io/badge/dart-3.3.4-orange" alt="Dart"/></a>
  <a><img src="https://img.shields.io/badge/platform-Android/iOS/web-critical" alt="Platforms"/></a>
  <a><img src="https://img.shields.io/github/actions/workflow/status/295060456/JobsFlutterBaseConfigDemo/ci.yml?branch=main" alt="Build Status"/></a>
  <a href="https://github.com/295060456/JobsFlutterBaseConfigDemo"><img src="https://img.shields.io/github/license/295060456/JobsFlutterBaseConfigDemo?style=flat&color=success" alt="License"/></a>
  <a><img src="https://img.shields.io/github/languages/top/295060456/JobsFlutterBaseConfigDemo?color=blueviolet" alt="Top Language"/></a>
  <a href="https://github.com/295060456/JobsFlutterBaseConfigDemo/stargazers"><img src="https://img.shields.io/github/stars/295060456/JobsFlutterBaseConfigDemo?style=flat-square&color=yellow" alt="Stars"/></a>
  <a href="https://github.com/295060456/JobsFlutterBaseConfigDemo/network"><img src="https://img.shields.io/github/forks/295060456/JobsFlutterBaseConfigDemo?style=flat-square&color=blue" alt="Forks"/></a>
  <a><img src="https://img.shields.io/github/issues/295060456/JobsFlutterBaseConfigDemo?color=important" alt="Issues"/></a>
  <a><img src="https://img.shields.io/github/last-commit/295060456/JobsFlutterBaseConfigDemo?color=ff69b4" alt="Last Commit"/></a>
  <a><img src="https://img.shields.io/github/languages/code-size/295060456/JobsFlutterBaseConfigDemo" alt="Code Size"/></a>
</p>

[toc]

当前总行数：

## 🔥<font id=前言>前言</font>

* **工欲善其事必先利其器**
* **站在巨人的肩膀上，才能看得更远**
* **面向信仰编程**

## 一、🎯目的和功效 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

* 品控标准（只能严格的保证编译器正常，而不能完全保证运行时的不出错）
  * 一定要保证这个工程的成功编译通过，方便以后项目直接进行引用，乃至开新版本
  * <font color=blue>**示例Demo可能因为相关Api的升级，没有及时的覆盖处理，可能会出现闪退。修复即可**</font>
* 自此以后，所有新开的项目都可以根据这个**根项目**来进行统一的调配和使用
  * 将它作为所有项目的母版和基类，最大限度的做到全局的统一
  * 日积月累的记录一些平时生产生活中萌发的一些优秀的想法、灵光一现的创意。包括但不仅限于：<u>语法糖的封装</u>、<u>方法的调用</u>，<u>第三方的选用</u>、以及一些心得体会
* 作为某些代码**实践靶场**，在实际开发过程中，是非常有必要的
  * 为我们快速且稳定的复现一些业务场景，作为代码实验室🧪，而搭建的一个平台
* 作为代码笔记，记录一些常用的代码，方便查阅
  * 主要形式是可以运行的代码 + 文字性叙述 + 图文混编讲解
  * 作为学习的资料，可以快速了解到一些常用的知识，大幅**降低学习成本**
  * 作为其他项目的参考，可以快速的了解到项目的架构，代码规范，以及一些设计模式
  * 这么一些优秀的成果，其来源不仅仅是来自于作者本身的持续付出与积累。更是这个领域大家庭中各路优秀作者的智慧结晶
* 独立的测试单元
  * 对于单个的**Flutter**工程文件（小Demo）可以利用[**运行脚本**](./【MacOS】☀️双击运行Flutter项目（iOS 模拟器）.command)，在MacOS的**终端**直接拖入进行运行和展示（终端运行不支持断点，只能输出日志）
  * 为了保证各个Demo在形式上的独立性，所以尽可能的在单个`.dart`文件里面进行叙述。**每一个Flutter的Demo文件里，都会存在其程序的入口函数**

## 二、💥代码讲解 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

### 1、🖨️打印方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 1.1、<a href="#极光原生推送" style="font-size:17px; color:green;"><b>极光原生推送</b></a>封装的全局打印（🧨强烈推荐）<a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 虽然这个方法原本是插件内部封装的，但它本质上是一个对 `print()` 的增强封装，用法通用、效果更强大。

```dart
FlutterPluginEngagelab.printMy(xxx);
```

| 优点                    | 说明                    |
| ----------------------- | ----------------------- |
| ✅ 统一管理日志输出      | 方便集中控制            |
| ✅ 可扩展（加颜色/时间） | 比原生 `print()` 更灵活 |
| ✅ 可加日志等级 / tag    | 比如 `[INFO]` `[ERROR]` |
| ✅ 可屏蔽 Release 输出   | 保证线上不暴露调试信息  |
| ✅ 日志更美观 / 可写文件 | 后期接入文件记录也方便  |

#### 1.2、`debugPrint` <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

```dart
debugPrint("XXX");
```

#### 1.3、`JobsPrint` <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 1️⃣ 日志打印输出文件和行
>
> 2️⃣ 如果要打印类的实例，需要在类中添加 Map<String, dynamic> toJson() 方法

```dart
import 'package:flutter_plugin_engagelab/flutter_plugin_engagelab.dart';

void JobsPrint(Object? message) {
  /// 获取当前调用栈，目的是找到谁调用了这个日志函数。
  final StackTrace stackTrace = StackTrace.current;
  /// 把堆栈信息按行切割为数组。每一行大概表示一个方法的调用栈帧。
  final List<String> stackTraceLines = stackTrace.toString().split('\n');
  /// 取第2行（stackTraceLines[1]）：因为第1行是当前函数本身的调用，第2行才是调用 JobsPrint() 的地方。
  /// 然后传给 _formatStackTraceLine() 方法提取出文件和行号信息。
  final String logLine = stackTraceLines.length > 1
      ? _formatStackTraceLine(stackTraceLines[1])
      : 'Unknown location';
  FlutterPluginEngagelab.printMy('[$logLine] ${_messageToString(message)}');
}
```

### 2、`SystemChrome`常用于设置<u>**状态栏和系统底部导航栏样式**</u>的配置 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

<font color=red>**尤其在 APP 启动时、页面初始化时非常常见**</font>

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

###  3、配置首页入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 3.1、配置项目入口

```dart
Future<void> main() async{return runApp(XXX)};
void main() => runApp(XXX);
```

* **`MaterialApp`**

  ```dart
  import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsMaterialRunner.dart';// 公共测试器路径
  void main() => runApp(const JobsMaterialRunner(CustomOverlayDemo(),title:'XXX'));
  /// 或者
  void main() {
    runApp(JobsMaterialRunner.builder(
      title: 'Flutter Bloc Demo',
      builder: (ctx) {
        return BlocProvider(
          create: (_) => CounterBloc(),
          child: const CounterPage(),
        );
      },
    ));
  }
  ```

* **`CupertinoApp`**

  ```dart
  import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsCupertinoRunner.dart';// 公共测试器路径
  void main() => runApp(const JobsCupertinoRunner(CustomOverlayDemo(),title:'XXX'));
  /// 或者
  void main() {
    runApp(JobsCupertinoRunner.builder(
      title: 'Flutter Bloc Demo',
      builder: (ctx) {
        return BlocProvider(
          create: (_) => CounterBloc(),
          child: const CounterPage(),
        );
      },
    ));
  }
  ```

* **`GetMaterialApp`**

  ```dart
  import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsGetXRunner.dart';// 公共测试器路径
  void main() =>
      runApp(JobsGetRunner(const PageB(), navigatorObservers:[routeObserver],title: '路由变化的监听测试'));
  /// 或者
  void main() {
    runApp(JobsGetRunner.builder(
      title: 'Obx 测试',
      builder: (ctx) => Center(
        child: Obx(() => Text('当前值：${controller.count}')),
      ),
    ));
  }
  ```

#### 3.2、配置首页入口

```dart
GetMaterialApp(
  initialRoute: AppPages.INITIAL,      // 从哪个页面开始
  initialBinding: MainBindings(),      // 启动前先注入哪些依赖
  getPages: AppPages.routes,           // 有哪些页面能被跳转
)
```

```dart
MaterialApp(
  home: Builder(
    builder: (ctx) => Scaffold(
      appBar: AppBar(
        title:
            Text(title ?? (child?.runtimeType.toString() ?? 'Builder')),
      ),
      body: Center(
        child: builder != null
            ? builder!(ctx)
            : child ?? Text('请传入 child 或 builder'.tr),
      ),
    ),
  ),
)
```

```dart
CupertinoApp(
  home: Builder(
    builder: (ctx) => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle:
            Text(title ?? (child?.runtimeType.toString() ?? 'Builder')),
      ),
      child: SafeArea(
        child: child ?? Text('请传入 child 或 builder'.tr),
      ),
    ),
  ),
)
```

### 4、<font color=red>**Flutter 项目中比较标准且完整的启动流程**</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 1️⃣ `SystemChrome` 限制方向
>
> 2️⃣ `WakelockPlus` 保持屏幕常亮
>
> 3️⃣ `GetX` 依赖注入、路由
>
> 4️⃣ `SpUtil` 读取缓存
>
> 5️⃣ `ScreenUtil` 适配设计图尺寸
>
> 6️⃣ `EasyLoading` 全局 loading 提示
>
> 7️⃣ 多语言支持
>
> 8️⃣ 自定义生命周期监听

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

### 5、[**`GetX`**](https://pub.dev/packages/get) <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 5.1、[**`GetX`**](https://pub.dev/packages/get) （六种）依赖注册方式对比表 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 在不设置 `permanent: true` 的默认情况下，**Get.put()**、**Get.lazyPut()**、**Get.create()** 所创建的对象，**生命周期都不会永久保留**，用完就“没了”或“会被释放”，只不过：
>
> - `put`/`lazyPut` 是**缓存后可能释放**；
> - `create` 是**压根就不缓存**，用一次 <font color=green>**new**</font> 一次。

|       特性       | <font color=red>`Get.put()`</font>                           | <font color=red>`Get.putAsync()`</font>            | <font color=red>`Get.lazyPut()`</font>            | <font color=red>`Get.create()`</font>      | `Get.putNamed()`                | `Get.replace()`                                              |
| :--------------: | :----------------------------------------------------------- | -------------------------------------------------- | ------------------------------------------------- | ------------------------------------------ | :------------------------------ | ------------------------------------------------------------ |
|     具体含义     | 👉 注册**同步对象**到 [**`GetX`**](https://pub.dev/packages/get)  容器 | 👉 注册**异步对象**，等待 Future 完成               | 👉 注册**懒加载对象**，首次使用时才创建            | 👉 注册**非单例对象**，每次 `find()` 都新建 | 👉 注册**同类型对象（带 tag）**  | 👉 替换已注册对象，用于热更新或环境切换                       |
|     是否异步     | ❌ 否                                                         | ✅ 是                                               | ❌ 否                                              | ❌ 否                                       | ❌ 否                            | ❌ 否                                                         |
|   对象创建时机   | ✅ 立即实例化                                                 | ⏳ 等待异步初始化完成                               | ⏱ 首次使用时实例化                                | 每次 `find()` 都创建新实例                 | ✅ 立即实例化                    | ✅ 立即实例化                                                 |
| 是否需要 `await` | ❌ 不需要                                                     | ✅ 需要 `await`                                     | ❌ 不需要                                          | ❌ 不需要                                   | ❌ 不需要                        | ❌ 不需要                                                     |
| 对象是否立即可用 | ✅ 是                                                         | ❌ 初始化前不可用                                   | ❌ 首次调用前不可用                                | ❌ 每次使用都需重新创建                     | ✅ 是                            | ✅ 是                                                         |
|     是否单例     | ✅ 是（全局唯一）                                             | ✅ 是（全局唯一）                                   | ✅ 是（全局唯一）                                  | ❌ 否，每次都创建                           | ✅ 是，但每个 `tag` 是独立的单例 | ✅ 是                                                         |
|   是否自动保活   | ❌ 默认不保活<br/>**除非手动设置`permanent: true`**           | ❌ 默认不保活<br/>**除非手动设置`permanent: true`** | ❌ 默认不保活<br>**除非手动设置`permanent: true`** | ❌ 不适用（不会缓存）                       | ❌ 默认不保活，需手动设置        | ✅ 会立即替换旧对象                                           |
|      常用于      | 页面 Controller、同步服务等                                  | 启动阶段异步服务（如缓存、数据库）                 | 页面懒加载逻辑、节省资源                          | 弹窗、表单、临时控制器                     | 同类型多实例（如用户 A/B）      | 切换环境、热更新、动态测试                                   |
|   使用位置推荐   | 页面加载/依赖注入阶段                                        | `main()` 启动阶段                                  | 页面逻辑中延迟使用                                | 动态组件、短生命周期逻辑                   | 注册同类对象到多个位置          | 测试或替换已有逻辑<br>⚠️ **使用前必须已经注册了一个旧对象**。 |

* **Get.put()**

  ```dart
  /// 定义 Controller
  import 'package:get/get.dart';

  class CounterController extends GetxController {
    var count = 0.obs;
    void increment() {
      count++;
    }
  }
  ```

  ```dart
  /// 注册 Controller（通常在页面或入口）
  void main() {
    Get.put(CounterController()); // 👈 注册为全局单例
    runApp(MyApp());
  }
  ```

  ```dart
  /// 使用 Controller（在页面中）
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetMaterialApp(
        home: CounterPage(),
      );
    }
  }

  class CounterPage extends StatelessWidget {
    late final CounterController homeController;
    if (Get.isRegistered<CounterController>()) {
      homeController = Get.find<CounterController>();// 👈 获取已注册的 Controller
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Get.put() 示例')),
        body: Center(
          child: Obx(() => Text('点击次数: ${controller.count}',
              style: TextStyle(fontSize: 24))),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.increment,
          child: Icon(Icons.add),
        ),
      );
    }
  }
  ```

* **Get.putAsync()**

  ```dart
  /// 定义一个异步初始化的 Service
  import 'package:get/get.dart';

  class AuthService extends GetxService {
    late String token;

    Future<AuthService> init() async {
      await Future.delayed(Duration(seconds: 2)); // 模拟异步操作
      token = 'abc123_from_local_storage';
      return this;
    }

    String getToken() => token;
  }
  ```

  ```dart
  /// 在 main() 中注册服务（异步）
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Get.putAsync<AuthService>(() => AuthService().init()); // 👈 异步注册服务
    runApp(MyApp());
  }
  ```

  ```dart
  /// 在页面中使用该服务
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';

  class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return GetMaterialApp(
        home: AuthPage(),
      );
    }
  }

  class AuthPage extends StatelessWidget {
    late final authService;
    if (Get.isRegistered<AuthService>()) {
      authService = Get.find<AuthService>();// 👈 获取异步注册后的服务
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('Get.putAsync() 示例')),
        body: Center(
          child: Text('Token: ${authService.getToken()}',
              style: TextStyle(fontSize: 18)),
        ),
      );
    }
  }
  ```

* **Get.lazyPut()** <font color=red>**不返回实例**</font>

  当第一次使用时，再去创建它的实例（懒加载）

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
  late final manager;
  if (Get.isRegistered<HomeRequestManager>()) {
  	manager = Get.find<HomeRequestManager>();
  }
  ```

* **Get.create()**

* **Get.putNamed()**

* **Get.replace()**

#### 5.2、[**`GetX`**](https://pub.dev/packages/get) 的销毁机制 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 1️⃣ [**`GetX`**](https://pub.dev/packages/get)  中的依赖对象如果不是 `permanent: true`，默认在无人使用时可以被释放（或你手动释放）。
>
> 2️⃣ 即便是`permanent: true`也可以手动进行释放
>
> 3️⃣ **手动销毁用 `Get.delete<T>()` 或 `Get.deleteAll()`**。

| 方法                       | 说明                                                         |
| -------------------------- | ------------------------------------------------------------ |
| `Get.delete<T>()`          | 手动销毁某个类型的依赖，如 `Get.delete<HomeController>()`    |
| `Get.delete<T>(tag: 'xx')` | 销毁带有特定 `tag` 的对象                                    |
| `Get.deleteAll()`          | 销毁所有注册的依赖（慎用！）                                 |
| `Get.reload<T>()`          | 先删除再重新创建依赖（自动调用 `Get.create()` 或 `Get.lazyPut()`） |
| `Get.reset()`              | 重置整个依赖管理系统（清空所有 Controller、Service、路由信息等） |
| `Get.resetLazy<T>()`       | 重置指定类型的懒加载依赖（配合 `lazyPut`）                   |

#### 5.3、**`GetxController`** 🆚 **`GetView<T>`** <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

| 项目                | `GetxController`                  | `GetView<T>`                                 |
| ------------------- | --------------------------------- | -------------------------------------------- |
| 作用                | 管理业务逻辑 & 状态               | 展示视图 + 自动注入 controller               |
| 用于                | 编写逻辑类                        | 编写页面（StatelessWidget）                  |
| 是否包含 UI         | ❌ 纯逻辑类                        | ✅ 包含 UI                                    |
| 是否需要注册        | ✅ 需要手动注册 `Get.put()` 或绑定 | ✅ controller 需先注册，才能被 `GetView` 使用 |
| controller 获取方式 | 自己写 `Get.find<>()` 获取        | 自动通过 `controller` 变量提供               |

* `GetxController` 是一个继承自 `Controller` 的类，用于管理你的页面状态和业务逻辑。

* `GetView<T>` 是一个泛型 Widget，**用于自动注入并访问一个已注册的 `GetxController`**，无需手动 `Get.find<T>()`。

  > 1️⃣ 简化视图中的 controller 获取
  >
  > 2️⃣ 避免重复写 `final controller = Get.find<XXX>()`
  >
  > 3️⃣ 适用于 `StatelessWidget`

  ```dart
  class CounterPage extends GetView<CounterController> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('GetView 示例')),
        body: Center(
          child: Obx(() => Text('点击次数: ${controller.count}')),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.increment,
          child: Icon(Icons.add),
        ),
      );
    }
  }
  /// 两种写法完全等价
  class CounterPage extends StatelessWidget {
    late final CounterController controller;
    if (Get.isRegistered<CounterController>()) {
      controller = Get.find<CounterController>();// 👈 手动获取
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text('StatelessWidget 示例')),
        body: Center(
          child: Obx(() => Text('点击次数: ${controller.count}')),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: controller.increment,
          child: Icon(Icons.add),
        ),
      );
    }
  }
  ```

#### 5.4、**`GetxService`** <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> `GetxService` 是 [**`GetX`**](https://pub.dev/packages/get)  提供的**专门用于全局单例管理的服务类**，适合放一些只需要创建一次，整个 App 生命周期中都不释放的“后台服务”

| 特性             | GetxController           | GetxService                    |
| ---------------- | ------------------------ | ------------------------------ |
| 生命周期         | 跟随页面，可销毁重建     | 默认常驻内存，不会自动释放     |
| 创建方式         | 通常用于 UI 控制器       | 通常用于后台服务、工具类       |
| 是否推荐全局单例 | ❌ 不推荐（容易内存泄漏） | ✅ 推荐用于全局注册一次即可     |
| 示例用途         | 页面状态管理、交互逻辑等 | 网络服务、缓存服务、配置服务等 |

* 定义

  ```dart
  class AuthService extends GetxService {
    String? token;

    Future<AuthService> init() async {
      // 初始化，例如从本地缓存读取 token
      token = await getSavedToken();
      return this;
    }

    Future<String?> getSavedToken() async {
      await Future.delayed(Duration(milliseconds: 300));
      return 'abc123';
    }
  }
  ```

* 注册服务KKK

  ```dart
  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Get.putAsync<AuthService>(() => AuthService().init());
    runApp(MyApp());
  }
  ```

* 使用

  ```dart
  late final AuthService authService;
  if (Get.isRegistered<AuthService>()) {
    authService = Get.find<AuthService>();
  }
  print(authService.token);
  ```

#### 5.5、<font id=GetPage>**`GetPage()`**</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a> 

> 1️⃣ 用于在 `GetMaterialApp` 中注册页面，它包含了页面路径、页面构造函数、绑定依赖、转场动画等信息。
>
> 2️⃣ 是专为 `GetMaterialApp.getPages` 服务

```dart
GetPage(
  name: '/home',                                   // 路由路径
  page: () => HomeView(),                          // 页面构造函数
  binding: HomeBinding(),                          // 单个依赖绑定
  bindings: [                                      // 可选：多个依赖绑定
    HomeBinding(),
    OtherBinding(),
  ],
  transition: Transition.fadeIn,                   // 页面跳转动画
  transitionDuration: Duration(milliseconds: 300), // 动画持续时间
  curve: Curves.easeInOut,                         // 动画曲线
  fullscreenDialog: false,                         // 是否为全屏对话框（iOS push 模态页）
  middlewares: [AuthMiddleware()],                 // 中间件：如登录校验、权限拦截
  popGesture: true,                                // 是否允许 iOS 侧滑返回
  preventDuplicates: true,                         // 防止重复跳转（如果当前页面就是这个）
  participatesInRootNavigator: true,               // 嵌套路由是否使用主导航器
  opaque: true,                                    // 是否覆盖下层页面（false 可透视）
  showCupertinoParallax: true,                     // iOS 动画是否使用弹性滑动效果
  children: [                                      // 嵌套路由（可选）
    GetPage(
      name: '/home/detail',
      page: () => DetailView(),
    )
  ],
)
```

#### 5.6、🧭[**`GetX`**](https://pub.dev/packages/get) 路由 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

>  [**`GetX`**](https://pub.dev/packages/get)  的路由系统是一套集命名路由、依赖注入、中间件、动画于一体的强大路由管理机制，推荐用 `GetPage` + 命名跳转方式为主线结构！

| 项目               | Flutter 原生导航      | GetX 路由系统                     |
| ------------------ | --------------------- | --------------------------------- |
| 跳转方式           | `Navigator.push(...)` | `Get.to(...)`、`Get.toNamed(...)` |
| 是否需要 context   | ✅ 必须                | ❌ 不需要                          |
| 命名路由           | ✅ 支持                | ✅ 支持，更强大                    |
| 是否支持依赖注入   | ❌ 不支持              | ✅ 支持 binding                    |
| 是否支持中间件拦截 | ❌ 不支持              | ✅ 支持                            |
| 转场动画           | 复杂                  | 简单（内建 `Transition` 枚举）    |
| 嵌套路由 / 子路由  | 较复杂                | ✅ 支持 children 嵌套路由          |

##### 5.6.1、[**`GetX`**](https://pub.dev/packages/get) 免路由管理页面（直接跳 **`Widget`**）

  > ✅ 优点：不用提前注册页面
  > ❌ 缺点：不支持 **binding**、动画、中间件

  ```dart
  Get.to(ProfileView());        // 正常跳转
  Get.to(() => const PageB());  // 👈 免路由表跳转
  ```

| 写法                           | 含义                                                         | 是否推荐                                 |
| ------------------------------ | ------------------------------------------------------------ | ---------------------------------------- |
| `Get.to(const PageB());`       | **立即创建页面实例**，然后传给 `Get.to()`                    | ✅ 推荐，仅当不关心惰性加载时             |
| `Get.to(() => const PageB());` | **传入一个构造函数（函数体）,[`GetX`](https://pub.dev/packages/get)  会延迟调用** | ✅ 更推荐，尤其在复杂路由或需要懒加载场景 |

```dart
class PageB extends StatelessWidget {
  const PageB({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, /// ✅ 内容居中紧凑排列
        children: [
          Text('当前页面：Page B'.tr, style: normalTextStyle(fontSize: 24)),
          const SizedBox(height: 20), /// ✅ 间距
          ElevatedButton(
            onPressed: () {
              Get.to(() => const PageC()); /// 👈 免路由表跳转
            },
            child: Text('Go to Page C'.tr),
          ),
        ],
      ),
    );
  }
}

TextStyle normalTextStyle({
  double fontSize = 16,
  Color color = Colors.yellow,
  FontWeight fontWeight = FontWeight.normal,
}) =>
    TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      decoration: TextDecoration.none,
    );
```

```dart
Get.off(SettingsView());      // 替换当前页
Get.offAll(LoginView());      // 清空栈后跳转
```

##### 5.6.2、命名路由（推荐方式）

> 需要配合<a href="#GetPage" style="font-size:17px; color:green;"><b>GetPage()</b></a> 注册 

```dart
Get.toNamed('/home');
Get.offNamed('/login');
Get.offAllNamed('/splash');
```

* 路由表

  ```dart
  // app/routes/app_routes.dart
  abstract class AppRoutes {
    static const home = '/home';
    static const login = '/login';
  }

  // app/routes/app_pages.dart
  class AppPages {
    static final routes = [
      GetPage(
        name: AppRoutes.home,
        page: () => HomeView(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: AppRoutes.login,
        page: () => LoginView(),
      ),
    ];
  }

  // main.dart
  GetMaterialApp(
    initialRoute: AppRoutes.home,
    getPages: AppPages.routes,
  );

  // 页面跳转
  Get.toNamed(AppRoutes.login); // ✅ 命名跳转
  ```

* 路由守卫：跳转时进行验权

  ```dart
  /// ✅ 登录了，就跳转成功到首页；
  /// ❌ 未登录，就被拦截并跳转到登陆；
  if (!LoginManager.isLogin) {
    Get.offAllNamed('/login');
  } else {
    Get.toNamed('/home');
  }
  ```

  等价于

  ```dart
  /// 创建一个中间件类：
  class AuthMiddleware extends GetMiddleware {
    @override
    RouteSettings? redirect(String? route) {
      if (!LoginManager.isLogin) {
        return const RouteSettings(name: '/login');
      }
      return null; // ✅ 允许跳转
    }
  }
  ```

  ```dart
  /// 加到路由中：
  GetPage(
    name: '/home',
    page: () => HomeView(),
    binding: HomeBinding(),
    middlewares: [AuthMiddleware()],
  )
  ```

  ```dart
  Get.toNamed('/home');
  ```


#### 5.7、**`Get.dialog()`** <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> `Get.dialog()` 默认用当前上下文找 Navigator

[**`GetX`**](https://pub.dev/packages/get) 框架提供的弹窗方法

| 参数名               | 类型       | 说明                                           |
| -------------------- | ---------- | ---------------------------------------------- |
| `barrierDismissible` | `bool`     | 是否点击背景关闭弹窗，默认 `true`              |
| `useSafeArea`        | `bool`     | 是否使用 SafeArea，默认 `true`                 |
| `name`               | `String?`  | 给弹窗设置一个路由名（可选）                   |
| `transitionDuration` | `Duration` | 动画持续时间，默认 200ms                       |
| `transitionCurve`    | `Curve`    | 动画曲线，如 `Curves.easeInOut`                |
| `opaque`             | `bool`     | 是否完全遮挡，默认 `false`                     |
| `barrierColor`       | `Color`    | 背景颜色，默认 `Colors.black.withOpacity(0.5)` |

```dart
ElevatedButton(
  onPressed: () async {
    final result = await Get.dialog<String>(
      _CustomDialogContent(),

      barrierDismissible: true, // ✅ 点击弹窗外区域是否关闭弹窗（true = 可关闭）
      barrierColor: Colors.black.withOpacity(0.5), // ✅ 弹窗背景遮罩颜色（通常为半透明黑色）
      useSafeArea: true, // ✅ 是否自动避开状态栏/刘海/底部安全区（默认 true）

      navigatorKey: Get.key, // ✅ 指定使用哪个 Navigator（默认用 Get.key 就行）
      arguments: {'from': '按钮点击'}, // ✅ 向弹窗内部传递参数（可通过 Get.arguments 获取）

      transitionDuration: Duration(milliseconds: 400), // ✅ 动画持续时间（默认 200ms）
      transitionCurve: Curves.easeInOutBack, // ✅ 动画曲线（决定进出弹窗的运动方式）

      name: '/custom-dialog', // ✅ 路由名称（可选，方便调试或拦截路由）
      routeSettings: RouteSettings(name: '/custom-dialog-settings'), // ✅ 更完整的路由配置（配合导航系统）
    );

    if (result != null) {
      Get.snackbar('返回结果', '你选择了: $result'); // ✅ 弹窗关闭后获取返回值
    }
  },
  child: Text('打开自定义弹窗'),
)
```

#### 5.8、**`Get.key` **<a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> **`Get.key` 就是给全局 Navigator 打了个 tag（标签）**，即：**全局 Navigator Key**。[**`GetX`**](https://pub.dev/packages/get)  把它注册到自己的容器里，之后你所有（push、pop、dialog 等）相关操作都可以**不需要 context，直接通过这个 tag 找到并调用 Navigator 的功能。**（<font color=red>类似于iOS的**通知机制**</font>）

| 传统 Flutter              | [**`GetX`**](https://pub.dev/packages/get)                   |
| ------------------------- | ------------------------------------------------------------ |
| Navigator.of(context)     | Get.key.currentState                                         |
| 弹窗必须要 context        | `Get.dialog()` 无需 context                                  |
| 每个页面要传 BuildContext | [**`GetX`**](https://pub.dev/packages/get)  容器中全局持有导航器 |
| UI 和状态管理耦合严重     | UI/逻辑可分离，Controller 也能导航                           |

✅ 场景：从非 UI 层（比如 Service/Controller）弹出一个 Dialog，而不依赖 `BuildContext`

```dart
void main() {
  runApp(GetMaterialApp(
    navigatorKey: Get.key, // ✅ 注册全局导航器 必须初始化时配置一次
    home: MyHomePage(),
  ));
}

class AuthService {
  void checkLoginAndShowDialog() {
    /// ✅ 不依赖 context 就能显示 UI
    Get.dialog(
      AlertDialog(
        title: Text('未登录'),
        content: Text('请先登录才能继续操作'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('取消'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.toNamed('/login'); // 可以继续跳转
            },
            child: Text('去登录'),
          ),
        ],
      ),
      navigatorKey: Get.key, // ✅ 关键点：指向全局 Navigator（此例里面可以不写）
      barrierDismissible: false,
    );
  }
}

ElevatedButton(
  onPressed: () {
    AuthService().checkLoginAndShowDialog(); // ✅ 不用 context，也能弹窗
  },
  child: Text('执行需要登录的操作'),
)
```

* ✅ 那什么时候 **必须写 `navigatorKey: Get.key`**？

  * ❗ 场景1：页面还没加载完成（比如在 `initState` 或 `GetxController.onInit()` 里直接弹）

    ```dart
    @override
    void initState() {
      super.initState();
      Future.delayed(Duration.zero, () {
        Get.dialog(AlertDialog(...)); // ❌ 可能找不到 Navigator.currentContext
      });
    }
    ```

  * ❗ 场景2：用了嵌套的<a href="#Shell页面" style="font-size:17px; color:green;"><b> Shell页面</b></a> / 子<a href="#Navigator" style="font-size:17px; color:green;"><b> `Navigator`</b></a>   （如 `BottomNavigationBar` + `Tab`）

    ```dart
    Scaffold(
      body: Navigator( // 👈 嵌套 navigator，Get.dialog 找不到上层 Navigator
        key: shellKey,
        ...
      ),
    );
    ```

> 🧠 **`navigatorKey: Get.key` 是保险机制：**
>  当你在 UI 按钮中弹窗，不写也可以；
>  但如果你在“非 UI 上下文”或“嵌套导航结构”中调用弹窗，**就必须显式指定 `navigatorKey` 来避免找不到 Navigator 的错误。**
>
> **完全可以养成习惯：**
>  👉 **任何时候用 `Get.dialog()`，都写上 `navigatorKey: Get.key`**，
>  ✅ 兼容所有场景、生命周期、嵌套结构，绝对不翻车。

#### 5.9、[**`GetX`**](https://pub.dev/packages/get) 多语言化  <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 如果找不到对应 key，会 **原样返回原始字符串**（即 `"等待状态变化"`），不会报错或崩溃。

```dart
String status = "等待状态变化".tr;
```

#### 5.10、关于[**`GetX`**](https://pub.dev/packages/get) 的二次（语法糖🍬）封装

```dart
import 'package:get/get.dart';

/// 自动注册或获取 Controller（立即创建并返回）
/// 用法：
///   final c = getOrPut(() => MyController());
T getOrPut<T extends GetxController>(
  T Function() creator, {
  bool permanent = false,
}) {
  if (Get.isRegistered<T>()) {
    return Get.find<T>();
  } else {
    return Get.put<T>(creator(), permanent: permanent);
  }
}

/// 自动懒加载注册或获取 Controller（第一次用时才创建）
/// 用法：
///   final c = getOrLazyPut(() => MyController(), fenix: true);
T getOrLazyPut<T extends GetxController>(
  T Function() creator, {
  bool fenix = false,
}) {
  if (Get.isRegistered<T>()) {
    return Get.find<T>();
  } else {
    Get.lazyPut<T>(creator, fenix: fenix);
    return Get.find<T>();
  }
}
```

```dart
late final MyTabCtrl tabController = getOrPut(() => MyTabCtrl());
```

#### 5.11、基于[**`GetX`**](https://pub.dev/packages/get) 最佳实践的完整项目结构模板（项目名为：`getx_demo`） <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

```bash
lib/
├── app/
│   ├── modules/
│   │   ├── home/
│   │   │   ├── bindings/          # 页面绑定
│   │   │   │   └── home_binding.dart
│   │   │   ├── controllers/       # 控制器
│   │   │   │   └── home_controller.dart
│   │   │   ├── views/             # 页面视图
│   │   │   │   └── home_view.dart
│   ├── routes/
│   │   ├── app_pages.dart         # 页面路由总表
│   │   └── app_routes.dart        # 路由名常量
├── main.dart
```

```dart
/// home_controller.dart
import 'package:get/get.dart';

class HomeController extends GetxController {
  var count = 0.obs;
  void increment() {
    count++;
  }
}
```

```dart
/// home_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Obx(() => Text("点击次数: ${controller.count}",
            style: TextStyle(fontSize: 24))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

```dart
/// home_binding.dart
import 'package:get/get.dart';
import 'package:getx_demo/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
```

```dart
/// app_routes.dart
abstract class AppRoutes {
  static const HOME = '/home';
}
```

```dart
/// app_pages.dart
import 'package:get/get.dart';
import 'package:getx_demo/app/modules/home/bindings/home_binding.dart';
import 'package:getx_demo/app/modules/home/views/home_view.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.HOME;

  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
```

```dart
/// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
```

### 6、`WidgetsFlutterBinding`确保 Flutter 框架与底层平台（如 MethodChannel、插件）之间的桥梁已完成初始化 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

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

### 7、`DartPingIOS`在 iOS 上启用 native 层实现的 ping 功能 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

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
      dart_ping: any
    # iOS 需要单独引入
    dart_ping_ios: any
    ```

### 8、利用**`SharedPreferences`**对数据进行存取 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 1️⃣ 封装原生 `SharedPreferences` 支持的所有类型
>
> 2️⃣ 额外支持了自定义对象（Bean）的存取
>
> 💥 Flutter.**`SharedPreferences`** == OC.**`NSUserDefaults`** == Swift.**`UserDefaults`**

```dart
/// SpUtil.dart
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

### 9、Flutter标准<a href="#模态" style="color:green; font-size:25px;"><b>模态</b></a>弹窗组件（SDK自带的）<a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

Flutter SDK（系统自带）的模态弹窗汇总表（截至 2025）

| 名称                        | 类型 | 用途说明                           | 所属库                           |
| --------------------------- | ---- | ---------------------------------- | -------------------------------- |
| `AlertDialog`               | 组件 | 标准提示对话框                     | `package:flutter/material.dart`  |
| `SimpleDialog`              | 组件 | 简单选项对话框                     | `package:flutter/material.dart`  |
| `Dialog`                    | 组件 | 可自定义内容                       | `package:flutter/material.dart`  |
| `showDialog()`              | 方法 | 通用弹窗封装                       | `package:flutter/material.dart`  |
| `showGeneralDialog()`       | 方法 | 自定义内容和动画的底层弹窗方法     | `package:flutter/material.dart`  |
| `showModalBottomSheet()`    | 方法 | 弹出底部模态弹窗                   | `package:flutter/material.dart`  |
| `showDatePicker()`          | 方法 | 弹出日期选择器                     | `package:flutter/material.dart`  |
| `showTimePicker()`          | 方法 | 弹出时间选择器                     | `package:flutter/material.dart`  |
| `showSearch()`              | 方法 | 弹出搜索页（全屏弹窗）             | `package:flutter/material.dart`  |
| `showAboutDialog()`         | 方法 | 显示应用信息弹窗                   | `package:flutter/material.dart`  |
| `showLicensePage()`         | 方法 | 显示 License 页面                  | `package:flutter/material.dart`  |
| `LicensePage`               | 组件 | License 页面容器                   | `package:flutter/material.dart`  |
| `showCupertinoDialog()`     | 方法 | 弹出 iOS 风格弹窗                  | `package:flutter/cupertino.dart` |
| `CupertinoAlertDialog`      | 组件 | iOS 风格对话框组件                 | `package:flutter/cupertino.dart` |
| `showCupertinoModalPopup()` | 方法 | 弹出 iOS 风格底部弹窗              | `package:flutter/cupertino.dart` |
| `CupertinoActionSheet`      | 组件 | iOS 风格底部弹窗内容               | `package:flutter/cupertino.dart` |
| `CupertinoPopupSurface`     | 组件 | 弹窗表面组件（用于自定义弹窗外观） | `package:flutter/cupertino.dart` |


* `AlertDialog`（最常用）

  ```dart
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('提示'),
        content: Text('你确定要删除吗？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('取消'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('确定'),
          ),
        ],
      );
    },
  );
  ```

* `SimpleDialog`

  ```dart
  /// 适合展示多个选项
  showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Text('请选择'),
        children: [
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'A'),
            child: Text('选项A'),
          ),
          SimpleDialogOption(
            onPressed: () => Navigator.pop(context, 'B'),
            child: Text('选项B'),
          ),
        ],
      );
    },
  );
  ```

* `Dialog`

  ```dart
  /// 一个基础的对话框容器，通常用于自定义弹窗
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('自定义内容'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('关闭'),
              ),
            ],
          ),
        ),
      );
    },
  );
  ```

* `showDialog`

  ```dart
  /// 异步等待用户返回结果
  bool? confirmed = await showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('确认'),
        content: Text('是否保存？'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text('取消')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text('确定')),
        ],
      );
    },
  );
  if (confirmed == true) {
    // 用户点击了确定
  }
  ```

* `showGeneralDialog`

  ```dart
  /// 完全自定义弹窗 + 动画
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '弹窗',
    barrierColor: Colors.black54,
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) {
      return Center(
        child: Container(
          width: 250,
          height: 150,
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: Text('自定义弹窗内容'),
        ),
      );
    },
    transitionBuilder: (_, animation, __, child) {
      return ScaleTransition(
        scale: animation,
        child: child,
      );
    },
  );
  ```

  ...demo未完待补充


### 10、[**EasyLoading**](https://pub.dev/documentation/flutter_easyloading/latest/) <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

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

### 11、<font id=极光原生推送>[**极光原生推送**](https://www.engagelab.com/zh_CN)</font>：[FlutterPluginEngagelab](https://pub.dev/packages/flutter_plugin_engagelab) <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 来自于：`package:flutter_plugin_engagelab/flutter_plugin_engagelab.dart`
>
> 1️⃣ iOS / Android 推送消息接收与处理
>
> 2️⃣ 获取设备注册 ID
>
> 3️⃣ 设置角标
>
> 4️⃣ 推送事件回调
>
> 5️⃣ 设置调试模式等...

| 方法                                      | 说明                                           |
| ----------------------------------------- | ---------------------------------------------- |
| `addEventHandler({ onMTCommonReceiver })` | 注册原生端发来的事件处理回调                   |
| `getRegistrationId()`                     | 获取当前设备的 Registration ID（推送唯一标识） |
| `initIos({appKey, channel})`              | 初始化 iOS 推送 SDK                            |
| `initAndroid()`                           | 初始化 Android 推送 SDK                        |
| `setNotificationBadge(int count)`         | 设置通知角标数（如：0）                        |
| `resetNotificationBadge()`                | 重置角标                                       |
| `printMy(String msg)`                     | 用于 debug 打印（SDK 内封装）                  |
| `checkNotificationAuthorizationIos()`     | 检查 iOS 用户是否开启通知权限                  |
| `configDebugMode(bool)`                   | 设置是否开启调试模式                           |

```dart
/// pubspec.yaml
dependencies:
  flutter_plugin_engagelab: ^1.2.4
```

### 12、[**OpenInstall**](https://www.openinstallglobal.com/)：移动端的安装/拉新/渠道统计 SDK <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

```dart
Future<void> initOpeninstall() async {
  OpeninstallFlutterPlugin openinstallFlutterPlugin =
      OpeninstallFlutterPlugin();
  openinstallFlutterPlugin.setDebug(true);
  openinstallFlutterPlugin.init(wakeupHandler);
  // 错误：应该在业务需要时再调用 install 获取参数
  // openinstallFlutterPlugin.install(installHandler);
}

Future wakeupHandler(Map<String, Object> data) async {
  FlutterPluginEngagelab.printMy("wakeupHandler: $data");
}
```

* `install()` 是用于获取安装参数的，**只能调用一次且应当在需要时（如首次打开 APP 的时候）调用**。否则可能时机不对导致参数获取不到。

### 13、⏰获取当前时间 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

```dart
/// 调用输出（格式）：2025/07/13T14:38:45.123 PM
String getNowTime() {
  final time = DateTime.now();

  DateFormat formatter = DateFormat('yyyy/MM/ddTHH:mm:ss.SSS');
  String formattedDate = formatter.format(time);

  DateFormat amPmFormatter = DateFormat('a');
  String amPm = amPmFormatter.format(time);
  return '$formattedDate ${amPm == 'AM' ? 'AM' : 'PM'}';
}
```

* 📆 日期格式符（Date fields）

  | 格式符  | 含义             | 示例输出 | 说明                      |
  | ------- | ---------------- | -------- | ------------------------- |
  | `y`     | 年（1位或多位）  | `2025`   | 只写一个 `y` 会是简写年份 |
  | `yy`    | 年（两位）       | `25`     | 2025 → 25                 |
  | `yyyy`  | 年（四位）       | `2025`   | 常用                      |
  | `M`     | 月份（1–12）     | `7`      | 一位数无前导 0            |
  | `MM`    | 月份（两位）     | `07`     | 补足前导 0                |
  | `MMM`   | 月份缩写         | `Jul`    | 英文缩写                  |
  | `MMMM`  | 月份全称         | `July`   | 英文全称                  |
  | `MMMMM` | 月份首字母       | `J`      |                           |
  | `d`     | 日（1–31）       | `3`      |                           |
  | `dd`    | 日（两位）       | `03`     |                           |
  | `E`     | 星期缩写         | `Sun`    |                           |
  | `EEE`   | 星期缩写         | `Sun`    |                           |
  | `EEEE`  | 星期全称         | `Sunday` |                           |
  | `EEEEE` | 星期首字母       | `S`      |                           |
  | `c`     | 周中的天（数字） | `7`      | 通常周日为 7              |

* ⏰ 时间格式符（Time fields）

  | 格式符 | 含义                 | 示例输出     | 说明                     |
  | ------ | -------------------- | ------------ | ------------------------ |
  | `a`    | 上午/下午            | `AM` 或 `PM` | 可根据 locale 显示中文   |
  | `h`    | 12小时制小时（1–12） | `5`          | 无前导 0                 |
  | `hh`   | 12小时制小时（两位） | `05`         | 有前导 0                 |
  | `H`    | 24小时制小时（0–23） | `17`         | 无前导 0                 |
  | `HH`   | 24小时制小时（两位） | `17`         | 有前导 0                 |
  | `m`    | 分钟（0–59）         | `8`          |                          |
  | `mm`   | 分钟（两位）         | `08`         |                          |
  | `s`    | 秒（0–59）           | `3`          |                          |
  | `ss`   | 秒（两位）           | `03`         |                          |
  | `S`    | 毫秒（1 位）         | `4`          | 可能输出一位、两位或三位 |
  | `SSS`  | 毫秒（三位）         | `004`        | 推荐用                   |

* 🌍 时区（TimeZone）

  | 格式符 | 含义             | 示例输出              | 说明                   |
  | ------ | ---------------- | --------------------- | ---------------------- |
  | `z`    | 时区缩写         | `GMT+8`               | 不一定是标准时区名     |
  | `zzzz` | 时区全称         | `Greenwich Mean Time` | 部分 locale 才支持     |
  | `Z`    | RFC 822 时区格式 | `+0800`               | 通常用于 API、ISO 标准 |
  | `ZZZZ` | 时区全称 + 偏移  | `GMT+08:00`           | 比 `Z` 更人性化        |

* 🔣 其他符号用法

  | 符号       | 含义                     | 示例或说明                          |
  | ---------- | ------------------------ | ----------------------------------- |
  | `'...'`    | 字面量（原样输出）       | `'T'` → `T`                         |
  | `T`        | 字符 T（需要写成 `'T'`） | 常用于分隔日期与时间（如 ISO 格式） |
  | `G`        | 公元纪元（Era）          | `AD`、`BC`                          |
  | `Q`        | 季度（数字）             | `3`                                 |
  | `QQQ`      | 季度缩写                 | `Q3`                                |
  | `QQQQ`     | 季度全称                 | `3rd quarter`                       |
  | `w` / `ww` | 一年中的第几周           | `27`                                |
  | `D`        | 一年中的第几天           | `194`                               |
  | `k` / `kk` | 24小时制（1–24）         | `24`（不会是 0）                    |
  | `K` / `KK` | 12小时制（0–11）         | `0` 表示 12点                       |

### 14、 <font id=Navigator>✅Navigator</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 1️⃣ 在 Flutter 中，每一个 `Navigator` 都会有**自己的路由栈（Route Stack）**，并不是全局唯一的
>
> 2️⃣ 可以有多个 **Navigator**👇
>
> ```dart
> MaterialApp → Navigator A （根）
>           └── Scaffold → Navigator B （嵌套）
> ```
>
> 3️⃣ 默认调用 `Navigator.of(context)`，是**从当前 context 向上查找最近的 Navigator**，**而不是找最上层的**

#### 14.1、正向传参 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

* 构造函数传参（✅最推荐）

  ```dart
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondPage(name: 'Jobs')),
  );
  ```

  ```dart
  class SecondPage extends StatelessWidget {
    final String name;
    const SecondPage({super.key, required this.name});
  }
  ```

* 全局变量或状态管理器传参：（如使用 `Provider`、[**`GetX`**](https://pub.dev/packages/get) 、`Riverpod`、`Bloc` 等状态管理框架共享数据）

  *  [**`Provider`**](https://pub.dev/packages/provider)

    ```dart
    import 'package:flutter/material.dart';
    import 'package:provider/provider.dart';

    void main() {
      runApp(
        ChangeNotifierProvider(create: (_) => UserModel(), child: MyApp()),
      );
    }

    class UserModel extends ChangeNotifier {
      String name = '默认名';
      void updateName(String newName) {
        name = newName;
        notifyListeners();
      }
    }

    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) => MaterialApp(home: HomePage());
    }

    class HomePage extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        final user = Provider.of<UserModel>(context);
        return Scaffold(
          appBar: AppBar(title: Text('首页')),
          body: Center(
            child: ElevatedButton(
              child: Text('设置用户名并跳转'),
              onPressed: () {
                user.updateName('Provider 用户');
                Navigator.push(context, MaterialPageRoute(builder: (_) => SecondPage()));
              },
            ),
          ),
        );
      }
    }

    class SecondPage extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        final user = Provider.of<UserModel>(context);
        return Scaffold(
          appBar: AppBar(title: Text('第二页')),
          body: Center(child: Text('用户名：${user.name}')),
        );
      }
    }
    ```

  * [**`GetX`**](https://pub.dev/packages/get)

    ```dart
    import 'package:flutter/material.dart';
    import 'package:get/get.dart';

    void main() {
      runApp(GetMaterialApp(home: HomePage()));
    }

    class UserController extends GetxController {
      var name = '默认名'.obs;
    }

    class HomePage extends StatelessWidget {
      final UserController controller = Get.put(UserController());

      @override
      Widget build(BuildContext context) => Scaffold(
            appBar: AppBar(title: Text('首页')),
            body: Center(
              child: ElevatedButton(
                child: Text('设置用户名并跳转'),
                onPressed: () {
                  controller.name.value = 'GetX 用户';
                  Get.to(() => SecondPage());
                },
              ),
            ),
          );
    }

    class SecondPage extends StatelessWidget {
      final UserController controller = Get.find();
      @override
      Widget build(BuildContext context) => Scaffold(
            appBar: AppBar(title: Text('第二页')),
            body: Center(
              child: Obx(() => Text('用户名：${controller.name.value}')),
            ),
          );
    }
    ```

  * [**`Riverpod`**](https://pub.dev/packages/riverpod)

    ```dart
    import 'package:flutter/material.dart';
    import 'package:flutter_riverpod/flutter_riverpod.dart';

    final userProvider = StateProvider<String>((ref) => '默认名');

    void main() {
      runApp(ProviderScope(child: MyApp()));
    }

    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) => MaterialApp(home: HomePage());
    }

    class HomePage extends ConsumerWidget {
      @override
      Widget build(BuildContext context, WidgetRef ref) {
        return Scaffold(
          appBar: AppBar(title: Text('首页')),
          body: Center(
            child: ElevatedButton(
              child: Text('设置用户名并跳转'),
              onPressed: () {
                ref.read(userProvider.notifier).state = 'Riverpod 用户';
                Navigator.push(context, MaterialPageRoute(builder: (_) => SecondPage()));
              },
            ),
          ),
        );
      }
    }

    class SecondPage extends ConsumerWidget {
      @override
      Widget build(BuildContext context, WidgetRef ref) {
        final name = ref.watch(userProvider);
        return Scaffold(
          appBar: AppBar(title: Text('第二页')),
          body: Center(child: Text('用户名：$name')),
        );
      }
    }
    ```

  * [**`bloc`**](https://pub.dev/packages/bloc)

    ```dart
    import 'package:flutter/material.dart';
    import 'package:flutter_bloc/flutter_bloc.dart';
    
    void main() {
      runApp(BlocProvider(create: (_) => UserCubit(), child: MyApp()));
    }
    
    class UserCubit extends Cubit<String> {
      UserCubit() : super('默认名');
      void updateName(String newName) => emit(newName);
    }
    
    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) => MaterialApp(home: HomePage());
    }
    
    class HomePage extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        final cubit = context.read<UserCubit>();
        return Scaffold(
          appBar: AppBar(title: Text('首页')),
          body: Center(
            child: ElevatedButton(
              child: Text('设置用户名并跳转'),
              onPressed: () {
                cubit.updateName('Bloc 用户');
                Navigator.push(context, MaterialPageRoute(builder: (_) => SecondPage()));
              },
            ),
          ),
        );
      }
    }
    
    class SecondPage extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text('第二页')),
          body: Center(
            child: BlocBuilder<UserCubit, String>(
              builder: (context, state) => Text('用户名：$state'),
            ),
          ),
        );
      }
    }
    ```

  > ✅ 优点：适合跨页面传递大量数据
  >  ❌ 缺点：可能过度依赖全局状态，调试成本高

* 通过单例类或静态变量传参

  > ✅ 优点：简单粗暴
  >  ❌ 缺点：不推荐用于生产环境，数据污染风险高

  ```dart
  /// 例：用一个单例缓存临时参数（不推荐，但可应急）
  class PageCache {
    static String? tempMessage;
  }

  // 设置参数
  PageCache.tempMessage = 'Hello';

  // 在新页面读取
  Text(PageCache.tempMessage ?? '')
  ```

* 使用 `RouteSettings` 自定义参数（进阶命名路由）

  > ✅ 优点：适合大型项目进行集中统一路由处理
  >  ❌ 缺点：写法较复杂

  ```dart
  onGenerateRoute: (settings) {
    if (settings.name == '/second') {
      final args = settings.arguments as Map;
      return MaterialPageRoute(
        builder: (_) => SecondPage(name: args['name']),
      );
    }
  }
  ```

* 命名路由 + `ModalRoute.of(context)?.settings.arguments`：**适合多页面统一管理时使用**

  > ✅ 优点：搭配 `onGenerateRoute` 可统一路由管理
  >  ❌ 缺点：参数类型校验靠自己，不如构造函数安全

   ```dart
   /// 注册路由：
   MaterialApp(
     initialRoute: '/',
     routes: {
       '/': (context) => HomePage(),
       '/second': (context) => SecondPage(),
     },
   );
   ```

  ```dart
  /// 跳转传参：
  Navigator.pushNamed(
    context,
    '/second',
    arguments: {'name': 'Jobs'},
  );
  ```

  ```dart
  /// 接收参数：
  class SecondPage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final args = ModalRoute.of(context)?.settings.arguments as Map?;
      final name = args?['name'];
  
      return Scaffold(
        body: Center(child: Text('Hello $name')),
      );
    }
  }
  ```

#### 14.2、返向传参 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

* 标准型

   ```dart
   final result = await Navigator.push(...);
   Navigator.pop(context, 返回值);
   ```

* 全局变量或状态管理器传参：（如使用  [**`Provider`**](https://pub.dev/packages/provider)、[**`GetX`**](https://pub.dev/packages/get) 、[**`Riverpod`**](https://pub.dev/packages/riverpod)、[**Bloc**](https://pub.dev/packages/bloc) 等状态管理框架共享数据）

  *  [**`Provider`**](https://pub.dev/packages/provider)

    通过模型同步（间接传参）

    ```dart
    class UserModel extends ChangeNotifier {
      String result = '无';
      void setResult(String value) {
        result = value;
        notifyListeners();/// notifyListeners(); 不是“全局”通知，而是对注册了它这个对象的所有监听者发通知。
      }
    }

    // 首页
    ElevatedButton(
      onPressed: () async {
        Navigator.push(context, MaterialPageRoute(builder: (_) => SecondPage()));
      },
      child: Text('跳转到第二页'),
    ),
    Text('返回结果：${Provider.of<UserModel>(context).result}'),

    // 第二页
    onPressed: () {
      Provider.of<UserModel>(context, listen: false).setResult('Provider 的返回值');
      Navigator.pop(context);
    },
    ```

  * [<font color=red>**`GetX`**</font>](https://pub.dev/packages/get)

    使用 `Get.back(result: value)`（标准方式）

    ```dart
    // 首页
    ElevatedButton(
      onPressed: () async {
        final result = await Get.to(() => SecondPage());
        print('返回值：$result');
      },
      child: Text('跳转并接收返回值'),
    );

    // 第二页
    ElevatedButton(
      onPressed: () => Get.back(result: 'GetX 的返回值'),
      child: Text('返回并传值'),
    );
    ```

  * [**`Riverpod`**](https://pub.dev/packages/riverpod)

    修改状态再 pop（间接）

    ```dart
    final resultProvider = StateProvider<String>((ref) => '无');

    // 首页
    ElevatedButton(
      onPressed: () async {
        await Navigator.push(context, MaterialPageRoute(builder: (_) => SecondPage()));
      },
      child: Text('跳转'),
    ),
    Text('返回值：${ref.watch(resultProvider)}'),

    // 第二页
    ref.read(resultProvider.notifier).state = 'Riverpod 返回值';
    Navigator.pop(context);
    ```

  * [**`Bloc`**](https://pub.dev/packages/bloc)

    emit 状态后 pop（间接）

    ```dart
    class ResultCubit extends Cubit<String> {
      ResultCubit() : super('无');
      void setResult(String val) => emit(val);
    }
    
    // 首页
    BlocBuilder<ResultCubit, String>(
      builder: (_, result) => Column(
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SecondPage())),
            child: Text('跳转'),
          ),
          Text('返回值：$result'),
        ],
      ),
    );
    
    // 第二页
    context.read<ResultCubit>().setResult('Bloc 的返回值');
    Navigator.pop(context);
    ```

### 15、🖥️Flutter屏幕适配方案 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

| 工具/方式            | 作用                       | 用法示例                                                     |
| -------------------- | -------------------------- | ------------------------------------------------------------ |
| `MediaQuery`         | 获取屏幕宽高/边距/键盘高度 | `MediaQuery.of(context).size.height`                         |
| `SafeArea`           | 自动避开状态栏/导航栏      | `SafeArea(child: ...)`                                       |
| `flutter_screenutil` | 屏幕尺寸适配（dp/sp统一）  | `20.w`, `14.sp`, `EdgeInsets.all(10.r)`                      |
| `LayoutBuilder`      | 自适应布局大小判断         | `constraints.maxWidth < 600 ? PhoneLayout() : TabletLayout()` |
| `KeyboardVisibility` | 键盘弹出监听，处理遮挡问题 | `KeyboardVisibilityController().onChange.listen(...)`        |

#### 15.1、[**flutter_screenutil**](https://pub.dev/packages/flutter_screenutil)  <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

* ‼️重要说明

  * [**ScreenUtilInit**](https://pub.dev/packages/flutter_screenutil).**builder** 后面的参数

    | App 类型                              | 是否支持                                  | 原因说明                                         |
    | ------------------------------------- | ----------------------------------------- | ------------------------------------------------ |
    | `MaterialApp`                         | ✅ 支持                                    | 官方推荐用法，内部已处理 context 初始化逻辑      |
    | `CupertinoApp`                        | ❌ 不支持                                  | 无 `MediaQuery`，`ScreenUtil` 初始化失败或不完整 |
    | `GetMaterialApp`                      | ❌ 不直接支持                              | 内部结构不同，`context` 获取时机不同             |
    | `WidgetsApp`                          | ⚠️ 勉强支持                                | 需自己确保 `MediaQuery` 注入，使用受限           |
    | `Builder` 包装 + 任意 App（如下所示） | ✅ <font color=red>**推荐替代方案**</font> | 手动传入 `context`，可兼容任何框架（包括 GetX）  |

  * `ScreenUtilInit` 内部依赖：

    - `MediaQuery.of(context)` 初始化设备尺寸等；
    - `WidgetsBinding.instance.window.physicalSize` 是兜底；
    - 一般通过 `MaterialApp` 创建完整的 widget 树，包括 `MediaQuery`、`Localizations` 等。

* 使用

  ```yaml
  dependencies:
    flutter_screenutil: any
  ```

  ```dart
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  ```

  ```dart
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: const Size(1125, 2436),// 👈 指定设计稿尺寸
      minTextAdapt: true,
      builder: (context, child) => GetMaterialApp(/// ← 可以替换成 CupertinoApp、WidgetsApp 等
          debugShowCheckedModeBanner: false,
          title: title ?? 'GetX Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Builder(
            builder: (ctx) => Scaffold(
              appBar: AppBar(
                title:
                    Text(title ?? (child?.runtimeType.toString() ?? 'Builder')),
              ),
              body: builder != null ? builder!(ctx) : child!,
            ),
          ),
        )
    );
  ```

  ```dart
  520.h     // 表示高度适配值
  300.w     // 表示宽度适配值
  16.sp     // 表示字体大小适配值
  ```

#### 15.2、**SafeArea** <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

* 参考
  * [**SafeArea & MediaQuery**](https://docs.flutter.dev/ui/adaptive-responsive/safearea-mediaquery)
  * [**Layouts in Flutter**](https://docs.flutter.dev/ui/layout)

* 系统遮挡区的定义👇

  | 场景               | 说明                                                         |
  | ------------------ | ------------------------------------------------------------ |
  | ⏫ 顶部状态栏       | iOS 顶部刘海、状态栏；Android 通知栏                         |
  | ⏬ 底部系统导航栏   | Android底部导航按钮区域（Back/Home/Recent）                  |
  | 🕳️ iPhone 刘海/下巴 | iPhone **X**/**11**/**12**/**13**/**14**/**15** 系列的`凹口`和`下巴`区域 |
  | 🆘 横屏下的左右边缘 | 一些设备横屏时会有侧边手势栏                                 |

* 温馨提示

  *  **适合用于顶层布局容器，自动（可选避让方向）避开系统遮挡区域的`Widget`**

    ```dart
    SafeArea(
      top: false, // 如果已经有 AppBar，就不需要顶部避让
      child: Scaffold(
        body: ...
      ),
    )
    ```

  * `SafeArea` 通常应该放在最外层（或接近最外层），且**全局只需要用一次**

  * 不应该在 **`main()`** 中使用 `SafeArea`：**`SafeArea` 依赖于 `MediaQuery`，而 `main()` 没有构建上下文**

    * `SafeArea` 的工作机制：它从 `MediaQuery.of(context)` 中获取系统的安全区域（状态栏、刘海、导航栏等）进行 padding。
    * 而 `main()` 中，还没有构建 `MaterialApp`，没有上下文树，自然没有 `MediaQuery`，所以 `SafeArea` 无法生效。

  * 💥 **不要嵌套多个 `SafeArea`**：会导致 `MediaQuery` `padding` 被多次应用，造成布局偏移。<font color=red>若有嵌套需求，使用 **`MediaQuery.removePadding`**</font>

    * 使用 `MediaQuery.removePadding`（兼容旧版 Flutter）

      🔹 优点：兼容旧版本
      🔹 缺点：要手动指定 `removeTop`、`removeBottom`，逻辑略复杂

      ```dart
      SafeArea(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true, // 根据需求移除
          removeBottom: true,
          child: YourNestedContent(),
        ),
      )
      ```

  * 💥 **不要与 `Scaffold.resizeToAvoidBottomInset` 冲突使用**：会出现布局跳动、挤压、底部空间错误等问题

    * 推荐只用 `SafeArea` 或使用 `resizeToAvoidBottomInset: false`

      ```dart
      Scaffold(
        resizeToAvoidBottomInset: false, // 避免 SafeArea 冲突
        body: SafeArea(
          child: ...,
        ),
      )
      ```

  * 🟡 **不能代替键盘避让机制**：`SafeArea` 只考虑系统 UI（如状态栏、刘海、底部 Home 指示器等），不负责键盘避让

    * 如果有键盘弹出需求，需结合 `MediaQuery` 或 `KeyboardAvoider` 等手动处理。

  * ⚠️ **对 Dialog/Overlay 等不是在根节点渲染的内容无效**：`SafeArea` 必须在拥有 `MediaQuery` 的上下文中才起作用（通常是 `MaterialApp` 或 `WidgetsApp` 之下），否则无效。

  * **`CupertinoPageScaffold` 自带 SafeArea 行为**，但自定义页面仍需要手动处理。

  * ⚠️ **与 `AppBar` 共用时应只作用于 body**：否则会让 AppBar 有额外顶部边距，一般只包裹 `Scaffold.body` 即可。

#### 15.3、📐 键盘遮挡通用处理方案  <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

🌹类似于iOS里面的[**IQKeyboardManager**](https://github.com/hackiftekhar/IQKeyboardManager)，👉 **监听键盘的高度变化，动态将视图往上推这么多距离，避免输入控件被遮挡。**

> **MediaQuery**.**of(context)**.**viewInsets**.**bottom**，是 Flutter 提供的一个<u> **动态值**</u>，表示：当前屏幕底部被“系统遮挡”的高度
>
> | 系统遮挡 | MediaQuery.of(context).viewInsets.bottom 值 |
> | -------- | ------------------------------------------- |
> | 没有遮挡 | 0                                           |
> | 键盘弹出 | 键盘的实际高度（比如 300）                  |

```dart
/// ❌ 如果你什么都不处理：
/// 键盘一弹出
/// TextField 就会被 直接挡住
/// 页面不能滑动，你根本看不到它了
Scaffold(
  body: Column(
    children: [
      Spacer(),
      TextField(), // 输入框靠下
    ],
  ),
)
```

```dart
/// 键盘未弹出	页面正常显示
/// 键盘弹出	被键盘挡住的区域会被 Padding 顶上来
/// 内容超出	SingleChildScrollView 允许你滚动看到全部内容（即使被键盘挡住）
/// 🔥 SafeArea + SingleChildScrollView + Padding
SafeArea(
  child: Scaffold(
    resizeToAvoidBottomInset: true,
    body: SingleChildScrollView(
      child: Padding(
        /// 在底部添加一个动态的 padding（内边距）
        /// 它的值是：MediaQuery.of(context).viewInsets.bottom
        /// 也就是把你的页面内容整体往上推这么多空间，避免输入框被键盘挡住。
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
      			Spacer(),
     			  TextField(), // 输入框靠下
   			  ],
        ),
      ),
    ),
  ),
)
```

* Flutter 没有像 iOS 那样原生的 `keyboardWillShow` 事件，但可以通过：

  - `MediaQuery.of(context).viewInsets.bottom`
  - 或者 `flutter_keyboard_visibility` 包来监听键盘状态变化

  手动加 `ScrollView + Padding`，就等同于**Flutter 版 IQKeyboardManager**

#### 15.4、🔄 响应式布局：根据宽度切换布局  <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

```dart
LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth < 600) {
      return PhoneLayout();
    } else {
      return TabletLayout();
    }
  },
)
```

### 16、Dart.Object <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 在 Dart 中，**所有类最终都继承自 `Object`**，所以这些方法每个类都自动拥有

| 方法                                  | 返回类型  | 作用                                                         | 是否常重写                  |
| ------------------------------------- | --------- | ------------------------------------------------------------ | --------------------------- |
| `toString()`                          | `String`  | 将对象转换为字符串，常用于打印、日志调试。                   | ✅ 经常重写，用于调试打印等  |
| `operator ==(Object other)`           | `bool`    | 比较两个对象是否相等                                         | ✅ 自定义比较逻辑时必须重写  |
| `get hashCode`                        | `int`     | 返回对象的哈希值，配合 `==` 使用<br>**在内存中快速定位/查找用的 ID** | ✅ 如果重写 `==`，必须重写它 |
| `noSuchMethod(Invocation invocation)` | `dynamic` | 拦截未定义方法调用。<br>捕获未定义的方法调用（动态调用时），用于实现“代理”、“Mock”、“动态接口”等。 | ⚠️ 高级用法，较少用          |
| `runtimeType`                         | `Type`    | 返回当前对象的运行时实际类型，常用于调试或类型判断           | ❌ 不能重写，只能调用        |
| `identical(a, b)`                     | `bool`    | 判断两个对象是否为同一引用                                   | ❌ 静态方法，不可重写        |

```dart
class XXX{}
/// 👆等价于👇：
class XXX extends Object{}
```

### 17、Flutter中，支持<font color=red>**滑动**</font>的所有核心**`Widget`** <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> Grid：网格

* 滚动条

  * iOS 滚动指示器是 `UIScrollView` 自带的

    | 特点               | 描述                                                         |
    | ------------------ | ------------------------------------------------------------ |
    | **内置指示器**     | 滚动条（scroll indicator）是 `UIScrollView` 自带的 UI 行为   |
    | **无需配置**       | 系统自动根据 `contentOffset` 和 `contentSize` 来决定是否显示滚动条 |
    | **开启/关闭控制**  | 通过属性控制：`showsVerticalScrollIndicator = YES/NO`        |
    | **无法自定义**     | 样式和位置难以自定义，除非私有 API 或覆盖子视图（不推荐）    |
    | **滚动驱动指示器** | 滚动行为自动驱动指示器变化，无需开发者手动干预               |

  * Flutter 滚动指示器是独立的 `Scrollbar` 组件

    | 特点                    | 描述                                                         |
    | ----------------------- | ------------------------------------------------------------ |
    | **不是内置的**          | 默认的 `ListView` / `SingleChildScrollView` 是**没有滚动条**的 |
    | **需要手动包裹**        | 必须外层手动包一层 `Scrollbar` 才有滚动条效果                |
    | **需要共享 controller** | `Scrollbar` 要和内部滚动组件**共用一个 `ScrollController`**，才能同步滚动 |
    | **支持自定义样式**      | 可以设置颜色、厚度、是否总是显示、是否交互拖动等             |
    | **滚动驱动指示器**      | 由 controller 驱动滚动，`Scrollbar` 通过绑定 controller 来同步滚动位置 |

  * 📌 总结

    | 对比点             | iOS                 | Flutter                              |
    | ------------------ | ------------------- | ------------------------------------ |
    | 滚动条来源         | `UIScrollView` 内置 | 需要手动用 `Scrollbar` 包裹          |
    | 滚动条是否自动同步 | ✅ 系统自动          | ❌ 需通过 `ScrollController` 手动同步 |
    | 是否可以自定义     | ❌ 非常受限          | ✅ 颜色、宽度、交互、拖拽等全可自定义 |
    | 是否可以拖动条滚动 | ❌ 不能（仅视觉）    | ✅ `interactive: true` 支持拖动滚动   |

* Flutter 原生SDK内置的滚动组件

  | 类型       | Widget                                              | 说明                     |
  | ---------- | --------------------------------------------------- | ------------------------ |
  | 列表类     | `ListView`                                          | 常用线性滚动列表         |
  | 网格类     | `GridView`                                          | 类似 `UICollectionView`  |
  | 分页类     | `PageView`                                          | 左右滑动分页             |
  | 单组件滚动 | `SingleChildScrollView`                             | 嵌套滚动或表单滑动常用   |
  | 可重排列表 | `ReorderableListView`                               | 内置拖拽重排             |
  | 组合滚动   | `CustomScrollView` + `SliverList` / `SliverGrid`    | 复杂结构滚动             |
  | 多滚动嵌套 | `NestedScrollView`                                  | 滑动联动（如顶部折叠）   |
  | 滚动增强   | `Scrollbar`、`RefreshIndicator`、`ScrollController` | 滚动条、刷新、跳转控制等 |

  ```dart
  /// ListView
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20, // 列表项数量
      itemBuilder: (context, index) {
        return ListTile(title: Text('Item $index'));
      },
      scrollDirection: Axis.vertical, // 滚动方向（默认垂直，可设置为 Axis.horizontal）
      reverse: false, // 是否倒序显示列表项
      controller: ScrollController(), // 滚动控制器，可用于跳转滚动位置
      primary: false, // 是否使用主滚动区域（true时自动连接主 ScrollController）
      physics: BouncingScrollPhysics(), // 滚动物理特性（惯性、回弹、滑动行为）
      shrinkWrap: false, // 是否根据子组件内容自动收缩（true时适合嵌套）
      padding: EdgeInsets.all(8), // 内容的内边距
      cacheExtent: 100.0, // 预加载区域（列表滚动到临近位置时提前构建）
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
      // 键盘收起行为，可选 manual / onDrag
      restorationId: 'listViewDemo', // 状态恢复用的 ID，用于记住滚动位置
      clipBehavior: Clip.hardEdge, // 内容溢出裁剪方式
    );
  }
  ```

  ```dart
  /// GridView
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3, // 每行几个格子
      mainAxisSpacing: 10.0, // 主轴（垂直方向）间距
      crossAxisSpacing: 10.0, // 横向间距
      childAspectRatio: 1.0, // 宽高比，1.0 = 正方形
      scrollDirection: Axis.vertical, // 默认垂直滚动
      reverse: false, // 是否倒序显示
      controller: ScrollController(), // 滚动控制器
      physics: ClampingScrollPhysics(), // Android 风格滑动物理
      shrinkWrap: false, // 是否自动收缩（适合嵌套）
      padding: EdgeInsets.all(8), // 外边距
      primary: false, // 是否占用主滚动视图
      restorationId: 'gridViewDemo', // 状态恢复 ID
      clipBehavior: Clip.hardEdge, // 内容裁剪
      children: List.generate(
        30,
        (index) => Container(
          color: Colors.blue,
          child: Center(child: Text('Item $index')),
        ),
      ),
    );
  }
  ```

  ```dart
  /// PageView
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: 5, // 页数
      itemBuilder: (context, index) => Center(child: Text('Page $index')),

      scrollDirection: Axis.horizontal, // 横向或纵向滑动（默认水平）
      reverse: false, // 是否反向滑动（右滑变成前一页）
      controller: PageController(
        initialPage: 0, // 初始页码
        keepPage: true, // 是否保持滚动状态
        viewportFraction: 1.0, // 页面占屏幕宽度比例（<1 时可显示部分下一页）
      ),
      physics: BouncingScrollPhysics(), // 滑动行为，支持弹性、惯性、回弹
      pageSnapping: true, // 是否自动对齐整页（分页吸附）
      onPageChanged: (index) {
        print('页面切换到 $index');
      },
      allowImplicitScrolling: false, // 是否允许“懒加载下一页”（用于动画提前构建）
      restorationId: 'pageViewDemo', // 状态恢复 ID（用于恢复页码）
      clipBehavior: Clip.hardEdge, // 裁剪行为
    );
  }
  ```

  ```dart
  /// SingleChildScrollView
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical, // 垂直或水平滚动
      reverse: false, // 是否倒序显示（适合聊天界面）
      padding: EdgeInsets.all(16), // 内容边距
      primary: false, // 是否使用主滚动视图（如嵌套情况设为 false）
      physics: AlwaysScrollableScrollPhysics(), // 滑动物理（允许空状态也能滑动）
      controller: ScrollController(), // 控制器，可用于定位滚动
      clipBehavior: Clip.hardEdge, // 内容超出裁剪方式
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      // 拖动时是否自动收起键盘（适合表单）
      restorationId: 'singleChildScrollViewDemo', // 状态恢复 ID
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(20, (i) => Text('Line $i')),
      ),
    );
  }
  ```

  ```dart
  /// ReorderableListView（支持拖拽排序）
  Widget build(BuildContext context) {
    return ReorderableListView(
      onReorder: (oldIndex, newIndex) {
        print('从 $oldIndex 拖动到 $newIndex');
        // 拖动完成后需自己更新数据源，否则 UI 不会刷新
      },

      children: List.generate(
        10,
        (index) => ListTile(
          key: ValueKey(index), // 🔥 必须提供 Key，否则无法拖拽
          title: Text('Item $index'),
          leading: Icon(Icons.drag_handle), // 可拖动提示图标
        ),
      ),

      scrollDirection: Axis.vertical, // 滚动方向（默认垂直，可横向）
      reverse: false, // 是否倒序显示
      controller: ScrollController(), // 滚动控制器
      padding: EdgeInsets.symmetric(vertical: 12), // 列表边距
      physics: BouncingScrollPhysics(), // 滚动物理（弹性）
      proxyDecorator: (child, index, animation) {
        // 拖动时自定义拖拽视图样式
        return Material(
          elevation: 6,
          child: child,
        );
      },
      buildDefaultDragHandles: true, // 是否使用默认拖动手柄（设置 false 自定义）
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      clipBehavior: Clip.hardEdge,
      restorationId: 'reorderListDemo',
    );
  }
  ```

  ```dart
  /// CustomScrollView（组合多个 Sliver 的高级滚动结构）
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical, // 滚动方向
      reverse: false, // 是否倒序滚动
      controller: ScrollController(), // 滚动控制器
      physics: ClampingScrollPhysics(), // 滚动物理（安卓风格）
      primary: false,
      shrinkWrap: false, // 是否根据内容自动收缩（通常为 false）
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
      restorationId: 'customScrollViewDemo',
      clipBehavior: Clip.hardEdge,

      slivers: [
        SliverAppBar(
          pinned: true, // 是否固定顶部（吸顶）
          expandedHeight: 150.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('SliverAppBar'),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 80,
            color: Colors.amber,
            child: Center(child: Text('普通内容')),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => ListTile(title: Text('Item $index')),
            childCount: 10,
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              color: Colors.blue[100 * ((index % 8) + 1)],
              child: Center(child: Text('Grid $index')),
            ),
            childCount: 8,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 每行几个
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.2,
          ),
        ),
      ],
    );
  }
  ```

  > `CustomScrollView` 是构建复杂滚动结构的核心框架，适合处理：
  >
  > - 吸顶 header（SliverAppBar）
  > - 列表 + 网格混排
  > - 内容自适应 + 滚动联动
  > - 替代 `NestedScrollView` 解决性能问题

  ```dart
  /// SliverGrid 全属性示例（Flutter 原生 Sliver 网格）
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.all(8), // 外边距
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: Colors.primaries[index % Colors.primaries.length],
                  child: Center(child: Text('Item $index')),
                );
              },
              childCount: 20, // 子项总数
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 每行显示几个格子
              mainAxisSpacing: 10.0, // 垂直方向格子之间的间距
              crossAxisSpacing: 10.0, // 水平方向格子之间的间距
              childAspectRatio: 1.2, // 宽高比（>1 表示更宽）
            ),
          ),
        ),
      ],
    );
  }
  ```

  >  ❌ **`SliverGrid` 不能单独作为 Widget 返回**，因为它不是继承自 `Widget`，而是继承自 **`SliverMultiBoxAdaptorWidget`**，只能被放在 `CustomScrollView.slivers` 中使用。

  ```dart
  /// NestedScrollView（嵌套滚动视图）
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: ScrollController(), // 外层滚动控制器
      physics: BouncingScrollPhysics(), // 滚动物理
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverAppBar(
          pinned: true, // 固定顶部吸顶
          expandedHeight: 200.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('Nested Header'),
          ),
        ),
      ],
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
      ),
      floatHeaderSlivers: false, // header 是否浮动（和 SliverAppBar 的 floating 联动）
      scrollDirection: Axis.vertical,
      clipBehavior: Clip.hardEdge,
      restorationId: 'nestedScrollViewDemo',
    );
  }
  ```

  ```dart
  /// Scrollbar（添加滚动条）
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
      ),

      thumbVisibility: true, // 始终显示滚动条（默认只在滚动时可见）
      trackVisibility: true, // 显示滚动轨道
      interactive: true, // 是否支持拖动滚动条进行滑动
      thickness: 6.0, // 滚动条宽度
      radius: Radius.circular(8), // 滚动条圆角
      controller: ScrollController(), // 滚动控制器（与内部 ListView 保持一致）
      scrollbarOrientation: ScrollbarOrientation.right, // 滚动条显示在右侧或左侧
    );
  }
  ```

  ```dart
  /// 展示 RefreshIndicator 的全部属性用法（下拉刷新）
  Widget build(BuildContext context) {
    return RefreshIndicator(
      // ✅ 下拉刷新触发回调（返回 Future）
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 1));
        print('刷新完成');
      },
      // ✅ 刷新圈下拉的触发偏移（单位 px）
      displacement: 60.0, // 默认是 40
      // ✅ 圈圈的颜色
      color: Colors.blue,
      // ✅ 圈圈背景颜色（Material 风格）
      backgroundColor: Colors.yellow[100],
      // ✅ 圈圈线条粗细
      strokeWidth: 3.0,
      // ✅ 是否必须从“边缘”才能触发刷新（默认：onEdge）
      triggerMode: RefreshIndicatorTriggerMode.any,
      // onEdge = 必须从顶部边缘拖动
      // any = 只要滚动组件内向下拖就可触发
      // ✅ 控制是否允许刷新触发（拦截器）
      notificationPredicate: (ScrollNotification notification) {
        print('滚动通知类型: ${notification.runtimeType}');
        // 例如只允许在没有拖动时刷新
        return notification is ScrollStartNotification;
      },
      // ✅ 刷新区域（child 必须是可滚动组件）
      child: ListView.builder(
        physics: AlwaysScrollableScrollPhysics(), // 即使内容不足也可下拉
        itemCount: 15,
        itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
      ),
    );
  }
  ```

  ```dart
  /// 组合 RefreshIndicator + ScrollController 实现上下拉完整体验（带分页）
  class RefreshLoadMoreDemo extends StatefulWidget {
    @override
    _RefreshLoadMoreDemoState createState() => _RefreshLoadMoreDemoState();
  }

  class _RefreshLoadMoreDemoState extends State<RefreshLoadMoreDemo> {
    final ScrollController _scrollController = ScrollController();
    List<int> _data = List.generate(20, (i) => i);
    bool _isLoadingMore = false;

    @override
    void initState() {
      super.initState();
      // ✅ 监听滚动，触发上拉加载更多
      _scrollController.addListener(() {
        if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 50) {
          _loadMore();
        }
      });
    }
    // ✅ 下拉刷新逻辑
    Future<void> _handleRefresh() async {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        _data = List.generate(20, (i) => i);
      });
    }
    // ✅ 上拉加载更多逻辑
    Future<void> _loadMore() async {
      if (_isLoadingMore) return;
      _isLoadingMore = true;

      await Future.delayed(Duration(seconds: 1));
      setState(() {
        int current = _data.length;
        _data.addAll(List.generate(10, (i) => current + i));
      });

      _isLoadingMore = false;
    }

    @override
    Widget build(BuildContext context) {
      return RefreshIndicator(
        onRefresh: _handleRefresh,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _data.length + 1, // 最后一项是 loading 指示器
          itemBuilder: (context, index) {
            if (index < _data.length) {
              return ListTile(title: Text('Item ${_data[index]}'));
            } else {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
        ),
      );
    }

    @override
    void dispose() {
      _scrollController.dispose();
      super.dispose();
    }
  }
  ```

  > 在iOS中没有专门的系统封装上拉加载、下拉刷新的控件（一般用MJRefresh）
  >
  > 但是在Flutter由系统给提供了`RefreshIndicator`

  ```dart
  /// DraggableScrollableSheet（可拖动底部弹出滑动面板）
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3, // 初始高度（相对于父容器 0.0~1.0）
      minChildSize: 0.2, // 最小高度
      maxChildSize: 0.8, // 最大高度
      expand: true, // 是否填满父组件（false = 按需布局）
      builder: (context, scrollController) {
        return Container(
          color: Colors.grey[200],
          child: ListView.builder(
            controller: scrollController, // 控制滚动
            itemCount: 20,
            itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
          ),
        );
      },
    );
  }
  ```

* [**Flutter社区**](pub.dev)/第三方提供的滚动库

  | 库                                   | 说明                                                         |
  | ------------------------------------ | ------------------------------------------------------------ |
  | `flutter_staggered_grid_view`        | 实现瀑布流 Masonry 布局                                      |
  | `carousel_slider` / `flutter_swiper` | 高性能轮播组件（基于 PageView）                              |
  | `infinite_scroll_pagination`         | 分页加载列表组件                                             |
  | `extended_nested_scroll_view`        | 更强大的嵌套滚动支持，解决官方 NestedScrollView 滚动冲突问题 |
  | `pull_to_refresh`                    | 下拉刷新/上拉加载的封装库                                    |
  | `flutter_easyrefresh`（已停更）      | 曾经流行的刷新库（不推荐新项目用）                           |

### 18、👋手势 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 虽然本质是响应用户输入（如点击、滑动、拖动、缩放等），但它们的使用方式**确实也是通过 Widget 实现的**
>
> ```
> ┌────────────────────────────┐
> │ Pointer 原始事件层         │ → Listener / MouseRegion
> ├────────────────────────────┤
> │ 手势识别封装层             │ → GestureDetector / RawGestureDetector
> ├────────────────────────────┤
> │ 手势 + 可视化反馈层         │ → InkWell / InkResponse / 按钮类
> ├────────────────────────────┤
> │ 拖拽、滑动等复杂交互封装     │ → Draggable / Dismissible / RefreshIndicator
> └────────────────────────────┘
> ```

* Flutter 中的手势系统本质（由三层机制组成）

  | 层级   | 名称                     | 说明                                               |
  | ------ | ------------------------ | -------------------------------------------------- |
  | 1️⃣ 底层 | `Listener`               | 原始事件监听（如 pointerDown、pointerMove）        |
  | 2️⃣ 中层 | `GestureDetector`        | 对原始事件进行识别封装（如 tap、double tap、drag） |
  | 3️⃣ 高层 | `InkWell`, `InkResponse` | 组件化的手势 + 视觉反馈（如水波纹）                |

* ✅ Flutter 中所有手势相关 Widget 一览（全量分类）

  * 🔹原始指针事件层（Pointer 级）：处理最底层的触摸事件（pointer down / move / up 等）

    | Widget               | 说明                                                         |
    | -------------------- | ------------------------------------------------------------ |
    | **`Listener`**       | 监听原始 Pointer 事件（触摸按下、移动、抬起、取消、进入、离开等） |
    | `MouseRegion`        | 专门处理鼠标事件（进入、悬停、离开、位置）                   |
    | `RawGestureDetector` | 手动构建手势识别器，适合自定义复杂手势识别逻辑               |
    | `IgnorePointer`      | 禁用子组件对 Pointer 事件的响应                              |
    | `AbsorbPointer`      | 拦截 Pointer 事件（自身响应但不传递给子组件）                |

  * 🔹手势识别层（Gesture 级）：对原始 Pointer 的封装，负责识别出“点击/拖动/缩放”等语义手势

    | Widget                                                       | 说明                                                         |
    | ------------------------------------------------------------ | ------------------------------------------------------------ |
    | **`GestureDetector`**                                        | 支持 **tap**、**double tap**、**long press**、**drag**、**scale** 等完整手势<br/>❌ 无视觉反馈 |
    | `Dismissible`                                                | 支持滑动删除手势，内置动画                                   |
    | **`Draggable`**                                              | 可拖拽组件<br/>✅ 内建拖动逻辑                                |
    | `LongPressDraggable`                                         | 长按后触发拖拽                                               |
    | **`DragTarget`**                                             | 拖拽目标区，可接收拖拽数据<br/>✅ 内建拖动逻辑                |
    | `InteractiveViewer`                                          | 支持缩放、拖动、旋转的交互容器                               |
    | `GestureDetectorWithMultipleCustomGestureRecognizer`（自定义组合） | 自己组合多个识别器<br/>需 RawGestureDetector                 |

  * 🔹手势 + 视觉反馈层（带交互视觉）：这些组件不仅支持手势识别，还附带点击反馈（如水波纹）

    | Widget                                                       | 说明                                                         |
    | ------------------------------------------------------------ | ------------------------------------------------------------ |
    | **`InkWell`**                                                | 点击水波纹效果，配合 `Material` 使用                         |
    | **`InkResponse`**                                            | 更灵活控制水波纹范围的点击组件<br>更灵活的 Ink 效果<br/>支持圆形<br/>可调点击区域等 |
    | `CupertinoButton`                                            | iOS 风格按钮，自带点击高亮反馈                               |
    | `MaterialButton` / `ElevatedButton` / `TextButton` / `OutlinedButton` | 都是封装了点击反馈的组件                                     |

  * 🔹组合行为类组件（复杂手势交互）

    | Widget                   | 说明                                          |
    | ------------------------ | --------------------------------------------- |
    | `PageView`               | 可横向/纵向滑动分页（内部使用拖拽手势）       |
    | **`Dismissible`**        | 处理左右滑动删除的手势（✅ 内建动画）          |
    | `RefreshIndicator`       | 下拉刷新（配合滚动手势触发）                  |
    | `Slider` / `RangeSlider` | 拖动滑块（拖拽 + tap）                        |
    | `Switch` / `Checkbox`    | 也支持手势（tap）但通常不直接作为手势组件使用 |

### 19、Flutter中，涉及到布局的**`Widget`**  <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 类似 iOS 中的 [**Masonry**](https://github.com/SnapKit/Masonry) 或 AutoLayout

#### 19.1、🧱 线性布局（类似 iOS 的 `UIStackView`） <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

| Widget         | 功能说明                                                     |
| -------------- | ------------------------------------------------------------ |
| `Row`          | 水平方向排列子组件                                           |
| `Column`       | 垂直方向排列子组件                                           |
| `Flex`         | 可指定主轴方向（横 / 竖）                                    |
| **`Expanded`** | 1️⃣ **占据剩余空间，弹性伸缩**<br/>2️⃣ 只在 `Row` / `Column` / `Flex` 中起作用，用来自动填满多余的可用空间<br/>3️⃣ 不能用于 `Stack` / `Container` / `GridView` 等其他布局中<br/>4️⃣ 占用的是剩余空间，不能强行撑大父 **Widget** |
| `Flexible`     | 弹性布局，可选择占不占满                                     |
| `Spacer`       | 空间占位器，实质是 `Flexible` 封装                           |
| `SizedBox`     | 固定尺寸或间距                                               |

`Expanded` 🆚 `Flexible`

| 比较点   | `Expanded`                | `Flexible`                     |
| -------- | ------------------------- | ------------------------------ |
| 默认行为 | 强制填满剩余空间          | 可以填满，也可以由内容决定大小 |
| 常用场景 | 占满空间、均分            | 需要灵活控制内容大小时使用     |
| 包装效果 | 是 `Flexible(fit: tight)` | 可自定义 `fit: tight/loose`    |

#### 19.2、🧱 层叠布局（类似 iOS 的 Frame 布局 + zIndex） <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

| Widget       | 功能说明                              |
| ------------ | ------------------------------------- |
| `Stack`      | 层叠布局（类似 iOS 的 `UIView` 叠加） |
| `Positioned` | Stack 子元素定位                      |
| `Align`      | 子组件对齐（用于 Stack、普通 Widget） |
| `Center`     | 子组件居中                            |

#### 19.3、🧱 约束类布局（最接近 [**Masonry**](https://github.com/SnapKit/Masonry) 的思想） <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

| Widget                 | 功能说明                 |
| ---------------------- | ------------------------ |
| `ConstrainedBox`       | 添加最小最大尺寸约束     |
| `UnconstrainedBox`     | 移除父组件的约束         |
| `SizedBox`             | 固定宽高尺寸             |
| `FractionallySizedBox` | 根据父尺寸按比例设置宽高 |
| `AspectRatio`          | 按宽高比自动调整尺寸     |
| `LimitedBox`           | 超出最大尺寸时才应用限制 |

#### 19.4、🧱 自动换行 / 流式布局 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

| Widget | 功能说明                               |
| ------ | -------------------------------------- |
| `Wrap` | 自动换行布局（类似 HTML 的 flex-wrap） |
| `Flow` | 高级流式布局（需手动实现 delegate）    |

#### 19.5、🧱 表格 / 网格布局 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

| Widget       | 功能说明               |
| ------------ | ---------------------- |
| `Table`      | 类似 HTML 表格布局     |
| `GridView`   | 网格布局（支持滚动）   |
| `SliverGrid` | 滚动性能优化的网格布局 |

#### 19.6、🧱 边距 / 填充 / 对齐 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

| Widget      | 功能说明                                             |
| ----------- | ---------------------------------------------------- |
| `Padding`   | 添加内边距                                           |
| `Margin`    | ❌ 无此 Widget，可用 `Padding + Container` 模拟外边距 |
| `Container` | 可组合设置 `padding`, `margin`, `alignment`          |
| `Align`     | 设置对齐方式                                         |
| `Center`    | 子组件居中                                           |
| `Baseline`  | 按基线对齐                                           |

#### 19.7、🧱  布局辅助 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

| Widget                                               | 功能说明                   |
| ---------------------------------------------------- | -------------------------- |
| `Offstage`                                           | 控制是否渲染但保留状态     |
| `Visibility`                                         | 控制是否渲染并可动画       |
| `LayoutBuilder`                                      | 可根据父约束动态构建子组件 |
| `CustomSingleChildLayout` / `CustomMultiChildLayout` | 高级自定义布局逻辑         |

### 20、✅ Flutter 实现相对位置布局的几种方式 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 20.1、使用 `Column` / `Row`（线性排列 + 间距控制）

```dart
Column(
  children: [
    Text('我是锚点'),
    SizedBox(height: 10),
    Text('我在锚点下面 10'),
  ],
);
```

#### 20.2、使用 `Stack + Positioned`（绝对锚点式）

```dart
Stack(
  children: [
    Positioned(
      top: 100,
      left: 50,
      child: Text('锚点 A'),
    ),
    Positioned(
      top: 150, // 相对 Y 轴偏移
      left: 50,
      child: Text('锚点 A 下面 50'),
    ),
  ],
);
```

#### 20.3、使用 `Align` + `FractionalOffset`

> ✅ 适合相对父组件的对齐布局。相对“容器”对齐，但不能锚定某个兄弟控件

```dart
Align(
  alignment: Alignment.bottomRight,
  child: Text("右下角锚点"),
);
```

#### 20.4、使用 `CustomMultiChildLayout` 实现锚定兄弟 Widget

> Flutter 的高级布局 Widget，支持**通过 key 锚定某个子 Widget 的位置来放置另一个子 Widget**

```dart
CustomMultiChildLayout(
  delegate: _AnchorLayoutDelegate(),
  children: [
    LayoutId(id: 'anchor', child: Text('锚点')),
    LayoutId(id: 'follower', child: Text('锚点下方')),
  ],
);

class _AnchorLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    Size anchorSize = layoutChild('anchor', BoxConstraints.loose(size));
    positionChild('anchor', Offset(0, 0));

    Size followerSize = layoutChild('follower', BoxConstraints.loose(size));
    positionChild('follower', Offset(0, anchorSize.height + 10));
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}
```

### 21、中间代码的生成工具 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 21.1、[<font color=red>**build_runner**</font>](https://pub.dev/packages/build_runner)

> **Dart 的代码生成引擎**，用于根据规则自动生成 Dart 代码
>
> 📦 它本身不生成代码，但**驱动其他插件去生成代码**。

| 命令                                 | 作用                               |
| ------------------------------------ | ---------------------------------- |
| `flutter pub run build_runner build` | 一次性生成代码                     |
| `flutter pub run build_runner watch` | 监听源码变化自动生成代码           |
| `flutter pub run build_runner clean` | 清除 `.dart_tool` 中生成的缓存代码 |


* `build_runner` 是建筑工人 🧱（实际干活的）
* `json_serializable`、`flutter_gen_runner`、`freezed` 等是设计图 📐（告诉你该建什么）
* `.g.dart`、`.gen.dart` 文件是建筑成果 🏠（自动生成的代码）

#### 21.2、[**flutter_gen_runner**](https://pub.dev/packages/flutter_gen)

> 根据你的 `pubspec.yaml` 中配置的资源文件，自动生成 assets.gen.dart 文件，让你用代码方式访问资源，更安全、方便。

```yaml
dev_dependencies:
  flutter_gen_runner: ^5.3.1
  build_runner: any

flutter_gen:
  output: lib/gen/ # 生成文件的目录
```

#### 21.3、[**json_serializable**](https://pub.dev/packages/json_serializable)

> 用于序列化/反序列化JSON数据

### 22、👂监听 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 22.1、👂路由的监听：`NavigatorObserver` <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 1️⃣ `class RouteObserver<R extends Route<dynamic>> extends NavigatorObserver `
>
> 2️⃣ 用于监听页面 push、pop、remove、replace 等 **路由事件**的类
>
> 3️⃣ `RouteObserver` 是`NavigatorObserver`的唯一官方子类

```dart
import 'package:flutter/material.dart';
import 'package:flutter_plugin_engagelab/flutter_plugin_engagelab.dart';

class AppNavigatorObserver extends RouteObserver<PageRoute<dynamic>> {
  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    // 监听返回事件
    if (route.settings.name != null && route.settings.name!.isNotEmpty) {
      FlutterPluginEngagelab.printMy("页面返回了: ${route.settings.name}");
    }
  }
}
```

```dart
final AppNavigatorObserver appNavigatorObserver = AppNavigatorObserver();

builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: '澳门新葡京',
            navigatorObservers: [appNavigatorObserver],
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            // supportedLocales: supportedLocales,
            // initialRoute: AppPages.INITIAL,
            // initialBinding: MainBindings(),
            // getPages: AppPages.routes,
            // builder: EasyLoading.init(),
            // translations: AppTranslations(),
            locale: Locale(currentLanguage),
            fallbackLocale: const Locale("en"),
          );
        }
```

#### 22.2、👂APP 生命周期的监听：`WidgetsBindingObserver` <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 主要通过实现 `WidgetsBindingObserver` 接口来完成

* App 前后台切换（如 iOS 的 `applicationDidEnterBackground` / `applicationDidBecomeActive`）
* 屏幕尺寸变化（如旋转）
* 语言切换
* 内存压力警告等

#### 22.3、👂滚动的监听 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 22.4、👂数据变化通知的监听 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 22.5、👂键盘（弹起/落下）的监听 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 22.6、👂网络的监听 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

### 23、富文本 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 23.1、🍎 iOS 🆚 🐦 Flutter

* 🍎 iOS 的富文本能力（`NSAttributedString`），几乎无所不能

* 🐦 Flutter 的痛点

  | 问题点                    | 原因                                                         |
  | ------------------------- | ------------------------------------------------------------ |
  | ❌ 没有统一的富文本对象    | 没有类似 `NSAttributedString` 的官方结构，Flutter 用 `TextSpan` 来手动构建 |
  | ❌ `Text` 只能显示简单样式 | 复杂样式需 `RichText` + `TextSpan`                           |
  | ❌ 没有原生点击行为        | 点击行为必须手动实现 `GestureRecognizer`                     |
  | ❌ 图片/WidgetSpan 兼容差  | 不能很好地与文字混排，溢出等问题                             |
  | ❌ 没有富文本输入控件      | iOS UITextView 自带，Flutter 需要用第三方                    |

#### 23.2、🧠 为什么会这样？

Flutter 是跨平台框架，它的核心设计理念是“自己画 UI（Skia）”，所有文本渲染都是**自绘**：

- iOS 原生：富文本由操作系统提供支持（UIKit + CoreText + WebKit）
- Flutter：必须用 Dart 描述 → Skia 绘制 → 手动管理逻辑

所以，Flutter 没办法像 iOS 那样“一行代码全搞定”。

### 24、Tab切换：**`IndexedStack`**  <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

```dart
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    PageA(),
    PageB(),
    PageC(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex, // 当前选中项
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'A'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'B'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'C'),
        ],
      ),
    );
  }
}
```

```dart
IndexedStack(
  index: 1, // 显示第几个子组件（从 0 开始）
  children: [
    WidgetA(),
    WidgetB(),
    WidgetC(),
  ],
)
```

```dart
/// GetX + IndexedStack
Obx(() => IndexedStack(
  index: tabCtrl.currentIndex.value,
  children: [
    PageA(),
    PageB(),
    PageC(),
  ],
))
```

> 只会**显示 index 对应的子组件**
>
> 其他子组件仍然 **在内存中保持状态，不会 rebuild**

### 25、[**`Provider`**](https://pub.dev/packages/provider)  <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

by [**Rémi Rousselet**](https://github.com/rrousselGit)

> 1️⃣ [**`Provider`**](https://pub.dev/packages/provider) 是 Flutter 中用于**管理和共享状态（数据）**的工具，可以 **在整个 widget 树中方便、安全地传递数据和状态**，并在数据变化时自动更新 UI。
>
> 2️⃣ 本质上是对 Flutter 原生的 `InheritedWidget` 和 `ChangeNotifier` 的封装，让状态共享变得更容易、更强大。
>
> 3️⃣ 是 Google 官方推荐的 Flutter 状态管理方式。

| 组件名                   | 作用说明                                       |
| ------------------------ | ---------------------------------------------- |
| `ChangeNotifier`         | 一个带监听能力的数据模型                       |
| `ChangeNotifierProvider` | 把模型放进 widget 树里共享                     |
| `Consumer`               | 用于读取并响应数据变化的 Widget                |
| `context.watch()`        | 监听数据并自动 rebuild（和 Consumer 效果类似） |
| `context.read()`         | 只读取一次，不监听                             |
| `context.select()`       | 精准监听某个字段                               |

* 🧩 和 [**`GetX`**](https://pub.dev/packages/get)  区别简要对比

  | 项目       | Provider                     | GetX                     |
  | ---------- | ---------------------------- | ------------------------ |
  | 学习曲线   | 简单，推荐初学者             | 更灵活但略复杂           |
  | UI刷新控制 | 精准，基于 `notifyListeners` | 自动，基于 `Obx`、`.obs` |
  | 架构解耦   | 明确，鼓励分层               | 灵活，不强制             |
  | 依赖注入   | 手动注册                     | 自动注册或懒加载更方便   |

* 🧠 [**`Provider`**](https://pub.dev/packages/provider) 的三种使用方式对比

  | 用法                     | 是否监听变化 | 用途                           |
  | ------------------------ | ------------ | ------------------------------ |
  | `context.read<T>()`      | ❌ 否         | 用来调用方法、只读一次         |
  | `context.watch<T>()`     | ✅ 是         | 用来刷新 UI，监听整个模型      |
  | `context.select<T, R>()` | ✅ 精准监听   | 用来只监听模型中的某个字段变化 |

* **`notifyListeners()`**：**不是全局通知**，而是**对注册了它这个对象的所有监听者**发通知

  ```dart
  class MyModel extends ChangeNotifier
  
  final myModel = MyModel(); // 这是一个 ChangeNotifier
  
  myModel.addListener(() {
    print('监听者 A 收到通知');
  });
  
  myModel.addListener(() {
    print('监听者 B 收到通知');
  });
  
  myModel.notifyListeners();
  ```

### 26、[**riverpod**](https://riverpod.dev/)  <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

by [**Rémi Rousselet**](https://github.com/rrousselGit)

>  [**`Provider`**](https://pub.dev/packages/provider) 的升级（完全）重构版，解决了  [**`Provider`**](https://pub.dev/packages/provider)  的所有限制和设计缺陷，**推荐用于大型项目**

### 27、[**flutter_bloc**](https://pub.dev/packages/flutter_bloc) <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 1️⃣ [**flutter_bloc**](https://pub.dev/packages/flutter_bloc) 是 Google 官方支持的 Flutter 状态管理库，基于 **BLoC**（<font color=red>**B**</font>usiness <font color=red>**Lo**</font>gic <font color=red>**C**</font>omponent） 思想封装，功能非常完整，尤其适合中大型项目。（不再手动管理 `StreamController`，代码更简洁）
>
> 2️⃣ 能做什么？
>
>  ✅ 用于构建清晰的业务逻辑层（Bloc/Cubit）
>  ✅ 实现输入事件 → 输出状态流转
>  ✅ 组件化管理多个状态源
>  ✅ 自动更新 UI，避免手动 setState
>  ✅ 全局调试、测试能力优秀
>  ✅ 可组合，可解耦，易维护
>
> 3️⃣ **BLoC**（<font color=red>**B**</font>usiness <font color=red>**Lo**</font>gic <font color=red>**C**</font>omponent） 的本质是一种**响应式编程思想**
>
> * **事件（Event）输入 → 状态（State）输出**
> * 通过 `Sink` 和 `Stream` 构建清晰的数据流动路径。
>
> 4️⃣  [**flutter_bloc**](https://pub.dev/packages/flutter_bloc) 提供的主要功能和类：
>
> | 类 / 方法名              | 类型   | 用途说明                                                     |
> | ------------------------ | ------ | ------------------------------------------------------------ |
> | `Bloc<Event, State>`     | 抽象类 | BLoC 的核心，处理事件并输出状态                              |
> | `Cubit<State>`           | 抽象类 | 简化版 Bloc，去掉了 Event，只操作状态（轻量状态管理）        |
> | `BlocProvider`           | Widget | 提供 Bloc/Cubit 实例给 widget 树使用（依赖注入）             |
> | `MultiBlocProvider`      | Widget | 同时注册多个 BlocProvider                                    |
> | `BlocBuilder`            | Widget | 根据状态变化构建 UI，类似于 `Consumer`                       |
> | `BlocListener`           | Widget | 监听状态变化，执行副作用（如弹窗、跳转等）                   |
> | `BlocConsumer`           | Widget | `BlocBuilder` + `BlocListener` 的组合体                      |
> | `RepositoryProvider`     | Widget | 注入 Repository（如 API 服务类等，便于测试和解耦）           |
> | `BlocObserver`           | 抽象类 | 全局监听 Bloc 生命周期：事件派发、状态变更、错误等（适合调试日志） |
> | `context.read<T>()`      | 方法   | 获取 Bloc/Cubit 实例，不触发 rebuild                         |
> | `context.watch<T>()`     | 方法   | 获取并监听 Bloc/Cubit，状态变化时触发 rebuild                |
> | `context.select<T, R>()` | 方法   | 精准监听某个属性变化，避免无意义重建                         |

## 三、📃其他 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

### 1、关于iOS模拟器（最新版本XCode：16.4） <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

* 老版本的iOS模拟器的兼容

  在设备选择器里面点选了较低版本的iOS模拟器（比如说：iPhone 7），只能通过命令行进行实例化并打开

  ```shell
  xcrun simctl list devices | grep 'iPhone 7'
  xcrun simctl boot "iPhone 7"
  ```

  ![image-20250716131840500](./assets/README/image-20250716131840500.png)

* 命令行唤起 iOS模拟器

  ```shell
  open -a Simulator
  ```

* 查看`Command Line Tools`版本

  ```shell
  pkgutil --pkg-info=com.apple.pkg.CLTools_Executables
  ```

* 打印所有模拟器实例路径和设备名称

  ```shell
  xcrun simctl list devices -j | jq -r '.devices | to_entries[] | .value[] | select(.isAvailable == true) | "\(.name) (\(.state))\n↪︎  Path: ~/Library/Developer/CoreSimulator/Devices/\(.udid)\n"'
  ```

  或，

  ```shell
  xcrun simctl list devices | grep -E '^    ' | while read -r line; do
    name=$(echo "$line" | cut -d '(' -f1 | xargs)
    uuid=$(echo "$line" | grep -oE '[A-F0-9\-]{36}')
    echo "$name"
    echo "↪︎  Path: ~/Library/Developer/CoreSimulator/Devices/$uuid"
    echo ""
  done
  ```

* 查看目前有的iOS模拟器安装包

  ```shell
  xcrun simctl list runtimes
  ```

* iOS模拟器目录

  * ```shell
    ~/Library/Developer/CoreSimulator/Devices/
    ```

    > <font color=red>**最常用的目录**</font>
    >
    > 🧼 清理建议：清理 `~/Library/Developer/CoreSimulator/Devices/` 可以释放大量空间，但会移除所有模拟器的 App 安装数据。
    >
    > **每个模拟器实例对应一个 UUID 子目录**。子目录包含该模拟器的所有数据，例如：
    >
    > - 应用程序数据（App 安装后的容器、沙盒）
    > - `data/` 目录里有模拟器的 Documents、tmp、Library 等路径
    > - `device.plist` 存储了模拟器的配置信息（名称、系统版本、状态等）
    > - `logs/` 保存了日志
    >
    > 当你运行模拟器、安装应用、查看沙盒路径，访问的就是这个目录中的对应路径。

  * ```
    ~/Library/Developer/CoreSimulator/Volumes/
    ```

    > 🧼 清理建议：`Volumes/` 通常空间不大，**可以直接删除**，Xcode 会自动重新创建。
    >
    > * 存放模拟器用到的 **挂载卷（Volumes）数据**。
    >
    > - 用于模拟 **iOS 设备的磁盘结构**，包括 `/Volumes` 中的挂载点。
    > - 一些 App 或系统组件可能会在模拟器中访问 `/Volumes` 路径（类似 macOS 磁盘挂载），就会挂载此目录中的数据。
    >
    > 例如：模拟器运行中，如果用户或 App 尝试挂载外部磁盘，或创建虚拟磁盘（如 .dmg 文件），就可能映射到这个目录。
    >
    > 📌 注意事项：
    >
    > - 通常这个目录在未特殊使用挂载卷的模拟器中是空的。
    > - 可被清理，Xcode 会在需要时自动重新创建。

### 2、[**FVM**](https://fvm.app/) = <font color=red>F</font>lutter <font color=red>V</font>ersion <font color=red>M</font>anagement <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 一个项目锁定该项目特有的Flutter.sdk环境，方便切换和调试

* 安装[**FVM**](https://fvm.app/)的前提是先安装**dart**环境

  ```dart
  dart pub global activate fvm
  ```

* 由[**FVM**](https://fvm.app/)锁定的版本信息，写入在**Flutter**项目根目录下的**`.fvm/fvm_config.json`**（隐藏文件夹）

  ```json
  {
    "flutterSdkVersion": "3.13.9", /// 当前项目锁定使用的 Flutter 版本
    "pinVersions": false /// 是否锁定精确版本（通常设为 false）
  }
  ```

* 由[**FVM**](https://fvm.app/)管理的Flutter.SDK的缓存目录：`.fvm/flutter_sdk/`

* 环境变量配置：`.bash_profile`

  > 🌟全局定义了一个 shell 函数，把所有的 `flutter` 命令都转发给 `fvm`
  >
  > 📌 那么 FVM 是怎么知道用哪个 Flutter SDK？
  >
  > * FVM 会优先查找**当前项目的 `.fvm/fvm_config.json`** 文件；
  >
  > * 如果你不在 Flutter 项目目录，FVM 会使用你设置的 **全局默认 Flutter SDK 版本**。
  >
  >   ```shell
  >   ➜  Desktop fvm global
  >   ? Select a version:  ›
  >   ❯ stable
  >     3.32.6
  >     3.24.5
  >   ```

  ```shell
  # 配置 FVM 环境变量
  export PATH="$HOME/.pub-cache/bin:$PATH"
  if command -v fvm &>/dev/null; then
    flutter() { fvm flutter "$@"; }
  else
    echo "⚠️ 未检测到 fvm，请执行 flutter pub global activate fvm 安装"
  fi
  ```

  ```shell
  ➜  Desktop which flutter

  flutter () {
  	fvm flutter "$@"
  }
  ```

* 🧰[**FVM**](https://fvm.app/)命令行使用方式：

  * **查看当前 FVM 的全局默认版本**

    ```shell
    fvm global
    ```

  * **查看所有可用版本**

    ```
    fvm releases
    ```

  * **查看当前项目锁定版本**

    ```shell
    fvm flutter --version
    ```

  * 查询可用**`channel`**

    ```shell
    fvm flutter channel
    ```

    ```shell
    ➜  Desktop flutter channel
    Flutter channels:
      master (latest development branch, for contributors)
      main (latest development branch, follows master channel)
      beta (updated monthly, recommended for experienced users)
    * stable (updated quarterly, for new users and for production app releases)
    ```

    | channel  | 说明                                                         | 适用人群       |
    | -------- | ------------------------------------------------------------ | -------------- |
    | `stable` | **稳定发布，适合生产环境**                                   | 普通开发者 ✅   |
    | `beta`   | **新功能预览版，较稳定**                                     | 有经验的开发者 |
    | `main`   | **主开发分支，功能最前沿**<br>从 **Flutter 3.22 开始**，Flutter 团队对 channel 进行了重构，**废弃了 `dev` channel 的独立维护**，其功能完全被 `main` 取代。 | 需体验最新特性 |
    | `master` | **Flutter 引擎贡献者使用**                                   | 深度参与者     |

  * 升级（切换）由[**FVM**](https://fvm.app/)管理的Flutter.SDK

    ```shell
    # 如果有必要，需要先切换channel，再upgrade
    fvm flutter channel main
    fvm flutter upgrade
    ```

    | 命令                 | 含义                                                         | 是否修改项目配置                |
    | -------------------- | ------------------------------------------------------------ | ------------------------------- |
    | `fvm install stable` | 安装**最新稳定版本**到本地缓存                               | ❌                               |
    | `fvm use stable`     | 设置当前项目使用最新稳定版本                                 | ✅                               |
    | `fvm global stable`  | 设置全局默认版本                                             | ✅（全局）                       |
    | `fvm upgrade`        | 1️⃣ **获取当前项目 `.fvm/fvm_config.json` 中配置的 `flutterSdkVersion` 所属 channel（如 stable、beta、dev、master）**；<br>2️⃣ 然后从该 **channel** 中 **升级到该 channel 的最新版本** | ✅（更新版本但不换 **channel**） |

### 3、[**VSCode**](https://code.visualstudio.com/)配置 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

* 如果[**VSCode**](https://code.visualstudio.com/)打开flutter项目以后没有办法通过`command`+`click`的形式点进去看，那么需要`command`+`shift`+`x` => 安装Dart/Flutter

  ![image-20250713101322760](./assets/README/image-20250713101322760.png)

  ![image-20250713101045523](./assets/README/image-20250713101045523.png)

  * [**VSCode**](https://code.visualstudio.com/)的配置文件

    ```
    Flutter项目的根目录/
    └── .vscode/
        ├── extensions.json          ✅ 插件推荐列表（✅ 推荐加入 Git）
        ├── launch.json              ▶️ 启动配置（如调试 main.dart）（✅ 推荐加入 Git）
        ├── settings.json            ⚙️ 全局项目设置（⚠️ 视情况加入 Git，建议仅保留通用设置）
        ├── settings.local.json      🧪 本地专属设置（❌ 不建议加入 Git，应添加至 .gitignore）
        └── tasks.json               🔁 自定义任务（如自动构建、格式化）（✅ 推荐加入 Git）
    ```

  * Git忽略文件`.gitignore`对于[**VSCode**](https://code.visualstudio.com/)的配置文件的处理

    ```plaintext
    # The .vscode folder contains launch configuration and tasks you configure in
    # VS Code which you may wish to be included in version control, so this line
    # is commented out by default.
    .vscode/settings.json
    !.vscode/settings.local.json
    ```


### 4、`/android/build.gradle`的配置 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

```Groovy
/// 显式声明了 Kotlin 版本
buildscript {
    ext.kotlin_version = '1.8.22'
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.buildDir = '../build'
subprojects {
    project.buildDir = "${rootProject.buildDir}/${project.name}"
}
subprojects {
    project.evaluationDependsOn(':app')
}

tasks.register("clean", Delete) {
    delete rootProject.buildDir
}
```

### 5、🎯 Dart 命名规则大全（官方风格指南） <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

| 类型            | 命名规则                                                     | 格式示例                             | 是否允许下划线 `_`  | 是否允许 `$`                                         |
| --------------- | ------------------------------------------------------------ | ------------------------------------ | ------------------- | ---------------------------------------------------- |
| 类名 / 枚举     | **帕斯卡命名法** PascalCase：<br><font color=red>**首字母大写，<br/>每个单词首字母也大写，<br/>不要用下划线**</font> | `UserModel`, `MyApp`, `ActivityType` | ❌ 不能有 `_`        | ✅ 允许<br/>但<font color=red>**仅限生成代码**</font> |
| 方法 / 函数     | **驼峰命名法** camelCase                                     | `fetchData()`, `onTap()`             | ❌ 不推荐            | ✅ 允许但少见                                         |
| 变量 / 成员变量 | **驼峰命名法** camelCase                                     | `userName`, `isLoading`              | ✅ 允许 `_`（私有）  | ✅ 允许但少见                                         |
| 常量（顶级）    | **全大写 + 下划线**                                          | `MAX_LENGTH`, `API_KEY`              | ✅ 推荐使用 `_` 分隔 | ❌ 不允许                                             |
| 文件名 / 路径   | **蛇形命名法** snake_case：<br><font color=red>**每个空格皆以底线（_）取代的书写风格，<br/>且每个单字的第一个字母皆为小写**</font> | `user_model.dart`, `home_page.dart`  | ✅ 推荐              | ❌ 不推荐                                             |
| 私有变量 / 方法 | 下划线开头<br>**只在当前 Dart 文件里能访问，其他文件即使导入了也访问不到** | `_user`, `_fetchData()`              | ✅ 必须用 `_`        | ❌ 不推荐                                             |

### 6、重定向技巧

> 保留多个构造方式（如 builder 模式 vs 普通 child 模式）；
>
> 保证初始化逻辑只写一份；
>
> 支持 `const` 调用（前提是 `_internal` 构造函数也 `const`）；

调用 `Person('Tom')` 实际上是调用 `Person._internal('Tom', 18)`；

```dart
class Person {
  final String name;
  final int age;
  const Person._internal(this.name, this.age);
  const Person(String name) : this._internal(name, 18);
}
```

### 7、package <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

* **package:**这种路径前缀只能用于 **`lib/` 目录下的 Dart 文件**。 表示从 `pubspec.yaml` 中定义的包或当前项目的 `lib/` 目录开始引用

  ❌ **不能使用 `package:` 的情况**：

  | ❌ 路径类型          | 原因说明                                                     |
  | ------------------- | ------------------------------------------------------------ |
  | `assets/`           | 用于加载资源，需通过 `AssetImage` 等方式加载                 |
  | `lib/` 以外的文件夹 | 比如 `test/`、`bin/`、`web/`、`ios/`、`android/` 等不能被 `package:` 引用 |
  | `lib/` 外 Dart 文件 | 比如 `tools/util.dart`，不是 `lib/` 下的无法被 `package:` 访问 |

### 8、[**Firebase**](https://firebase.google.com/?hl=zh-cn) <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

* [**Firebase**](https://firebase.google.com/?hl=zh-cn)：**Google 提供的一整套后端云服务平台**，专门为移动 App（Android/iOS）、Web 应用开发者提供“后端即服务”（BaaS）能力

  > 📦 一个不需要你自己搭服务器，就能拥有**推送通知、用户登录、数据库、文件存储、分析**等功能的一站式平台。
  >
  > <font>**虽然[**Firebase**](https://firebase.google.com/?hl=zh-cn)跨平台支持iOS，但是在Apple平台的推送都必须严格遵循苹果的标准设定（APNs）。即，在APNs上进行了二次封装**</font>

  | 分类                                                         | 模块名称                                     | 功能说明                                |
  | ------------------------------------------------------------ | -------------------------------------------- | --------------------------------------- |
  | 🔔 推送通知                                                   | Firebase Cloud Messaging（FCM）              | 向 Android/iOS/Web 发送通知消息         |
  | 🔐 身份认证                                                   | Firebase Authentication                      | 登录注册（支持手机号、邮箱、Google 等） |
  | 🗄️ 数据库                                                     | Firebase Realtime DatabaseFirebase Firestore | 云数据库，自动同步到客户端              |
  | 📦 文件存储                                                   | Firebase Storage                             | 图片、音频、视频等上传下载              |
  | 📊 应用分析                                                   | Firebase Analytics                           | 记录用户行为、事件埋点分析              |
  | 🧪 崩溃报告                                                   | Firebase Crashlytics                         | 捕捉应用崩溃日志                        |
  | ☁️ 云函数                                                     | Firebase Cloud Functions                     | 写后端代码的 Serverless 平台            |
  | 🌐 托管                                                       | Firebase Hosting                             | 静态 Web 页面托管                       |
  | 🔎 A/B测试<br/>（通过对比两个版本（A 和 B）来找出哪一个效果更好的实验方法。） | Firebase Remote ConfigFirebase A/B Testing   | 远程动态配置，用户实验测试              |

  | 平台    | 支持 [**Firebase**](https://firebase.google.com/?hl=zh-cn) 吗？ |
  | ------- | ------------------------------------------------------------ |
  | Android | ✅ 全面支持                                                   |
  | iOS     | ✅ 全面支持（推送需接入 APNs）                                |
  | Web     | ✅ 支持                                                       |
  | Flutter | ✅ 有官方 SDK 支持                                            |
  | Unity   | ✅ 支持游戏开发                                               |
  | C++     | ✅ 支持部分模块                                               |

### 9、📂Dart.Flutter系统文件目录 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 9.1、`~/.pub-cache/hosted/pub.dev/`

* 存放从 [**pub.dev**](https://pub.dev) 下载的所有依赖包源码（包括版本号）

* 🉑删除，操作后不会影响当前项目；**下次运行 `flutter pub get` 会重新联网下载所有依赖**；

  * ```shell
    /// 自动清除损坏的包；
    /// 检查依赖完整性；
    /// 重新下载丢失的或损坏的包；
    flutter pub cache repair
    ```

  * ```shell
    rm -rf ~/.pub-cache/hosted/pub.dev/*
    flutter pub get
    ```

  | 项目             | `flutter pub cache repair`    | `rm -rf ~/.pub-cache/hosted/pub.dev/* && flutter pub get` |
  | ---------------- | ----------------------------- | --------------------------------------------------------- |
  | ✅ 是否清除缓存   | ✔️ 清除损坏/异常的包（选择性） | ✔️ 全部清除（暴力删）                                      |
  | ✅ 是否重新下载   | ✔️ 仅下载缺失或损坏的包        | ✔️ 全部重新下载                                            |
  | ✅ 是否保留正常包 | ✔️ 会保留未损坏的包            | ❌ 全部删除                                                |
  | ✅ 安全性         | ✔️ 官方支持，保守修复          | ⚠️ 有风险，完全清空，依赖全部重拉                          |
  | ✅ 使用场景       | 依赖异常、下载中断、构建失败  | 彻底清理后重建缓存、解决极端冲突                          |

#### 9.2、`~/.pub-cache/`

| 路径                           | 说明                                                  | 是否可删                           |
| ------------------------------ | ----------------------------------------------------- | ---------------------------------- |
| `~/.pub-cache/hosted/pub.dev/` | 来自 pub.dev 的所有 Dart 包缓存                       | ✅ 可删，`pub get` 会自动恢复       |
| `~/.pub-cache/git/`            | 通过 Git 安装的包                                     | ✅ 可删，自动恢复                   |
| `~/.pub-cache/bin/`            | 全局安装的 Dart 命令行工具（如 `webdev`, `melos` 等） | ⚠️ 慎删，删了要重新 global activate |
| `~/.pub-cache/_temp/`          | 临时下载缓存                                          | ✅ 安全清理                         |

#### 9.3、`~/.flutter/`

| 路径          | 说明                                            | 是否可删                            |
| ------------- | ----------------------------------------------- | ----------------------------------- |
| `~/.flutter/` | Flutter 工具缓存（例如 Flutter Web 的调试资源） | ✅ 可删，运行任何 flutter 命令会重建 |

#### 9.4、`~/Library/Flutter/` （按需出现，非必备）

> 这个目录只有在你满足以下条件时才会出现：
>
> | 条件                                       | 描述                                                |
> | ------------------------------------------ | --------------------------------------------------- |
> | 使用 macOS 且执行过 `flutter precache`     | 会拉取一些 Flutter tools 缓存到 `~/Library/Flutter` |
> | 使用过 Flutter Web / Desktop               | 某些构建产物可能会缓存到这里                        |
> | 安装了某些 Flutter 插件（如 Firebase CLI） | 可能写入配置文件                                    |
>
> 👉 **没使用或未触发以上行为，该路径就不会创建。**

| 路径                 | 说明                          | 是否可删                           |
| -------------------- | ----------------------------- | ---------------------------------- |
| `~/Library/Flutter/` | macOS 专属的 Flutter 工具缓存 | ✅ 可删，Flutter 会重新拉取所需工具 |

#### 9.5、`~/.dart/`

> Dart CLI 的缓存目录，只有在以下情况出现时才会生成：
>
> | 条件                                         | 描述                                |
> | -------------------------------------------- | ----------------------------------- |
> | 独立安装过 Dart SDK（非 Flutter 自带）       | 例如通过 `brew install dart`        |
> | 使用 Dart CLI 创建项目或执行过 `dart pub`    | 如 `dart create`、`dart run` 等命令 |
> | 使用 `dart pub global activate` 安装过全局包 | 如 `melos`、`webdev` 等工具         |
>
> 👉 **如果你是通过 Flutter 安装的 Dart，并且一直是用 `flutter pub`，那这个目录压根不会创建。**

| 路径       | 说明                                           | 是否可删                                           |
| ---------- | ---------------------------------------------- | -------------------------------------------------- |
| `~/.dart/` | Dart SDK 和 tools 的缓存（部分版本依赖此目录） | ⚠️ 慎删，如果你使用 dart CLI 频繁切换 SDK，建议保留 |

### 10、📂**Dart.Flutter项目文件（夹）** <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

  * [**FVM**](https://fvm.app/) 相关

    | 路径                         | 说明                                         | 是否可删                       |
    | ---------------------------- | -------------------------------------------- | ------------------------------ |
    | `~/.fvm/`                    | Flutter Version Management 的所有 SDK 存放地 | ⚠️ 慎删，删了旧版本就无法使用   |
    | `.fvm/flutter_sdk`（项目内） | 指向 fvm Flutter SDK 的软链接                | ✅ 清理前确保不是当前项目使用中 |

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

### 11、注解 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>
<font color=red>注解（以`@JsonSerializable() `为例） 🆚 OC 分类（Category）</font>

* 确实都达到了**在不改动原类结构下，增加功能**的目的

    📌 相同点

  | 特点                          | @JsonSerializable()（Flutter） | Category（Objective-C） |
  | ----------------------------- | ------------------------------ | ----------------------- |
  | ✅ 不改动类的核心逻辑          | 是                             | 是                      |
  | ✅ 给类“加功能”                | 是（加上了 JSON 能力）         | 是（加方法或属性）      |
  | ✅ 使用时像“声明一个注解/扩展” | 是                             | 是                      |
  | ✅ 开发者不用手写大量样板代码  | 是                             | 是                      |

    ❌ 不同点（本质机制不一样）

  | 特点           | @JsonSerializable()（Dart）    | Category（Obj-C）               |
  | -------------- | ------------------------------ | ------------------------------- |
  | ⚙️ 本质         | 靠代码生成器自动生成 Dart 代码 | 运行时动态将方法加入类          |
  | 📦 产物         | 编译阶段生成 `.g.dart` 文件    | 运行时加入新方法映射表          |
  | 🔧 工作时机     | 编译阶段（build_runner）       | 运行时（Objective-C runtime）   |
  | 🧠 类型系统影响 | 有静态类型检查                 | 无类型检查，靠 runtime dispatch |
  | 📄 新增文件     | 会生成新文件                   | 不会生成新文件                  |

### 12、Dart抽象类+`factory` 构造函数 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> Dart 中的抽象类可以定义 `factory` 构造函数，它不能直接被实例化，但可以通过这个 `factory` 返回子类对象或其他实例，从而起到**工厂方法（类方法）+ 构造器**的双重作用。

  * Dart.Flutter单例的全部写法

    | 使用场景            | 推荐写法                           |
    | ------------------- | ---------------------------------- |
    | 简单工具类          | `factory` + 私有构造函数懒汉式     |
    | 资源敏感/要懒加载   | `factory` + `??=` 初始化           |
    | 大型项目 / 解耦依赖 | 使用 `GetIt` / `riverpod` 管理单例 |
    | 多类型缓存管理      | 泛型单例封装模板                   |

    * ✅ 最推荐写法（懒汉式 + 工厂构造）

      ```dart
      class Singleton {
        static Singleton? _instance;

        Singleton._internal(); // 私有构造函数

        factory Singleton() {
          return _instance ??= Singleton._internal();
        }

        void doSomething() {
          print('Doing something...');
        }
      }
      ```

    * 📌 饿汉式（类加载就创建）

      ```dart
      class Singleton {
        static final Singleton _instance = Singleton._internal();

        Singleton._internal();

        factory Singleton() => _instance;
      }
      ```

    * 📌 静态变量初始化（等效饿汉）

      ```dart
      class Singleton {
        Singleton._(); // 私有构造

        static final Singleton instance = Singleton._();

        void foo() => print('Singleton foo');
      }
      ```

      ```dart
      Singleton.instance.foo();
      ```

    * 📌 懒汉式 getter（懒加载写法）

      ```dart
      class Singleton {
        static Singleton? _instance;

        Singleton._();

        static Singleton get instance {
          return _instance ??= Singleton._();
        }
      }
      ```

    * 📌 Dart 单例完整封装模板（带线程安全/泛型支持）

      ```dart
      class Singleton<T> {
        static final Map<Type, Object> _cache = {};

        Singleton._();

        static T getInstance<T>(T Function() creator) {
          if (_cache.containsKey(T)) return _cache[T] as T;
          final instance = creator();
          _cache[T] = instance as Object;
          return instance;
        }
      }
      ```

      ```dart
      class MyService {
        void sayHi() => print("Hi");
      }

      final service = Singleton.getInstance(() => MyService());
      ```

    * 📌 使用 GetIt 实现全局单例（推荐用于大型项目）

      ```dart
      import 'package:get_it/get_it.dart';
      
      final getIt = GetIt.instance;
      
      class MyService {
        void doWork() => print("Working...");
      }
      
      void setup() {
        getIt.registerLazySingleton(() => MyService());
      }
      ```

      ```dart
      // 使用：
      void example() {
        getIt<MyService>().doWork();
      }
      ```

### 13、<font color=red>**abstract**</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 1️⃣ 防止被实例化
>
> 2️⃣ 不能背继承
>
> 常用于**纯静态工具类或常量容器类**的定义。提升代码的可读性和语义安全性，是一种更严谨的推荐写法

### 14、Comparable <font color=red><b>&lt;T&gt;</b></font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 1️⃣ Dart 中的一个接口（mixin），表示 **“可比较”类型**
>
> 2️⃣ 用于支持排序、查找、比较等操作
>
> 3️⃣ 触发`compareTo()`的几个方式：<u>使用 `List.sort()` 排序</u>、<u>使用 `<`、`>`, `<=`, `>=`</u>、<u>`Comparable.compare(a, b)`</u>、<u>显示调用</u>

```dart
Comparable.compare(a, b)
```

  * 返回 **负数**：表示 `a < b`

  * 返回 **0**：表示 `a == b`

  * 返回 **正数**：表示 `a > b`

### 15、**纯静态类** 的（常见）写法 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 1️⃣ Dart.Flutter里面没有反射（尤其是 release 模式）根本不支持 `dart:mirrors`（导入报错）
>
> 2️⃣ 但是在Dart里面却可以有反射，可以绕过去。从语法层面来讲，使用 `enum`最安全。而事实上，因为Flutter不存在反射机制，所以下列3种写法都是安全的
>
> 3️⃣ 如果只关注 Flutter | 用 `class Xxx._();` 就够了 ✅ ；如果写的是 Dart 公共包 / 命令行工具 / 未来也考虑服务端，那么用 `enum Xxx { ; }` 会更加的保险 ✅✅✅

* 私有构造函数方式（最常见）

  > 1️⃣ 明确表达“不能实例化”
  >
  > 2️⃣ 类中只能包含 `static` 内容
  >
  > 3️⃣ Dart版本要求 ≥ 2.0

  ```dart
  class AppUtils {
    AppUtils._(); // 私有构造函数，防止外部实例化

    static void doSomething() {
      print('Doing something...');
    }

    static const version = '1.0.0';
  }
  ```

* 使用 `abstract class`

  > 1️⃣ `abstract class` 不能被实例化
  >
  > 2️⃣ 不需要写私有构造函数
  >
  > 3️⃣ 类中只能写 `static` 成员（因为没法 new）
  >
  > 4️⃣ Dart版本要求 ≥ 2.0

  ```dart
  abstract class AppUtils {
    static void doSomething() {
      print('Doing something...');
    }

    static const version = '1.0.0';
  }
  ```

* 使用 `enum`

  > 1️⃣ enum 自带防实例化特性
  >
  > 2️⃣ `;` 是 Dart 2.17+ 的语法，用于声明一个空的枚举体
  >
  > 3️⃣ 更安全，彻底禁止构造
  >
  > 4️⃣ Dart版本要求 ≥ 2.17

  ```dart
  enum AppUtils {
    ; // Dart 2.17 允许空 enum 表达静态工具类
  
    static void doSomething() {
      print('Doing something...');
    }
  
    static const version = '1.0.0';
  }
  ```

### 16、剪切板  <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

| 操作                                     | 可同步剪贴板？ | 方向   |
| ---------------------------------------- | -------------- | ------ |
| 在 **macOS 上复制**，到 iOS 模拟器中粘贴 | ✅ 可以         | 💻 ➜ 📱  |
| 在 **iOS 模拟器中复制**，到 macOS 上粘贴 | ❌ 不行         | 📱 🚫➜ 💻 |

## 四、FAQ <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

* **`call()`**

  ```dart
  void sayHello() {
    print("Hello!");
  }

  void main() {
    var fn = sayHello;
    fn();        // ✅ 传统写法：调用函数
    fn.call();   // ✅ 等价写法：显式调用 call 方法
  }
  ```

  ```dart
  /// 甚至可以重写 call 方法
  class Greeter {
    void call() {
      print("Hi, I'm callable!");
    }
  }

  void main() {
    var g = Greeter();

    g();        // ✅ 像函数一样调用
    g.call();   // ✅ 等价写法
  }
  ```

* ✅什么是`ScrollController`?

  * ✅ Flutter 与 iOS 滚动控制对照总表

    | 用途 / 功能                          | Flutter (`ScrollController`)                                 | iOS (`UIScrollView + Delegate`)                       |
    | ------------------------------------ | ------------------------------------------------------------ | ----------------------------------------------------- |
    | **获取滚动位置**                     | `controller.offset`                                          | `scrollView.contentOffset`                            |
    | **监听滚动事件**                     | `controller.addListener()`                                   | `scrollViewDidScroll:` 等代理方法                     |
    | **判断是否滚动到底部/顶部**          | `controller.position.atEdge` + `offset` 判断                 | 手动判断 `contentOffset + frame.size` 🆚 `contentSize` |
    | **跳转/动画滚动到指定位置**          | `controller.jumpTo()` / `animateTo()`                        | `setContentOffset:animated:`                          |
    | **控制多个滚动同步**                 | 多个组件使用同一个 `ScrollController`                        | KVO / 通知 / delegate 绑定多个 `scrollView`           |
    | **搭配滚动组件（如 Scrollbar）使用** | 与 `Scrollbar`、`DraggableScrollbar`、`NestedScrollView` 联动 | 与系统滚动指示器自动联动，无需手动控制                |
    | **监听滚动边界 / 弹性状态**          | `controller.position` 里的 `extentBefore` / `extentAfter`    | 手动判断 `contentOffset` 与边界                       |
    | **滚动停止/开始等状态监听**          | `ScrollNotification`（更细粒度）                             | `scrollViewWillBeginDragging:` 等代理方法             |
    | **是否滚动中 / 拖拽中**              | `controller.position.isScrollingNotifier`                    | `scrollView.isDragging`、`isDecelerating`             |

  * 📌 总结对比重点：

    | 特性                            | Flutter                                      | iOS                                      |
    | ------------------------------- | -------------------------------------------- | ---------------------------------------- |
    | 控制 & 监听是否分离             | 合在 `ScrollController` 或通知               | 控制靠 `scrollView`，监听靠 delegate     |
    | 联动滚动是否简便                | 非常方便，多个组件绑定同一个 controller 即可 | 比较麻烦，需要同步多个 scrollView 的状态 |
    | 滚动状态判定是否易用            | `position` 属性丰富，封装完好                | 需要自己计算或判断                       |
    | 可拓展性是否强（嵌套 / 自定义） | 非常强，如 `NestedScrollView`                | 一般，需要手动组合                       |

  * 示例代码：

    ```dart
    /// 监听和滚动到某个位置
    class ScrollControllerDemo extends StatefulWidget {
      @override
      _ScrollControllerDemoState createState() => _ScrollControllerDemoState();
    }
    
    class _ScrollControllerDemoState extends State<ScrollControllerDemo> {
      final ScrollController _controller = ScrollController();
    
      @override
      void initState() {
        super.initState();
    
        // ✅ 添加滚动监听
        _controller.addListener(() {
          print('当前滚动位置: ${_controller.offset}');
        });
      }
    
      @override
      void dispose() {
        _controller.dispose(); // ✅ 别忘了释放
        super.dispose();
      }
    
      void _scrollToTop() {
        _controller.animateTo(
          0.0, // 目标 offset
          duration: Duration(milliseconds: 500),
          curve: Curves.easeOut,
        );
      }
    
      void _scrollToBottom() {
        _controller.animateTo(
          _controller.position.maxScrollExtent, // 最大可滚动距离
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    
      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(title: Text('ScrollController 示例')),
          body: Column(
            children: [
              Row(
                children: [
                  TextButton(onPressed: _scrollToTop, child: Text('回到顶部')),
                  TextButton(onPressed: _scrollToBottom, child: Text('滑到底部')),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  controller: _controller, // ✅ 绑定控制器
                  itemCount: 50,
                  itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
                ),
              ),
            ],
          ),
        );
      }
    }
    ```

    ```dart
    /// 多个组件同步滚动
    final controller = ScrollController();
    
    Row(
      children: [
        Expanded(
          child: ListView(controller: controller, ...),
        ),
        Expanded(
          child: ListView(controller: controller, ...), // 同一个控制器！
        ),
      ],
    )
    ```

* ✅什么是`external`?

  > 这个方法没有在 Dart 层实现，而是由 Dart VM 或平台原生层提供实现。

* ✅为什么**Dart.Flutter**禁止反射机制？

  👉 是为了保证 **更快启动、更小体积、更高性能的移动应用体验**，这是设计上的取舍

  * **AOT 无法支持动态反射**

    [官方文档说明](https://github.com/flutter/flutter/issues/2072)：“<u>We have no plans to support dart:mirrors in Flutter.</u>”

    ```dart
    import 'dart:mirrors'; // ❌ 直接报错：Unsupported in Flutter
    ```

    反射意味着：

    - 动态调用方法（通过字符串方法名）
    - 动态创建对象（通过类名字符串）
    - 动态读取字段（通过字符串字段名）

    这要求 Dart 在运行时 **保留所有类型信息** 和 **方法表**，但 AOT 编译时会：

    - ✅ **去掉未用代码（Tree Shaking）**
    - ✅ **剥离类型信息来压缩包体积**
    - ✅ **只保留被静态调用的代码路径**

    ➡️ 所以 **反射需要的运行时信息根本就被编译器优化掉了**。

  * **`dart:mirrors` 会极大增加体积和启动时间**

    * Flutter 官方测试显示：
       **启用 dart:mirrors 会增加几 MB 的包大小**（尤其是 iOS）
    * 启动速度也会明显变慢，因为要加载大量元信息

  * 替代反射

    <font color=red>用的这些 `@JsonSerializable()`、`build_runner` 代码生成，其实就是“用静态代码生成”来**替代反射能做的那些事**。</font>

    | 目的        | Flutter 推荐做法                        |
    | ----------- | --------------------------------------- |
    | JSON 转换   | 用 `json_serializable` 生成代码代替反射 |
    | 路由注册    | 用静态表 / 自动生成路由注册             |
    | AOP（切面） | 用 codegen 或封装中间件实现             |
    | 服务定位    | 用 `GetIt` 或 `provider` 的静态注入机制 |

* <font id=Shell页面>✅什么是**Shell**页面？</font>

  > **Shell 页面就是你 App 的“主骨架页面”**，它负责承载内容、管理导航结构，而不是展示具体业务数据。

  在 iOS 中等同于：

  - `UITabBarController`
  - `UINavigationController`
  - 或者你自定义的“主容器 + 内容页切换框架”

* <font id=模态>✅ 什么是**模态**？</font>

  > 1️⃣ 指的是一种**强制用户完成某个操作或关闭弹窗之后，才能继续与页面其他部分交互**的界面方式。
  >
  > 2️⃣ 能防止用户误操作，也用于强调重要性
  >
  > 🔒 特点是：**阻断交互**。一旦出现模态界面：
  >
  > - 背后的内容变灰或被遮罩；
  > - 用户无法点击、滚动、与其他界面交互；
  > - 只能操作弹出的模态框（如“确定”或“取消”）；
  > - 关闭弹窗后，才能回到原界面。

