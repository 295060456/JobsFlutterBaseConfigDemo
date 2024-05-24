import 'dart:convert';
import 'package:flutter_bet/services/account_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/app_cache_key.dart';
import '../model/wallet/CurrencyBean.dart';

class SPUtil{

  //创建工厂方法
  static SPUtil? _instance;
  factory SPUtil() => _instance ??= SPUtil._initial();
  SharedPreferences? _preferences;
  //创建命名构造函数
  SPUtil._initial() {
    //为什么在这里需要新写init方法 主要是在命名构造中不能使用async/await
    init();
  }
  //初始化SharedPreferences
  void init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  //到这里还没有完 有时候会遇到使用时提示 SharedPreferences 未初始化,所以还需要提供一个static 的方法
  static Future<SPUtil?> perInit() async {
    if (_instance == null) {
      //静态方法不能访问非静态变量所以需要创建变量再通过方法赋值回去
      SharedPreferences preferences = await SharedPreferences.getInstance();
      _instance = SPUtil._pre(preferences);
    }
    return _instance;
  }
  SPUtil._pre(SharedPreferences prefs) {
    _preferences = prefs;
  }
  ///设置String类型的
  void setString(key, value) {
    _preferences?.setString(key, value);
  }
  ///设置setStringList类型的
  void setStringList(key, value) {
    _preferences?.setStringList(key, value);
  }
  List<String> getStringList(key) {
    return _preferences?.getStringList(key) ?? [];
  }
  ///设置setBool类型的
  void setBool(key, value) {
    _preferences?.setBool(key, value);
  }
  bool? getBool(key) {
    return _preferences?.getBool(key);
  }
  int? getInt(key) {
    return _preferences?.getInt(key);
  }
  String? getString(key) {
    return _preferences?.getString(key);
  }
  ///设置setDouble类型的
  void setDouble(key, value) {
    _preferences?.setDouble(key, value);
  }
  ///设置setInt类型的
  void setInt(key, value) {
    _preferences?.setInt(key, value);
  }
  ///存储Json类型的
  void setJson(key, value) {
    value = jsonEncode(value);
    _preferences?.setString(key, value);
  }
  ///通过泛型来获取数据
  T? get<T>(key) {
    var result = _preferences?.get(key);
    if (result != null) {
      return result as T;
    }
    return null;
  }
  ///获取JSON
  Map<String, dynamic>? getJson(key) {
    String? result = _preferences?.getString(key);
    if(result != null) {
      if (result!.isNotEmpty) {
        return jsonDecode(result!);
      }
    }
    return null;
  }

  // 保存CurrencyBean对象
  Future<void> saveCurrencyBean(CurrencyBean? user) async {
    String uid = AccountService.sharedInstance.currentUser?.uid??"";
    if(uid.isEmpty){
      return;
    }
    // 将User对象转换为JSON字符串
    String userJson = json.encode(user?.toJson());
    // 保存JSON字符串到SharedPreferences
    await _preferences?.setString("${CacheKey.selectedCoin}$uid", userJson);
  }

// 读取CurrencyBean对象
  CurrencyBean? getCurrencyBean() {
    String uid = AccountService.sharedInstance.currentUser?.uid??"";
    if(uid.isEmpty){
      return null;
    }
    // 获取存储的JSON字符串
    String? userJson = _preferences?.getString("${CacheKey.selectedCoin}$uid");
    // 如果有数据，则转换为User对象
    if (userJson != null) {
      return CurrencyBean.fromJson(json.decode(userJson));
    }
    return null;
  }
  ///文中的StringUtil中的isNotEmpty的判断
  ///  static isNotEmpty(String? str) {
  /// return str?.isNotEmpty ?? false;
  /// }
  ///清除全部
  void clean() {
    _preferences?.clear();
  }
  ///移除某一个
  void remove(key) {
    _preferences?.remove(key);
  }
}