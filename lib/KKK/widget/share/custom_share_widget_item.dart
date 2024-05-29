import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bet/widget/custom_asset_icon.dart';

import '../../services/theme/theme_service.dart';
import '../custom_text.dart';
import 'custom_share_widget_model.dart';

///联盟计划-tab-我的推广界面-分享widget
class CustomShareItemWidget extends StatelessWidget {
  const CustomShareItemWidget({super.key, required this.model, this.onItemClick});

  final CustomShareModel model;
  final void Function(CustomShareModel model)? onItemClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onItemClick != null) {
          onItemClick!.call(model);
        }
      },
      child: Container(
        width: 56,
        // margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 28,
                width: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: CustomAssetIcon(
                  name: model.assetPath,
                  size: 28,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            CustomText(model.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: ThemeService()
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 11, fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }
}
