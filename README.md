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

### 1、<a href="#极光原生推送" style="font-size:17px; color:green;"><b>极光原生推送</b></a>封装的全局打印（🧨强烈推荐）<a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

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

### 3、<font color=red>**Flutter 项目中比较标准且完整的启动流程**</font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

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

### 4、[**`GetX`**](https://pub.dev/packages/get) <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

#### 4.1、[**`GetX`**](https://pub.dev/packages/get) （六种）依赖注册方式对比表 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 在不设置 `permanent: true` 的默认情况下，Get.put()、Get.lazyPut()、Get.create() 所创建的对象，**生命周期都不会永久保留**，用完就“没了”或“会被释放”，只不过：
>
> - `put`/`lazyPut` 是**缓存后可能释放**；
> - `create` 是**压根就不缓存**，用一次 new 一次。

|       特性       | <font color=red>`Get.put()`</font>                 | <font color=red>`Get.putAsync()`</font>            | <font color=red>`Get.lazyPut()`</font>            | <font color=red>`Get.create()`</font>      | `Get.putNamed()`                | `Get.replace()`                                              |
| :--------------: | :------------------------------------------------- | -------------------------------------------------- | ------------------------------------------------- | ------------------------------------------ | :------------------------------ | ------------------------------------------------------------ |
|     具体含义     | 👉 注册**同步对象**到 GetX 容器                     | 👉 注册**异步对象**，等待 Future 完成               | 👉 注册**懒加载对象**，首次使用时才创建            | 👉 注册**非单例对象**，每次 `find()` 都新建 | 👉 注册**同类型对象（带 tag）**  | 👉 替换已注册对象，用于热更新或环境切换                       |
|     是否异步     | ❌ 否                                               | ✅ 是                                               | ❌ 否                                              | ❌ 否                                       | ❌ 否                            | ❌ 否                                                         |
|   对象创建时机   | ✅ 立即实例化                                       | ⏳ 等待异步初始化完成                               | ⏱ 首次使用时实例化                                | 每次 `find()` 都创建新实例                 | ✅ 立即实例化                    | ✅ 立即实例化                                                 |
| 是否需要 `await` | ❌ 不需要                                           | ✅ 需要 `await`                                     | ❌ 不需要                                          | ❌ 不需要                                   | ❌ 不需要                        | ❌ 不需要                                                     |
| 对象是否立即可用 | ✅ 是                                               | ❌ 初始化前不可用                                   | ❌ 首次调用前不可用                                | ❌ 每次使用都需重新创建                     | ✅ 是                            | ✅ 是                                                         |
|     是否单例     | ✅ 是（全局唯一）                                   | ✅ 是（全局唯一）                                   | ✅ 是（全局唯一）                                  | ❌ 否，每次都创建                           | ✅ 是，但每个 `tag` 是独立的单例 | ✅ 是                                                         |
|   是否自动保活   | ❌ 默认不保活<br/>**除非手动设置`permanent: true`** | ❌ 默认不保活<br/>**除非手动设置`permanent: true`** | ❌ 默认不保活<br>**除非手动设置`permanent: true`** | ❌ 不适用（不会缓存）                       | ❌ 默认不保活，需手动设置        | ✅ 会立即替换旧对象                                           |
|      常用于      | 页面 Controller、同步服务等                        | 启动阶段异步服务（如缓存、数据库）                 | 页面懒加载逻辑、节省资源                          | 弹窗、表单、临时控制器                     | 同类型多实例（如用户 A/B）      | 切换环境、热更新、动态测试                                   |
|   使用位置推荐   | 页面加载/依赖注入阶段                              | `main()` 启动阶段                                  | 页面逻辑中延迟使用                                | 动态组件、短生命周期逻辑                   | 注册同类对象到多个位置          | 测试或替换已有逻辑<br>⚠️ **使用前必须已经注册了一个旧对象**。 |

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
    final controller = Get.find<CounterController>(); // 👈 获取已注册的 Controller
  
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
    final authService = Get.find<AuthService>(); // 👈 获取异步注册后的服务
  
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
  
* **Get.lazyPut()**

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
  final manager = Get.find<HomeRequestManager>();
  ```

* **Get.create()**

* **Get.putNamed()**

* **Get.replace()**

#### 4.2、[**`GetX`**](https://pub.dev/packages/get) 的销毁机制 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

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

#### 4.3、**`GetxController`** vs **`GetView<T>`** <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

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
  > 2️⃣ 避免重复写 `final controller = Get.find<XXXController>()`
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
    final CounterController controller = Get.find<CounterController>(); // 👈 手动获取
  
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

#### 4.4、**`GetxService`** <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> `GetxService` 是 GetX 提供的**专门用于全局单例管理的服务类**，适合放一些只需要创建一次，整个 App 生命周期中都不释放的“后台服务”

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

* 注册服务

  ```dart
  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Get.putAsync<AuthService>(() => AuthService().init());
  
    runApp(MyApp());
  }
  ```

* 使用

  ```dart
  final AuthService authService = Get.find<AuthService>();
  print(authService.token);
  ```

#### 4.5、**`GetPage`** <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

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

#### 4.6、[**`GetX`**](https://pub.dev/packages/get) 路由 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

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

* 路由守卫（Route Guard / Middleware）：跳转时进行验权

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

* 非命名路由（直接跳 Widget）

  > ✅ 优点：不用提前注册页面
  > ❌ 缺点：不支持 binding、动画、中间件

  ```dart
  Get.to(ProfileView());        // 正常跳转
  Get.off(SettingsView());      // 替换当前页
  Get.offAll(LoginView());      // 清空栈后跳转
  ```

* 命名路由（推荐方式）

  > 需要配合 `GetPage` 注册

  ```dart
  Get.toNamed('/home');
  Get.offNamed('/login');
  Get.offAllNamed('/splash');
  ```

#### 4.7、基于[**`GetX`**](https://pub.dev/packages/get) 最佳实践的完整项目结构模板（项目名为：`getx_demo`） <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

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

###  5、配置首页入口 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

```dart
GetMaterialApp(
  initialRoute: AppPages.INITIAL,      // 从哪个页面开始
  initialBinding: MainBindings(),      // 启动前先注入哪些依赖
  getPages: AppPages.routes,           // 有哪些页面能被跳转
)
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
      dart_ping: ^8.0.1
    # iOS 需要单独引入
    dart_ping_ios: ^4.0.0
    ```

### 8、**SpUtil** <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

> 1️⃣ 封装原生 SharedPreferences 支持的所有类型
>
> 2️⃣ 额外支持了自定义对象（Bean）的存取

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

### 9、Comparable <font color=red><b>&lt;T&gt;</b></font> <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

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

### 12、[**OpenInstall**](https://www.openinstallglobal.com/)：移动端的安装/拉新/渠道统计 SDK

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

### 13、获取当前时间 <a href="#前言" style="font-size:17px; color:green;"><b>🔼</b></a>

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
    
  * <font color=red>**abstract**</font>

    > 1️⃣ 防止被实例化
    >
    > 2️⃣ 不能背继承
    >
    > 常用于**纯静态工具类或常量容器类**的定义。提升代码的可读性和语义安全性，是一种更严谨的推荐写法

* **纯静态类** 的（常见）写法

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

