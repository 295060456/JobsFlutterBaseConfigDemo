import 'package:flutter/material.dart';
import 'package:flutter_bet/widget/preload/preload_item_config.dart';
import 'package:shimmer/shimmer.dart';

import '../../constant/app_themes.dart';

///预加载 骨架屏  cell view
class CustomPreLoadCellView extends StatelessWidget {
  const CustomPreLoadCellView({
    super.key,
    required this.config,
  });

  final PreloadItemConfig config;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: config.leftMargin, right: config.rightMargin),
      margin: EdgeInsets.only(left: config.leftMargin, right: config.rightMargin),
      child: Shimmer.fromColors(
        // AppThemes.chatRooCardColor
        // AppThemes.textColorLightGrey
        baseColor: AppThemes.preLoadGray,
        highlightColor: AppThemes.onTertiaryColor,
        child: Container(
          width: config.w,
          height: config.h,
          // margin: EdgeInsets.only(left: config.leftMargin, right: config.rightMargin),
          decoration: BoxDecoration(
            color: AppThemes.preLoadGray,
            borderRadius: BorderRadius.circular(config.radius),
          ),
        ),
      ),
    );
  }
}
