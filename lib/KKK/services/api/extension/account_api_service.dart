import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bet/generated/l10n.dart';
import 'package:flutter_bet/model/login_log.dart';
import 'package:flutter_bet/model/page.dart';
import 'package:flutter_bet/model/user.dart';
import 'package:flutter_bet/model/wallet/BalanceBean.dart';
import 'package:flutter_bet/services/account_service.dart';
import 'package:flutter_bet/services/api/api_service.dart';
import 'package:flutter_bet/services/device_service.dart';
import 'package:flutter_bet/utils/http/http_engine.dart';
import 'package:flutter_bet/utils/http/http_response.dart';
import 'package:flutter_bet/utils/json_util.dart';

import '../../../pages/setup/2FA/google/auth_qrcode_api_model.dart';
import '../../../pages/setup/a_model/auth_config_api_model.dart';
import '../../../pages/setup/index/Brand.dart';

extension AccountApiService on ApiService {
  Future<HttpResponse> createAccount({
    required String email,
    required String username,
    required String password,
    required String parentId,
    required String birthday,
    String captcha = '',
    required Success<String> success,
    required Fail fail,
  }) async {
    var params = {
      "email": email,
      "username": username,
      "password": password,
      "device_number": DeviceService.instance.getDeviceId(),
      "parent_uid": parentId,
      "birthday": birthday,
      "captcha": captcha,
    };
    String path = "/member/reg";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok) {
      if (response.statusOk) {
        success(response.data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> createAccountWithPhone({
    required String phone,
    required String username,
    required String password,
    required String birthday,
    String captcha = '',
    required Success<String> success,
    required Fail fail,
  }) async {
    var params = {
      "phone": phone,
      "username": username,
      "password": password,
      "device_number": DeviceService.instance.getDeviceId(),
      "birthday": birthday,
      "captcha": captcha,
    };
    String path = "/member/reg";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok) {
      if (response.statusOk) {
        success(response.data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///第三方注册
  Future<HttpResponse> thirdRegister({
    required String email,
    required String username,
    required String password,
    required String parentId,
    required int thirdType,
    required String thirdId,
    required Success<String> success,
    required Fail fail,
  }) async {
    var params = {
      "email": email,
      "username": username,
      "password": password,
      "device_number": DeviceService.instance.getDeviceId(),
      "parent_uid": parentId,
      "third_type": thirdType,
      "third_id": thirdId,
    };
    String path = "/member/third/register";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok) {
      if (response.statusOk) {
        success(response.data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> login({
    required String username,
    required String password,
    required Success<String> success,
    required Fail fail,
  }) async {
    var params = {
      "username": username,
      "password": password,
      "device_number": DeviceService.instance.getDeviceId(),
    };

    String path = "/member/login";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);

    ///response是对http response脱壳处理后的实例子
    ///ok用来判断网络请求是否成功，失败则返回response.error?.message（message是国际化处理之后的文本）
    ///statusOk是后端api的status字段，失败则返回response.data（错误提示，由后端进行国际化处理
    ///statusOk为true时我们可以将response.data转成jsonModel
    if (response.ok) {
      if (response.statusOk) {
        ///直接返回token字符串
        String token = response.data;
        success(token);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 拉取用户信息
  /// 只有该接口需要传token
  Future<HttpResponse> getUserInfo({
    required String? token,
    required Success<User> success,
    required Fail fail,
  }) async {
    String path = "/member/detail";
    Options? options;
    if (token?.isNotEmpty == true) {
      options = Options();
      options.headers = {"t": token!};
    }
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      options: options,
    );

    if (response.ok && response.statusOk) {
      final user = User.fromJson(response.data);
      success(user);
    } else {
      fail(response.error?.message ?? response.data);
    }
    return response;
  }

  /// 更新用户信息
  Future<HttpResponse> updateUserInfo({
    required Map<String, dynamic> map,
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/member/update";

    final account = AccountService.sharedInstance.currentUser;
    final params = {
      "uid": '${account?.mext?.uid}',
      "record": map,
    };
    HttpResponse response = await $engine?.execute(
      Method.POST,
      path,
      data: params,
    );
    if (response.ok && response.statusOk) {
      success(response.data);
    } else {
      fail(response.error?.message ?? response.data);
    }
    return response;
  }

  /// 更新密码
  Future<HttpResponse> updatePassword({
    required String password,
    required String newPassword,
    required Success<String> success,
    required Fail fail,
  }) async {
    final params = {'password': password, 'new_password': newPassword};
    String path = "/member/password/update";
    HttpResponse response = await $engine?.execute(
      Method.POST,
      path,
      data: params,
    );

    if (response.ok && response.statusOk) {
      success(response.data);
    } else {
      fail(response.error?.message ?? response.data);
    }
    return response;
  }

  /// 退出登录
  Future<HttpResponse> logout({
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/member/logout";
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
    );

    if (response.ok && response.statusOk) {
      success(response.data);
    } else {
      fail(response.error?.message ?? response.data);
    }
    return response;
  }

  /// 修改支付密码
  Future<HttpResponse> updatePayPassword({
    required int types,
    required String oldPassword,
    required String payPassword,
    required String code,
    required int codeType,
    required Success<String> success,
    required Fail fail,
  }) async {
    final params = {
      'types': types,
      'pay_password': payPassword,
      'code': code,
      'code_type': codeType
    };
    if (types == 2) {
      params['old_pay_password'] = oldPassword;
    }
    String path = "/member/pay/password/update";
    HttpResponse response = await $engine?.execute(
      Method.POST,
      path,
      data: params,
    );

    if (response.ok && response.statusOk) {
      success(response.data);
    } else {
      fail(response.error?.message ?? response.data);
    }
    return response;
  }

  ///发送验证吗
  Future<HttpResponse> sendEmailCode({
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/member/send/mail/code";
    HttpResponse response = await $engine?.execute(Method.GET, path,
        options: Options(
          headers: {"dn": DeviceService.instance.getDeviceId()},
        ));
    if (response.ok && response.statusOk) {
      success(response.data);
    } else {
      fail(response.error?.message ?? response.data);
    }
    return response;
  }

  ///发送验证码
  Future<HttpResponse> getEmailCode({
    required String email,
    required String captcha,
    required Success<String> success,
    required Fail fail,
  }) async {
    final account = AccountService.sharedInstance.currentUser;
    String path = "/member/email/check";
    final params = {
      'email': email,
      'captcha': captcha,
      'uid': account?.uid ?? '',
    };
    HttpResponse response = await $engine?.execute(
      Method.POST,
      path,
      data: params,
    );
    if (response.ok && response.statusOk) {
      success(response.data);
    } else {
      fail(response.error?.message ?? response.data);
    }
    return response;
  }

  ///重发邮箱认证
  Future<HttpResponse> emailCheck({
    required String email,
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/member/email/check/request";
    final params = {
      'email': email,
    };

    HttpResponse response = await $engine?.execute(Method.POST, path,
        data: params,
        options: Options(
          headers: {"dn": DeviceService.instance.getDeviceId()},
        ));
    if (response.ok && response.statusOk) {
      success(response.data);
    } else {
      fail(response.error?.message ?? response.data);
    }
    return response;
  }

  ///校验邮箱是否被占用
  ///校验用户名是否被占用
  Future<HttpResponse> accountCheck({
    required String value,
    required int type,
    bool? noNotify,
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/member/exists?ty=$type&val=$value";
    if (type == 3) {
      path = "/member/exists?ty=$type&val=$value&noNotify=$noNotify";
    }
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
    );
    if (response.ok) {
      if (response.statusOk && (response.data == false)) {
        success('');
      } else {
        if (type == 1) {
          if (response.data['msg'] != '') {
            response.data = S.current.username_already_exists_text;
          } else {
            response.data = '';
          }
        } else if (type == 2) {
          if (response.data['msg'] != '') {
            response.data = S.current.email_already_exists_text;
          } else {
            response.data = '';
          }
        } else {
          if (response.data['msg'] != '') {
            response.data = '手机号码已存在';
          } else {
            response.data = '';
          }
        }
        success(response.data);
      }
    }

    // else {
    //   fail(response.error?.message ?? response.data);
    // }
    return response;
  }

  Future<HttpResponse> forgetPassword({
    required String email,
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/member/forget/password?email=$email";
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
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

  Future<HttpResponse> verifyEmail({
    required String email,
    required Success<String> success,
    required Fail fail,
  }) async {
    var params = {
      "email": email,
    };
    String path = "/member/send/mail/captcha";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok && response.statusOk) {
      success(response.data);
    } else {
      if (response.error?.message != null) {
        fail(response.error?.message);
      }
    }
    return response;
  }

  Future<HttpResponse> verifyPhone({
    required String phone,
    required Success<String> success,
    required Fail fail,
  }) async {
    var params = {
      "phone": phone,
      "type": 0,
      "uid": AccountService.sharedInstance.currentUser?.uid??'',
    };
    String path = "/member/phone/sms";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok && response.statusOk) {
      success(response.data);
    } else {
      if (response.error?.message != null) {
        fail(response.error?.message);
      }
    }
    return response;
  }

  /// type 1邮箱 2手机'+11232323'
  Future<HttpResponse> resetPassword({
    required String account,
    required String password,
    required String code,
    required int type,
    required Success<String> success,
    required Fail fail,
  }) async {
    var params = {"captcha": code, "new_password": password, "phone_email": account, "type": type};
    String path = "/member/password/update/code";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok && response.statusOk) {
      success(response.data);
    } else {
      if (response.error?.message != null) {
        fail(response.error?.message);
      } else {
        fail(response.data);
      }
    }
    return response;
  }

  Future<HttpResponse> loginLog({
    required int page,
    required Success<PageModel<LoginLogModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/front/login/log/list?page_size=40&page=$page";
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
    );
    if (response.ok && response.statusOk) {
      final page =
          PageModel<LoginLogModel>.fromJson(response.data, (json) => LoginLogModel.fromJson(json));
      success(page);
    } else {
      if (response.error?.message != null) {
        fail(response.error?.message);
      }
    }
    return response;
  }

  ///获取用户余额
  Future<HttpResponse> getBalance({
    required Success<BalanceBean> success,
    required Fail fail,
  }) async {
    String path = "/member/balance";
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
    );
    if (response.ok && response.statusOk) {
      final balance = BalanceBean.fromJson(response.data);
      success(balance);
    } else {
      if (response.error?.message != null) {
        fail(response.error?.message);
      }
    }
    return response;
  }

  ///获取公共 品牌信息
  Future<HttpResponse> getBrandDetail({
    required String tag,
    String cur = "",
    required Success<dynamic> success,
    required Fail fail,
  }) async {
    String path = "/member/brand/detail";
    var params;
    if (cur.isNotEmpty) {
      params = {
        'tag': tag,
        'cur': cur,
      };
    } else {
      params = {
        'tag': tag,
      };
    }

    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      params: params,
    );
    if (response.ok && response.statusOk) {
      log('------获取到公共品牌信息=${response.data}');
      success(response.data);
    } else {
      if (response.error?.message != null) {
        fail(response.error?.message);
      }
    }
    return response;
  }

  ///双重认证
  Future<HttpResponse> dualVerify({
    required String password,
    required String code,
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/member/dual/verify";
    final params = {
      'password': password,
      'code': code,
    };
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      data: params,
    );
    if (response.ok && response.statusOk) {
      success(response.data);
    } else {
      fail(response.error?.message ?? response.data);
    }
    return response;
  }

  ///基础配置
  Future<HttpResponse> brand({
    required String tag,
    required Success<Brand> success,
    required Fail fail,
  }) async {
    String path = "/member/brand/detail";
    final params = {
      'tag': tag,
    };
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      params: params,
    );
    if (response.ok && response.statusOk) {
      success(Brand.fromJson(response.data));
    } else {
      fail(response.error?.message ?? response.data);
    }
    return response;
  }

  ///客服
  Future<HttpResponse> cs<T>({
    required String tag,
    required Success<List<T>> success,
    required Fail fail,
    required T Function(dynamic) converter, // 传入一个将动态类型转换为T类型的函数
  }) async {
    String path = "/member/brand/detail";
    final params = {
      'tag': tag,
    };
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      params: params,
    );
    if (response.ok && response.statusOk) {
      if (response.data['kf'] is List) {
        List<T> data = (response.data['kf'] as List<dynamic>).map<T>((dynamic item) {
          return converter(item);
        }).toList();
        success(data);
      } else {
        // fail(response.error?.message ?? response.data);
      }
    } else {
      fail(response.error?.message ?? response.data);
    }
    return response;
  }

  ///在线支持跳转签名
  Future<HttpResponse> csSign({
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/member/brand/kefu/sign";
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
    );
    if (response.ok && response.statusOk) {
      success(response.data);
    } else {
      fail(response.error?.message ?? response.data);
    }
    return response;
  }

  //数据统计
  Future<HttpResponse> betReport<T>({
    required Success<List<T>> success,
    required Fail fail,
    required gameClass,

    ///游戏类型,空=全部 1=娱乐城 2=体育
    String username = '',
    required T Function(dynamic) converter, // 传入一个将动态类型转换为T类型的函数
  }) async {
    String path = "/member/bet/report";
    final params = {
      'game_class': gameClass,
      'username': username,
    };
    HttpResponse response = await $engine?.execute(
      Method.POST,
      path,
      data: params,
    );
    if (response.ok && response.statusOk) {
      if (response.data == null) {
        success([]);
      } else {
        List<T> data = (response.data as List<dynamic>).map<T>((dynamic item) {
          return converter(item);
        }).toList();
        success(data);
      }
    } else {
      fail(response.error?.message ?? response.data);
    }
    return response;
  }

  Future<HttpResponse> getPassWordConfig({
    required Success<dynamic> success,
    required Fail fail,
  }) async {
    String path = "/member/auth/config";
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
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

  ///获取安全验证配置
  Future<HttpResponse> getAuthConfig({
    required Success<AuthConfigApiModel> success,
    required Failed fail,
  }) async {
    var params = {
      // "ic": ic,
    };
    String path = "/member/auth/config";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: {});
    if (response.ok && response.statusOk) {
      var apiModel = AuthConfigApiModel.fromJson(response.data);
      log("获取安全验证配置api...${JsonUtil.encodeObj(apiModel)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///获取二阶段验证密钥
  Future<HttpResponse> getAuthSecret({
    required Success<String> success,
    required Failed fail,
  }) async {
    var params = {
      // "ic": ic,
    };
    String path = "/member/auth/secret";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: {});
    if (response.ok && response.statusOk) {
      var apiModel = response.data;
      log("获取二阶段验证密钥api...${JsonUtil.encodeObj(apiModel)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///获取二阶段验证qrcode【新版0122】
  ///返回动态二维码连接
  Future<HttpResponse> getAuthSecretQrcode({
    required Success<AuthQrcodeApiModel> success,
    required Failed fail,
  }) async {
    var params = {
      // "ic": ic,
    };
    String path = "/member/auth/qrcode";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: {});
    if (response.ok && response.statusOk) {
      var apiModel = AuthQrcodeApiModel.fromJson(response.data);
      log("获取二阶段验证密钥api...${JsonUtil.encodeObj(apiModel)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///设定二阶段验证
  Future<HttpResponse> requestAuthSet({
    required String auth_code,
    required String password,
    required Success<String> success,
    required Failed fail,
  }) async {
    var params = {
      "auth_code": auth_code, //二阶段验证码
      "password": password //登录密码
    };
    String path = "/member/auth/set";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok && response.statusOk) {
      var apiModel = response.data;
      log("获取二阶段验证密钥api...${JsonUtil.encodeObj(apiModel)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///关闭二阶段验证
  Future<HttpResponse> requestAuthClose({
    required String auth_code,
    required String password,
    required Success<String> success,
    required Failed fail,
  }) async {
    var params = {
      "auth_code": auth_code, //二阶段验证码
      "password": password //登录密码
    };
    String path = "/member/auth/close";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok && response.statusOk) {
      var apiModel = response.data;
      log("获取二阶段验证密钥api...${JsonUtil.encodeObj(apiModel)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }
}
