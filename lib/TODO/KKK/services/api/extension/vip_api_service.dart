import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/model/page.dart';
import 'package:flutter_bet/model/viplevel/vip_availiable_amount_model.dart';
import 'package:flutter_bet/model/viplevel/vip_fanshui_detail_list.dart';
import 'package:flutter_bet/model/viplevel/vip_fanshui_sum.dart';
import 'package:flutter_bet/model/viplevel/vip_fenglu_config_model.dart';
import 'package:flutter_bet/model/viplevel/vip_jifen_rate_model.dart';
import 'package:flutter_bet/model/viplevel/vip_rate_multiple.dart';
import 'package:flutter_bet/model/viplevel/vip_rebate_config_model.dart';
import 'package:flutter_bet/model/viplevel/viplevel_config_model.dart';
import 'package:flutter_bet/model/viplevel/viplevel_lingqu_model.dart';
import 'package:flutter_bet/model/yulecheng/gameDetailModel.dart';
import 'package:flutter_bet/model/yulecheng/gamelist_model.dart';
import 'package:flutter_bet/services/api/api_service.dart';
import 'package:flutter_bet/utils/http/http_engine.dart';
import 'package:flutter_bet/utils/http/http_response.dart';
import 'package:flutter_bet/utils/json_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/notice_model.dart';
import '../../../model/yulecheng/index.dart';

extension VipLevelApiService on ApiService {
  /// 拉取config数据
  Future<HttpResponse> getVipLevelConfig({
    required Success<List<VipLevelModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/vip/config";
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String cacheStringKey = path;
    // String cacheString = prefs.getString(cacheStringKey) ?? "";
    // if (cacheString.isNotEmpty) {
    //   // Map<String, dynamic> data = jsonDecode(cacheString);

    //   // // 获取所有的 key
    //   // List<String> keys = data.keys.toList();
    //   // List<VipLevelModel> modelList = [];
    //   // for (var i = 1; i < keys.length + 1; i++) {
    //   //   VipLevelModel model = VipLevelModel.fromJson(data['v' + i.toString()]);
    //   //   modelList.add(model);
    //   // }

    //   // success(modelList);
    // }
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
    );
    if (response.ok) {
      try {
        if (response.statusOk) {
          // 将 JSON 数据解析为 Map

          Map<String, dynamic> data = response.data;

          // 获取所有的 key
          List<String> keys = response.data.keys.toList();

          List<int> withOuthV = [];
          for (int i = 0; i < keys.length; i++) {
            withOuthV.add(int.parse(keys[i].substring(1)));
          }

          withOuthV.sort((a, b) => a.compareTo(b));
          // keys.sort((a, b) => a.compareTo(b));

          List<VipLevelModel> modelList = [];
          for (var i = 0; i < withOuthV.length; i++) {
            VipLevelModel model = VipLevelModel.fromJson(data["v${withOuthV[i]}"]);
            modelList.add(model);
          }

          success(modelList);
          // prefs.setString(cacheStringKey, jsonEncode(response.data));
        } else {
          fail(response.data);
        }
      } catch (e) {
        fail(response.error?.message);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 拉取config数据
  Future<HttpResponse> getVipJiangJinConfig({
    required String cur,
    required Success<VipFengluModel> success,
    required Fail fail,
  }) async {
    String path = "/member/vip/prize/config?cur=${cur}";
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String cacheStringKey = path;
    // String cacheString = prefs.getString(cacheStringKey) ?? "";
    // if (cacheString.isNotEmpty) {
    //   // Map<String, dynamic> data = jsonDecode(cacheString);

    //   // // 获取所有的 key
    //   // List<String> keys = data.keys.toList();
    //   // List<VipLevelModel> modelList = [];
    //   // for (var i = 1; i < keys.length + 1; i++) {
    //   //   VipLevelModel model = VipLevelModel.fromJson(data['v' + i.toString()]);
    //   //   modelList.add(model);
    //   // }

    //   // success(modelList);
    // }
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
    );
    // log("vip俸禄api：${JsonUtil.encodeObj(response.data)}");
    if (response.ok) {
      try {
        if (response.statusOk) {
          // 将 JSON 数据解析为 Map
          // log("vip俸禄api：${JsonUtil.encodeObj(response.data)}");

          VipFengluModel model = VipFengluModel.fromJson(response.data);
          success(model);

          // Map<String, dynamic> data = response.data;

          // // 获取所有的 key
          // List<String> keys = response.data.keys.toList();
          // List<int> withOuthV = [];
          // for (int i = 0; i < keys.length; i++) {
          //   withOuthV.add(int.parse(keys[i].substring(1)));
          // }
          // withOuthV.sort((a, b) => a.compareTo(b));
          // // keys.sort((a, b) => a.compareTo(b));

          // List<List<dynamic>> modelList = [];
          // for (var i = 0; i < withOuthV.length; i++) {
          //   List<dynamic> item =
          //       data["v${withOuthV[i]}"].map((e) => VipFengluConfigModel.fromJson(e)).toList();
          //   modelList.add(item);
          // }
          // // log("vip俸禄api：${JsonUtil.encodeObj(response.data)}");

          // success(modelList);
          // prefs.setString(cacheStringKey, jsonEncode(response.data));
        } else {
          fail(response.data);
        }
      } catch (e) {
        fail(response.error?.message);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> lingQuDengJiJiangLi({
    required String jiangJinId,
    required String cur,
    required String amount,
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/member/vip/bonus/apply";

    HttpResponse response = await $engine?.execute(Method.POST, path, data: {
      "id": jiangJinId,
      "cur": cur,
      "amount": amount,
    });
    if (response.ok) {
      if (response.statusOk) {
        // 将 JSON 数据解析为 Map
        success(response.data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> getVipJiFenRate({
    required String cur,
    required Success<VipJifenRateModel> success,
    required Fail fail,
  }) async {
    String path = "/member/vip/score/config";

    HttpResponse response = await $engine?.execute(Method.GET, path, params: {
      "cur": cur,
    });
    if (response.ok) {
      if (response.statusOk) {
        // 将 JSON 数据解析为 Map
        VipJifenRateModel model = VipJifenRateModel.fromJson(response.data);
        success(model);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  // 领取全部晋级奖金
  Future<HttpResponse> lingQuQuanBuJinJiJiangLi({
    required String flag,
    required String cur,
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/member/vip/bonus/apply/all";

    HttpResponse response = await $engine?.execute(Method.POST, path, data: {
      "cur": cur,
      "flag": flag,
    });

    if (response.ok) {
      if (response.statusOk) {
        // 将 JSON 数据解析为 Map
        success(response.data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> lingQuZongE({
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/member/vip/bonus/amount";

    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
    );
    if (response.ok) {
      if (response.statusOk) {
        // 将 JSON 数据解析为 Map
        success(response.data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> chakanLingQuJiLu({
    required String cash_type,
    required int page,
    required start_time,
    required end_time,
    required Success<PageModel<VipLevelLingQuModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/vip/bonus/apply/list";
    var params = {
      "cash_type": cash_type,
      "page": page,
      "page_size": 100,
      "start_time": start_time,
      "end_time": end_time
    };
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.statusOk) {
      final page = PageModel<VipLevelLingQuModel>.fromJson(
          response.data, (json) => VipLevelLingQuModel.fromJson(json));
      success(page);
    } else {
      fail(response.data);
    }

    return response;
  }

  Future<HttpResponse> getAvailiableAmount({
    required String type,
    required Success<List> success,
    required Fail fail,
  }) async {
    String path = "/member/vip/bonus/available?cash_type=" + type;

    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
    );
    if (response.ok) {
      if (response.statusOk) {
        // 将 JSON 数据解析为 Map
        if (response.data == null) {
          success([]);
        } else {
          success(response.data);
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  // 获取体育倍数
  Future<HttpResponse> getVipMutilple({
    required Success<List<VipRateMultiple>> success,
    required Fail fail,
  }) async {
    String path = "/member/vip/multiple";

    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
    );
    if (response.ok) {
      if (response.statusOk) {
        // 将 JSON 数据解析为 Map
        List<VipRateMultiple> list = [];
        for (var element in response.data) {
          list.add(VipRateMultiple.fromJson(element));
        }
        success(list);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  // 获取体育倍数
  Future<HttpResponse> getVipRebateConfig({
    required int gameType,
    required String cur,
    required Success<VipRebateConfigModel> success,
    required Fail fail,
  }) async {
    String path = "/member/vip/rebate/config";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cacheStringKey = path + gameType.toString();
    String cacheString = prefs.getString(cacheStringKey) ?? "";
    if (cacheString.isNotEmpty) {
      Map<String, dynamic> data = jsonDecode(cacheString);

      VipRebateConfigModel model = VipRebateConfigModel.fromJson(data);

      success(model);
    }
    HttpResponse response = await $engine?.execute(Method.GET, path, params: {
      "game_type": gameType,
      "cur": cur,
    });
    if (response.ok) {
      if (response.statusOk) {
        // 将 JSON 数据解析为 Map

        VipRebateConfigModel model = VipRebateConfigModel.fromJson(response.data);

        success(model);
        prefs.setString(cacheStringKey, jsonEncode(response.data));
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  //
  // 获取返水总列表
  Future<HttpResponse> getVipRebateButtonStatus({
    required Success<bool> success,
    required Fail fail,
  }) async {
    String path = "/member/rebate/automatic";

    HttpResponse response = await $engine?.execute(Method.GET, path, params: {});
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

  // 获取返水总列表
  Future<HttpResponse> getVipRebateSum({
    required Success<List<VipFanshuiSumModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/rebate/sum";

    HttpResponse response = await $engine?.execute(Method.GET, path, params: {});
    if (response.ok) {
      if (response.statusOk) {
        // 将 JSON 数据解析为 Map
        List<VipFanshuiSumModel> list = [];
        for (var element in response.data) {
          list.add(VipFanshuiSumModel.fromJson(element));
        }

        success(list);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  // 获取返水详细列表
  Future<HttpResponse> getVipRebateDetailsList({
    required String gameType,
    required String cur,
    required Success<PageModel<VipFanshuiDetailListModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/rebate/detail";

    HttpResponse response = await $engine?.execute(Method.GET, path,
        params: {"game_type": gameType, "currency_id": cur, "page": "1", "page_size": "100"});
    if (response.ok) {
      if (response.statusOk) {
        // 将 JSON 数据解析为 Map

        final page = PageModel<VipFanshuiDetailListModel>.fromJson(
            response.data, (json) => VipFanshuiDetailListModel.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  // 领取返水
  Future<HttpResponse> receiveFanshui({
    required Success<String> success,
    required Fail fail,
  }) async {
    String path = "/member/rebate/apply";

    HttpResponse response = await $engine?.execute(Method.GET, path, params: {});
    if (response.ok) {
      print("vip 数据返回 ${response.data}");
      if (response.statusOk) {
        // 将 JSON 数据解析为 Map
        // log("vip领取api：${JsonUtil.encodeObj(response.data)}");

        success(response.data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }
}
