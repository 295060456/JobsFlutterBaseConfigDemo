import 'package:flutter_bet/base/getx/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_urls_values.dart';
import 'package:flutter_bet/services/branch/branch_service.dart';
import 'package:flutter_bet/widget/network_image/custom_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/app_values.dart';
import 'logic.dart';

const double bottomHeight = 90;

class SplashPage extends BaseView<SplashLogic> {
  SplashPage({super.key});
  Function(BuildContext context)? onFinish;

  @override
  Widget buildBody(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    //等待隐私协议弹窗确认
    controller.onFinish = () {
      if (onFinish != null) {
        onFinish!(context);
      }
    };
    return Container(
      color: Colors.white,
      alignment: Alignment.bottomCenter,
      child: CustomNetWorkImage(
          imageUrl:
              '${AppUrlsValues.envConfig.asset_url}/${controller.globalController.brandDetail?['open']}',
          errorWidget: Image.asset('assets/images/LaunchImage.webp', width: 375, height: 812)),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }
}
