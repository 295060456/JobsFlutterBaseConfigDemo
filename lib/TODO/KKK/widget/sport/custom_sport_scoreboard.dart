import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/pages/sport/sport_detail/model.dart';
import 'package:flutter_bet/utils/string_uril.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constant/app_themes.dart';
import '../../constant/app_values.dart';
import '../../services/theme/theme_service.dart';
import '../custom_divider_widget.dart';
import '../custom_text.dart';

class CustomScoreBoard extends StatefulWidget {
  bool isExpand;
  SportDetailModel model;
  CustomScoreBoard(this.isExpand,this.model,{super.key});

  @override
  State<CustomScoreBoard> createState() => _CustomScoreBoardState();
}

class _CustomScoreBoardState extends State<CustomScoreBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(AppValues.sportRadius_4)),
        color: ThemeService().colorScheme.surface,
      ),
      width: AppValues.sportWidth_351.w,
      // height: AppValues.sportHeight_174.h,
      margin: EdgeInsets.only(
        left: AppValues.sportPadding_12.w,
        right: AppValues.sportPadding_12.w,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: AppValues.sportPadding_12.w),
              Image.asset(
                'assets/images/sport/sport_banner.webp',
                height: AppValues.sportIcon_32.w,
                width: AppValues.sportIcon_32.h,
              ),
              SizedBox(width: AppValues.sportPadding_8.w),
              Text(
                StringUtil().truncateString(widget.model.list?.first.htn ?? '', 8),
                style: ThemeService()
                    .theme
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: AppValues.sportHeight_6_5.h),
                        child: Container(
                          padding: EdgeInsets.only(
                              left: AppValues.sportHeight_5.w,
                              right: AppValues.sportHeight_5.w,
                              top: AppValues.sportHeight_1.w,
                              bottom: AppValues.sportHeight_1.w),
                          decoration: const BoxDecoration(
                            // border: Border(
                            //   top:
                            //       BorderSide(width: 0, color: Colors.black),
                            //   bottom:
                            //       BorderSide(width: AppValues.sportHeight_1, color: Colors.black),
                            //   left:
                            //       BorderSide(width: AppValues.sportHeight_1, color: Colors.black),
                            //   right:
                            //       BorderSide(width: AppValues.sportHeight_1, color: Colors.black),
                            // ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(AppValues.sportRadius_2),
                              bottomRight: Radius.circular(AppValues.sportRadius_2),
                            ),
                            color: AppThemes.sportWidgetColor,
                          ),
                          child: CustomText(
                            'Set | Game6',
                            style: ThemeService().theme.textTheme.bodyMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: AppValues.sportHeight_6.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/sport/sport_banner.webp',
                            height: AppValues.sportIcon_10.w,
                            width: AppValues.sportIcon_10.h,
                          ),
                          SizedBox(width: AppValues.sportWidth_4),
                          CustomText(
                            '${widget.model.list?.first.hp} ',
                            style: ThemeService()
                                .theme
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: AppValues.fontTileLargeSize),
                          ),
                          CustomText(
                            ':',
                            style: ThemeService()
                                .theme
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: AppValues.fontTileLargeSize),
                          ),
                          CustomText(
                            ' ${widget.model.list?.first.ap}',
                            style: ThemeService()
                                .theme
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: AppValues.fontTileLargeSize),
                          ),
                          SizedBox(
                            height: AppValues.sportHeight_14.w,
                            width: AppValues.sportHeight_14.h,
                          ),
                        ],
                      ),
                    ],
                  )),
              Text(
                StringUtil().truncateString(widget.model.list?.first.atn ?? '', 8),
                style: ThemeService()
                    .theme
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(width: AppValues.sportPadding_8.w),
              Image.asset(
                'assets/images/sport/sport_banner.webp',
                height: AppValues.sportIcon_32.w,
                width: AppValues.sportIcon_32.h,
              ),
              SizedBox(width: AppValues.sportPadding_12.w),
            ],
          ),
          SizedBox(height: AppValues.sportHeight_3.h),
          CustomDividerWidget(),
          Container(
            height: AppValues.sportHeight_102.h,
            child: Stack(
              children: [
                Positioned(
                  left: AppValues.sportPadding_12.w,
                  right: AppValues.sportWidth_40.w,
                  // bottom: AppValues.sportHeight_2.h,
                  child: Container(
                    height: AppValues.sportHeight_102.h,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: AppValues.sportHeight_7.h,
                              bottom: AppValues.sportHeight_5.h),
                          child: Row(
                            children: [
                              CustomText('Best of 3',
                                  style: ThemeService()
                                      .theme
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: AppValues.fontBodySmallSize)),
                              Expanded(child: SizedBox()),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: AppValues.sportWidth_8,
                                    right: AppValues.sportWidth_8),
                                child: CustomText('1',
                                    style: ThemeService()
                                        .theme
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: AppValues.fontBodySmallSize)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: AppValues.sportWidth_8,
                                    right: AppValues.sportWidth_8),
                                child: CustomText('2',
                                    style: ThemeService()
                                        .theme
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: AppValues.fontBodySmallSize)),
                              ),
                              Container(
                                width: 1,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: AppValues.sportWidth_8,
                                    right: AppValues.sportWidth_8),
                                child: CustomText('T',
                                    style: ThemeService()
                                        .theme
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontSize: AppValues.fontBodySmallSize)),
                              ),
                              // SizedBox(width: AppValues.sportWidth_40),
                            ],
                          ),
                        ),
                        CustomDividerWidget(),
                        // SizedBox(height: AppValues.sportHeight_4),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/sport/sport_banner.webp',
                                  height: AppValues.sportIcon_16.w,
                                  width: AppValues.sportIcon_16.h,
                                ),
                                CustomText('Best of 3',
                                    style: ThemeService()
                                        .theme
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: AppValues.fontBodySmallSize)),
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AppValues.sportWidth_8,
                                  right: AppValues.sportWidth_8),
                              child: CustomText('1',
                                  style: ThemeService()
                                      .theme
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: AppValues.fontBodySmallSize)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AppValues.sportWidth_8,
                                  right: AppValues.sportWidth_8),
                              child: CustomText('2',
                                  style: ThemeService()
                                      .theme
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: AppValues.fontBodySmallSize)),
                            ),
                            Container(
                              width: AppValues.sportHeight_1, // 设置分隔线的宽度
                              height: 40.h,
                              color: ThemeService().colorScheme.tertiary, // 设置分隔线的颜色
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AppValues.sportWidth_8,
                                  right: AppValues.sportWidth_8),
                              child: CustomText('T',
                                  style: ThemeService()
                                      .theme
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: AppValues.fontBodySmallSize)),
                            ),
                            // SizedBox(width: AppValues.sportWidth_40),
                          ],
                        ),
                        // SizedBox(height: AppValues.sportHeight_7),
                        Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/sport/sport_banner.webp',
                                  height: AppValues.sportIcon_16.w,
                                  width: AppValues.sportIcon_16.h,
                                ),
                                CustomText('Best of 3',
                                    style: ThemeService()
                                        .theme
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: AppValues.fontBodySmallSize)),
                              ],
                            ),
                            Expanded(child: SizedBox()),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AppValues.sportWidth_8,
                                  right: AppValues.sportWidth_8),
                              child: CustomText('1',
                                  style: ThemeService()
                                      .theme
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: AppValues.fontBodySmallSize)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AppValues.sportWidth_8,
                                  right: AppValues.sportWidth_8),
                              child: CustomText('2',
                                  style: ThemeService()
                                      .theme
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: AppValues.fontBodySmallSize)),
                            ),
                            Container(
                              height: AppValues.sportHeight_30.h,
                              child: Column(
                                children: [
                                  Container(
                                    width: 1,
                                    height: AppValues.sportHeight_25.h,
                                    color: ThemeService().colorScheme.tertiary,
                                  ),
                                  Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: AppValues.sportWidth_8,
                                  right: AppValues.sportWidth_8),
                              child: CustomText('T',
                                  style: ThemeService()
                                      .theme
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: AppValues.fontBodySmallSize)),
                            ),
                            // SizedBox(width: AppValues.sportWidth_40),
                          ],
                        ),
                        // SizedBox(height: AppValues.sportHeight_40),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      alignment: Alignment.center,
                      width: 32.w,
                      height: 50.h,
                      child: FaIcon(
                        FontAwesomeIcons.addressBook,
                        size: AppValues.allianceIcon_10_45.w,
                      ),
                    )),
                Positioned(
                  top: 0,
                  right: 32.w,
                  child: Container(
                    width: 1,
                    height: 50.h,
                    color: ThemeService().colorScheme.tertiary,
                  ),
                ),
                Positioned(
                  top: 50.h,
                  right: 0,
                  child: Container(
                    width: 33.w,
                    height: 1,
                    color: ThemeService().colorScheme.tertiary,
                  ),
                ),
                Positioned(
                  top: 57.h,
                  right: 32.w,
                  child: Container(
                    width: 1,
                    height: 32.h,
                    color: ThemeService().colorScheme.tertiary,
                  ),
                ),
                // Positioned(
                //     child: CustomButton(
                //
                //     )
                // ),
              ],
            ),
          ),
          CustomDividerWidget(),
          if (widget.isExpand)
            Container(
              height: AppValues.sportHeight_233.h,
              color: Colors.red,
            ),
          if (widget.isExpand)
            Container(
              height: AppValues.sportHeight_32.h,
              child: DefaultTabController(
                length: 6,
                child: TabBar(
                  // controller: state.tabDetailController,
                  indicatorWeight: 4,
                  indicatorColor: ThemeService().theme.colorScheme.inverseSurface,
                  tabs: [
                    Tab(
                      child: Image.asset(
                        'assets/images/sport/sport_detail_a.webp',
                        height: AppValues.sportHeight_16,
                        width: AppValues.sportWidth_16,
                      ), // 图片1
                    ),
                    Tab(
                      child: Image.asset(
                        'assets/images/sport/sport_detail_b.webp',
                        height: AppValues.sportHeight_16,
                        width: AppValues.sportWidth_16,
                      ), // 图片2
                    ),
                    Tab(
                      child: Image.asset(
                        'assets/images/sport/sport_detail_c.webp',
                        height: AppValues.sportHeight_16,
                        width: AppValues.sportWidth_16,
                      ), // 图片3
                    ),
                    Tab(
                      child: Image.asset(
                        'assets/images/sport/sport_detail_d.webp',
                        height: AppValues.sportHeight_16,
                        width: AppValues.sportWidth_16,
                      ), // 图片3
                    ),
                    Tab(
                      child: Image.asset(
                        'assets/images/sport/sport_detail_e.webp',
                        height: AppValues.sportHeight_16,
                        width: AppValues.sportWidth_16,
                      ), // 图片3
                    ),
                    Tab(
                      child: Image.asset(
                        'assets/images/sport/sport_detail_f.webp',
                        height: AppValues.sportHeight_16,
                        width: AppValues.sportWidth_16,
                      ), // 图片3
                    ),
                  ],
                ),
              ),
            ),
          InkWell(
            onTap: () {
              setState(() {
                widget.isExpand = !widget.isExpand;
              });
            },
            child: Container(
              height: AppValues.sportPadding_20.w,
              child: Center(
                child: AnimatedRotation(
                  duration: Duration(milliseconds: 250),
                  turns: widget.isExpand ? 0.5 : 0,
                  child: FaIcon(
                    FontAwesomeIcons.angleDown,
                    size: AppValues.sportIcon_14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
