import 'package:flutter/material.dart';
import 'package:flutter_bet/widget/custom_asset_icon.dart';

enum CustomCurrency {
  usdt,
  eth,
  bnb,
  bch,
  brl,
  cny,
  thb,
  vnd,
  inr,
}

class CustomCurrencyIcon extends StatelessWidget {
  final double? size;
  final CustomCurrency type;

  const CustomCurrencyIcon({super.key, this.size = 14, required this.type});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String assetName = '';

    switch (type) {
      case CustomCurrency.usdt:
        assetName = 'assets/images/coin_icon/ic_usdt.png';
        break;
      case CustomCurrency.eth:
        assetName = 'assets/images/coin_icon/ic_eth.png';
        break;
      case CustomCurrency.bnb:
        assetName = 'assets/images/coin_icon/ic_bnb.png';
        break;
      case CustomCurrency.bch:
        assetName = 'assets/images/coin_icon/ic_bch.png';
        break;
      case CustomCurrency.brl:
        assetName = 'assets/images/coin_icon/ic_brl.png';
        break;
      case CustomCurrency.cny:
        assetName = 'assets/images/coin_icon/ic_cny.png';
        break;
      case CustomCurrency.thb:
        assetName = 'assets/images/coin_icon/ic_thb.png';
        break;
      case CustomCurrency.vnd:
        assetName = 'assets/images/coin_icon/ic_vnd.png';
        break;
      case CustomCurrency.inr:
        assetName = 'assets/images/coin_icon/ic_inr.png';
        break;
    }
    return CustomAssetIcon(
      name: assetName,
      size: size,
    );
  }
}
