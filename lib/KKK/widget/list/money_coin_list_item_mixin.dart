import 'dart:ui';

import 'package:flutter_bet/controllers/global_state_controller.dart';
import 'package:get/get.dart';

import '../../generated/l10n.dart';
import '../../model/wallet/CurrencyBean.dart';
import '../../pages/alliance_plan/whepler/alliance_biz_helper.dart';
import '../custom_toast.dart';
import '../refresh/widget/cupertino/easy_refresh_path.dart';

///联盟计划- 列表 item  对带有货币的 提供 公共的mixin
mixin MoneyCoinListItemMixin {
  final GlobalStateController gLogic = GlobalStateController.of();
  String _coinIc = '';
  CurrencyBean? _coinBean;

  final Color red = const Color(0xFFE91134);
  final Color green = const Color(0xFF1FFF20);
  final Color gray = const Color(0xFFB1BAD3);

  ///获取货币, cache 因为是mixn, 会缓存， 给个cache标准，说明是否重新读取配置表
  CurrencyBean? getCoinBean(String? currency_id, {bool cache = true}) {
    //马上取值 条件， 为空 或 cache =false
    if (!cache ||
        (_coinBean == null && currency_id != null && gLogic.localConfigCoinLists.isNotEmpty)) {
      _coinBean = gLogic.localConfigCoinLists.firstWhereOrNull((bean) => bean.cur == currency_id);
    }
    return _coinBean;
  }

  ///获取货币图标，走网络的
  /// cache 因为是mixn, 会缓存， 给个cache标准，说明是否重新读取配置表
  String getCoinIc(String? currency_id, {bool cache = true}) {
    //马上取值 条件， 为空 或 cache =false
    if (!cache ||
        (_coinIc.isEmpty && currency_id != null && gLogic.localConfigCoinLists.isNotEmpty)) {
      _coinIc =
          gLogic.localConfigCoinLists.firstWhereOrNull((bean) => bean.cur == currency_id)?.coinIc ??
              '';
    }
    return _coinIc;

    // if (currency_id != null && gLogic.currTypeInitialLists.isNotEmpty) {
    //   return gLogic.currTypeInitialLists.firstWhere((bean) => bean.cur == currency_id).coinIc ?? '';
    // }
    // return '';
  }

  ///金额添加 +-
  String getMoneyWithSign(String? money) {
    if (money == null) {
      return '';
    } else {
      if (money.contains('-') || double.tryParse(money) == 0) {
        return money;
      } else {
        return '+$money';
      }
    }
  }

  ///获取总数输赢 的金额颜色
  ///获取总数输赢 的金额颜色 ,逻辑+红色， -绿色, 0灰色
  Color getMoneyColor(String? money) {
    // if (money != null && money.contains('-')) {
    //   return green;
    // } else {
    //   return red;
    // }
    if (money != null && money.contains('-')) {
      return green;
    } else if (money != null && (money.contains('+') || double.tryParse(money)! > 0)) {
      return red;
    } else {
      return gray;
    }
  }

  ///copy用户名
  void onClickCopy(String? content) {
    Clipboard.setData(ClipboardData(text: content));
    CustomToast.show(S.current.random_text_151, Get.overlayContext!);
  }
}
