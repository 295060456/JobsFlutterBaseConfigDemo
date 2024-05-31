import 'package:flutter_bet/model/transactions/bet.dart';
import 'package:flutter_bet/model/transactions/other.dart';
import 'package:flutter_bet/model/transactions/wallet.dart';
import 'package:flutter_bet/pages/personal_center/transactions/index/state.dart';
import 'package:flutter_bet/utils/http/http_response.dart';
import '../../../model/page.dart';
import '../../../utils/http/http_engine.dart';
import '../api_service.dart';

/// 交易记录相关API
extension TransactionsApiService on ApiService {

  /// 入款记录/出款记录
  /// trType TransactionsType.deposits / withdrawals
  /// coinType TransactionsCoinType.crypto / banking
  Future<HttpResponse> trWalletList({
    required TransactionsType trType,
    required TransactionsCoinType coinType,
    required String stateCode,
    required int pageSize,
    required int page,
    required Success<PageModel<TrWalletModel>> success,
    required Fail fail,
  }) async {
    var params = {
      "page_size": pageSize,
      "page": page,
    };

    final trPath   = trType == TransactionsType.deposits ? "deposit" : "withdraw";
    final coinPath = coinType == TransactionsCoinType.crypto ? "coin" : "bank";

    String path = "/finance/record/$trPath/$coinPath?page=$page&page_size=$pageSize&state=$stateCode";
    HttpResponse response =
    await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        final page = PageModel<TrWalletModel>.fromJson(
            response.data, (json) => TrWalletModel.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }


  /// 投注记录列表获取
  Future<HttpResponse> trBetList({
    required int pageSize,
    required int page,
    required Success<PageModel<TrBetModel>> success,
    required Fail fail,
  }) async {
    var params = {
      "page_size": pageSize,
      "page": page,
    };
    String path = "/member/casino/record/list?page=$page&page_size=$pageSize";
    HttpResponse response =
    await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        final page = PageModel<TrBetModel>.fromJson(
            response.data, (json) => TrBetModel.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  /// 其它-下拉选单
  Future<HttpResponse> trOtherTypeList({
    required Success<List<dynamic>> success,
    required Fail fail,
  }) async {

    String path = "/finance/record/other/select?page=1&page_size=50";
    HttpResponse response =
    await $engine?.execute(Method.GET, path, params: {});
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

  /// 投注记录列表获取
  Future<HttpResponse> trOtherList({
    required int pageSize,
    required int page,
    required String typeId,
    required Success<PageModel<TrOtherModel>> success,
    required Fail fail,
  }) async {
    var params = {
      "page_size": pageSize,
      "page": page,
    };
    String path = "/finance/record/other?page=$page&page_size=$pageSize&id=$typeId";
    HttpResponse response =
    await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        final page = PageModel<TrOtherModel>.fromJson(
            response.data, (json) => TrOtherModel.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }


}