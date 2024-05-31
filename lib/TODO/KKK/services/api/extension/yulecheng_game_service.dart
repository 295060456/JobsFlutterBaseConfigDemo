import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/model/page.dart';
import 'package:flutter_bet/model/yulecheng/big_wins_model.dart';
import 'package:flutter_bet/model/yulecheng/gameDetailModel.dart';
import 'package:flutter_bet/model/yulecheng/gamelist_model.dart';
import 'package:flutter_bet/model/yulecheng/yulecheng_compitite_rank.dart';
import 'package:flutter_bet/model/yulecheng/yulecheng_remen_recoment_model.dart';
import 'package:flutter_bet/services/account_service.dart';
import 'package:flutter_bet/services/api/api_service.dart';
import 'package:flutter_bet/utils/http/http_engine.dart';
import 'package:flutter_bet/utils/http/http_response.dart';
import 'package:flutter_bet/utils/json_util.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/notice_model.dart';
import '../../../model/page_common_model.dart';
import '../../../model/yulecheng/casino_record_model.dart';
import '../../../model/yulecheng/index.dart';
import '../../../pages/betting/common_model/betting_race_api_model.dart';
import '../../../pages/betting/common_model/betting_record_api_model.dart';
import '../../../pages/betting/common_model/betting_record_prove_api_model.dart';

extension GameApiService on ApiService {
  /// 拉取大厅数据
  Future<HttpResponse> getLobbyGame({
    required Success<YulechengLobbyModel> success,
    required Fail fail,
  }) async {
    String path = "/member/game/lobby";

    HttpResponse response = await $engine?.execute(Method.GET, path, isZstd: true);
    if (response.ok) {
      if (response.statusOk) {
        final YulechengLobbyModel model = YulechengLobbyModel.fromJson(response.data);
        success(model);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 拉取分类数据
  Future<HttpResponse> getLobbyGameCate({
    required String cid,
    required Success<YulechengLobbyCateModel> success,
    required Fail fail,
  }) async {
    String path = "/member/game/cate";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cacheStringKey = path + cid;
    String cacheString = prefs.getString(cacheStringKey) ?? "";
    if (cacheString.isNotEmpty) {
      final YulechengLobbyCateModel model =
          YulechengLobbyCateModel.fromJson(jsonDecode(cacheString));
      success(model);
    }

    HttpResponse response =
        await $engine?.execute(Method.GET, path, params: {"cid": cid}, isZstd: true);
    if (response.ok) {
      log("娱乐城分类数据api：${JsonUtil.encodeObj(response.data)}");
      if (response.statusOk) {
        final YulechengLobbyCateModel model = YulechengLobbyCateModel.fromJson(response.data);
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

  /// 拉取分类数据
  Future<HttpResponse> getLobbyGameCate5({
    required String cid,
    required Success<PageModel<YuLeChengChangGuanModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/game/cate";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cacheStringKey = path + cid;
    String cacheString = prefs.getString(cacheStringKey) ?? "";
    if (cacheString.isNotEmpty) {
      // final page = PageModel<YuLeChengChangGuanModel>.fromJson(
      //       cacheString, (json) => YuLeChengChangGuanModel.fromJson(json));
      //   success(page);
    }

    HttpResponse response =
        await $engine?.execute(Method.GET, path, params: {"cid": cid}, isZstd: true);
    if (response.ok) {
      log("娱乐城分类数据api：${JsonUtil.encodeObj(response.data)}");
      if (response.statusOk) {
        final page = PageModel<YuLeChengChangGuanModel>.fromJson(
            response.data, (json) => YuLeChengChangGuanModel.fromJson(json));
        success(page);
        prefs.setString(cacheStringKey, jsonEncode(response.data));
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 拉取分类数据
  Future<HttpResponse> getLobbyGameCateMoreData({
    required int page,
    required int page_size,
    required String cid,
    required platform_id,
    String sort = "created_at:desc",
    required Success<PageModel<GameLobbyModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/game/cate/games";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cacheStringKey = path + page.toString() + cid + platform_id + sort;
    if (page == 1) {
      String cacheString = prefs.getString(cacheStringKey) ?? "";
      if (cacheString.isNotEmpty) {
        final page = PageModel<GameLobbyModel>.fromJson(
            jsonDecode(cacheString), (json) => GameLobbyModel.fromJson(json));
        success(page);
      }
    }
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      params: {
        "cid": cid,
        "page": page,
        "page_size": page_size,
        "venue_id": platform_id,
        "sort": sort
      },
    );
    if (response.ok) {
      if (response.statusOk) {
        final page = PageModel<GameLobbyModel>.fromJson(
            response.data, (json) => GameLobbyModel.fromJson(json));
        success(page);
        if (page == 1) {
          prefs.setString(cacheStringKey, jsonEncode(response.data));
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 拉取游戏列表信息
  ///
  Future<HttpResponse> getAllGames({
    required int page,
    required int game_type,
    required Success<PageModel<GameListModel>> success,
    String sort = "name:desc",
    required Fail fail,
  }) async {
    String path = "/member/game/list";
    var params = {
      "page": page,
      "page_size": AppValues.defaultPageSize + 1,
      // "tag_id": 1,
      // "platform_id": 26595015200305,
      // "is_new": 1,
      "game_type": game_type,
      "sort": sort,
      // "is_hot": false,
      // "is_hot":
    };
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      params: params,
    );
    if (response.ok) {
      if (response.statusOk) {
        // var gameList = [];
        // for (var element in response.data["d"]) {
        //   GameListModel model = GameListModel.fromJson(element);
        //   gameList.add(model);
        // }
        final page = PageModel<GameListModel>.fromJson(
            response.data, (json) => GameListModel.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 拉取游戏列表信息
  ///
  Future<HttpResponse> getRecentGames({
    required Success<List<GameListModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/game/list/history";

    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      params: {},
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cacheStringKey = "${path} ${AccountService().currentUser?.uid ?? "--"}";
    String cacheString = prefs.getString(cacheStringKey) ?? "";
    if (cacheString.isNotEmpty) {
      final List<GameListModel> jsonList = [];
      List data = jsonDecode(cacheString);
      for (var element in data) {
        GameListModel model = GameListModel.fromJson(element);
        jsonList.add(model);
      }
      success(jsonList);
    }
    if (response.ok) {
      if (response.statusOk) {
        int? length = response.data?.length ?? 0;
        if (length! < 1) {
          success([]);
        } else {
          final List<GameListModel> jsonList = [];
          for (var element in response.data) {
            GameListModel model = GameListModel.fromJson(element);
            jsonList.add(model);
          }

          success(jsonList);
          prefs.setString(cacheStringKey, jsonEncode(response.data));
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 拉取ty2游戏列表信息
  ///
  Future<HttpResponse> getYulechengTy2Games({
    required int page,
    required int page_size,
    required String platformid,
    String sort = "name:desc",
    required Success<PageModel<GameListModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/game/list";
    var params = {
      "page": page,
      "page_size": page_size,
      // "tag_id": 1,
      "platform_id": platformid,
      // "is_new": 1,
      // "game_type": game_type,
      "sort": sort,
      // "is_hot": false,
      // "is_hot":
    };
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      params: params,
    );
    if (response.ok) {
      if (response.statusOk) {
        final page = PageModel<GameListModel>.fromJson(
            response.data, (json) => GameListModel.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 拉取热门游戏列表信息
  ///
  Future<HttpResponse> getHotGames({
    required int page,
    required String platform_id,
    required Success<PageModel<GameListModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/game/hot/list";
    var params = {
      "page": page,
      "page_size": AppValues.defaultPageSize + 1,
      "platform_id": platform_id,
    };
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      params: params,
    );
    print("获取热门列表失败0");
    if (response.ok) {
      if (response.statusOk) {
        print("获取热门列表成功0");
        final page = PageModel<GameListModel>.fromJson(
            response.data, (json) => GameListModel.fromJson(json));
        print("获取热门列表成功");

        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 拉取热门游戏列表信息
  ///
  Future<HttpResponse> getRecomendGames({
    required int page,
    required String platformId,
    required Success<YuLeChengHotRecomentModel> success,
    required Fail fail,
    String sort = "",
  }) async {
    String path = "/member/game/lobby";
    HttpResponse response = await $engine?.execute(Method.GET, path, isZstd: true);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cacheStringKey = "${path}1";
    // String cacheString = prefs.getString(cacheStringKey) ?? "";
    // if (cacheString.isNotEmpty) {
    //   Map<String, dynamic> data = jsonDecode(cacheString);
    //   final YuLeChengHotRecomentModel model = YuLeChengHotRecomentModel.fromJson(data);
    //   success(model);
    // }
    print("数据返回了-3----");
    if (response.ok) {
      if (response.statusOk) {
        Map<String, dynamic> data = response.data;
        if (data["bottoms"].length > 0) {
          final YuLeChengHotRecomentModel model =
              YuLeChengHotRecomentModel.fromJson(data["bottoms"][0]);
          success(model);
          prefs.setString(cacheStringKey, jsonEncode(data["bottoms"][0]));
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

  Future<HttpResponse> getDetailsLink({
    required String platformId,
    required String code,
    required String cur,
    required Success success,
    required Fail fail,
  }) async {
    String path = "/game/launch/$platformId";
    var params = {
      "code": code,
      "cur": cur,
    };
    Options options = Options();
    options.headers?.addAll({"cur": "BRL", "db": "dev"});
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      params: params,
      options: options,
    );
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

  ///获取单个游戏详情
  Future<HttpResponse> getGameDetails({
    required String id,
    required String pid,
    required String gameId,
    required Success<GameListModel> success,
    required Fail fail,
  }) async {
    String path = "/member/game/detail?id=$id";
    if (id == "") {
      path = "/member/game/detail?game_id=$gameId&pid=$pid";
    }
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
    );

    if (response.ok) {
      if (response.statusOk) {
        success(GameListModel.fromJson(response.data));
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  // 获取收藏列表
  Future<HttpResponse> getFavoriteGames({
    required int page,
    required Success<PageModel<GameListModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/fav/list";
    var params = {
      "page": page,
      "page_size": AppValues.defaultPageSize + 1,
      // "sort": "en_name:asc",
    };
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      params: params,
    );
    if (response.ok) {
      if (response.statusOk) {
        final page = PageModel<GameListModel>.fromJson(
            response.data, (json) => GameListModel.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///游戏收藏 取消收藏
  Future<HttpResponse> editCollect({
    required String gameId,
    required bool isCollect,
    required Success success,
    required Fail fail,
  }) async {
    String path = isCollect ? "/member/fav/insert?id=$gameId" : "/member/fav/delete?id=$gameId";
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
    );
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

  ///搜索娱乐城游戏
  Future<HttpResponse> getSearchCasinoGame({
    required int page,
    required int pageSize,
    required String keyword,
    required Success<PageModel<GameListModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/game/search";
    var params = {
      "page": page,
      "page_size": pageSize + 1,
      "w": keyword,
    };
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      params: params,
    );
    if (response.ok) {
      if (response.statusOk) {
        final page = PageModel<GameListModel>.fromJson(
            response.data, (json) => GameListModel.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///获取场馆  TODO: 临时替换
  Future<HttpResponse> getAllPlatForm({
    required Success<YuLeChengChangGuanApiModel> success,
    required Fail fail,
  }) async {
    String path = "/member/game/cate?cid=5";

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cacheStringKey = path;
    String cacheString = prefs.getString(cacheStringKey) ?? "";
    if (cacheString.isNotEmpty) {
      final apiModel = YuLeChengChangGuanApiModel.fromJson(jsonDecode(cacheString));
      success(apiModel);
    }
    HttpResponse response = await $engine?.execute(Method.GET, path, params: {}, isZstd: true);
    if (response.ok) {
      if (response.statusOk) {
        final apiModel = YuLeChengChangGuanApiModel.fromJson(response.data);
        success(apiModel);
        prefs.setString(cacheStringKey, jsonEncode(response.data));
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///获取场馆余额
  Future<HttpResponse> getPlatFormBalance({
    required String platformId,
    required String code,
    required String cur,
    required Success success,
    required Fail fail,
  }) async {
    String path = "/game/balance/$platformId";
    var params = {
      "code": code,
      "cur": cur,
    };
    Options options = Options();
    options.headers?.addAll({"cur": "CNY", "db": "dev"});
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      // params: params,
      options: options,
    );
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

  ///获取首页跑马灯数据
  Future<HttpResponse> getGameMarquee({
    required Success<NoticeModel> success,
    required Fail fail,
  }) async {
    String path = "/member/notice/all/list";
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
    );

    if (response.ok) {
      if (response.statusOk) {
        NoticeModel model = NoticeModel.fromJson(response.data);
        success(model);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 拉取娱乐场我的投注列表
  Future<HttpResponse> getCasinoRecord({
    required int page,
    required Success<PageModel<CasinoRecordModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/casino/record/list";
    var params = {
      "page": page,
      "page_size": AppValues.defaultPageSize + 1,
    };
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      params: params,
    );
    print('娱乐场投注数据：${response.data}');
    if (response.ok) {
      if (response.statusOk) {
        final page = PageModel<CasinoRecordModel>.fromJson(
            response.data, (json) => CasinoRecordModel.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 拉取娱乐场我的投注列表【v2版本】，重构，数据接收体不同
  Future<HttpResponse> getCasinoRecordV2({
    int? page,
    int? page_size,
    required Success<PageCommonModel<BettingRecordApiModel>> success,
    required Failed fail,
  }) async {
    String path = "/member/casino/record/list";
    var params = {
      "page": page,
      "page_size": page_size,
    };
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok && response.statusOk) {
      var apiModel = PageCommonModel<BettingRecordApiModel>.fromJson(
        response.data,
        (json) => BettingRecordApiModel.fromJson(json),
      );
      log("娱乐城我的投注api...${JsonUtil.encodeObj(apiModel.content)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  /// 所有投注/风云榜/大赢家/幸运赢家
  /// gameClass 游戏类型 1=真人,2=捕鱼,3=电子,4=体育
  /// gameCode 大厅排行“”
  /// type 0 最新时间 1最大金额
  Future<HttpResponse> getRankingList({
    required String gameClass,
    required String gameCode,
    required String type,
    required Success<PageModel<BigWinsModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/bet/list";
    var params = {
      "game_class": gameClass,
      "game_code": gameCode,
      "type": type,
      "page": 1,
      "page_size": 10,
    };
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      params: params,
    );
    if (response.ok) {
      if (response.statusOk) {
        final page =
            PageModel<BigWinsModel>.fromJson(response.data, (json) => BigWinsModel.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> getRankingListCompetite({
    required String startTime,
    required String endTime,
    required Success<PageModel<CompetitionModel>> success,
    required Fail fail,
  }) async {
    String path = "/member/competition/list";
    var params = {
      "start_time": startTime,
      "end_time": endTime,
      "page": 1,
      "page_size": 10,
    };
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
      params: params,
    );
    if (response.ok) {
      if (response.statusOk) {
        final page = PageModel<CompetitionModel>.fromJson(
            response.data, (json) => CompetitionModel.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 所有投注/风云榜/大赢家/幸运赢家
  /// gameClass 游戏类型 1=真人,2=捕鱼,3=电子,4=体育
  /// gameCode 大厅排行“highlights000000”
  /// type 0 最新时间 1最大金额
  ///  娱乐城、体育下面的所有投注、风云榜接口
  /// 查所有投注：page、page_size、type参数就好，type传0，就是所有投注的一个滚动效果
  /// 查风云榜：同上，type传1，一天内投注金额最大的在前
  /// 【重新设计,第二版】v2
  Future<HttpResponse> getRankingList_v2({
    int? page,
    int? page_size,
    required String gameClass,
    required String gameCode,
    required String type,
    required Success<PageCommonModel<BettingRecordApiModel>> success,
    required Failed fail,
  }) async {
    var params = {
      "game_class": gameClass,
      "game_code": gameCode,
      "type": type,
      "page": page ?? 1,
      "page_size": page_size ?? 10,
    };
    String path = "/member/bet/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok && response.statusOk) {
      var apiModel = PageCommonModel<BettingRecordApiModel>.fromJson(
        response.data,
        (json) => BettingRecordApiModel.fromJson(json),
      );
      log("娱乐城投注排行榜api...${JsonUtil.encodeObj(apiModel.content)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///竞赛排行榜
  Future<HttpResponse> getCompetitionList({
    int? page,
    int? page_size,
    required String start_time,
    required String end_time,
    required Success<PageCommonModel<BettingRaceApiModel>> success,
    required Failed fail,
  }) async {
    var params = {
      "page": page ?? 1,
      "page_size": page_size ?? 10,
      "start_time": start_time,
      "end_time": end_time,
    };
    String path = "/member/competition/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok && response.statusOk) {
      var apiModel = PageCommonModel<BettingRaceApiModel>.fromJson(
        response.data,
        (json) => BettingRaceApiModel.fromJson(json),
      );
      log("娱乐城竞赛排行榜api...${JsonUtil.encodeObj(apiModel.content)}");
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  ///可证明公平
  ///game/original/game/detail?id=66596818015017844&uid=29899334526508548
  Future<HttpResponse> getRecordProve({
    required String id,
    required String uid,
    required Success<BettingRecordProveApiModel> success,
    required Failed fail,
  }) async {
    var params = {
      "id": id,
      "uid": uid,
    };
    String path = "/game/original/game/detail";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok && response.statusOk) {
      var apiModel = BettingRecordProveApiModel.fromJson(response.data);
      success(apiModel);
    } else if (response.ok && !response.statusOk) {
      fail(true, response.data, null);
    } else {
      fail(false, response.error?.message, null);
    }
    return response;
  }

  // 获取轮播图
  Future<HttpResponse> getCasinoBanner({
    required Success<List> success,
    required Fail fail,
  }) async {
    String path = "/member/banner/v2/list?banner_type=1";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String cacheStringKey = path;
    String cacheString = prefs.getString(cacheStringKey) ?? "";
    if (cacheString.isNotEmpty) {
      final apiModel = jsonDecode(cacheString);
      success(apiModel);
    }
    HttpResponse response = await $engine?.execute(Method.GET, path);
    if (response.ok) {
      if (response.statusOk) {
        success(response.data);
        prefs.setString(path, json.encode(response.data));
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
}
