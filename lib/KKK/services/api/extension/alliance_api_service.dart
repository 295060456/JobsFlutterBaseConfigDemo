import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bet/pages/alliance_plan/wmodel/alliance_sort_model.dart';
import 'package:flutter_bet/utils/json_util.dart';

import '../../../model/page.dart';
import '../../../model/page_common_model.dart';
import '../../../pages/alliance_plan/all_data/all_data_api_model.dart';
import '../../../pages/alliance_plan/all_data/all_data_api_model_total.dart';
import '../../../pages/alliance_plan/commission_rate/commission_rate_api_model.dart';
import '../../../pages/alliance_plan/commission_history/commission_history_api_model.dart';
import '../../../pages/alliance_plan/direct_betting/direct_betting_api_model.dart';
import '../../../pages/alliance_plan/direct_finance/direct_finance_api_model.dart';
import '../../../pages/alliance_plan/direct_receive/dicrect_receive_api_model.dart';
import '../../../pages/alliance_plan/direct_user/direct_user_api_model.dart';
import '../../../pages/alliance_plan/my_commission/my_commission_api_model.dart';
import '../../../pages/alliance_plan/my_performance/my_performance_api_model.dart';
import '../../../pages/alliance_plan/my_promotion/alliance_my_promotion_api_model.dart';
import '../../../pages/alliance_plan/wmodel/alliance_commission_type_api_model.dart';
import '../../../pages/alliance_plan/wmodel/alliance_game_type_api_model.dart';
import '../../../pages/alliance_plan/wmodel/alliance_info_api_model.dart';
import '../../../utils/http/http_engine.dart';
import '../../../utils/http/http_response.dart';
import '../api_service.dart';

///联盟计划api  请求类
extension AllianceApiService on ApiService {
  ///是否显示上级
  ///0 = 隐藏
  // 1 = 显示
  Future<HttpResponse> getIsShowAgency({
    required Success<String> success,
    required Failed fail,
  }) async {
    var params = {
      "tag": "agency_show",
    };
    String path = "/member/brand/detail";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    log("是否显示上级api...${JsonUtil.encodeObj(response.data)}");
    if (response.ok && response.statusOk) {
      //{"status":true,"data":"0"}
      // var apiModel = AllianceInfoApiModel.fromJson(response.data);
      // log("个人信息api...${JsonUtil.encodeObj(apiModel)}");
      success(response.data);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///个人信息
  Future<HttpResponse> getAllianceInfo({
    required Success<AllianceInfoApiModel> success,
    required Failed fail,
  }) async {
    var params = {
      // "ic": ic,
    };
    String path = "/agency/info";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: {});
    if (response.ok && response.statusOk) {
      var apiModel = AllianceInfoApiModel.fromJson(response.data);
      log("个人信息api...${JsonUtil.encodeObj(apiModel)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///获取联盟计划-游戏类型 - 下拉框
  Future<HttpResponse> getAllianceGameType({
    required Success<List<AllianceGameTypeApiModel>> success,
    required Failed fail,
  }) async {
    var params = {
      // "ic": ic,
    };
    String path = "/agency/commission/models/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: {});
    if (response.ok && response.statusOk) {
      var apiModel = JsonUtil.getObjectList<AllianceGameTypeApiModel>(
        response.data,
        (model) => AllianceGameTypeApiModel.fromJson(model),
      );
      // var apiModel = AllianceGameTypeApiModel.fromJson(response.data);
      log("游戏类型api...${JsonUtil.encodeObj(apiModel)}");
      success(apiModel ?? []);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///获取联盟计划-游戏类型 - 下拉框
  Future<HttpResponse> getCommissionType({
    required Success<List<CommissionTypeApiModel>> success,
    required Failed fail,
  }) async {
    var params = {
      // "ic": ic,
    };
    String path = "/agency/commission/records/class";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: {});
    if (response.ok && response.statusOk) {
      var apiModel = JsonUtil.getObjectList<CommissionTypeApiModel>(
        response.data,
        (model) => CommissionTypeApiModel.fromJson(model),
      );
      // var apiModel = AllianceGameTypeApiModel.fromJson(response.data);
      log("佣金类型api...${JsonUtil.encodeObj(apiModel)}");
      success(apiModel ?? []);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///我的推广
  Future<HttpResponse> getMyPromotion({
    required Success<AllianceMyPromotionApiModel> success,
    required Failed fail,
  }) async {
    var params = {
      // "ic": ic,
    };
    String path = "/agency/mypromotion";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: {});
    if (response.ok && response.statusOk) {
      var apiModel = AllianceMyPromotionApiModel.fromJson(response.data);
      log("我的推广api...${JsonUtil.encodeObj(apiModel)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///联盟计划 - 我的佣金
  Future<HttpResponse> getMyCommission({
    required int page,
    required int page_size,
    required String start_time,
    required String end_time,
    required String currency_id,
    required String model_id,
    required Success<PageCommonModel<MyCommissionApiModel>> success,
    required Failed fail,
  }) async {
    var params = {
      "page": page,
      "page_size": page_size,
      "start_time": start_time,
      "end_time": end_time,
      "currency_id": currency_id, //币种
      "model_id": model_id, //类型id，取类型下拉数据的id
    };
    String path = "/agency/commission";
    log("我的佣金参数...${JsonUtil.encodeObj(params)}");
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok && response.statusOk) {
      //{"status":true,"data":{"d":null,"t":0,"s":15}}
      var apiModel = PageCommonModel<MyCommissionApiModel>.fromJson(
        response.data,
        (json) => MyCommissionApiModel.fromJson(json),
      );
      log("我的佣金api...${JsonUtil.encodeObj(apiModel.content)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///返佣比例
  Future<HttpResponse> getCommissionRate({
    required Success<CommissionRateApiModel> success,
    required Failed fail,
  }) async {
    var params = {};
    String path = "/agency/commission/scale";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: {});
    if (response.ok && response.statusOk) {
      var apiModel = CommissionRateApiModel.fromJson(response.data);
      log("返佣比例api...${JsonUtil.encodeObj(apiModel)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///注册子代理
  Future<HttpResponse> registerSubAgent({
    required String username,
    required String password,
    required String email,
    required String birthday,
    required Success<String> success,
    required Failed fail,
  }) async {
    var params = {
      "username": username.trim(),
      "password": password.trim(),
      "email": email.trim(),
      "birthday": birthday.trim(),
      // "username": "xiaobu01",
      // "password": "x1234567",
      // "email": "4430@gmail.com",
      // "birthday": "2023-12-29"
    };
    String path = "/agency/insert";
    log("注册子代理参数...${JsonUtil.encodeObj(params)}");
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok && response.statusOk) {
      // var apiModel = CommissionRateApiModel.fromJson(response.data);
      log("注册子代理api...${JsonUtil.encodeObj(response.data)}");
      success("");
    } else if (response.ok && !response.statusOk) {
      //{"status":false,"data":"password"}
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///直属领取
  Future<HttpResponse> getDirectReceive({
    required int page,
    required int page_size,
    required String start_time,
    required String end_time,
    required String currency_id,
    required String username,
    required AllianceSortModel sortModel,
    required Success<PageCommonModel<DirectReceiveApiModel>> success,
    required Failed fail,
  }) async {
    var params = {
      "page": page,
      "page_size": page_size,
      "start_time": start_time,
      "end_time": end_time,
      "currency_id": currency_id,
      "username": username,
    };
    String path = "/agency/report/receive";
    log("直属领取参数...${JsonUtil.encodeObj(params)}");
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok && response.statusOk) {
      //{"status":true,"data":{"d":null,"t":0,"s":15}}
      var apiModel = PageCommonModel<DirectReceiveApiModel>.fromJson(
        response.data,
        (json) => DirectReceiveApiModel.fromJson(json),
      );
      log("直属领取api...${JsonUtil.encodeObj(apiModel.content)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///直属用户
  Future<HttpResponse> getDirectUser({
    required int page,
    required int page_size,
    required String start_time,
    required String end_time,
    required String username,
    required AllianceSortModel sortModel,
    required Success<PageCommonModel<DirectUserApiModel>> success,
    required Failed fail,
  }) async {
    var params = {
      "page": page,
      "page_size": page_size,
      "start_time": start_time,
      "end_time": end_time,
      "username": username,
      // "time": sortModel.count_time,
      // "deposit_count": sortModel.deposit_count,
      // "last_login_at": sortModel.last_login_at,
      // "net_amount": sortModel.net_amount,
    };
    String path = "/agency/report/user";
    log("直属用户参数...${JsonUtil.encodeObj(params)}");
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok && response.statusOk) {
      //{"status":true,"data":{"d":null,"t":0,"s":15}}
      var apiModel = PageCommonModel<DirectUserApiModel>.fromJson(
        response.data,
        (json) => DirectUserApiModel.fromJson(json),
      );
      log("直属用户api...${JsonUtil.encodeObj(apiModel.content)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///直属投注
  Future<HttpResponse> getDirectBetting({
    required int page,
    required int page_size,
    required String start_time,
    required String end_time,
    required String currency_id,
    required String username,
    required AllianceSortModel sortModel,
    required Success<PageCommonModel<DirectBettingApiModel>> success,
    required Failed fail,
  }) async {
    var params = {
      "page": page,
      "page_size": page_size,
      "start_time": start_time,
      "end_time": end_time,
      "username": username,
      "currency_id": currency_id,
      // "valid_bet_amount": sortModel.valid_bet_amount,
      // "withdraw_amount": sortModel.withdraw_amount,
      // "net_amount": sortModel.net_amount,
    };
    String path = "/agency/report/bet";
    log("直属投注参数...${JsonUtil.encodeObj(params)}");
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok && response.statusOk) {
      //{"status":true,"data":{"d":null,"t":0,"s":15}}
      var apiModel = PageCommonModel<DirectBettingApiModel>.fromJson(
        response.data,
        (json) => DirectBettingApiModel.fromJson(json),
      );
      log("直属投注api...${JsonUtil.encodeObj(apiModel.content)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///直属财务，不需要排序
  Future<HttpResponse> getDirectFinance({
    required int page,
    required int page_size,
    required String start_time,
    required String end_time,
    required String currency_id,
    required String username,
    required AllianceSortModel sortModel,
    required Success<PageCommonModel<DirectFinanceApiModel>> success,
    required Failed fail,
  }) async {
    var params = {
      "page": page,
      "page_size": page_size,
      "start_time": start_time,
      "end_time": end_time,
      "currency_id": currency_id,
      "username": username,
      // "deposit_amount": sortModel.deposit_amount,
      // "withdraw_amount": sortModel.withdraw_amount,
      // "deposit_withdraw_amount": sortModel.deposit_withdraw_amount,
    };
    String path = "/agency/report/finance";
    log("直属财务参数...${JsonUtil.encodeObj(params)}");
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok && response.statusOk) {
      //{"status":true,"data":{"d":null,"t":0,"s":15}}
      var apiModel = PageCommonModel<DirectFinanceApiModel>.fromJson(
        response.data,
        (json) => DirectFinanceApiModel.fromJson(json),
      );
      log("直属财务api...${JsonUtil.encodeObj(apiModel.content)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///所有数据
  Future<HttpResponse> getAllData({
    required int page,
    required int page_size,
    required String start_time,
    required String end_time,
    required String currency_id,
    required String username,
    required AllianceSortModel sortModel,
    required Success<PageCommonModel<AllDataApiModel>> success,
    required Failed fail,
  }) async {
    var params = {
      "page": page,
      "page_size": page_size,
      "start_time": start_time,
      "end_time": end_time,
      "currency_id": currency_id,
      "username": username,

      // "time": sortModel.join_time,
      // "deposit_amount": sortModel.deposit_amount,
      // "valid_bet_amount": sortModel.valid_bet_amount,
      // "net_amount": sortModel.net_amount,
    };

    ///追加排序参数
    params.addEntries(sortModel.getApiParamsFormat());
    String path = "/agency/report/all";
    log("所有数据参数...${JsonUtil.encodeObj(params)}");
    // var options =  Options()..headers;
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok && response.statusOk) {
      //{"status":true,"data":{"d":null,"t":0,"s":15}}
      var apiModel = PageCommonModel<AllDataApiModel>.fromJson(
        response.data,
        (json) => AllDataApiModel.fromJson(json),
      );
      var totalJson = response.data['total'];
      if (totalJson != null) {
        var totalModel = AllDataTotalApiModel.fromJson(totalJson);
        apiModel.totalData = totalModel;
      }
      log("所有数据api...${JsonUtil.encodeObj(apiModel.content)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///联盟计划 - 我的业绩
  Future<HttpResponse> getMyPerformance({
    required int page,
    required int page_size,
    required String start_time,
    required String end_time,
    required String currency_id,
    required String username,
    required AllianceSortModel sortModel,
    required Success<PageCommonModel<MyPerformanceApiModel>> success,
    required Failed fail,
  }) async {
    var params = {
      "page": page,
      "page_size": page_size,
      "start_time": start_time,
      "end_time": end_time,
      "currency_id": currency_id,
      "username": username,
    };

    ///追加排序参数
    params.addEntries(sortModel.getApiParamsFormat());
    String path = "/agency/performance";
    log("我的业绩参数...${JsonUtil.encodeObj(params)}");
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok && response.statusOk) {
      //{"status":true,"data":{"d":null,"t":0,"s":15}}
      var apiModel = PageCommonModel<MyPerformanceApiModel>.fromJson(
        response.data,
        (json) => MyPerformanceApiModel.fromJson(json),
      );
      log("我的业绩api...${JsonUtil.encodeObj(apiModel.content)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///联盟计划 - 佣金历史
  Future<HttpResponse> getCommissionHistory({
    required int page,
    required int page_size,
    required String start_time,
    required String end_time,
    required String cash_type,
    required Success<PageCommonModel<CommissionHistoryApiModel>> success,
    required Failed fail,
  }) async {
    var params = {
      "page": page,
      "page_size": page_size,
      "start_time": start_time,
      "end_time": end_time,
      "cash_type": cash_type,
    };
    String path = "/agency/commission/records";
    log("佣金历史参数...${JsonUtil.encodeObj(params)}");
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok && response.statusOk) {
      //{"status":true,"data":{"d":null,"t":0,"s":15}}
      var apiModel = PageCommonModel<CommissionHistoryApiModel>.fromJson(
        response.data,
        (json) => CommissionHistoryApiModel.fromJson(json),
      );
      log("佣金历史api...${JsonUtil.encodeObj(apiModel.content)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }
}
