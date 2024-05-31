import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bet/services/account_service.dart';
import 'package:flutter_bet/utils/http/http_response.dart';

import '../../../model/page.dart';
import '../../../model/wallet/BalanceBean.dart';
import '../../../model/wallet/BankcardBean.dart';
import '../../../model/wallet/CoinBean.dart';
import '../../../model/wallet/CoinPaymentDetailsBean.dart';
import '../../../model/wallet/CurrencyBean.dart';
import '../../../model/wallet/PaymentDetails.dart';
import '../../../model/wallet/ValidCurrencyBean.dart';
import '../../../utils/http/http_engine.dart';
import '../api_service.dart';

extension WalletApiService on ApiService {
  ///虚拟钱包列表
  ///[pageSize]页码
  ///[page]当前页
  ///[contractType]合约类型 id
  ///[currencyName]货币id
  Future<HttpResponse> walletList({
    required int pageSize,
    required int page,
    required String contractType,
    required String currencyId,
    required Success<PageModel<CoinBean>> success,
    required Fail fail,
  }) async {
    var params = {
      "page_size": pageSize,
      "page": page,
      "contract_type": contractType,
      "currency_id": currencyId,
    };
    // String path = "/member/wallet/list";
    String path = "/finance/withdraw/wallet";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        final page = PageModel<CoinBean>.fromJson(response.data, (json) => CoinBean.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///添加虚拟币钱包
  /// [contractType]合约类型
  /// [currencyName]货币名
  /// [walletAddress] 钱包地址
  /// [isDefault] 是否默认 ：1是 2否
  Future<HttpResponse> walletInsert({
    String? id = "",
    required String contractType,
    required String currencyId,
    required String address,
    required int isDefault,
    required String payPassword,
    required String authType,
    required Success<String> success,
    required Fail fail,
  }) async {
    var param = {
      "id": id,
      "contract_type": int.parse(contractType),
      "currency_id": currencyId,
      "address": address,
      "is_default": isDefault,
      "pay_password": payPassword,
      "auth_type": int.parse(authType), //验证方式 1:谷歌 2:资金密码
    };
    String path;
    if (id == "") {
      path = "/member/wallet/insert";
    } else {
      path = "/member/wallet/update";
    }

    HttpResponse response = await $engine?.execute(Method.POST, path, data: param);
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

  ///银行卡列表
  ///[currency_id]
  Future<HttpResponse> bankcardList({
    required int pageSize,
    required int page,
    required String currencyId,
    required Success<PageModel<BankcardBean>> success,
    required Fail fail,
  }) async {
    var params = {
      "page_size": pageSize,
      "page": page,
      "currency_id": currencyId,
    };
    String path = "/member/bankcard/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        final page =
            PageModel<BankcardBean>.fromJson(response.data, (json) => BankcardBean.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///获取三方支付银行列表
  ///[currency_id]
  Future<HttpResponse> thirdBankcardList<T>({
    required String id,
    required Success<List<T>> success,
    required Fail fail,
    required T Function(dynamic) converter,
  }) async {
    var params = {
      "id": id,
    };
    String path = "/payment/deposit/bank/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data != null) {
          List<T> data = (response.data as List<dynamic>).map<T>((dynamic item) {
            return converter(item);
          }).toList();
          success(data);
        } else {
          success([]);
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///添加银行卡
  ///[bankType]银行卡类型，如：中国(cn)越南(vn)
  ///[openName]开户人姓名，如：李四
  ///[bankName]银行名称，如：农业银行
  ///[bankAccount]银行账号
  ///[bankAreaCpf]开户地区，如：广东省深圳市龙华
  ///[isDefault]是否默认：1：是，2否
  Future<HttpResponse> bankcardInsert({
    String? id = "",
    required int bankId,
    required String currencyId,
    required String openName,
    required String bankName,
    required String bankAccount,
    required String bankAreaCpf,
    required int isDefault,
    required String payPassword,
    required String country,
    required String city,
    required String address,
    required String authType,
    required Success<String> success,
    required Fail fail,
  }) async {
    var params = {
      "id": id,
      "bank_id": bankId,
      "currency_id": currencyId,
      "open_name": openName,
      "bank_name": bankName,
      "bank_account": bankAccount,
      "bank_area_cpf": bankAreaCpf,
      "is_default": isDefault,
      "pay_password": payPassword,
      "country": country,
      "city": city,
      "address": address,
      "auth_type": int.parse(authType), //验证方式 1:谷歌 2:资金密码
    };
    // String path = "/member/bankcard/insert";
    String path;
    if (id == "") {
      path = "/member/bankcard/insert";
    } else {
      path = "/member/bankcard/update";
    }
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

  Future getCountryAndBandBard<T>({
    required String currencyId,
    required Success<List<dynamic>> success,
    required Fail fail,
  }) async {
    String path = "/member/bankcard/bank";
    var params = {
      "currency_id": currencyId,
    };
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

  Future<HttpResponse> treeList<T>({
    required String level,
    required Success<List<T>> success,
    required Fail fail,
    required T Function(dynamic) converter, // 传入一个将动态类型转换为T类型的函数
  }) async {
    var params = {
      "level": level,
    };
    String path = "/member/tree/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data != null) {
          List<T> data = (response.data as List<dynamic>).map<T>((dynamic item) {
            return converter(item);
          }).toList();
          success(data);
        } else {
          success([]);
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future balance<T>({
    required Success<List<CurrencyBean>> success,
    required Fail fail,
  }) async {
    var currentUser = AccountService.sharedInstance.currentUser;
    if (currentUser != null) {
      BalanceBean? data = currentUser.balance;
      var json = data!.toJson();
      List<CurrencyBean> list = [];
      List<MapEntry<String, dynamic>> keyValuePairs = json.entries.toList();
      for (int i = 0; i < keyValuePairs.length; i++) {
        var key = keyValuePairs[i].key;
        if (!key.contains("uid")) {
          list.add(CurrencyBean(name: keyValuePairs[i].key, amount: keyValuePairs[i].value));
        }
      }
      success(list);
    }
  }

  ///货币配置信息
  Future currencyConfig<T>({
    required Success<List<CurrencyBean>> success,
    required Fail fail,
  }) async {
    String configJsonData = await rootBundle.loadString('assets/jsons/config.json');
    var data = json.decode(configJsonData);
    var configData = data['data'];
    List<CurrencyBean> list = [];
    for (int i = 0; i < configData.length; i++) {
      list.add(CurrencyBean(
        name: configData[i]['cur_name'],
        symbol: configData[i]['symbol'],
        cur: configData[i]['cur'],
        currency_type: configData[i]['currency_type'],
        // contract_type: configData[i]['contract_type'],
        bank_tree: configData[i]['bank_tree'],
        decimal_places: configData[i]['decimal_places'],
      ));
    }
    success(list);
    log("neco 货币配置信息 ${configData}");
  }

  ///保险库加减
  /// flag 1:转入2:转出
  Future<HttpResponse> balanceLocker<T>({
    required int flag,
    required int currencyId,
    required String password,
    required String amount,
    required String authType,
    required Success<String> success,
    required Fail fail,
  }) async {
    var params = {};
    if (password.isEmpty) {
      params = {
        "flag": flag,
        "currency_id": currencyId,
        "amount": amount,
      };
    } else {
      params = {
        "flag": flag,
        "currency_id": currencyId,
        "password": password,
        "amount": amount,
        "auth_type": int.parse(authType),
      };
    }

    String path = "/member/balance/locker/update";
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

  ///保险库余额
  Future balanceLockerShow<T>({
    required Success<List<CurrencyBean>> success,
    required Fail fail,
  }) async {
/*    var currentUser = AccountService.sharedInstance.currentUser;
    if(currentUser!=null){
      BalanceBean? data = !isDeposit?currentUser.balance_locker:currentUser.balance;
      if(data!=null){
        var json = data.toJson();
        List<CurrencyBean> list = [];
        List<MapEntry<String, dynamic>> keyValuePairs = json.entries.toList();
        for(int i = 0; i <keyValuePairs.length ; i++){
          var key = keyValuePairs[i].key;
          if(!key.contains("uid")){
            list.add(CurrencyBean(name: keyValuePairs[i].key,amount: keyValuePairs[i].value));
          }
        }
        success(list);
      }
    }*/
    String path = "/member/balance/locker";
    HttpResponse response = await $engine?.execute(Method.GET, path);
    if (response.ok) {
      if (response.statusOk) {
        var data = response.data;
        List<CurrencyBean> list = [];
        List<MapEntry<String, dynamic>> keyValuePairs = data.entries.toList();
        for (int i = 0; i < keyValuePairs.length; i++) {
          var key = keyValuePairs[i].key;
          if (!key.contains("uid")) {
            list.add(CurrencyBean(name: keyValuePairs[i].key, amount: keyValuePairs[i].value));
          }
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

  ///保险库利息
  Future interestAllocation<T>({
    required String currencyId,
    // required Success<List<dynamic>> success,
    required Success<dynamic> success,
    required Fail fail,
  }) async {
    String path = "/member/interest/config";
    var params = {
      "cur": currencyId,
    };
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

  Future<HttpResponse> cardBagList({
    required Success<Map<String, List<MapEntry<String, dynamic>>>> success,
    required Fail fail,
  }) async {
    String path = "/member/wallet/bankcard/list";
    HttpResponse response = await $engine?.execute(Method.GET, path);
    if (response.ok) {
      if (response.statusOk) {
        var coin = response.data['coin'];
        var bankcard = response.data['bankcard'];
        Map<String, List<MapEntry<String, dynamic>>> cardBag = {};
        List<MapEntry<String, dynamic>> keyValueCoin = [];
        if (coin != null) {
          keyValueCoin = coin?.entries.toList();
        }
        List<MapEntry<String, dynamic>> keyValueBank = [];
        if (bankcard != null) {
          keyValueBank = bankcard?.entries.toList();
        }
        cardBag['coin'] = keyValueCoin;
        cardBag['bankcard'] = keyValueBank;
        success(cardBag);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> removeAddress<T>({
    required Success<String> success,
    required String id,
    required String payPassword,
    required String authType,
    required Fail fail,
  }) async {
    String path = "/member/wallet/delete";
    var data = {"id": id, "pay_password": payPassword, "auth_type": int.parse(authType)};
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
    if (response.ok) {
      if (response.statusOk) {
        var data = response.data;
        success(data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> removeBankcard<T>({
    required Success<String> success,
    required String id,
    required String payPassword,
    required String authType,
    required Fail fail,
  }) async {
    String path = "/member/bankcard/delete";
    var data = {
      "id": id,
      "pay_password": payPassword,
      "auth_type": int.parse(authType) //验证种类 1:二阶段验证码 2:资金密码
    };
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
    if (response.ok) {
      if (response.statusOk) {
        var data = response.data;
        success(data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> coinContract({
    required Success<dynamic> success,
    required Fail fail,
  }) async {
    String path = "/finance/merchant/coin/contract";
    HttpResponse response = await $engine?.execute(Method.GET, path);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data != null) {
          success(response.data);
        } else {
          success([]);
        }
      } else {
        fail(response.error?.message);
      }
    }
    return response;
  }

  Future<HttpResponse> payWayListV2<T>({
    required String currencyId,
    String contractId = "",
    required Success<List<T>> success,
    required Fail fail,
    required T Function(dynamic) converter, // 传入一个将动态类型转换为T类型的函数
  }) async {
    var params = {
      "currency_id": currencyId,
    };
    if (contractId.isNotEmpty) {
      params["contract_id"] = contractId;
    }
    String path = "/finance/method/v2/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data != null) {
          List<T> data = (response.data as List<dynamic>).map<T>((dynamic item) {
            return converter(item);
          }).toList();
          success(data);
        } else {
          success([]);
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> payWayList<T>({
    required String currencyId,
    required Success<List<T>> success,
    required Fail fail,
    required T Function(dynamic) converter, // 传入一个将动态类型转换为T类型的函数
  }) async {
    var params = {
      "currency_id": currencyId,
    };
    String path = "/finance/method/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data != null) {
          List<T> data = (response.data as List<dynamic>).map<T>((dynamic item) {
            return converter(item);
          }).toList();
          success(data);
        } else {
          success([]);
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> payChannelList<T>({
    required String id,
    required Success<List<T>> success,
    required Fail fail,
    required T Function(dynamic) converter, // 传入一个将动态类型转换为T类型的函数
  }) async {
    var params = {
      "id": id,
    };
    String path = "/finance/merchant/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data != null) {
          List<T> data = (response.data as List<dynamic>).map<T>((dynamic item) {
            return converter(item);
          }).toList();
          success(data);
        } else {
          success([]);
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> coinPayChannelList<T>({
    required String currencyId,
    required String contractId,
    required Success<List<T>> success,
    required Fail fail,
    required T Function(dynamic) converter, // 传入一个将动态类型转换为T类型的函数
  }) async {
    var params = {
      "currency_id": currencyId,
      "contract_id": contractId,
    };
    String path = "/finance/merchant/coin/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data != null) {
          List<T> data = (response.data as List<dynamic>).map<T>((dynamic item) {
            return converter(item);
          }).toList();
          success(data);
        } else {
          success([]);
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> thirdDeposit<T>({
    required Success<String> success,
    required String amount,
    required String cid,
    required String mid,
    required String bankCode,
    required String currencyId,
    required String currencyName,
    required Fail fail,
  }) async {
    String path = "/finance/third/deposit";
    var data = {
      "amount": amount,
      "cid": cid,
      "mid": mid,
      "bank_code": bankCode,
      "currency_id": currencyId,
      "currency_name": currencyName
    };
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
    if (response.ok) {
      if (response.statusOk) {
        var data = response.data;
        success(data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> applicationDeposit({
    required Success<PaymentDetails> success,
    required String amount,
    required String cid,
    required String mid,
    required String currencyId,
    required String currencyName,
    required String realname,
    required String bankcardId,
    required Fail fail,
  }) async {
    String path = "/payment/deposit/bank/application";
    var data = {
      "amount": amount,
      "cid": cid,
      "mid": mid,
      "currency_id": currencyId,
      "currency_name": currencyName,
      "realname": realname,
      "bankcard_id": bankcardId,
    };
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
    if (response.ok) {
      if (response.statusOk) {
        var data = response.data;
        var json = PaymentDetails.fromJson(data);
        success(json);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  //application order confirm
  Future<HttpResponse> bankConfirm({
    required Success<String> success,
    required String id,
    required Fail fail,
  }) async {
    String path = "/payment/deposit/bank/confirm";
    var data = {
      "id": id,
    };
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
    if (response.ok) {
      if (response.statusOk) {
        success(response.data.toString());
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  //application order cancel
  Future<HttpResponse> bankCancel({
    required Success<String> success,
    required String id,
    required Fail fail,
  }) async {
    String path = "/payment/deposit/bank/cancel";
    var data = {
      "id": id,
    };
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
    if (response.ok) {
      if (response.statusOk) {
        success(response.data.toString());
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> thirdCoinDeposit<T>({
    required Success<CoinPaymentDetailsBean> success,
    required String amount,
    required String cid,
    required String mid,
    required String currencyId,
    required String currencyName,
    required Fail fail,
  }) async {
    String path = "/finance/third/coin/deposit";
    var data = {
      "amount": amount,
      "cid": cid,
      "mid": mid,
      "currency_id": currencyId,
      "currency_name": currencyName,
    };
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
    if (response.ok) {
      if (response.statusOk) {
        var data = response.data;
        var json = CoinPaymentDetailsBean.fromJson(data);
        success(json);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> coinAppDeposit({
    required Success<CoinPaymentDetailsBean> success,
    required String amount,
    required String cid,
    required String mid,
    required String currencyId,
    required String currencyName,
    required String bankcardId,
    required Fail fail,
  }) async {
    String path = "/payment/deposit/coin/application";
    var data = {
      "amount": amount,
      "cid": cid,
      "mid": mid,
      "currency_id": currencyId,
      "currency_name": currencyName,
      "bankcard_id": bankcardId,
    };
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
    if (response.ok) {
      if (response.statusOk) {
        var data = response.data;
        var json = CoinPaymentDetailsBean.fromJson(data);
        success(json);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> coinConfirm({
    required Success<String> success,
    required String id,
    required Fail fail,
  }) async {
    String path = "/payment/deposit/coin/confirm";
    var data = {
      "id": id,
    };
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
    if (response.ok) {
      if (response.statusOk) {
        success(response.data.toString());
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> coinCancel({
    required Success<String> success,
    required String id,
    required Fail fail,
  }) async {
    String path = "/payment/deposit/coin/cancel";
    var data = {
      "id": id,
    };
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
    if (response.ok) {
      if (response.statusOk) {
        success(response.data.toString());
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> withdrawBankcardList({
    required String currencyId,
    required Success<PageModel<BankcardBean>> success,
    required Fail fail,
  }) async {
    var params = {
      "currency_id": currencyId,
    };
    String path = "/finance/withdraw/bankcard";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        final page =
            PageModel<BankcardBean>.fromJson(response.data, (json) => BankcardBean.fromJson(json));
        success(page);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> withdrawMethodList<T>({
    required String currencyId,
    required String contractId,
    required Success<List<T>> success,
    required Fail fail,
    required T Function(dynamic) converter,
  }) async {
    var params = {"currency_id": currencyId, "contract_id": contractId};
    String path = "/finance/withdraw/method/list";
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data != null) {
          List<T> data = (response.data as List<dynamic>).map<T>((dynamic item) {
            return converter(item);
          }).toList();
          success(data);
        } else {
          success([]);
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> withdraw<T>({
    required Success<String> success,
    required String currencyId,
    required String methodId,
    required String amount,
    required String payPassword,
    required String bankcardId,
    required String authType,
    required Fail fail,
  }) async {
    //{
    // "currency_id": 701, //币种
    // "type_id": "16254403970632953", //出款方式id，来源为member的/finance/withdraw/type/list
    // "amount": "100", //出款金额
    // "pay_password": "123456", //资金密码
    // "bankcard_id": "44912994472972556" //银行卡id
    // }
    String path = "/finance/withdraw";
    var data = {
      "currency_id": int.parse(currencyId.isEmpty ? "0" : currencyId),
      "type_id": methodId,
      "amount": amount,
      "pay_password": payPassword,
      "bankcard_id": bankcardId,
      "auth_type": int.parse(authType), //验证种类 1:二阶段验证码, 2:资金密码
    };
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
    if (response.ok) {
      if (response.statusOk) {
        var data = response.data;
        success(data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> coinWithdraw<T>({
    required Success<String> success,
    required String currencyId,
    // required String methodId,
    required String amount,
    required String payPassword,
    required String walletId,
    required String contractId,
    required String memo,
    required String authType,
    required Fail fail,
  }) async {
    //   {
    //     "currency_id": 706, //币种
    //   "method_id": "155120665317925762", //代付方式id
    //   "amount": "100", //出款金额
    //   "pay_password": "123456", //资金密码
    //   "wallet_id": "51625097540628850", //钱包id
    //   "contract_id": "1802" //该虚拟币有协议才传
    // }
    String path = "/finance/withdraw/coin";
    var data = {
      "currency_id": int.parse(currencyId.isEmpty ? "0" : currencyId), //币种
      // "method_id": methodId, //代付方式id
      "amount": amount, //出款金额
      "pay_password": payPassword, //资金密码
      "wallet_id": walletId, //钱包id
      "contract_id": contractId, //该虚拟币有协议才传
      "memo": memo,
      "auth_type": int.parse(authType), //验证种类 1:二阶段验证码, 2:资金密码
    };
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
    if (response.ok) {
      if (response.statusOk) {
        var data = response.data;
        success(data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> exchangeRateList<T>({
    required Success<T> success,
    required Fail fail,
    required T Function(dynamic) converter,
  }) async {
    String path = "/exchange/rate/list";
    HttpResponse response = await $engine?.execute(Method.GET, path);
    if (response.ok) {
      if (response.statusOk) {
        log("neco 汇率 ${response.data}");
        if (response.data != null) {
          success(converter(response.data));
        } else {
          // success();
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  //可取款余额
  Future<HttpResponse> withdrawBalance<T>({
    required Success<T> success,
    required String currencyId,
    required Fail fail,
    required T Function(dynamic) converter,
  }) async {
    String path = "/finance/withdraw/balance";
    var params = {
      "currency_id": currencyId,
    };
    HttpResponse response = await $engine?.execute(Method.GET, path, params: params);
    if (response.ok) {
      if (response.statusOk) {
        if (response.data != null) {
          success(converter(response.data));
        } else {
          // success();
        }
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> dcAvailableList<T>({
    required String contractId,
    required Success<List<T>> success,
    required Fail fail,
    required T Function(dynamic) converter,
  }) async {
    var params = {
      "contract_id": contractId,
    };
    String path = "/finance/deposit/currency";
    HttpResponse response = await $engine?.execute(Method.GET, path);
    if (response.ok) {
      if (response.statusOk) {
        List<T> data = (response.data as List<dynamic>).map<T>((dynamic item) {
          return converter(item);
        }).toList();
        success(data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> wcAvailableList<T>({
    required String contractId,
    required Success<List<T>> success,
    required Fail fail,
    required T Function(dynamic) converter,
  }) async {
    var params = {
      "contract_id": contractId,
    };
    String path = "/finance/withdraw/currency";
    HttpResponse response = await $engine?.execute(
      Method.GET,
      path,
    );
    if (response.ok) {
      if (response.statusOk) {
        List<T> data = (response.data as List<dynamic>).map<T>((dynamic item) {
          return converter(item);
        }).toList();
        success(data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  //币种间余额转换
  Future<HttpResponse> balanceTransfer<T>({
    required String currencyOut,
    required String currencyIn,
    required String amount,
    required Success<String> success,
    required Fail fail,
  }) async {
    var params = {
      "currency_out": currencyOut,
      "currency_in": currencyIn,
      "amount": amount,
    };
    String path = "/finance/balance/transfer";
    HttpResponse response = await $engine?.execute(Method.POST, path, data: params);
    if (response.ok) {
      if (response.statusOk) {
        success("成功");
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> balanceTransferLock<T>({
    required Success<dynamic> success,
    required Fail fail,
  }) async {
    String path = "/finance/balance/transfer/lock";
    HttpResponse response = await $engine?.execute(Method.GET, path);
    if (response.ok) {
      if (response.statusOk) {
        success(jsonEncode(response.data['expire_at']));
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  ///------------------代理钱包

  //代理钱包余额
  Future balanceAgency<T>({
    required Success<List<CurrencyBean>> success,
    required Fail fail,
  }) async {
    String path = "/member/balance/agency";
    HttpResponse response = await $engine?.execute(Method.GET, path);
    if (response.ok) {
      if (response.statusOk) {
        var data = response.data;
        List<CurrencyBean> list = [];
        List<MapEntry<String, dynamic>> keyValuePairs = data.entries.toList();
        for (int i = 0; i < keyValuePairs.length; i++) {
          var key = keyValuePairs[i].key;
          if (!key.contains("uid")) {
            list.add(CurrencyBean(name: keyValuePairs[i].key, amount: keyValuePairs[i].value));
          }
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

  //提取佣金
  Future withdrawalCommission<T>({
    required Success<dynamic> success,
    required Fail fail,
    required BuildContext context,
  }) async {
    String path = "/agency/transfer/to/member";
    var data = {};
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
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

  //兑换
  Future<HttpResponse> agencyExchange({
    required Success<String> success,
    required String curId,
    required Fail fail,
  }) async {
    String path = "/agency/balance/exchange";
    var data = {
      "cur": curId,
    };
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
    if (response.ok) {
      if (response.statusOk) {
        success(response.data.toString());
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  //转账
  Future<HttpResponse> agencyTransferToMember({
    required Success<String> success,
    required String curId,
    required String password,
    required String amount,
    required Fail fail,
  }) async {
    String path = "/agency/transfer/to/member";
    var data = {
      "cur": curId,
      "password": password,
      "amount": amount,
    };
    HttpResponse response = await $engine?.execute(Method.POST, path, data: data);
    if (response.ok) {
      if (response.statusOk) {
        success(response.data.toString());
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> validCurrency<T>({
    required Success<List<ValidCurrencyBean>> success,
    required Fail fail,
  }) async {
    var param = {};
    String path = "/finance/deposit/wallet/invalid/currency";

    HttpResponse response = await $engine?.execute(Method.GET, path, data: param);
    if (response.ok) {
      if (response.statusOk) {
        List<ValidCurrencyBean> data =
            (response.data as List<dynamic>).map<ValidCurrencyBean>((dynamic item) {
          return ValidCurrencyBean.fromJson(item);
        }).toList();
        success(data);
      } else {
        fail(response.data);
      }
    } else {
      fail(response.error?.message);
    }
    return response;
  }

  Future<HttpResponse> wdFeeInfo<T>({
    required String curId,
    required Success<dynamic> success,
    required Fail fail,
  }) async {
    String path = "/finance/withdraw/fee/info";
    var param = {
      "currency_id": curId,
    };

    HttpResponse response = await $engine?.execute(Method.GET, path, params: param);
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
