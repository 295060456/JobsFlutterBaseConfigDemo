import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bet/model/page.dart';
import 'package:flutter_bet/model/sport/sport_bet_info_model.dart';
import 'package:flutter_bet/model/sport/sport_menu_model.dart';
import 'package:flutter_bet/model/sport/sport_odds_model.dart';
import 'package:flutter_bet/services/api/api_service.dart';
import 'package:flutter_bet/utils/http/http_engine.dart';
import 'package:flutter_bet/utils/http/http_response.dart';
import 'package:flutter_bet/utils/json_util.dart';

import '../../../constant/app_values.dart';
import '../../../model/pageTwo.dart';
import '../../../model/sport/search_sport_model.dart';
import '../../../model/sport/sport_bet_list_model.dart';
import '../../../model/sport/sport_bet_model.dart';
import '../../../pages/sport/common_model/sport_competition_api_model.dart';
import '../../../pages/sport/common_model/sport_filter.dart';
import '../../../pages/sport/common_model/sport_handicap_api_model.dart';
import '../../../pages/sport/common_model/sport_outrihgt_api_model.dart';
import '../../../pages/sport/sport_detail/model.dart';

extension SportApiService on ApiService {
  Future<HttpResponse> getAllSportCount({
    required int ic,
    required Success<Map> success,
    required Fail fail,
  }) async {
    var params = {
      // "ic": ic,
    };
    String path = "/sport/401/count";
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

  Future<HttpResponse> getSportMenu({
    required Success<SportMenuModel> success,
    required Fail fail,
  }) async {
    String path = "/sport/401/sidebar";

    HttpResponse response = await $engine?.execute(Method.GET, path);
    if (response.ok) {
      if (response.statusOk) {
        log("体育菜单：${JsonUtil.encodeObj(response.data)}");
        final SportMenuModel model = SportMenuModel.fromJson(response.data);
        success(model);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> getContestDetail({
    required int si,
    required String ei,
    required Success<HttpResponse> success,
    required Fail fail,
  }) async {
    var params = {"si": si, "ei": ei};
    String path = "/sport/401/event/info";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        success(response);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> getChampionDetail({
    required int si,
    required int ci,
    required Success<HttpResponse> success,
    required Fail fail,
  }) async {
    // "ci": ci,
    var params = {"si": si, "ci": ci, "page": 1, "page_size": 100};
    String path = "/sport/401/outright/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        success(response);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///冠军投注接口
  Future<HttpResponse> getOutright({
    required int si,
    required String pgid,
    required String ci,
    required int page,
    required int page_size,
    required Success<List<SportOutRightModel>> success,
    required Fail fail,
  }) async {
    var params = {
      "si": si,
      "pgid": pgid,
      "ci": ci,
      "page": page,
      "page_size": page_size,
    };
    String path = "/sport/401/outright/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    //{"status":true,"data":{"t":0,"d":null}}
    //成功状态，两种情况没有数据  和 有数据
    if (response.ok && response.statusOk) {
      //要显示到界面的数据
      SportOutRightApiModel apiModel = SportOutRightApiModel.fromJson(response.data);
      log("冠军投注api...${JsonUtil.encodeObj(apiModel)}");
      //直接返回，上层判断
      success(apiModel.d!);
    }
    //有返回，但有错误提示
    else if (response.ok && !response.statusOk) {
      fail(response.msg);
    }
    //请求有异常
    else if (!response.ok) {
      fail(response.error?.message);
    }
    return response;
  }

  /// {
  // "si": 1, //球种Id
  // "m": 3, //market 0:取所有 1:早盘 2:今日 3:滚球 4:即将开赛 5:即将开赛及滚球
  // "ci": [
  // "1111",
  // "2222"
  // ], //联赛id
  // pgid ://地区id
  // "page": 1, //page
  // "page_size": 100 //page_size
  // }
  Future<HttpResponse> getSportList({
    required int si,
    required int m,
    required int hot,
    required List ci,
    String? pgid, //地区id
    int? ic = 0,
    int? ivs = 2,
    required int page,
    required int page_size,
    required Success<Map> success,
    required Fail fail,
  }) async {
    var params = {
      "si": si,
      "m": m,
      "ci": ci,
      "hot": hot,
      "pgid": pgid,
      "page": page,
      "page_size": page_size,
      "ic": ic,
      "ivs": ivs,
    };
    String path = "/sport/401/event/list";
    // ?si=$si&m=$m&page=$page&page_size=$page_size
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        // log("赛事列表api...event/list：${JsonUtil.encodeObj(response.data)}");
        success(response.data);
        // ulog.d(response.data);
        // ULog.d(response.data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> getSportFavList({
    required List sis,
    required String cur,
    required Success<Map> success,
    required Fail fail,
  }) async {
    var params = {
      "sis": sis,
      "cur": cur,
    };
    String path = "/sport/401/favorite/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        success(response.data);
        // ulog.d(response.data);
        // ULog.d(response.data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> getBanner({
    required Success<List> success,
    required Fail fail,
  }) async {
    String path = "/member/banner/v2/list?banner_type=2";
    HttpResponse response = await $engine?.execute(Method.GET, path);
    if (response.ok) {
      if (response.statusOk) {
        success(response.data);
        // ulog.d(response.data);
        // ULog.d(response.data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> getTopHot({
    required Success<Map> success,
    required Fail fail,
  }) async {
    String path = "/sport/401/homepage/hot";
    HttpResponse response = await $engine?.execute(Method.GET, path);
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

  Future<HttpResponse> getSportAddFav({
    required int si,
    required List<String> eis,
    required String cur,
    required Success<Map> success,
    required Fail fail,
  }) async {
    var params = {
      "si": si,
      "eis": eis,
      "cur": cur,
    };
    String path = "/sport/401/favorite/insert";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data is Map) {
          success(response.data);
        } else {
          success({'data': response.data});
        }
        // ulog.d(response.data);
        // ULog.d(response.data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> getSportDetelFav({
    required int si,
    required List<String> eis,
    required String cur,
    required Success<Map> success,
    required Fail fail,
  }) async {
    var params = {
      "si": si,
      "eis": eis,
      "cur": cur,
    };
    String path = "/sport/401/favorite/delete";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data is Map) {
          success(response.data);
        } else {
          success({'data': response.data});
        }
        // ulog.d(response.data);
        // ULog.d(response.data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///联赛列表
  Future<HttpResponse> getCompetitionList({
    required int si,
    required String kind,
    required Success<SportCompetitionApiModel> success,
    required Fail fail,
  }) async {
    //"si": 1, //球种Id
    // "kind": "normal" //种类 normal:一般赛事 outright:冠军赛
    var params = {
      "si": si,
      "kind": kind,
    };
    String path = "/sport/401/competition/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    //成功状态，两种情况没有数据  和 有数据
    if (response.ok && response.statusOk) {
      //要显示到界面的数据
      SportCompetitionApiModel model = SportCompetitionApiModel.fromJson(response.data);
      //直接返回，上层判断
      success(model);
    } else if (response.ok && !response.statusOk) {
      fail(response.error?.message);
    } else if (!response.ok) {
      fail(response.error?.message);
    }
    return response;
  }

  /// 索取注信息：包括单项投注，和复式投注
  Future<HttpResponse> getSportOddsApiBetInfo({
    required Success<SportOddsModel> success,
    required SportBetInfoModel requestData,
    required Fail fail,
  }) async {
    var params = requestData.toJson();
    String path = "/sport/401/place/betinfo";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    log('索取投注信息：传参数：${JsonUtil.encodeObj(requestData)}');
    log('索取投注信息api：单项or复式结果：${requestData.ic}...${JsonUtil.encodeObj(response.data)}');
    if (response.ok) {
      if (response.statusOk) {
        final SportOddsModel model = SportOddsModel.fromJson(response.data);
        success(model);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///投注接口
  Future<HttpResponse> submitApiBet({
    required Success<dynamic> success,
    required SportBetModel requestData,
    required Fail fail,
  }) async {
    var params = requestData.toJson();
    String path = "/sport/401/place/bet";
    print('投注参数：${params}');
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

  ///20231208 接口变更
  ///索取投注明细接口  ： 获取投注列表： 未结算  和  已结算
  //   1.  移除入参 kind
  //   2.  增加回传：
  //     a.  reb 1:支持重新投注 0:不支持重新投注
  //     b.  wid, mlid, mll, ic 用于购物车
  Future<HttpResponse> getBetList({
    required Success<PageModel<ListElement>> success,
    required int page,
    required int sttle,
    required String cur,
    required Fail fail,
  }) async {
    var params = {
      // 'kind': 'normal',
      'settle': sttle,
      'cur': cur,
      "page": page,
      "page_size": AppValues.defaultPageSize,
    };
    String path = "/sport/401/betlist";
    log('投注明细传参：${JsonUtil.encodeObj(params)}');
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        log('我的投注-未结算-已结算：${sttle} ${JsonUtil.encodeObj(response.data)}');
        //对数据额外处理，添加ms, 方便后面未计算 进行复投
        final pageModel =
            PageModel<ListElement>.fromJson(response.data, (json) => ListElement.fromJson(json));
        log("--------");
        success(pageModel);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> searchSport({
    required Success<SearchSportModel> success,
    required String keyword,
    required Fail fail,
  }) async {
    var params = {'word': keyword};
    String path = "/sport/401/event/search";

    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok) {
      if (response.statusOk) {
        print('索取搜索传参：${JsonUtil.encodeObj(response.data)}');
        SearchSportModel searchSportModel = SearchSportModel.fromJson(response.data);
        success(searchSportModel);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///获取列表投注項 - 盘口类型 下拉框
  Future<HttpResponse> getSportHandicapType({
    required Success<SportHandicapApiModel> success,
    required Failed fail,
  }) async {
    var params = {};
    String path = "/sport/401/bettype/filter";
    log("盘口类型参数...${JsonUtil.encodeObj(params)}");
    HttpResponse response = await $engine?.execute(Method.GET, path, params: {});
    if (response.ok && response.statusOk) {
      var apiModel = SportHandicapApiModel.fromJson(response.data);
      log("盘口类型api...${JsonUtil.encodeObj(apiModel)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  Future<HttpResponse> getSportConfig({
    required Success<FilterModel> success,
    required Fail fail,
  }) async {
    String path = "/sport/401/homepage/config";
    HttpResponse response = await $engine?.execute(Method.GET, path);
    if (response.ok) {
      if (response.statusOk) {
        success(FilterModel.fromJson(response.data));
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> getChampionList({
    required int si,
    int? page = 1,
    int? page_size = 100,
    required Success<Map> success,
    required Fail fail,
  }) async {
    var params = {"si": si, "page": page, "page_size": page_size};
    String path = "/sport/401/outright/list";
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

  Future<HttpResponse> getSportState({
    required Success<dynamic> success,
    required Fail fail,
  }) async {
    var params = {"game_type": 4, "page": 1, "page_size": 100};
    String path = "/member/platform/list";
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

  Future<HttpResponse> login({
    String cur = '701',
    required Success<String> success,
    required Fail fail,
  }) async {
    var params = {'cur': cur};
    String path = "/sport/401/login";
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
}
