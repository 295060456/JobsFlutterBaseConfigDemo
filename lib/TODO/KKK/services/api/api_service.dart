import 'dart:convert';
import 'package:flutter_bet/model/notifis/notification.dart';
import 'package:flutter_bet/services/branch/branch_service.dart';
import 'package:flutter_bet/utils/http/http_config.dart';
import 'package:flutter_bet/utils/http/http_engine.dart';
import 'package:flutter_bet/utils/http/http_response.dart';
import 'package:flutter_bet/utils/sp_util.dart';
import 'package:flutter/material.dart';
import '../../constant/app_cache_key.dart';
import 'business_interceptor.dart';
import 'default_http_transformer.dart';

typedef Success<T> = Function(T data);
///旧代码使用这个，有一个弊端，无法识别是200 还是非200 的异常
typedef Fail = Function(String? message);
///新定义一个回调函数，isConnect是否连接正常，200为true， 非200为false， message异常信息， candy请求甜点，本次请求异常可以带回给错误回调
typedef Failed = Function(bool isConnect ,String? message, dynamic candy);

class ApiService {
  HttpEngine? $engine;

  static ApiService? _instance;

  static ApiService _getInstance() {
    _instance ??= ApiService();
    return _instance!;
  }

  static ApiService get instance => _getInstance();

  ApiService() {
    String? proxy = SPUtil().get<String>(CacheKey.appProxy);
    final branch = BranchService.instance;
    final config = HttpConfig(branch.current.api_url,
        interceptors: [BusinessInterceptor()],
        format: DefaultHttpTransformer(),
        connectTimeout: 15 * 1000,
        proxy: proxy);
    $engine = HttpEngine.instance(config);
  }

  void setProxy({required String? proxy, VoidCallback? onSuccess, VoidCallback? onFail}) {
    final branch = BranchService.instance;
    try {
      HttpEngine.destroy();
      $engine = null;
      final config = HttpConfig(branch.current.api_url,
          interceptors: [BusinessInterceptor()],
          format: DefaultHttpTransformer(),
          connectTimeout: 15 * 1000,
          proxy: proxy);
      $engine = HttpEngine.instance(config);
      SPUtil().setString(CacheKey.appProxy, proxy!);
      if (onSuccess != null) {
        onSuccess();
      }
    } catch (e) {
      if (onFail != null) {
        onFail();
      }
    }
  }

  // String getToken() {
  //   return SPUtil().get<String>(CacheKey.apiToken) ?? '';
  // }

  String? getProxy() {
    return $engine?.getProxy();
  }

}
