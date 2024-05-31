import 'package:flutter/cupertino.dart';
import 'package:flutter_bet/constant/app_cache_key.dart';
import 'package:flutter_bet/model/user.dart';
import 'package:flutter_bet/model/wallet/BalanceBean.dart';
import 'package:flutter_bet/services/api/api_service.dart';
import 'package:flutter_bet/services/api/extension/account_api_service.dart';
import 'package:flutter_bet/utils/sp_util.dart';
import 'package:get/get.dart';

import '../pages/account/login/login_widget.dart';
import '../routes/routes.dart';

/// 处理账号登陆相关的问题
class AccountService {
  // 如果一个函数的构造方法并不总是返回一个新的对象的时候，可以使用factory，
  // 比如从缓存中获取一个实例并返回或者返回一个子类型的实例

  // 工厂方法构造函数
  factory AccountService() => _getInstance();

  // instance的getter方法，通过AccountService.instance获取对象
  static AccountService get sharedInstance => _getInstance();

  // 静态变量_instance，存储唯一对象
  static AccountService? _instance;

  int lastGetBalanceTime = 0; //记录最后一次获取余额的时间戳

  // 私有的命名式构造方法，通过它可以实现一个类可以有多个构造函数，
  // 子类不能继承internal不是关键字，可定义其他名字
  AccountService._internal() {
    // 初始化
    initAsync();
  }

  //当前的user对象
  User? _user;

  final listeners = <AccountServiceListener>[];

  // final GlobalStateController globalController = Get.find<GlobalStateController>();

  // 获取对象
  static AccountService _getInstance() {
    _instance ??= AccountService._internal();
    return _instance!;
  }

  /// 异步初始化
  Future initAsync() async {
    final userMap = SPUtil().getJson(CacheKey.userDataKey);
    if (userMap != null) {
      _user = User.fromJson(userMap!);
    }
  }

  /// 当前登陆的User
  User? get currentUser {
    // _user ??= SpUtil.getObj(CacheKey.userDataKey, (m) => User.fromJson(m as Map<String, dynamic>));
    if (_user == null) {
      final userMap = SPUtil().getJson(CacheKey.userDataKey);
      if (userMap != null) {
        _user = User.fromJson(userMap!);
      }
    }
    return _user;
  }

  Future<void> addListener(AccountServiceListener listener) async {
    if (listeners.contains(listener)) return;
    listeners.add(listener);
  }

  Future<void> removeListener(AccountServiceListener listener) async {
    if (!listeners.contains(listener)) return;
    listeners.remove(listener);
  }

  /// 用户登陆
  ///
  /// * [user] 登陆用户的信息
  void loginUser(User user) {
    // 存储用户数据
    saveUserInfo(user);
    for (AccountServiceListener listener in listeners) {
      if (listener.onLoginSuccess != null) {
        listener.onLoginSuccess!(user);
      }
    }
  }

  void saveUserInfo(User user) {
    if (_user != null && _user?.uid == user.uid && user.token == null) {
      final newUser = user.copyWith(token: _user!.token);
      _user = newUser;
    } else {
      _user = user;
    }
    SPUtil().setJson(CacheKey.userDataKey, _user!.toJson());
  }

  User getUserInfo(){
    Map<String, dynamic>? json = SPUtil().getJson(CacheKey.userDataKey);
    return User.fromJson(json!);
  }

  Future<void> refreshUserInfo({String? t}) async {
    String token = t ?? (AccountService.sharedInstance.currentUser?.token ?? '');
    if (token.isEmpty) return;
    final response = await ApiService.instance.getUserInfo(
        token: token,
        success: (user) {
          final newUser = user.copyWith(token: token!);
          AccountService.sharedInstance.loginUser(newUser);
        },
        fail: (String? message) {});
    if (response.ok) {
      for (AccountServiceListener listener in listeners) {
        if (listener.onUserInfoChange != null) {
          listener.onUserInfoChange!(_user!);
        }
      }
    }
  }

  ///获取用户余额信息
  Future<void> getBalance({
    required Success<BalanceBean> success,
    required Fail fail,
  }) async {
    int nowTime = DateTime.now().millisecondsSinceEpoch;
    if (nowTime - lastGetBalanceTime > 5 * 1000) {
      await ApiService.instance.getBalance(success: (balanceBean) {
        success(balanceBean);
        lastGetBalanceTime = DateTime.now().millisecondsSinceEpoch;
      }, fail: (String? message) {
        fail(message);
        lastGetBalanceTime = DateTime.now().millisecondsSinceEpoch;
      });
    }
  }

  Future<void> getBalanceN({
    required Success<BalanceBean> success,
    required Fail fail,
  }) async {
    await ApiService.instance.getBalance(success: (balanceBean) {
      success(balanceBean);
    }, fail: (String? message) {
      fail(message);
    });
  }

  void onUserTokenInvalid() {
    for (AccountServiceListener listener in listeners) {
      if (listener.onTokenInvalid != null) {
        listener.onTokenInvalid!();
      }
    }
    clearUser();
  }

  Future<void> pushToLoginPage(BuildContext context) async {
    // RouteUtil.pushToView(Routes.loginPage);
    showCustomLoginWidget(context: context);
  }

  /// 退出登录
  Future<void> logoutUser() async {
    await ApiService.instance.logout(success: (message) {}, fail: (message) {});
    clearUser();
    Get.until((route) => Get.currentRoute == Routes.mainPage);
  }

  void clearUser() {
    // // 清除账号信息
    for (AccountServiceListener listener in listeners) {
      if (listener.onLogout != null) {
        listener.onLogout!();
      }
    }
    _user = null;
    SPUtil().remove(CacheKey.userDataKey);
  }

  bool isLogin() {
    return _user != null && _user?.token != null;
  }
}

typedef AccountServiceOnUserInfoChange = void Function(User model);
typedef AccountServiceOnLoginSuccess = void Function(User model);
typedef AccountServiceOnLogout = Function();
typedef AccountServiceOnTokenInvalid = Function();

class AccountServiceListener {
  AccountServiceOnUserInfoChange? onUserInfoChange;
  AccountServiceOnLoginSuccess? onLoginSuccess;
  AccountServiceOnLogout? onLogout;
  AccountServiceOnTokenInvalid? onTokenInvalid;

  AccountServiceListener({
    this.onUserInfoChange,
    this.onLogout,
    this.onLoginSuccess,
    this.onTokenInvalid,
  });
}
