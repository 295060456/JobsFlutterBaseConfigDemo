import 'dart:developer';

import '../../../model/activity_model/RecordBean.dart';
import '../../../model/page_common_model.dart';
import '../../../pages/activity/a_model/activity_receive_api_model.dart';
import '../../../pages/activity/activity_promotion/activity_promotion_api_model.dart';
import '../../../pages/activity/a_model/activity_invite_api_model.dart';
import '../../../pages/activity/all_promotions/all_promotions_api_model.dart';
import '../../../pages/activity/a_model/activity_people_api_model.dart';
import '../../../pages/activity/a_model/activity_quick_api_model.dart';
import '../../../pages/activity/a_model/activty_sidebar_api_model.dart';
import '../../../utils/http/http_engine.dart';
import '../../../utils/http/http_response.dart';
import '../../../utils/json_util.dart';
import '../api_service.dart';

///活动管理 网络请求 管理类
extension ActivityApiService on ApiService {
  ///启动app  主页活动对话框
  Future<HttpResponse> getMainPromotions({
    required Success<List<ActivityQuickApiModel>> success,
    required Failed fail,
  }) async {
    var params = {};
    String path = "/member/promo/pop";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: null);

    if (response.ok && response.statusOk) {
      //{"status":true,"data":{"d":null,"t":0,"s":15}}
      var apiModel = JsonUtil.getObjectList<ActivityQuickApiModel>(
          response.data, (v) => ActivityQuickApiModel.fromJson(v));
      //icon 转换
      if (apiModel != null) {
        for (var model in apiModel) {
          model.iconConvert();
        }
      }
      log("主页活动对话框api...${response.data.toString()}");
      success(apiModel ?? []);

      //模拟数据
      // List<ActivityQuickApiModel> list = [
      //   // 34584464559088451
      //   // 911065750483031
      //   // 40039904499718196
      //   ActivityQuickApiModel(
      //       id: "34584464559088451", name: "推广活动", iconList: ["/promos/zh_CN/1713619473060.webp"]),
      //   ActivityQuickApiModel(
      //       id: "40039904499718196", name: "现金返现", iconList: ["/promos/zh_CN/1713619203542.webp"]),
      //   ActivityQuickApiModel(
      //       id: "40039904499718196", name: "红包活动", iconList: ["/promos/zh_CN/1713619282436.webp"]),
      // ];
      // success(list);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///首页活动快捷入口
  Future<HttpResponse> getQuickPromotions({
    required Success<List<ActivityQuickApiModel>> success,
    required Failed fail,
  }) async {
    var params = {};
    String path = "/member/promo/shortcut";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: null);

    if (response.ok && response.statusOk) {
      //{"status":true,"data":{"d":null,"t":0,"s":15}}
      // var apiModel = PageCommonModel<AllPromotionsApiModel>.fromJson(
      //   response.data,
      //       (json) => AllPromotionsApiModel.fromJson(json),
      // );
      // log("所有活动api...${JsonUtil.encodeObj(apiModel.content)}");
      //模拟数据
      // List<String> apiModel = [
      //   "https://d2utx4nptvgikt.cloudfront.net/images/promo/5.webp",
      //   "https://k.sinaimg.cn/www/dy/slidenews/2_img/2010_30/786_132481_319348.jpg/w640slw.jpg"
      // ];
      var apiModel = JsonUtil.getObjectList<ActivityQuickApiModel>(
          response.data, (v) => ActivityQuickApiModel.fromJson(v));
      //icon 转换
      if (apiModel != null) {
        for (var model in apiModel) {
          model.iconConvert();
        }
      }
      log("活动快捷入口api...${response.data.toString()}");
      success(apiModel ?? []);
      //todo: 模拟数据
      // List<ActivityQuickApiModel> list = [
      // // 34584464559088451
      // // 911065750483031
      // // 40039904499718196
      // ActivityQuickApiModel(id: "34584464559088451", name: "推广活动", iconList: ["promos/zh_CN/1711950305381.webp"]),
      // ActivityQuickApiModel(id: "40039904499718196",name: "现金返现",iconList: ["/sports/im/m/1.webp"]),
      // ActivityQuickApiModel(id: "40039904499718196",name: "红包活动",iconList: ["/sports/im/m/1.webp"]),
      // ];
      // success(list);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///活动侧边栏
  Future<HttpResponse> getAllActivitySidebar({
    // required int page,
    // required int page_size,
    required Success<List<ActivitySidebarApiModel>> success,
    required Failed fail,
  }) async {
    var params = {};
    String path = "/member/promo/sidebar";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: null);
    if (response.ok && response.statusOk) {
      // log("活动侧边栏api...${JsonUtil.encodeObj(response.data)}");
      //{"status":true,"data":"[]"} ，直接异常
      // var apiModel = sidebarFromJson(JsonUtil.encodeObj(response.data)??"");
      // Unhandled Exception: type 'List<dynamic>' is not a subtype of type 'String?'
      // response.data 返回的是 'List<dynamic>'
      var apiModel = JsonUtil.getObjectList<ActivitySidebarApiModel>(
          response.data, (v) => ActivitySidebarApiModel.fromJson(v));
      success(apiModel ?? []);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///所有活动 列表
  Future<HttpResponse> getAllPromotions({
    required int page,
    required int page_size,
    required String category,
    required Success<PageCommonModel<AllPromotionsApiModel>> success,
    required Failed fail,
  }) async {
    var params = {
      "page": page,
      "page_size": page_size,
      "category": category, //分类 1娱乐城 2体育
    };
    String path = "/member/promo/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok && response.statusOk) {
      //{"status":true,"data":{"d":null,"t":0,"s":15}}
      //todo:数据结构老是变
      // var apiModel = PageCommonModel<AllPromotionsApiModel>.fromJson(
      //   response.data,
      //   (json) => AllPromotionsApiModel.fromJson(json),
      // );
      // log("所有活动api...${JsonUtil.encodeObj(response.data)}");
      var list = JsonUtil.getObjectList<AllPromotionsApiModel>(
          response.data, (json) => AllPromotionsApiModel.fromJson(json));
      var apiModel = PageCommonModel<AllPromotionsApiModel>.initContent(content: list ?? []);
      // var apiModel = PageCommonModel<AllPromotionsApiModel>.initContent(content: []);
      // log("所有活动api...${JsonUtil.encodeObj(apiModel.content)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  /// 获取抽奖次数
  Future<HttpResponse> getConfig({
    required String pid,
    required String cur,
    required Success<Map> success,
    required Fail fail,
  }) async {
    String path = "/member/turntable/config";
    HttpResponse response =
        await $engine?.execute(Method.GET, path, params: {"pid": pid, 'cur': cur});
    if (response.ok) {
      if (response.statusOk) {
        if (response.data is Map) {
          success(response.data);
        } else {
          success({'data': response.data});
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 活动记录
  Future<HttpResponse> getRecord({
    required String pid,
    required Success<Map> success,
    required Fail fail,
  }) async {
    var params = {"pid": pid};
    String path = "/member/turntable/record";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      log("记录元数据：${response.data}");

      if (response.statusOk) {
        if (response.data is Map) {
          success(response.data);
        } else {
          success({'data': null});
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 大转盘 获奖结果
  Future<HttpResponse> getRoll({
    String? pid = '256610365262037311',
    required String cur,
    required Success<Map> success,
    required Fail fail,
  }) async {
    var params = {"pid": pid, "cur": cur};
    String path = "/member/turntable/roll";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data is Map) {
          success(response.data);
        } else {
          success({'data': response.data});
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///累计奖金
  Future<HttpResponse> prizeList({
    required int pageSize,
    required int page,
    required String pid,
    required Success<List<dynamic>> success,
    required Fail fail,
  }) async {
    var params = {
      "page_size": pageSize,
      "page": page,
      "pid": pid,
    };
    String path = "/member/turntable/prize/record";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      log("邀请元数据：${response.data['d']}");
      if (response.statusOk) {
        success(response.data?['d'] ?? []);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///领奖
  Future<HttpResponse> apply({
    required String pid,
    required String cur,
    required Success<Map> success,
    required Fail fail,
  }) async {
    var params = {
      "pid": pid,
      "cur": cur,
    };
    String path = "/member/turntable/bonus/apply";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data is Map) {
          success(response.data);
        } else {
          success({'data': response.data});
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///活动领取记录(虚假数据)
  Future<HttpResponse> firstReportList({
    required Success<List<dynamic>> success,
    required Fail fail,
  }) async {
    var params = {"t": "carousel"};
    String path = "/member/turntable/get/record";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
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

  ///红包详情
  Future<HttpResponse> redDetail({
    required String pid,
    required Success<dynamic> success,
    required Fail fail,
  }) async {
    var params = {"pid": pid};
    String path = "/member/promo/red/detail";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
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

  ///红包奖金
  Future<HttpResponse> bonus({
    required String pid,
    currencyId,
    required Success<dynamic> success,
    required Fail fail,
  }) async {
    var params = {"pid": pid, "currency_id": currencyId};
    String path = "/member/promo/red/bonus";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
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

  ///红包领取奖金
  Future<HttpResponse> receive({
    required String pid,
    required Success<dynamic> success,
    required Fail fail,
  }) async {
    var params = {"pid": pid};
    String path = "/member/promo/red/receive";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
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

  ///兑换
  Future<HttpResponse> exchange({
    required String pid,
    required String currencyId,
    required Success<dynamic> success,
    required Fail fail,
  }) async {
    var params = {"pid": pid, "currency_id": currencyId};
    String path = "/member/promo/red/exchange";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
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

  ///获取手机号
  Future<HttpResponse> phoneList({
    required Success<List<dynamic>> success,
    required String pid,
    required Fail fail,
  }) async {
    var params = {"pid": pid};
    String path = "/member/turntable/phone";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
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

  ///推广活动 - 活动配置
  Future<HttpResponse> getActivityPromotionConfig({
    required String pid,
    required String currency_id,
    required Success<ActivityPromotionApiModel> success,
    required Failed fail,
  }) async {
    var params = {
      "pid": pid,
      "currency_id": currency_id,
    };
    String path = "/member/agency/config";
    log("活动配置...${JsonUtil.encodeObj(params)}");
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok && response.statusOk) {
      //{"status":true,"data":{"d":null,"t":0,"s":15}}
      var apiModel = ActivityPromotionApiModel.fromJson(response.data);
      log("活动配置api...${JsonUtil.encodeObj(apiModel)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///推广活动有效推广人数
  Future<HttpResponse> getActivityPromotionPeoples({
    required String pid,
    required String currency_id,
    required Success<ActivityPeopleApiModel> success,
    required Failed fail,
  }) async {
    var params = {
      "pid": pid,
      "currency_id": currency_id,
    };
    //{{url}}/member/agency/valid/member/count?pid=99&currency_id=701
    String path = "/member/agency/valid/member/count";
    log("推广活动有效推广人数...${JsonUtil.encodeObj(params)}");
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok && response.statusOk) {
      //{"status":true,"data":{"d":null,"t":0,"s":15}}
      var apiModel = ActivityPeopleApiModel.fromJson(response.data);
      log("推广活动有效推广人数api...${JsonUtil.encodeObj(apiModel)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///推广活动领取
  Future<HttpResponse> getActivityPromotionReceive({
    required String pid,
    required String currency_id,
    required Success<ActivityReceiveApiModel> success,
    required Failed fail,
  }) async {
    var params = {
      "pid": pid,
      "currency_id": currency_id,
    };
    String path = "/member/agency/bonus/apply";
    log("推广活动领取...${JsonUtil.encodeObj(params)}");
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok && response.statusOk) {
      //{"status":true,"data":{"d":null,"t":0,"s":15}}
      //{"status":true,"data":{}}
      var apiModel = ActivityReceiveApiModel.fromJson(response.data);
      // log("推广活动领取api...${JsonUtil.encodeObj(apiModel)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///活动推广 邀请列表 推广活动有效推广人数详情
  Future<HttpResponse> getActivityInviteList({
    required int page,
    required int page_size,
    required String pid,
    required String state,
    required String username,
    required String currency_id,
    required Success<PageCommonModel<ActivityInviteApiModel>> success,
    required Failed fail,
  }) async {
    var params = {
      "page": page,
      "page_size": page_size,
      "pid": pid,
      "state": state,
      "username": username,
      "currency_id": currency_id,
    };
    String path = "/member/agency/valid/member/detail";
    log("邀请列表参数...${JsonUtil.encodeObj(params)}");
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok && response.statusOk) {
      //{"status":true,"data":{"d":null,"t":0,"s":15}}
      var apiModel = PageCommonModel<ActivityInviteApiModel>.fromJson(
        response.data,
        (json) => ActivityInviteApiModel.fromJson(json),
      );
      log("邀请列表api...${JsonUtil.encodeObj(apiModel.content)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  /// 负盈利活动领取
  Future<HttpResponse> getBonus({
    String? cur = '701',
    required Success<Map> success,
    required Fail fail,
  }) async {
    var params = {
      "cur": cur,
    };
    String path = "/member/profit/bonus/apply";
    HttpResponse response = await $engine?.execute(Method.POST, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data is Map) {
          success(response.data);
        } else {
          success({'data': response.data});
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 负盈利活动配置
  Future<HttpResponse> cashbackConfig({
    String? pid = '48815713448760286',
    required Success<Map> success,
    required Fail fail,
  }) async {
    var params = {
      "pid": pid,
    };
    String path = "/member/profit/config";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data is Map) {
          success(response.data);
        } else {
          fail(response.data);
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 负盈利活动会员等级查询
  Future<HttpResponse> getLevel({
    String? pid = '48815713448760286',
    required Success<Map> success,
    required Fail fail,
  }) async {
    var params = {
      "pid": pid,
    };
    String path = "/member/profit/level";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data is Map) {
          success(response.data);
        } else {
          fail(response.data);
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 自定义活动
  Future<HttpResponse> activityConfig({
    String? pid = '48815713448760322',
    required Success<Map<String, dynamic>> success,
    required Fail fail,
  }) async {
    var params = {
      "pid": pid,
    };
    String path = "/member/display/config";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data is Map) {
          success(response.data);
        } else {
          fail(response.data);
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }
}
