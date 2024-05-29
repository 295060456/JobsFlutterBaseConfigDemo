import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/url_launch_util.dart';
import '../custom_toast.dart';
import 'custom_share_params.dart';
import 'custom_share_widget_item.dart';
import 'custom_share_widget_model.dart';

///多个分享封装
class CustomShareListWidget extends StatelessWidget with CustomShareListWidgetMixin {
  CustomShareListWidget({super.key, this.shareLinkValue, this.onClickShare});

  final String? shareLinkValue; //需要分享的地址

  final void Function(CustomShareModel model)? onClickShare;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      primary: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // maxCrossAxisExtent: 54,
        crossAxisCount: 5,
        childAspectRatio: 1.0, //宽高比为2
        mainAxisSpacing: 6, //主轴方向的间距
        crossAxisSpacing: 16, //横轴方向子元素的间距
      ),
      physics: const NeverScrollableScrollPhysics(),
      children: shareModelList
          .map((model) => CustomShareItemWidget(
                model: model,
                onItemClick: (model) {
                  onClickShareLaunchLink(model.typeEnum, shareLinkValue);
                  if (onClickShare != null) onClickShare!.call(model);
                },
              ))
          .toList(),
    );
  }
}

mixin CustomShareListWidgetMixin {
  ///模拟分享数据源
  final shareModelList = [
    CustomShareModel(
        typeEnum: ShareTypeEnum.Facebook,
        assetPath: "assets/images/share/ic_share_facebook.webp",
        name: "Facebook"),
    CustomShareModel(
        typeEnum: ShareTypeEnum.Telegram,
        assetPath: "assets/images/share/ic_share_telegram.webp",
        name: "Telegram"),
    CustomShareModel(
        typeEnum: ShareTypeEnum.Instagram,
        assetPath: "assets/images/share/ic_share_instagram.webp",
        name: "Instagram"),
    CustomShareModel(
        typeEnum: ShareTypeEnum.YouTube,
        assetPath: "assets/images/share/ic_share_youtube.webp",
        name: "YouTube"),
    CustomShareModel(
        typeEnum: ShareTypeEnum.WhatsApp,
        assetPath: "assets/images/share/ic_share_whatsapp.webp",
        name: "WhatsApp"),
    CustomShareModel(
        typeEnum: ShareTypeEnum.Twitter,
        assetPath: "assets/images/share/ic_share_x.webp",
        name: "X"),
    CustomShareModel(
        typeEnum: ShareTypeEnum.TikTok,
        assetPath: "assets/images/share/ic_share_tiktok.webp",
        name: "TikTok"),
    CustomShareModel(
        typeEnum: ShareTypeEnum.LINE,
        assetPath: "assets/images/share/ic_share_line.webp",
        name: "LINE"),
    CustomShareModel(
        typeEnum: ShareTypeEnum.Gmail,
        assetPath: "assets/images/share/ic_share_gmail.webp",
        name: "Gmail"),
  ];

  ///跳转分享链接
  void onClickShareLaunchLink(ShareTypeEnum typeEnum, String? shareLinkValue) {
    var shareUrl = '${typeEnum.baseShare}${shareLinkValue}';
    // log("分享：$shareUrl");
    UrlLaunchUtil.launchURL(shareUrl).then((message) {
      if (message.isNotEmpty) {
        CustomToast.show(message, Get.overlayContext!);
      }
    });
  }
}
