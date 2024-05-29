import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/pages/sport/common_model/sport_common_params.dart';
import 'package:flutter_bet/pages/sport/sport_detail/model.dart';
import 'package:flutter_bet/utils/l10n_language2.dart';
import 'package:flutter_bet/utils/string_uril.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constant/app_themes.dart';
import '../../constant/app_values.dart';
import '../../generated/l10n.dart';
import 'package:get/get.dart';
import '../../pages/sport/common_model/sport_filter.dart';
import '../../pages/sport/logic.dart';
import '../../services/theme/theme_service.dart';
import '../../pages/sport/sport_detail/view.dart';
import '../../controllers/global_state_controller.dart';
import '../../utils/date_util.dart';
import '../../utils/time/time_utils.dart';
import '../custom_divider_widget.dart';
import '../custom_text.dart';
import 'custom_sport_mixin/custom_sport_bet_mixin.dart';
import 'custom_sport_odd/custom_sport_odd_two.dart';
import 'custom_sport_expand/custom_sport_expand.dart';
import 'custom_sport_odd_type.dart';

class CustomSportSection extends StatefulWidget {
  CustomSportSection(this.sportListCategotyType, this.sportBetClick, this.section, this.sortIndex,
      this.title, this.commingListTile, this.ct,
      {super.key, List<SportMatchModel>? categoryTabs, Map? sportMap,this.indexMain,this.indexLength,this.isSide = false})
      : categoryTabs = categoryTabs ?? <SportMatchModel>[],
        sportMap = sportMap ?? {};

  final List<SportMatchModel>? categoryTabs;
  final Map? sportMap;
  final SportListCategotyType sportListCategotyType;
  final SportBetClick sportBetClick;
  final int section;
  int sortIndex;
  String commingListTile;
  String ct;
  String? title;
  int? indexMain;
  int? indexLength;
  bool? isSide;

  @override
  State<CustomSportSection> createState() => _CustomSportSectionState();
}

class _CustomSportSectionState extends State<CustomSportSection> with CustomSportBetMixin {
  final MessageLogic logic = Get.find<MessageLogic>(); 
  final GlobalKey _popKey = GlobalKey();
  final GlobalStateController globalController = Get.find<GlobalStateController>();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    // setState(() {
    //
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          groupByCi(widget.categoryTabs ?? [], widget.title ?? '', widget.commingListTile ?? '')!
              .asMap()
              .entries
              .map((e) {
        int? market = e.value.first.m;
        int? eventState = e.value.first.es;
        List<Ml> mlList = e.value.where((m) => m.ml != null).expand((n) => n.ml!).toList();
        //这里数据筛选隐藏 保证全局数据一致
        String sort = '';
        if (widget.sortIndex == 0) {
          sort = '43';
        } else if (widget.sortIndex == 1) {
          sort = '1';
        } else {
          sort = '2';
        }
        bool hasdata = true;
        if (mlList.isNotEmpty) {
          hasdata =
              mlList.where((element) => sort.contains(element.bt.toString())).toList().isNotEmpty;
        } else {
          hasdata = false;
        }
        if (widget.indexMain == widget.indexLength! - 1) hasdata = mlList.isNotEmpty;
        return hasdata
            ? Padding(
                padding: EdgeInsets.only(
                    left: AppValues.sportPadding_12.w,
                    right: AppValues.sportPadding_12.w,
                    top: AppValues.sportPadding_10.w),
                child: CustomSportExpand(
                  padding: EdgeInsets.only(
                      left: AppValues.sportPadding_12.w,
                      right: AppValues.sportPadding_12.w,
                      top: AppValues.sportPadding_12.h,
                      bottom: 0),
                  countWidget: hasdata
                      ? Container(
                          padding: EdgeInsets.only(
                              left: AppValues.sportHeight_7.w,
                              right: AppValues.sportHeight_7.w,
                              top: AppValues.sportHeight_2.h,
                              bottom: AppValues.sportHeight_2.h),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(24.0), // Adjust the radius value as needed
                            color: ThemeService().colorScheme.tertiary, //Background color
                          ),
                          child: Text(
                            widget.title == S.current.sport_tabbar_coming
                                ? widget.ct
                                : widget.indexMain != widget.indexLength! - 1 ? mlList
                                .where((k) => sort.contains(k.bt.toString()))
                                .toList()
                                .length
                                .toString() : mlList.length.toString(),
                            style: TextStyle(
                                color: AppThemes.textColorSecondary,
                                fontSize: AppValues.fontBodySmallSize),
                          ),
                        )
                      : Container(),
                  // Text(((e.value["cl"] as List).first as Map)["cn"]
                  title: Container(
                    child: CustomText(StringUtil().truncateString(e.value.first.cn ?? '', 50),
                        //   (widget.title == S.current.sport_tabbar_coming)
                        //       ? e.value.first.cn
                        //       : (widget.commingListTile ?? ''),
                        //   e.value.first.cn,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: ThemeService().theme.textTheme.bodyMedium!.copyWith(
                              color: AppThemes.textColorSecondary,
                            )),
                  ),

                  decoration: BoxDecoration(
                    color: ThemeService().theme.colorScheme.surfaceVariant,
                    borderRadius: BorderRadius.circular(AppValues.sportRadius_4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25), // 阴影颜色，这里使用黑色
                        offset: Offset(3, 3), // 阴影偏移量，右下方向
                        blurRadius: 10, // 阴影模糊程度
                        spreadRadius: 0, // 阴影扩展程度
                      ),
                    ],
                  ),
                  trailing: hasdata
                      ? FaIcon(
                          FontAwesomeIcons.angleDown,
                          size: 9.41.w,
                        )
                      : Container(),
                  titlePadding: EdgeInsets.only(bottom: 14.5.h),
                  // childrenPadding: EdgeInsets.only(bottom: 19.h),
                  // controller: expandableWidgetController2,
                  isExpanded: hasdata,
                  children: mlList.isNotEmpty
                      ? mlList.asMap().entries.map((k) {
                          BettypeFilter filterModel = logic.state.filterModel.bettypeFilter![logic.state.sit];
                          for (var element in logic.state.filterModel.bettypeFilter!) {
                            if (k.value.si == element.si) {
                              filterModel = element;
                            }
                          }
                          Btl model = filterModel.btl![widget.sortIndex];
                          if (widget.indexMain == widget.indexLength! - 1 && !widget.isSide!) {
                            return _buildChampionView(k.value);
                          } else if (widget.title == S.current.sport_bet_hot && k.key == 0) {
                            return CustomSportOdd(
                              // OddContestType.rolling,
                              const [OddCountType.two],
                              widget.section,
                              k.key,
                              widget.sportBetClick,
                              sportMap: k.value,
                              widget.title,
                              marketType: SportMarketApiType.checkMarketType(market),
                              eventStateType:
                                  SportEventStateApiType.checkEventStateType(eventState),
                            );
                          } else if (k.value.bt == model.bt && k.value.egi == model.egi) {
                            return CustomSportOdd(
                              // OddContestType.rolling,
                              const [OddCountType.two],
                              widget.section,
                              k.key,
                              widget.sportBetClick,
                              sportMap: k.value,
                              widget.title,
                              marketType: SportMarketApiType.checkMarketType(market),
                              eventStateType:
                                  SportEventStateApiType.checkEventStateType(eventState),
                              mlList: mlList.length > 3 ? [mlList[0],mlList[1],mlList[2]] : mlList,
                            );
                          } else if (widget.title == S.current.sport_tabbar_coming) {
                            return CustomSportOdd(
                              // OddContestType.rolling,
                              const [OddCountType.two],
                              widget.section,
                              k.key,
                              widget.sportBetClick,
                              sportMap: k.value,
                              widget.title,
                              marketType: SportMarketApiType.checkMarketType(market),
                              eventStateType:
                                  SportEventStateApiType.checkEventStateType(eventState),
                            );
                          } else {
                            return Container();
                          }
                        }).toList()
// =======
//                 ? mlList.asMap().entries.map((k) {
//                     //这里数据筛选隐藏 保证全局数据一致
//                     String sort = '';
//                     if (widget.sortIndex == 0) {
//                       sort = '43';
//                     } else if (widget.sortIndex == 1) {
//                       sort = '1';
//                     } else {
//                       sort = '2';
//                     }
//                     if (sort.contains(k.value.bt.toString())) {
//                       return CustomSportOdd(
//                         // OddContestType.rolling,
//                         const [OddCountType.two],
//                         widget.section,
//                         k.key,
//                         widget.sportBetClick,
//                         widget.title,
//                         marketType: SportMarketType.checkMarketType(market),
//                         sportMap: k.value,
//                       );
//                     } else {
//                       return Container();
//                     }
//                   }).toList()
// >>>>>>> be4703664872023b42e515c51e175bbda93bddba
                      : [
                          Padding(
                            padding: EdgeInsets.only(left: 0, right: 0),
                            child: Divider(
                              color: AppThemes.widgetColorWhite.withOpacity(0.3),
                              height: AppValues.sportHeight_1,
                              indent: 0,
                              endIndent: 0,
                            ),
                          ),
                          SizedBox(height: AppValues.sportHeight_12.h),
                          Container(
                            height: AppValues.sportHeight_56.h,
                            decoration: BoxDecoration(
                              color: ThemeService().theme.colorScheme.onPrimaryContainer,
                              borderRadius: BorderRadius.circular(AppValues
                                  .sportRadius_4), // Add rounded corners, 10.0 is the radius
                            ),
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.lock,
                                color: AppThemes.textColorSecondary,
                                size: AppValues.allianceIcon_20.w,
                              ),
                            ),
                          ),
                          SizedBox(height: AppValues.sportHeight_12.h),
                        ],
                ),
              ): Container();
            // : _buildNoDataView(S.current.sport_nodata);
      }).toList(),
    );
  }


  Widget _buildNoDataView(String title) {
    return Container(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: AppValues.sportHeight_153),
            Image.asset(
              'assets/images/sport/sport_nodata.webp',
              height: AppValues.sportIcon_112,
              width: AppValues.sportIcon_112,
            ),
            const SizedBox(height: AppValues.sportHeight_16),
            Text(title),
          ],
        ),
      ),
    );
  }

  Widget _buildChampionView(Ml sportMap) {
    var tempData = getRollingOrTimeLabel(sportMap.ed ?? 0);
    return Column(
      children: [
        const CustomDividerWidget(height: 2, color: Color(0xFF557086)),
        InkWell(
          onTap: () {
            print("点击了...冠军赛事...");
            SportDetailPage.openPage(si: sportMap.si, ci: sportMap.ci, isChampion: true);
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: AppValues.sportPadding_4.w),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppValues.sportHeight_12.h),
                CustomText(
                  tempData[1],
                  style: ThemeService().textTheme.bodySmall!.copyWith(
                    color: AppThemes.textColorSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: AppValues.sportHeight_5.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomText(
                        sportMap.oen??'',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap:true,
                        textAlign: TextAlign.start,
                        style: ThemeService().textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                    // Spacer(),
                    const SizedBox(width: 12),
                    CustomText(
                      // "${model.sn} id:${model.sid}" ,
                      '+${sportMap.ms!.length}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.start,
                      style: ThemeService().textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFFB1BAD3),
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
                CustomText(
                  sportMap.cn??'',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: ThemeService().textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFFB1BAD3),
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(height: AppValues.sportHeight_16.h),
              ],
            ),
          ),
        ),
      ],
    );
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
      if ((nowTime - beginTime) < 5000 && !SportEventStateApiType.isBegin(SportEventStateApiType.unBegin)) {
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
      var isZh = Get.find<GlobalStateController>().isChinese();
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
        temp = [true, "${S.current.sport_event_list_begin_time}: $todayTimeStr", 1];
        if (todayTimeStr.contains('Phút Nữa')) {
          temp = [true, "${S.current.sport_event_list_begin_time} $todayTimeStr", 1];
        }
      } else {
        var beginDataTime = DateTime.fromMillisecondsSinceEpoch(beginTime);
        // var dayStr = DateUtil.formatDateMs(beginTime, format: DateFormats.mo_d);
        if (isZh) {
          var dayStr = DateUtil.formatDateMs(beginTime, format: L10nLanguage2.YYYYMMDD1);
          var weekStr = DateUtil.getWeekday(beginDataTime, languageCode: 'zh', short: true);
          var hourStr = DateUtil.formatDateMs(beginTime, format: 'HH:mm');
          temp = [true, "$dayStr $weekStr $hourStr", 2];
        } else {
          var dayStr = DateUtil.formatDateMs(beginTime, format: 'yyyy-MM-dd');
          var weekStr = DateUtil.getWeekday(beginDataTime, languageCode: 'en', short: true);
          var hourStr = DateUtil.formatDateMs(beginTime, format: 'HH:mm');
          temp = [true, "$dayStr $weekStr $hourStr", 2];
        }
      }
    }

    return temp;
  }

// String getName(String t){
//   if(t == S.current.sport_tabbar_coming){
//     return widget.commingListTile ?? '';
//   }else{
//     return e.value.first.cn;
//   }
// }
}
