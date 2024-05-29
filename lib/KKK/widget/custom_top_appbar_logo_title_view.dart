import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bet/constant/app_urls_values.dart';
import 'package:flutter_bet/extentions/ex_list.dart';
import 'package:flutter_bet/extentions/ex_widget.dart';
import 'package:flutter_bet/pages/main/logic.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_bet/widget/custom_asset_icon.dart';
import 'package:flutter_bet/widget/network_image/custom_network_image.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class CustomTopAppBarLogoTitleView extends GetView<MainLogic> {
  final String title;
  final VoidCallback? logoTap;

  CustomTopAppBarLogoTitleView({
    required this.title,
    this.logoTap,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return <Widget>[
      CustomNetWorkImage(
        imageUrl:
            '${AppUrlsValues.envConfig.asset_url}/${controller.globalController.brandDetailPc?['first_letter']}',
        errorWidget: const CustomAssetIcon(
          size: 60,
          name: 'assets/images/home/ic_sg_logo.webp',
        ),
        width: 60,
        height: 60,
        fit: BoxFit.scaleDown,
      ).onTap(logoTap ?? () {}),
      <Widget>[
        Container(
          height: 16,
        ),
        Text(title,
                style: ThemeService()
                    .theme
                    .appBarTheme
                    .titleTextStyle
                    ?.copyWith(fontWeight: FontWeight.w600))
            .height(44)
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.center).expanded(),
      SizedBox().tightSize(60),
    ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween).paddingZero.marginZero;
  }
}
