
// 判断两个集合是否相等
Set<dynamic> set1 = {"USD", "EUR", "GBP"};
Set<dynamic> set2 = {"USD", "EUR", "GBP", "JPY"};
// ignore: non_constant_identifier_names
bool OK = set1.containsAll(set2) && set2.containsAll(set1);

typedef InstanceBuilderCallback<S> = S Function();

// Get.lazyPut
// Get.find
// GetPage

// GetPage(
//   name: _Paths.WALLET,
//   page: () => WalletView(),
//   binding: WalletBinding(),
// ),

// class WalletBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<WalletController>(
//       () => WalletController(),
//       你可以在这里添加更多的依赖
//     );
//   }
// }

// binding参数是一个继承自Bindings的类实例。
// 它的主要职责是依赖注入（Dependency Injection）。
// 在GetX中，binding用于在页面初始化时，将Controller、Repository和其他依赖项注入到页面中

// 在这个例子中，WalletBinding类定义了页面的依赖。
// 当页面被创建时，GetX会自动调用dependencies方法，
// 将WalletController实例化并注入到依赖树中。

// 将page和binding分开有几个好处：
// 关注点分离：page只负责UI，binding只负责依赖注入和状态管理。这样使得代码更加模块化和可维护。
// 懒加载：binding允许依赖在需要的时候才加载（比如通过Get.lazyPut）。这样可以提升应用性能，避免不必要的资源消耗。
// 更好的测试性：将依赖注入逻辑和UI逻辑分开，使得每一部分更容易测试。你可以单独测试Controller和其他逻辑，而不必依赖于UI部分。
// 复用性：相同的binding可以在不同的页面中复用。这样你可以创建共享的依赖逻辑，不需要在每个页面中重复编写相同的注入代码。
