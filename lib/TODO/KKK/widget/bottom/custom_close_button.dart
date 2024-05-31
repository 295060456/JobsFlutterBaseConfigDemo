import 'package:flutter/material.dart';

import '../../utils/route_util.dart';
import '../button/custom_button.dart';
import '../custom_asset_icon.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key, this.onTap, this.padding});

  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      padding: padding ,
      onTap: () {
        if (onTap != null) {
          onTap!.call();
        } else {
          RouteUtil.popView();
        }
      },
      child:
          const CustomAssetIcon(name: "assets/images/common/ic_common_close_gray.webp", size: 16),
    );
  }
}
