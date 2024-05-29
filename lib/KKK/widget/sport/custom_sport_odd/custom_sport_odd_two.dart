import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/controllers/global_state_controller.dart';
import 'package:flutter_bet/pages/sport/sport_detail/model.dart';
import 'package:flutter_bet/utils/common_util.dart';
import 'package:flutter_bet/utils/json_util.dart';
import 'package:flutter_bet/utils/time/time_utils.dart';
import 'package:flutter_bet/utils/l10n_language2.dart';
import 'package:flutter_bet/widget/custom_divider_widget.dart';
import 'package:flutter_bet/widget/custom_text.dart';
import 'package:flutter_bet/widget/sport/custom_sport_mixin/custom_sport_bet_mixin.dart';
import 'package:flutter_bet/widget/sport/until/custom_sport_until.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constant/app_themes.dart';
import '../../../generated/l10n.dart';
import '../../../pages/sport/common_model/sport_common_params.dart';
import '../../../pages/sport/logic.dart';
import '../../../routes/routes.dart';
import '../../../services/theme/theme_service.dart';
import '../../../utils/date_util.dart';
import '../../button/custom_icon_button.dart';
import '../custom_sport_mixin/custom_sport_live_window_mixin.dart';
import '../custom_sport_mixin/custom_sport_statistics_window_mixin.dart';
import '../custom_sport_odd_type.dart';
import 'custom_sport_odd_button_v.dart';
import 'package:intl/intl.dart';

import 'sport_odd_desc_model.dart';

class CustomSportOdd extends StatefulWidget {
  // final OddContestType oddContestType;

  // final OddCountType oddCountType;
  final List<OddCountType> oddCountTypes;

  // ignore: non_constant_identifier_names
  final SportBetClick sportBetClick;

  ///section 不知道 干什么的？？
  int section;
  int row;
  String? title;
  List<Ml>? mlList;

  ///"m": 2, //market 1:早盘 2:今日 3:滚球
  SportMarketApiType marketType;

  ///"es": 1, //RBTimeStatus 0:未开赛 1:开始 2:进行中 3:暂停
  final SportEventStateApiType eventStateType;

  ///里面已经包含字段 "mls": 1, //0:关盘  1:开盘  2:锁盘
  final Ml? sportMap;
  final double? margin2;
  final double? margin3;
  final bool isSowDivider; //是否显示分割线

  ///重新设计逻辑，还是利用来区分 类型 OddContestType
  // final bool newDesign; //默认还是使用旧的代码
  // final int? beginTime; //开始时间
  // final String topRowLabel; // 第一行信息，或者给个时间

  CustomSportOdd(
    // this.oddContestType, //不需要上层直接给，Ml 已经有字段可以判断
    this.oddCountTypes,
    this.section,
    this.row,
    this.sportBetClick,
    this.title,
    // 软参数
    {
    super.key,
    required this.marketType,
    required this.eventStateType,
    required this.sportMap,
    this.margin2,
    this.margin3,
    this.isSowDivider = true,
    this.mlList,
    // this.newDesign = false, //默认还是使用旧的代码
  });

  // : sportMap = sportMap ?? Ml();

  @override
  State<CustomSportOdd> createState() => _CustomSportOddState();
}

class _CustomSportOddState extends State<CustomSportOdd>
    with CustomSportLiveWindowMixin, CustomSportStatisticsWindowMixin, CustomSportBetMixin {
  @override
  Future addOverlayEntry(double left, double top, BuildContext context) {
    // TODO: implement addOverlayEntry
    return super.addOverlayEntry(left, top, context);
  }

  @override
  Future showSportStatistics(double left, double top, BuildContext context) {
    // TODO: implement showSportStatistics
    return super.showSportStatistics(left, top, context);
  }

  var mlList = [];
  final GlobalStateController globalController = Get.find<GlobalStateController>();
  final MessageLogic logic = Get.find<MessageLogic>();

  ///0:关盘  1:开盘  2:锁盘
  late SportHandicapApiType handicapStateType;

  @override
  void initState() {
    super.initState();
    // mlList = widget.sportMap!["ml"].toList();
    if ((widget.mlList??[]).isNotEmpty) {
      for (var i = 0; i < widget.mlList!.length; i++) {
        var element = widget.mlList![i];
        if (element.bt == 2) {
          mlList.insert(0, element);
        } else {
          mlList.add(element);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // log("赔率组件...${JsonUtil.encodeObj(widget.sportMap)}");
    // log("赔率组件...${JsonUtil.encodeObj(widget.sportMap?.ed)}");
    handicapStateType = SportHandicapApiType.checkHandicap(widget.sportMap?.mls);
    return GestureDetector(
      // padding: EdgeInsets.zero,
      onTap: () {
        widget.sportBetClick(
            SportClikType.detail, -1, -1, -1, widget.sportMap?.si ?? 0, widget.sportMap?.ei ?? '');
      },
      child: Container(
        color: Colors.transparent,
        // height: sectionHeight(widget.oddContestType),
        child: Column(
          children: [
            //Divider
            CustomDividerWidget(
              // color: ThemeService().theme.colorScheme.tertiary,
              color: const Color(0xFF304454),
              height: widget.isSowDivider ? AppValues.sportHeight_2 : 0,
              // indent: 0,
              // endIndent: 0,
            ),
            SizedBox(height: AppValues.sportHeight_12.h),
            //绘制里面内容 的第一行
            _buildTopRowView(),
            SizedBox(height: AppValues.sportHeight_5.h),
            SizedBox(
              width: Get.width - (widget.margin3 ?? AppValues.sportWidth_44.w),
              child: Wrap(
                children: [
                  Text("${widget.sportMap?.htn} - ",
                    textAlign: TextAlign.left, style: ThemeService().theme.textTheme.bodyMedium),
                  Text("${widget.sportMap?.atn}",
                    textAlign: TextAlign.left, style: ThemeService().theme.textTheme.bodyMedium),
                ],
              ),
            ),
            if (widget.title == S.current.sport_tabbar_coming)
              SizedBox(height: AppValues.sportHeight_5.h),
            if (widget.title == S.current.sport_tabbar_coming)
              SizedBox(
                width: Get.width - AppValues.sportWidth_44.w,
                child: Text((widget.sportMap?.cn ?? '').toString(),
                    textAlign: TextAlign.left,
                    style: ThemeService()
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppThemes.textColorSecondary)),
              ),
            // if (widget.oddContestType == OddContestType.coming)
            //   Container(
            //     padding: EdgeInsets.only(top: AppValues.sportPadding_4.h),
            //     width: Get.width - (widget.margin3 ?? AppValues.sportWidth_44.w),
            //     child: Text('xxxxxxx',
            //         textAlign: TextAlign.left, style: ThemeService().theme.textTheme.bodyMedium),
            //   ),
            // if ((widget.sportMap?.ms ?? []).isNotEmpty)
            //   // ...SportUntil()
            //   //     .splitArrayIntoGroups(widget.sportMap?.ms ?? [],
            //   //     SportUntil().getRowsCount(widget.sportMap ?? Ml(pid: 1)))
            //   //     .map((e) {
            //   ...(widget.sportMap?.ms ?? [])
            //       .map((e) {
            //     return _sectionOdd(widget.oddCountTypes, widget.sportMap?.ms);
            //   }),

            if (widget.sportMap?.ms != null && widget.sportMap?.ms != [])
              Obx(() => (logic.state.showAll.value && (widget.mlList??[]).isNotEmpty) ? allOdd() : _sectionOdd(widget.oddCountTypes, widget.sportMap?.ms, widget.sportMap?.mls)),
            // _sectionOdd(widget.oddCountTypes, widget.sportMap?.ms, 2), //测试写固定
            SizedBox(height: AppValues.sportHeight_12.h),
            // Divider(
            //   color: ThemeService().theme.colorScheme.tertiary,
            //   // color: Color(0xFF304454),
            //   height: AppValues.sportHeight_2,
            //   indent: 0,
            //   endIndent: 0,
            // ),
          ],
        ),
      ),
    );
  }

  ///绘制里面内容 的第一行
  _buildTopRowView() {
    return Row(
      children: [
        SizedBox(
          width: Get.width - (widget.margin2 ?? AppValues.sportWidth_48.w),
          child: Row(
            children: [
              // !widget.newDesign ? _buildTopRowFlagView() : _buildTopRowFlagView_new(),
              _buildTopRowFlagView_new(),
              const Expanded(child: SizedBox()),
              // CustomIconButton(
              //   padding: 0,
              //   widgetWidth: AppValues.sportWidth_20.w,
              //   widgetHeight: AppValues.sportWidth_20.w,
              //   iconWidth: AppValues.sportIcon_16.w,
              //   iconHeight: AppValues.sportIcon_16.w,
              //   iconWidget: Image.asset(
              //     'assets/images/sport/sport_more.webp',
              //     width: AppValues.sportIcon_16.w,
              //     height: AppValues.sportIcon_16.w,
              //   ),
              //   onTap: () {
              //     showSportStatistics(0, 0, context);
              //   },
              // ),
              // SizedBox(width: AppValues.sportWidth_10.w),
              if (Get.find<GlobalStateController>().isLogin.value)
                CustomIconButton(
                  padding: 0,
                  widgetWidth: AppValues.sportWidth_30.w,
                  widgetHeight: AppValues.sportWidth_20.w,
                  iconWidth: AppValues.sportIcon_16.w,
                  iconHeight: AppValues.sportIcon_16.w,
                  mainAxisAlignment: MainAxisAlignment.center,
                  iconWidget: Image.asset(
                    widget.sportMap?.isFav == true
                        ? 'assets/images/sport/sport_fav_s.webp'
                        : 'assets/images/sport/sport_fav.webp',
                    width: AppValues.sportIcon_16.w,
                    height: AppValues.sportIcon_16.w,
                  ),
                  onTap: () {
                    if (widget.sportBetClick != null) {
                      widget.sportBetClick(SportClikType.fav, 0, 0, 0, widget.sportMap?.si ?? 0,
                          widget.sportMap?.ei ?? '');
                    }

                    // addOverlayEntry(
                    //     AppValues.sportWidth_80.w, AppValues.sportWidth_80.w, context);
                  },
                ),
              SizedBox(width: AppValues.sportWidth_10.w),
              Text('+${widget.sportMap?.mc}', style: ThemeService().theme.textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }

  ///动态标签
  _buildTopRowFlagView() {
    return Row(
      children: [
        Visibility(
          child: Container(
            height: AppValues.sportHeight_19.h,
            padding:
                EdgeInsets.only(left: AppValues.sportWidth_4.w, right: AppValues.sportWidth_4.w),
            constraints: const BoxConstraints(
              minWidth: 0, // 设置最小宽度为0
              maxWidth: double.infinity, // 设置最大宽度为无穷大
            ),
            decoration: BoxDecoration(
              color: AppThemes.reverseStateColor, // Container 的背景色
              borderRadius: BorderRadius.circular(AppValues.radius_2), // 设置圆角，10.0 是圆角的半径
            ),
            child: Center(
              child: Text(
                S.current.sport_tabbar_rolling,
                style: ThemeService().theme.textTheme.bodySmall,
              ),
            ),
          ),
          visible: widget.title == S.current.sport_tabbar_rolling,
          // visible: widget.sportMap?.m == 3,
        ),
        if (widget.title == S.current.sport_tabbar_rolling) SizedBox(width: AppValues.sportWidth_11.w),
        Text(
            widget.title == S.current.sport_tabbar_coming
                ? '${S.current.sport_tabbar_coming} ${widget.sportMap?.ed != null ? DateFormat(L10nLanguage2.YYYYMMDD_HH1).format(DateTime.fromMillisecondsSinceEpoch(widget.sportMap!.ed! * 1000)) : ''}'
                : (widget.title == S.current.sport_tabbar_rolling
                    ? widget.sportMap?.rbt ?? ''
                    : widget.sportMap?.pn ?? ''),
            style: ThemeService()
                .theme
                .textTheme
                .bodyMedium!
                .copyWith(color: AppThemes.textColorSecondary)),
        SizedBox(width: 10.w),
        Text(
            widget.title == S.current.sport_tabbar_coming
                ? ''
                : '${widget.sportMap?.hp ?? ""} - ${widget.sportMap?.ap ?? ""}',
            style: ThemeService()
                .theme
                .textTheme
                .bodyMedium!
                .copyWith(color: AppThemes.textColorSecondary)),
        SizedBox(width: 10.w),
        Text('',
            style: ThemeService()
                .theme
                .textTheme
                .bodyMedium!
                .copyWith(color: AppThemes.scoreTextColor)),
      ],
    );
  }

  ///【新代码】绘制里面内容 的第一行
  _buildTopRowFlagView_new() {
    // switch (widget.oddContestType) {
    //   case OddContestType.rolling:
    //     break;
    //   case OddContestType.coming:
    //     break;
    //   case OddContestType.over:
    //     break;
    //   default:
    //     break;
    // }
    if (widget.sportMap?.m == 3) {
      // return Container(
      //   width: 10,
      //   height: 10,
      //   color: Colors.red,
      // );

      String tt = toS(widget.sportMap?.rbtt ?? '', widget.sportMap?.ts ?? 0, widget.sportMap?.si);

      var tempData = getRollingOrTimeLabel(widget.sportMap!.ed ?? 0);
      bool isShowTime = tempData[0];
      String label = tempData[1];
      if (isShowTime) {
        ///【1】显示时间
        int t = tempData[2];
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (t == 1)
              Image.asset(
                'assets/images/sport/ic_sport_time_star.webp',
                // : 'assets/images/sport/sport_time_coming.webp',
                width: 12.w,
                height: 12.w,
              ),
            if (t == 1) SizedBox(width: 8.w),
            CustomText(
              // 'asdasdsad',
              label,
              style: ThemeService().textTheme.bodySmall!.copyWith(
                    color: AppThemes.textColorSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        );
      } else {
        ///【2】显示状态；'滚球'、'已结束'
        bool isOver = tempData[2] == 2;
        return Row(
          children: [
            Container(
              height: AppValues.sportHeight_19.h,
              padding: EdgeInsets.only(
                left: AppValues.sportWidth_4.w,
                right: AppValues.sportWidth_4.w,
              ),
              constraints: const BoxConstraints(
                minWidth: 0, // 设置最小宽度为0
                maxWidth: double.infinity, // 设置最大宽度为无穷大
              ),
              decoration: BoxDecoration(
                color: isOver ? Colors.black : AppThemes.reverseStateColor, // Container 的背景色
                borderRadius: BorderRadius.circular(AppValues.radius_2), // 设置圆角，10.0 是圆角的半径
              ),
              child: Center(
                child: Text(
                  label,
                  style: ThemeService().theme.textTheme.bodySmall,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Text(
                // '${widget.sportMap?.rbtt.toString()} ${widget.sportMap?.rbtd.toString()}',
                (globalController.isThai() && (widget.sportMap?.rbtd ?? '').length > 25) ? '' :
                 tt +
                    '  ' +
                    (widget.sportMap?.rbtd ?? ''),
                style: ThemeService()
                    .theme
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white)),
            SizedBox(width: 10.w),
            Text(
                widget.title == S.current.sport_tabbar_coming
                    ? ''
                    : '${widget.sportMap?.hp ?? ""} - ${widget.sportMap?.ap ?? ""}',
                style: ThemeService().textTheme.bodyMedium!.copyWith(color: Color(0xFFFF9800))),
            SizedBox(width: 10.w),
            Text('',
                style:
                    ThemeService().textTheme.bodyMedium!.copyWith(color: AppThemes.scoreTextColor)),
          ],
        );
      }
    } else {
      var tempData = getRollingOrTimeLabel(widget.sportMap!.ed ?? 0);
      bool isShowTime = tempData[0];
      String label = tempData[1];
      if (isShowTime) {
        ///【1】显示时间
        int t = tempData[2];
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (t == 1)
              Image.asset(
                'assets/images/sport/ic_sport_time_star.webp',
                // : 'assets/images/sport/sport_time_coming.webp',
                width: 12.w,
                height: 12.w,
              ),
            if (t == 1) SizedBox(width: 8.w),
            CustomText(
              label,
              style: ThemeService().textTheme.bodySmall!.copyWith(
                    color: AppThemes.textColorSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ],
        );
      } else {
        ///【2】显示状态；'滚球'、'已结束'
        bool isOver = tempData[2] == 2;
        return Row(
          children: [
            Container(
              height: AppValues.sportHeight_19.h,
              padding: EdgeInsets.only(
                left: AppValues.sportWidth_4.w,
                right: AppValues.sportWidth_4.w,
              ),
              constraints: const BoxConstraints(
                minWidth: 0, // 设置最小宽度为0
                maxWidth: double.infinity, // 设置最大宽度为无穷大
              ),
              decoration: BoxDecoration(
                color: isOver ? Colors.black : AppThemes.reverseStateColor, // Container 的背景色
                borderRadius: BorderRadius.circular(AppValues.radius_2), // 设置圆角，10.0 是圆角的半径
              ),
              child: Center(
                child: Text(
                  label,
                  style: ThemeService().theme.textTheme.bodySmall,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Text(widget.sportMap?.rbt ?? '',
                style: ThemeService()
                    .theme
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppThemes.textColorSecondary)),
            SizedBox(width: 10.w),
            Text(
                widget.title == S.current.sport_tabbar_coming
                    ? ''
                    : '${widget.sportMap?.hp ?? ""} - ${widget.sportMap?.ap ?? ""}',
                style: ThemeService().textTheme.bodyMedium!.copyWith(color: Color(0xFFFF9800))),
            SizedBox(width: 10.w),
            Text('',
                style:
                    ThemeService().textTheme.bodyMedium!.copyWith(color: AppThemes.scoreTextColor)),
          ],
        );
      }
    }
  }

  ///如上图所示赛事时间显示区域，时间显示规则统一如下：
  // 1、距离比赛开始1小时时开始显示倒计时；
  // 2、倒计时结束后，如果还没收到赛事开始消息，这时显示：即将开赛；
  // 3、赛事结束后，显示“已结束”
  // 4、其余情况距离比赛开始时间超过1小时的就显示年月日时分；
  ///第一个数据是isShowTime, 是否显示时间，
  ///第二个数据是标签，时间标签 或者 滚球标签
  ///第三个数据是显示图标 标记, 1代表显示倒计时图标，
  List getRollingOrTimeLabel(int rbt) {
    // 赛事model：
    // "m": 2, //market 1:早盘 2:今日 3:滚球
    // "rbt": "", //滚球时间
    // "rbts": 0, //RBTimeStatus 0:未开赛 1:开始 2:进行中 3:暂停
    // "ed": 1699707600, //赛事开始时间
    // "es": 1, //RBTimeStatus 0:未开赛 1:开始 2:进行中 3:暂停
    //  ml盘口model状态： "mls": 1, //0:关盘  1:开盘  2:锁盘
    int nowTime = DateTime.now().millisecondsSinceEpoch;
    int beginTime = rbt * 1000;
    var temp = [];

    ///现在时间大于比赛时间， 说明已经进行
    ///情况分析：0:未开赛 1:开始 2:进行中 3:暂停
    if (nowTime > beginTime) {
      //【情况一】倒计时结束后，如果还没收到赛事开始消息，这时显示：即将开赛；
      // 逻辑处理：时间在5秒内，且还未开赛
      if ((nowTime - beginTime) < 5000 && !SportEventStateApiType.isBegin(widget.eventStateType)) {
        //显示"即将开赛"
        temp = [true, S.current.sport_tabbar_coming, 0];
      }
      //【情况二】判断是否结束
      // else if (SportHandicapApiType.isClosed(handicapStateType)) {
      //   temp = [false, S.current.sport_event_list_over, 2];
      // }
      //【情况三】正常开赛
      else {
        temp = [false, S.current.bet_live, 1];
      }
    } else {
      //未开始显示时间,分两种情况：今天 和 明天起
      // bool isToday = DateUtil.isToday(beginTime);
      // bool isInOneHour = DateUtil.isWithinOneHour(beginTime);
      var isZh = globalController.isChinese();
      String todayTimeStr =
          TimeUtils.formatTimeBehind(beginTime, nowTime, languageCode: globalController.getLangString());
      bool isInOneHour = todayTimeStr.contains(S.current.random_text_733) ||
          todayTimeStr.contains(S.current.random_text_734) ||
          todayTimeStr.contains('min') ||
          todayTimeStr.contains('sec') || 
          todayTimeStr.contains('Phút Nữa');
      if (isInOneHour) {
        //需要距离比赛开始1小时时开始显示倒计时；、以及图标
        // String todayTimeStr = TimeUtils.formatTimeBehind(beginTime, nowTime);
        temp = [true, "${S.current.sport_event_list_begin_time}：$todayTimeStr", 1];
        if (todayTimeStr.contains('Phút Nữa')) {
          temp = [true, "${S.current.sport_event_list_begin_time} $todayTimeStr", 1];
        }
      } else {
        var beginDataTime = DateTime.fromMillisecondsSinceEpoch(beginTime);
        // var dayStr = DateUtil.formatDateMs(beginTime, format: DateFormats.mo_d);
        if (isZh) {
          var dayStr = DateUtil.formatDateMs(beginTime, format: S.current.random_text_1179);
          var weekStr = DateUtil.getWeekday(beginDataTime, languageCode: 'zh', short: true);
          var hourStr = DateUtil.formatDateMs(beginTime, format: 'HH:mm');
          temp = [true, "$dayStr $weekStr $hourStr", 2];
        } else {
          var dayStr = DateUtil.formatDateMs(beginTime, format: 'MM dd');
          var weekStr = DateUtil.getWeekday(beginDataTime, short: globalController.langType.value == 2 ? true : false);
          var hourStr = DateFormat('HH:mm a').format(DateTime.fromMillisecondsSinceEpoch(beginTime));
          var time = dealDate(beginTime);
          temp = [true, "$weekStr $time", 2];
          if (globalController.isVi()) {
            temp = [true, "$weekStr, $time", 2];
          }
        }
      }
    }

    return temp;
  }

  String dealDate(int beginTime) {
    var dayStr = DateUtil.formatDateMs(beginTime, format: 'MM dd');
    var hourStr = DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(beginTime));
    var month = dayStr.split(' ').first;
    var day = dayStr.split(' ').last;
    var monthStr = '';
    var hour = int.parse(hourStr.split(':').first);
    if (hour > 11) {
      hour = int.parse(hourStr.split(':').first) - 12;
    }
    var min = hourStr.split(':').last;
    if (globalController.langType.value == 2) {
      hourStr = DateFormat('HH:mm a').format(DateTime.fromMillisecondsSinceEpoch(beginTime));
      switch (month) {
        case '01':
          monthStr = 'January';
          break;
        case '02':
          monthStr = 'February';
          break;
        case '03':
          monthStr = 'March';
          break;
        case '04':
          monthStr = 'April';
          break;
        case '05':
          monthStr = 'May';
          break;
        case '06':
          monthStr = 'June';
          break;
        case '07':
          monthStr = 'July';
          break;
        case '08':
          monthStr = 'August';
          break;
        case '09':
          monthStr = 'September';
          break;
        case '10':
          monthStr = 'October';
          break;
        case '11':
          monthStr = 'November';
          break;
        case '12':
          monthStr = 'December';
          break;
        default:
      }
      return "$monthStr $day $hour:$min";
    } else if (globalController.isVi()) {
      monthStr = month.replaceRange(0, 1, 'Thg ');
      return "$day $monthStr $hour:$min";
    } else if (globalController.isThai()) {
      switch (month) {
        case '01':
          monthStr = 'ม.ค.';
          break;
        case '02':
          monthStr = 'ก.พ.';
          break;
        case '03':
          monthStr = 'มี.ค.';
          break;
        case '04':
          monthStr = 'เม.ย.';
          break;
        case '05':
          monthStr = 'พ.ค.';
          break;
        case '06':
          monthStr = 'มิ.ย.';
          break;
        case '07':
          monthStr = 'ก.ค.';
          break;
        case '08':
          monthStr = 'ส.ค.';
          break;
        case '09':
          monthStr = 'ก.ย.';
          break;
        case '10':
          monthStr = 'ต.ค.';
          break;
        case '11':
          monthStr = 'พ.ย.';
          break;
        case '12':
          monthStr = 'ธ.ค.';
          break;
        default:
      }
      return "$day $monthStr $hourStr";
    }
    return "$dayStr $hourStr";
  }

  double sectionHeight(OddContestType type) {
    switch (type) {
      case OddContestType.rolling:
        return AppValues.sportHeight_155.h;
      case OddContestType.coming:
        return AppValues.sportHeight_175.h;
      default:
        return AppValues.sportHeight_175.h;
    }
  }

  Widget allOdd() {
    return Column(
      children: (widget.mlList??[]).isNotEmpty ? mlList.map((e) => _sectionOdd(widget.oddCountTypes, e.ms, e.mls)).toList() : [],
    );
  }

  ///mls: 盘口状态
  Widget _sectionOdd(List<OddCountType> oddCountTypes, List<M>? mlMap, int? mls) {
    if (mlMap != null && mlMap.isNotEmpty) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: AppValues.sportHeight_4.h),
          Text(mlMap?.first.btn ?? 'xxxxx',
              style: ThemeService().theme.textTheme.bodyMedium?.copyWith(color: Color(0xFFB1BAD3)),
              textAlign: TextAlign.center),
          SizedBox(height: AppValues.sportHeight_4.h),
          _sectionOddCount(mlMap, SportHandicapApiType.checkHandicap(mls)),
        ],
      );
    } else {
      return Container();
    }
  }

  ///赔率显示view，2格子 或者 3格式
  ///stateType 盘口状态
  Widget _sectionOddCount(List<M>? ms, SportHandicapApiType stateType) {
    return Container(
      child: GridView(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          // scrollDirection : Axis.vertical,
          // scrollDirection: Axis.horizontal,
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: ms?.length == 2 ? 2 : 3,
            crossAxisSpacing: 8,
            childAspectRatio: ms?.length == 2 ? 2.73 : 1.70,
            // childAspectRatio: ms?.length == 2 ? 2.73 : 1.50,
          ),
          children: ms?.map((e) {
            return CustomSportOddButtonV(
              e,
              ms.length == 2 ? OddCountType.two : OddCountType.three,
              OddStatusType.rolling,
              widget.sportBetClick,
              widget.section,
              widget.row,
              0,
              stateType: stateType,
            );
          }).toList() as List<Widget>),
    );
  }

  String toS(String t, int st, int? si) {
    try {
      DateTime parsedTime = DateFormat("mm:ss").parse(t);

      int inputTimestamp = st;

      // 将输入的时间戳转换为DateTime对象
      DateTime inputDateTime = DateTime.fromMillisecondsSinceEpoch(inputTimestamp * 1000);

      // 获取当前时间
      DateTime currentDateTime = DateTime.now();

      Duration difference = currentDateTime.difference(inputDateTime);

      DateFormat formatter = DateFormat('mm:ss');

      if (si == 1) {
        DateTime resultDateTime = parsedTime.add(difference);
        return formatter.format(resultDateTime);
      } else {
        DateTime resultDateTime = parsedTime.subtract(difference);
        return formatter.format(resultDateTime);
      }
    } catch (e) {
      return '';
    }
  }
}
