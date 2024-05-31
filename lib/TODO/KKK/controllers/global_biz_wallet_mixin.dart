import 'dart:developer';

import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/services/api/extension/wallet_api_service.dart';
import 'package:get/get.dart';

import '../model/wallet/BalanceBean.dart';
import '../model/wallet/CoinBean.dart';
import '../model/wallet/CurrencyBean.dart';
import '../model/wallet/ProtocolBean.dart';
import '../pages/personal_center/vault/model/coin_rate_model.dart';
import '../pages/personal_center/vault/vault_controller.dart';
import '../pages/personal_center/wallet/wallet_controller.dart';
import '../services/account_service.dart';
import '../services/api/api_service.dart';
import '../services/event/event_service.dart';
import '../utils/sp_util.dart';
import '../widget/refresh/widget/cupertino/easy_refresh_path.dart';

///业务级别的mixin, 钱包管理
mixin GlobalBizWalletMixin {
  final level = "018"; //protocols
  final vault = 001;
  final withdrawal = 002;
  final coinIcDomain = '${AppValues.defaultBranch.asset_url}/currency/';
  final coinIcExtensionName = ".webp";
  final refBnk = false.obs;
  final refAdr = false.obs;
  final dcAvailableData = <CurrencyBean>[].obs;
  final dcTemAvailableData = <CoinBean>[].obs;
  final wcAvailableData = <CurrencyBean>[].obs;
  final wcTemAvailableData = <CoinBean>[].obs;
  final rateList = <String, CoinRate>{}.obs;

  //用来搜索展示是，因为还涉及到本地的搜索，不能直接使用原数据的列表
  //todo:注意注意对currTypeLists 的使用， 是搜索存储。与注意currTypeInitialLists 的区别
  final currTypeLists = <CurrencyBean>[].obs;
  final balanceBean = BalanceBean().obs;
  final balanceList = <CurrencyBean>[].obs;

  final currTypeSelected = CurrencyBean().obs; //选中的币种

  //用来保存本地初始化数据
  //todo：钱包可用的货币列表
  final currTypeInitialLists = <CurrencyBean>[];

  final brandBase = {}.obs; // 密码配置
  final getBrandBase = {}.obs; // 品牌基础配置
  final brandDetail = {}.obs; //公共品牌信息

  var pactList = [];

  ///获取安全验证类型
  int getVerifyType() {
    int verType = getBrandBase['base']?['verify']?['all'] == true ? 3 : 2; //1谷歌验证 2资金密码 3全部
    if (verType != 3) {
      verType = getBrandBase['base']?['verify']?['otp'] == true ? 1 : 2; //1谷歌验证 2资金密码 3全部
    }
    return verType;
  }

  Future<void> dcAvailableList() async {
    await ApiService.instance.dcAvailableList(
      success: (availableList) {
        log("neco 存款币种：${availableList.length}");
        dcTemAvailableData.addAll(availableList);
      },
      fail: (message) {},
      contractId: "",
      converter: (json) {
        return CoinBean.fromJson(json);
      },
    );
  }

  Future<void> wcAvailableList() async {
    await ApiService.instance.wcAvailableList(
      success: (wcvailableList) {
        log("neco 取款币种：${wcvailableList.length}");
        wcTemAvailableData.addAll(wcvailableList);
      },
      fail: (message) {},
      contractId: "",
      converter: (json) {
        return CoinBean.fromJson(json);
      },
    );
  }

  ///获取 汇率
  Future<void> getExchangeRate() async {
    await ApiService.instance.exchangeRateList<CoinRateApiModel>(
      success: (data) {
        rateList.addAll(data.rates);
      },
      fail: (message) {},
      converter: (json) {
        return CoinRateApiModel.fromJson(json);
      },
    );
  }

  //
  List<CurrencyBean> findCommonData(List<CurrencyBean> currencyList, List<CoinBean> availableList) {
    return currencyList
        .where((currency) =>
            availableList.any((availableCurrency) => currency.cur == availableCurrency.currencyId))
        .toList();
  }

  bool areCollectionsEqual(List<CoinBean> dcTemAvailableData, List<CoinBean> availableList) {
    // 提取每个集合中元素的指定字段，然后将其转换为 Set 进行比较
    Set<dynamic> set1 = dcTemAvailableData.map((element) => element.currencyId).toSet();
    Set<dynamic> set2 = availableList.map((element) => element.currencyId).toSet();

    // 判断两个集合是否相等
    bool currencyIdsEqual = set1.containsAll(set2) && set2.containsAll(set1);
    // 返回最终结果
    return currencyIdsEqual;
  }

  void inquireBalance({int flag = 0}) {
    AccountService.sharedInstance.getBalance(
        success: (balanceBean) {
          this.balanceBean.value = balanceBean;
          setBalance(flag: flag);
        },
        fail: (String? message) {});
  }

  void setBalance({int flag = 0}) {
    var json = balanceBean.toJson();
    List<CurrencyBean> list = [];
    List<MapEntry<String, dynamic>> keyValuePairs = json.entries.toList();
    for (var keyValuePairsItem in keyValuePairs) {
      var key = keyValuePairsItem.key;
      String value = keyValuePairsItem.value ?? "";
      if (!key.contains("uid")) {
        if (value.isNotEmpty) {
          list.add(CurrencyBean(name: keyValuePairsItem.key, amount: keyValuePairsItem.value));
        }
      }
    }
    balanceList.assignAll(list);
    log("全局 ${balanceList.length}");
    syncData(flag: flag);
    getContractData();
  }

  Future<void> syncData({int flag = 0}) async {
    List<CurrencyBean> currencyConfigs = await currencyConfig();
    List<ProtocolBean> protocolConfigs = await protocol(level);
    mergeData(balanceList, currencyConfigs, protocolConfigs, flag: flag);
  }

  //货币信息
  Future<List<CurrencyBean>> currencyConfig() {
    Completer<List<CurrencyBean>> completer = Completer<List<CurrencyBean>>();
    ApiService.instance.currencyConfig<CurrencyBean>(
      success: (list) {
        completer.complete(list);
      },
      fail: (errorMessage) {
        completer.completeError(errorMessage ?? "");
      },
    );
    return completer.future;
  }

  Future<List<ProtocolBean>> protocol(String level) async {
    Completer<List<ProtocolBean>> completer = Completer<List<ProtocolBean>>();
    await ApiService.instance.treeList<ProtocolBean>(
        success: (list) {
          completer.complete(list);
        },
        fail: (errorMessage) {
          completer.completeError(errorMessage ?? "");
        },
        level: level,
        converter: (json) {
          return ProtocolBean.fromJson(json);
        });
    return completer.future;
  }

  void mergeData(List<CurrencyBean> balanceData, List<CurrencyBean> currencyConfigs,
      List<ProtocolBean> protocolConfigs,
      {int flag = 0}) {
    currTypeLists.clear();
    //法币、加密货币map 比如：USDT:model, ETH：model
    var protocolMap = {};
    for (var protocolConfigsValue1 in protocolConfigs) {
      if (protocolConfigsValue1.pid == "1800") {
        var value = [];
        for (var protocolConfigsValue2 in protocolConfigs) {
          if (protocolConfigsValue1.id == protocolConfigsValue2.pid) {
            value.add({
              "label": protocolConfigsValue2.name,
              'id': protocolConfigsValue2.id,
              'name': protocolConfigsValue1.name,
              'isSelect': false
            });
          }
        }
        protocolMap[protocolConfigsValue1.name] = value;
      }
    }

    for (var balanceDataItem in balanceData) {
      for (var currencyConfigsItem in currencyConfigs) {
        //钱包有的，显示出来
        if (balanceDataItem.name == currencyConfigsItem.name) {
          currTypeLists.add(CurrencyBean(
            coinIc: "$coinIcDomain${currencyConfigsItem.cur}$coinIcExtensionName",
            bank_tree: currencyConfigsItem.bank_tree,
            cur: currencyConfigsItem.cur,
            name: balanceDataItem.name,
            uid: currencyConfigsItem.uid,
            amount: balanceDataItem.amount,
            symbol: currencyConfigsItem.symbol,
            currency_type: currencyConfigsItem.currency_type,
            contract_type: protocolMap[balanceDataItem.name],
            decimal_places: currencyConfigsItem.decimal_places, //配置保留小数位
          ));
        }
      }
    }

    if (SPUtil().getCurrencyBean() != null) {
      currTypeSelected.value = SPUtil().getCurrencyBean()!;
    }
    if (currTypeLists.isNotEmpty) {
      if (SPUtil().getCurrencyBean() == null) {
        saveSelected(currTypeLists[0]);
      } else {
        saveSelected(currTypeSelected.value);
      }

      dcAvailableData.assignAll(findCommonData(currTypeLists, dcTemAvailableData));
      wcAvailableData.assignAll(findCommonData(currTypeLists, wcTemAvailableData));
    }

    for (var currTypeItem in currTypeLists) {
      if (currTypeItem.name == currTypeSelected.value.name) {
        if (currTypeItem.amount != currTypeSelected.value.amount) {
          saveSelected(currTypeItem);
        }
        break;
      }
    }

    currTypeInitialLists.assignAll(currTypeLists);
    if (flag == vault) {
      EventService.instance.dispatchEvent(kVaultRefEvent);
    } else if (flag == withdrawal) {
      EventService.instance.dispatchEvent(kWalletWithRefEvent);
    }
  }

  Future<void> getContractData() async {
    await ApiService.instance.coinContract(
      success: (data) {
        pactList = data;
      },
      fail: (errorMessage) {
        if (errorMessage != null) {}
      },
    );
  }

  ///临时保存选中的币种
  void saveSelected(CurrencyBean bean) {
    currTypeSelected.value = bean;
    SPUtil().saveCurrencyBean(bean);
  }

  ///判断是否是选中的币种 item
  bool isSelectedItem(CurrencyBean bean) {
    return bean.cur == currTypeSelected.value.cur;
  }

  ///当关闭窗口或者 打开时，还原原来的数据源
  void resetSearchList() {
    currTypeLists.assignAll(currTypeInitialLists);
  }

  ///币种 选择框 内部搜索
  void updateSearchList(String value) {
    debugPrint('$value');
    if (value.isNotEmpty) {
      var tempList = currTypeInitialLists
          .where((element) => element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
      currTypeLists.assignAll(tempList);
    } else {
      // _controller.text = '';
      // _filteredUsers = users;
      currTypeLists.assignAll(currTypeInitialLists);
    }
  }

  String truncateText(String str, int maxLength) {
    if (str.isEmpty) {
      return "";
    }
    if (str.length > maxLength) {
      return '${str.substring(0, maxLength)}...';
    }
    return str;
  }

  List<CurrencyBean> getCurList(bool fiatCurrency, List<CurrencyBean> data) {
    int currencyType = fiatCurrency ? 1 : 2;
    return data.where((currency) => currency.currency_type == currencyType).toList();
  }
}
