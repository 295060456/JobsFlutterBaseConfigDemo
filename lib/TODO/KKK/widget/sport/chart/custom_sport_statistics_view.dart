import 'package:flutter_bet/generated/l10n.dart';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/widget/custom_text.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../constant/app_themes.dart';
import '../../../routes/routes.dart';
import '../../../services/theme/theme_service.dart';
import '../../../utils/function.dart';
import '../../../utils/route_util.dart';
import '../../button/custom_icon_button.dart';
import 'sport_statistics_controller.dart';
import 'custom_sport_statistics_chart.dart';

///体育-实时统计浮动框 -正文-全部内容
class CustomSportStatisticsView extends StatefulWidget {
  final ParamVoidCallback? onRemoveCallback;

  const CustomSportStatisticsView({super.key, this.onRemoveCallback});

  @override
  State<StatefulWidget> createState() => _SportStatisticsViewState();
}

class _SportStatisticsViewState extends State<CustomSportStatisticsView> {
  final controller = Get.put<SportStatisticsController>(SportStatisticsController());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SportStatisticsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              // color: ThemeService().theme.colorScheme.background,
              color: ThemeService().theme.colorScheme.tertiary,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: AppValues.defaultMargin),
                CustomIconButton(
                  padding: 0,
                  widgetWidth: 20,
                  widgetHeight: 20,
                  iconWidth: 16,
                  iconHeight: 16,
                  iconWidget: Image.asset(
                    'assets/images/sport/sport_video.webp',
                    width: 14,
                    height: 14,
                  ),
                  onTap: () {},
                ),
                const SizedBox(width: AppValues.margin_4),
                Text(
                  S.current.random_text_729,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const SizedBox(width: AppValues.margin_12),
                CustomIconButton(
                  padding: 0,
                  widgetWidth: 20,
                  widgetHeight: 20,
                  iconWidth: 16,
                  iconHeight: 16,
                  iconWidget: Image.asset(
                    'assets/images/sport/sport_more.webp',
                    width: 14,
                    height: 14,
                  ),
                  onTap: () {},
                ),
                const SizedBox(width: AppValues.margin_4),
                Text(
                  S.current.random_text_730,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                const Expanded(child: SizedBox()),
                CustomIconButton(
                  padding: 0,
                  widgetWidth: 20,
                  widgetHeight: 20,
                  iconWidth: 16,
                  iconHeight: 16,
                  iconWidget: Image.asset(
                    'assets/images/bet_slip/ic_float_view_max.webp',
                    width: 14,
                    height: 14,
                  ),
                  onTap: () {},
                ),
                const SizedBox(width: AppValues.margin_12),
                InkWell(
                    onTap: () {
                      widget.onRemoveCallback?.call();
                      // _chewieController.dispose();
                    },
                    child: Icon(
                      Icons.close,
                      color: AppThemes.iconColor,
                      size: 18,
                    )),
                const SizedBox(width: AppValues.margin_12),
              ],
            ),
          ),
          Container(
            color: AppThemes.floatViewColor,
            alignment: Alignment.topCenter,
            // width: 350,
            // height: 400,
            // child: FutureBuilder(
            //   future: _future,
            //   builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            //     if (snapshot.connectionState == ConnectionState.done) {
            //       return Text('实时统计 浮动框');
            //     } else {
            //       return const Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }
            //   },
            // ),
            // child:  Text('实时统计 浮动框'),
            child: CustomSportStatisticsChart(),
          ),
          InkWell(
            onTap: () {
              widget.onRemoveCallback?.call();
              RouteUtil.pushToView(Routes.sport_detail);
            },
            child: Container(
              alignment: Alignment.center,
              // width: 350,
              // height: 36,
              padding: EdgeInsets.symmetric(
                  horizontal: AppValues.defaultPadding, vertical: AppValues.halfPadding),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                color: ThemeService().theme.colorScheme.tertiary,
              ),
              child: CustomText(''),
            ),
          ),
        ],
      ),
    );
  }
}
