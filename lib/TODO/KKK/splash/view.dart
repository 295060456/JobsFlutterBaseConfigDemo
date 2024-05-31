import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_flutter_base_config/KKK/getx/base_view.dart';
import '../constant/app_urls_values.dart';
import '../widget/network_image/custom_network_image.dart';
import 'logic.dart';

const double bottomHeight = 90;

class SplashPage extends BaseView<SplashLogic> {

SplashPage({super.key, this.onFinish});

  // SplashPage({Key? key, this.onFinish}) : super(key: key);
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
