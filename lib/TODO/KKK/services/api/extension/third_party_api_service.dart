import 'package:dio/dio.dart';
import 'package:flutter_bet/services/api/api_service.dart';
import 'package:flutter_bet/services/device_service.dart';
import 'package:flutter_bet/utils/http/http_engine.dart';
import 'package:flutter_bet/utils/http/http_response.dart';
import 'package:dio/dio.dart' as dio;

extension ThirdPartyApiService on ApiService {

  ///三方登录-取得三方的OAuth网址-neil
  ///member/third/auth/google/url 调用 url 接口，
  ///auth/随机id 订阅推送，接收推送内容，根据"action": "success",
  ///动作指令, register:呼叫三方注册, error:发生错误, success: 返回登入后的 token 判断操作，
  ///register 打开 输入用户名（邮箱如果没有返回就显示输入邮箱），
  ///在调用接口}/member/third/register
  Future<HttpResponse> goToThirdParty(String type,{
    required Success<String> success,
    required Fail fail,
  }) async {
    Options options = dio.Options(headers: {'state': DeviceService.instance.getDeviceId(),'device_no': DeviceService.instance.getDeviceId(),'dnb': DeviceService.instance.getDeviceId()});
    String path = "/member/third/auth/$type/url";
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path, options: options
    );
    if (response.ok && response.statusOk) {
      success(response.data);
    } else {
      if (response.error?.message != null) {
        fail(response.error?.message);
      }
    }
    return response;
  }
}
