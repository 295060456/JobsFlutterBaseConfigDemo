import 'package:flutter/material.dart';

import '../../constant/app_values.dart';
import '../../generated/l10n.dart';
import '../../services/theme/theme_service.dart';
import '../../utils/route_util.dart';
import '../bottom/custom_close_button.dart';
import '../custom_asset_icon.dart';
import '../custom_text.dart';

class CustomAppBarH5 extends StatelessWidget {
  const CustomAppBarH5({
    super.key,
    this.icon,
    this.title,
    this.padding,
    this.onTap,
  });

  final String? icon;
  final String? title;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: AppValues.defaultPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: icon != null,
            child: CustomAssetIcon(name: icon ?? "", size: 16),
          ),
          Visibility(
            visible: icon != null,
            child: SizedBox(width: AppValues.margin_10),
          ),
          Visibility(
            visible: title != null,
            child: CustomText(title ?? "",
                style: ThemeService()
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600, fontSize: 18)),
          ),
          Spacer(),
          CustomCloseButton(
            padding: const EdgeInsets.only(left: 12, top: 4, bottom: 4),
            onTap: () {
              if (onTap != null) {
                onTap!.call();
              } else {
                RouteUtil.popView();
              }
            },
          ),
        ],
      ),
    );
  }
}
