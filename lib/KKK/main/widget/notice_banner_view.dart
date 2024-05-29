import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/utils/route_util.dart';
import 'package:flutter_bet/widget/custom_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../constant/app_values.dart';
import '../../../widget/dialog/custom_safe_dialog.dart';

const String kNoticeBannerWidget = 'kNoticeBannerWidget';
class NoticeBannerView extends StatelessWidget {
   final List<String> data;

   NoticeBannerView({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        height: 188,
        child: Obx(() {
          return Stack(
            children: [
              Swiper(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  // print('图片地址：${AppValues.noticeImageUrl + data[index]}-----${data.length}---index=$index');
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8.0), // 设置圆角半径
                    child: Image.network(
                      AppValues.defaultBranch.asset_url + data[index],
                      fit: BoxFit.fill,
                      width: 322, // 设置宽度
                      height: 188, // 设置高度
                    ),
                  );
                },
                pagination: SwiperPagination(), // 添加小圆点指示器
                control: null, // 添加左右箭头控制
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                    onTap: (){RouteUtil.popView();},
                    child: const CustomIcon(asset: 'assets/images/home/ic_notice_close.webp',size: 12,color: Colors.white,)),
              ),

            ],

          );
        }),
      );
  }

}

Future<void> showNoticeBannerWidget<T>({
  required BuildContext context,
  required List<String> list,
  bool barrierDismissible = true,
  bool useRootNavigator = true,
}) async {
  await CustomSafeDialog.show<T>(
      context: context,
      tag: kNoticeBannerWidget,
      barrierDismissible: barrierDismissible,
      useRootNavigator: useRootNavigator,
      builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child:GestureDetector(onTap: (){
              RouteUtil.popView();
            },),flex: 1,),
            NoticeBannerView(data: list,),
            Expanded(child:GestureDetector(onTap: (){
              RouteUtil.popView();
            },),flex: 1,),

          ],
        );
      });
}
