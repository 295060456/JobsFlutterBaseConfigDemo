import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/utils/route_util.dart';
import 'package:flutter_bet/widget/custom_asset_icon.dart';
import 'package:flutter_bet/widget/custom_icon.dart';

enum CustomBackIconButtonStyle {
  normal,
  close,
}

class CustomBackIconButton extends StatelessWidget {
  ///点击回调
  final VoidCallback? onTap;
  final CustomBackIconButtonStyle style;
  final AlignmentGeometry alignment;

  const CustomBackIconButton(
      {super.key,
      this.onTap,
      this.style = CustomBackIconButtonStyle.normal,
      this.alignment = Alignment.center});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    const maxSize = (AppValues.defaultMargin * 2) + (AppValues.iconDefaultSize);
    String assetPath = '';
    if (style == CustomBackIconButtonStyle.normal) {
      assetPath = 'assets/images/ic_back.png';
    } else {
      assetPath = 'assets/images/ic_closed.png';
    }
    return InkWell(
      onTap: () {
        if (onTap == null) {
          RouteUtil.popView();
        } else {
          onTap!();
        }
      },
      child: Container(
        width: maxSize,
        height: maxSize,
        alignment: alignment,
        child: CustomAssetIcon(
          name: assetPath,
          color: Colors.white,
        ),
      ),
    );
  }
}
