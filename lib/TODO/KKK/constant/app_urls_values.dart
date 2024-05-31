import 'package:flutter_bet/services/branch/branch.dart';

abstract class AppUrlsValues {
  /// 获取到当前环境
  static const appEnv = String.fromEnvironment(EnvName.envKey);
  static const affidavit = true;//接口数据是否加签
  static const encryption = false;//接口数据是否加密
  static Branch get envConfig => _getEnvConfig();

  /// 根据不同环境返回对应的环境配置
  static Branch _getEnvConfig() {
    switch (appEnv) {
      case EnvName.release:
        return prod;
      case EnvName.test:
        return test;
      case EnvName.dev:
        return dev;
      default:
        return dev;
    }
  }

  // 开发环境
  static final Branch dev = Branch(
    asset_url: 'https://d2utx4nptvgikt.cloudfront.net',
    api_url: "https://www.tfdjqp.com",
    ws_url: ["wss1.tfdjqp.com:1883","wss2.tfdjqp.com:1883","wss3.tfdjqp.com:1883"],//备用 wss2.tfdjqp.com:1883  wss3.tfdjqp.com:1883
    ws_prefix: 'dev',
  );

  // 测试环境
  static final Branch test = Branch(
    asset_url: 'https://d2utx4nptvgikt.cloudfront.net',
    api_url: "https://a19576.com",
    ws_url: ["43.198.7.164:1883"],//43.198.40.130 以前fat地址
    ws_prefix: 'fat',
  );

  // 生产环境
  static final Branch prod = Branch(
    asset_url: 'https://d2utx4nptvgikt.cloudfront.net',
    api_url: "https://a01.uat.today",//https://ju88.app https://win6.com https://a01.uat.today
    ws_url: ["mqtt1.a22292.com:1883","mqtt2.a22292.com:1883"],
    ws_prefix: 'a01',//a01 a02 a03
  );
}

/// 声明的环境
abstract class EnvName {
  /// 环境key
  static const String envKey = "APP_ENV";

  /// 环境value
  static const String release = "release";
  static const String test = "test";
  static const String dev = "dev";
}
