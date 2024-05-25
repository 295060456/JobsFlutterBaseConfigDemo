
class CacheKey {

  /// 登陆账号
  static const String userDataKey = "user_data_key";

  /// 网络代理
  static const String appProxy = "app_proxy";

  /// 搜索历史记录
  static const String searchHistory = 'searchHistory';

  /// 赔率格式
  static const String oddsType = 'odds_type';

  /// 赔率内容
  static const String oddsString = 'odds_string';

  /// 语言
  static const String langType = 'lang_type';

  /// 语言
  static const String langString = 'lang_string';

  static const String clientIdKey = 'clientIdKey';
  static const String selectedCoin = 'selected_coin';

  ///记录是否是首次启动app
  static const String firstInstallApp = 'install_app_key';
  ///tiktok 埋点统计
  static const String installApp = 'InstallApp';
  static const String launchApp = 'LaunchAPP';
  static const String loginApp = 'Login';
  static const String registrationApp = 'Registration';
  //是否展示余额 默认展示
  static const String isHiddenBalance = "isHiddenBalance";
  //锁定到期时间
  static const String expireAt = "expireAt";
}
