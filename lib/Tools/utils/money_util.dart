import 'package:flutter_bet/controllers/global_state_controller.dart';
import 'package:flutter_bet/utils/lang_util.dart';
import 'package:get/get.dart';
import 'package:money2/money2.dart';

///金钱 格式化
class MoneyUtil {
  static String toUs() {
    final teslaPrice = Money.fromInt(10034530, code: 'USD');
    // Money.fromNum(111.11, code: code)
    return "";
  }

  ///美元格式
  ///"###,###.##" 不会补0
  ///'###,###.#0' 会补0
  static String toFormatUsd(num number,bool? logo) {
    var money = Money.fromNum(number, code: 'USD');
    if(logo!=null && logo){
      return money.format('S###,###.#0');
    }
    return money.format('###,###.#0');
  }

  /// 添加千分号，但没有小数位
  static String toFormatComma(num number,bool? logo) {
    var money = Money.fromNum(number, code: 'USD');
    if(logo!=null && logo){
      return money.format('S###,###');
    }
    return money.format('###,###');
  }

  static String toFormatCny(num number,bool? logo) {
    var money = Money.fromNum(number, code: 'CNY');
    if(logo!=null && logo){
      return money.format('S###,###.#0');
    }
    return money.format('###,###.#0');
  }

  ///获取 货币 代号集合
  ///(AUD, BRL, BTC, CAD, CHF, CNY, CZK, EUR, GBP, GHS, INR, JPY, ..., ZAR, DODGE)
  static getAllCodes(){
    final registeredCurrencies = Currencies().getRegistered();
    final codes = registeredCurrencies.map((c) => c.code);
    print(codes);
    return codes;
  }

  ///获取App对应配置小数位金额
  ///return String “0.00”
  static toCoinAmountFormat(String? coinCurOrName, String? amount) {
    final globalController = Get.find<GlobalStateController>();
    // 配置信息
    final coinInfos        = globalController.localConfigCoinLists;
    // 金额double类型
    final amountDouble     = double.tryParse(amount ?? "0.0") ?? 0.0;
    // 小数位数
    int decimalPartLength  = 0;
    if(amountDouble.toString().contains('.')){
      decimalPartLength  = amountDouble.toString().split('.')[1].length;
    }

    // 特殊情况金额0
    if(amountDouble == 0) {
      if(LangUtil().isEnIn()) {
        return "0";
      }
      return "0.00";
    }
    // 配置对应长度小数
    for (var coin in coinInfos) {
      if(coinCurOrName == coin.cur || coinCurOrName == coin.name) {
        final decimalPlaces = coin.decimal_places ?? 2;
        // BTC ETH 等多位小数去除尾部0
        if(decimalPlaces > 2 && decimalPartLength < decimalPlaces) {
          return amountDouble.toString();
        }else {
          return amountDouble.toStringAsFixed(decimalPlaces);
        }
      }
    }
    return amount;
  }

}
