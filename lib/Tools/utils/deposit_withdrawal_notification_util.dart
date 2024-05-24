import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/generated/l10n.dart';
import 'package:flutter_bet/utils/lang_util.dart';
import 'package:flutter_bet/widget/custom_text.dart';
import 'package:get/get.dart';

import '../widget/custom_asset_icon.dart';
import '../widget/network_image/custom_network_image.dart';
import '../widget/refresh/widget/cupertino/easy_refresh_path.dart';
import '../widget/snack_bar/custom_snack_bar.dart';
import '../widget/snack_bar/custom_snack_bar_icons.dart';

const coinIcExtensionName = ".webp";

class DepositWithdrawalNotifUtils {
  static final coinIcDomain = '${AppValues.defaultBranch.asset_url}/currency/';

  static showNotificationPop(dynamic messageData) {
    if (messageData
        .toString()
        .isEmpty) {
      log("neco DepositWithdrawalNotifUtils messageData = ${messageData}");
      return;
    }
    Map<String, dynamic> payload = json.decode(messageData['payload']);
    log("neco payload2 = ${payload['currency_id']} ---${messageData['title']}");
    String title = _getTitle(messageData['title']);
    // String subtitle = _getSubTitle(messageData['title']);
    int state = payload['state'];
    var amount = "0";
    var coinId = "0";
    // 状态：1：成功，2：失败，3，支付中，4：删除，5:待审核 6：取消
    if (state == 1) {
      amount = payload['finally_amount'];
    } else {
      amount =
      payload.containsKey('pay_amount') ? payload['pay_amount'] : payload['finally_amount'];
    }
    coinId = payload['currency_id'];
    CustomSnackBar.show(
        subContent: _subView(amount, coinId, ""),
        "message",
        Get.overlayContext!,
        title: title,
        preIcon: _getIcon(messageData['title'], coinId));
  }

  static Widget _subView(String amount, String coinId, String subtitle) {
    return LangUtil().isTh() || LangUtil().isViVn()
        ? SizedBox(width: Get.width - 160, child: _thaiLanguage(amount, coinId, subtitle))
        : SizedBox(width: Get.width - 160, child: otherLanguage(amount, coinId, subtitle));
  }

  static Widget _thaiLanguage(String amount, String coinId, String subtitle) {
    return RichText(
        text: TextSpan(children: [
          WidgetSpan(
              child: Row(
                children: [
                  CustomText(
                    amount,
                    textColorStyle: CustomTextColorStyle.normal,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  CustomNetWorkImage(
                    placeholder: const CustomAssetIcon(
                      name: 'assets/images/personal_center_icon/currency_default_ic.webp',
                    ),
                    errorWidget: const CustomAssetIcon(
                      name: 'assets/images/personal_center_icon/currency_default_ic.webp',
                    ),
                    imageUrl: "$coinIcDomain$coinId$coinIcExtensionName",
                    width: 14,
                    height: 14,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  CustomText(
                    "${S.current.vault_amount} $subtitle",
                    textColorStyle: CustomTextColorStyle.normal,
                  ),
                ],
              )),
        ]));
  }

  static Widget otherLanguage(String amount, String coinId, String subtitle) {
    final coinIcDomain = '${AppValues.defaultBranch.asset_url}/currency/';
    return RichText(
        text: TextSpan(children: [
          WidgetSpan(
              child: Row(
                children: [
                  CustomText(
                    "${S.current.vault_amount} $amount",
                    textColorStyle: CustomTextColorStyle.normal,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  CustomNetWorkImage(
                    placeholder: const CustomAssetIcon(
                      name: 'assets/images/personal_center_icon/currency_default_ic.webp',
                    ),
                    errorWidget: const CustomAssetIcon(
                      name: 'assets/images/personal_center_icon/currency_default_ic.webp',
                    ),
                    imageUrl: "$coinIcDomain$coinId$coinIcExtensionName",
                    width: 14,
                    height: 14,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  CustomText(subtitle, textColorStyle: CustomTextColorStyle.normal),
                ],
              )),
        ]));
  }

  static String _getTitle(String title) {
    switch (title) {
      case "deposit_success":
        return S.current.random_text_784;
      case "deposit_fail":
        return S.current.random_text_785;
      case "deposit_in_process":
        return S.current.random_text_786;
      case "withdraw_success":
        return S.current.random_text_788;
      case "withdraw_fail":
        return S.current.random_text_778;
      case "withdraw_in_process":
        return S.current.random_text_789;
    }
    return "";
  }

  static String _getSubTitle(String title) {
    switch (title) {
      case "deposit_success":
        return S.current.random_text_790;
      case "deposit_fail":
        return S.current.random_text_785;
      case "deposit_in_process":
        return S.current.random_text_791;
      case "withdraw_success":
        return S.current.random_text_792;
      case "withdraw_fail":
        return S.current.random_text_778;
      case "withdraw_in_process":
        return S.current.random_text_793;
    }
    return "";
  }

  static Image _getIcon(String title,
      String coinId,) {
    switch (title) {
      case "deposit_success":
        return CustomSnackBarIcons.commissionSuccess;
      case "deposit_fail":
        return CustomSnackBarIcons.error;
      case "deposit_in_process":
        return Image.network("$coinIcDomain$coinId$coinIcExtensionName");
      case "withdraw_success":
        return CustomSnackBarIcons.commissionSuccess;
      case "withdraw_fail":
        return CustomSnackBarIcons.error;
      case "withdraw_in_process":
        return Image.network("$coinIcDomain$coinId$coinIcExtensionName");
    }
    return CustomSnackBarIcons.commissionSuccess;
  }
}
