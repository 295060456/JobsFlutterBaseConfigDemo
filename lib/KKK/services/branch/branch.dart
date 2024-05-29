// 环境配置
class Branch {
  final String asset_url;
  final String api_url;
  final List<String> ws_url;
  final String ws_prefix;

  Branch( {
    required this.asset_url,
    required this.api_url,
    required this.ws_url,
    required this.ws_prefix,
  });
}