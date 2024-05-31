import 'package:flutter_bet/generated/l10n.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/widget/button/custom_button.dart';
import 'package:flutter_bet/widget/custom_text.dart';
import 'package:flutter_bet/widget/sport/chart/custom_sport_statistics_live.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../services/theme/theme_service.dart';
import '../../expand/custom_expand_child.dart';
import '../../expand/custom_expand_indicator.dart';
import '../../tab_bar/custom_tab_bar_with_icon.dart';
import 'sport_image_model.dart';
import 'sport_image_painer.dart';
import 'sport_live_controller.dart';
import 'sport_statistics_controller.dart';
import 'spot_wrapper.dart';

//体育赛事-实时数据统计-心电图
class CustomSportStatisticsChart extends StatefulWidget {
  const CustomSportStatisticsChart({super.key});

  @override
  State<CustomSportStatisticsChart> createState() => _CustomSportStatisticsChartState();
}

class _CustomSportStatisticsChartState extends State<CustomSportStatisticsChart> {
  final controller = Get.find<SportStatisticsController>();
  Color belowLineColor = Colors.blue;
  Color aboveLineColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: controller.initFinish.value,
        child: Column(
          children: [
            //顶部比分区域
            _buildTop(),
            _buildLine(),
            //实时数据 心电图
            _buildChart(),
            _buildLine(),
            //播放动画画面
            _buildPlayScreenExpand(),
            _buildLine(),
            // _buildMenuTab(),
          ],
        ),
      );
    });
  }

  /// 用于演示如何通过 RawImage 显示指定的图像（注：这个 Image 是 dart:ui 库中的 Image）
  Widget _buildTop() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppValues.defaultMargin,
        vertical: AppValues.margin_2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                width: 32,
                height: 32,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.white),
                  ),
                ),
              ),
              CustomText('PAC',
                  style: ThemeService.instance.textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
          Column(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: Color(0xFF1D2E3B),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: Colors.white.withOpacity(0.11999999731779099),
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(2),
                        bottomRight: Radius.circular(2),
                      ),
                    ),
                  ),
                  child: CustomText(
                    '2nd | 77:03',
                    style: ThemeService.instance.textTheme.labelLarge,
                  )),
              const SizedBox(height: 11),
              CustomText(
                '02：12',
                style: ThemeService.instance.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                width: 32,
                height: 32,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Colors.white),
                  ),
                ),
              ),
              CustomText(
                'SLA',
                style: ThemeService.instance.textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }

  _buildLine() {
    return Container(
      height: 2,
      color: ThemeService().theme.colorScheme.background,
      margin: EdgeInsets.symmetric(horizontal: 4),
    );
  }

  _buildChart() {
    double ratio = 3;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppValues.defaultMargin,
        vertical: AppValues.halfMargin,
      ),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [

          ///图表层
          Container(
            // margin: const EdgeInsets.only(top: 10),
            child: AspectRatio(
              aspectRatio: ratio,
              child: Container(
                padding: const EdgeInsets.only(top: 20),
                child: LineChart(
                  key: controller.chartKey,
                  LineChartData(
                    //线触数据
                    lineTouchData: LineTouchData(enabled: false),
                    //线条数据，图表数据，是集合，是因为可以画多条线案
                    lineBarsData: [
                      lineChartConfig(controller.spotList),
                    ],
                    minY: -10,
                    maxY: 10,
                    minX: 0,
                    maxX: 90,
                    //坐标标题
                    titlesData: FlTitlesData(
                      show: true,
                      //1、顶部副标题
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      // 2、右边副标题
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),

                      //3、底部坐标显示
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 18,
                          interval: 15,
                          getTitlesWidget: bottomTitleWidgets,
                        ),
                      ),
                      //4、最左边的坐标显示
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                          interval: 5,
                          reservedSize: 40,
                          getTitlesWidget: leftTitleWidgets,
                        ),
                      ),
                    ),

                    //外边框
                    borderData: FlBorderData(
                      show: true,
                      border: Border.symmetric(
                        vertical: BorderSide(color: ThemeService.instance.colorScheme.tertiary),
                        // color: AppColors.borderColor,
                      ),
                    ),
                    //里面的虚线条
                    gridData: FlGridData(
                      show: true,
                      //水平线
                      drawHorizontalLine: false,
                      horizontalInterval: 1,
                      //垂直线
                      drawVerticalLine: true,
                      verticalInterval: 15,
                      //可过滤，显示条件
                      // checkToShowHorizontalLine: (double value) {
                      //   return value == 1 || value == 6 || value == 4 || value == 5;
                      // },

                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: ThemeService.instance.colorScheme.tertiary,
                          strokeWidth: 0.5,
                        );
                      },
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: ThemeService.instance.colorScheme.tertiary,
                          strokeWidth: 0.5,
                        );
                      },
                    ),

                    //rangeAnnotations 坐标上画图 范围注释 矩阵
                    //extraLinesData 坐标上画图 更加丰富
                    extraLinesData: ExtraLinesData(
                      extraLinesOnTop: false,
                      horizontalLines: [
                        HorizontalLine(
                          y: 0.0,
                          color: ThemeService.instance.theme.colorScheme.tertiary,
                          strokeWidth: 2,
                        ),
                      ],
                      verticalLines: [
                        VerticalLine(
                          x: 45,
                          color: ThemeService.instance.theme.colorScheme.tertiary.withAlpha(80),
                          strokeWidth: 30,
                          // strokeCap: StrokeCap.square,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          ///上下标签层
          Container(
            child: AspectRatio(
              aspectRatio: ratio,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  //第一行作为顶部头
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child:
                          CustomText("PAC", style: ThemeService.instance.textTheme.bodyMedium)),
                      Expanded(
                          child: Center(
                              child: CustomText("HT",
                                  style: ThemeService.instance.textTheme.labelMedium))),
                      Expanded(
                          child: Align(
                              child: CustomText("(2x45 Min) FT",
                                  style: ThemeService.instance.textTheme.labelMedium))),
                    ],
                  ),
                  //第二作为底部尾
                  Row(
                    children: [
                      CustomText("SLA", style: ThemeService.instance.textTheme.bodyMedium)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  //曲线配置
  lineChartConfig(List<SpotWrapper> points) {
    var cutOffYValue = 0.0;
    return LineChartBarData(
      spots: points,
      isCurved: true,
      barWidth: 2,
      //LateInitializationError: Field 'mostLeftSpot' has not been initialized
      //只需在 LineChartBarData 添加 show 属性，这将消除您的异常
      show: points.isNotEmpty,
      //线条颜色,color 与 gradient只能取一个
      // color: mainLineColor,
      color: Colors.transparent,
      // gradient: LinearGradient(
      //   colors: [
      //     AppColors.contentColorBlue.withOpacity(0.2),
      //     AppColors.contentColorBlue.withOpacity(0.5),
      //     AppColors.contentColorBlue.withOpacity(0.1),
      //     // widget.belowLineColor.withOpacity(0.2),
      //     // widget.belowLineColor.withOpacity(0.5),
      //     // widget.belowLineColor.withOpacity(0.1),
      //   ],
      // stops: const [0.1, 0.4, 0.9,1],
      // ),
      //低于条形数据
      belowBarData: BarAreaData(
        show: true,
        color: belowLineColor.withOpacity(0.4),
        cutOffY: cutOffYValue,
        applyCutOffY: true,
        // gradient: LinearGradient(
        // colors: [Colors.green, Colors.green].map((color) => color.withOpacity(0.5)).toList(),
        // ),
        spotsLine: BarAreaSpotsLine(
          show: false,
          applyCutOffY: true,
          flLineStyle: FlLine(
            color: ThemeService.instance.colorScheme.tertiary,
            strokeWidth: 2,
          ),
          checkToShowSpotLine: (spot) {
            return spot is SpotWrapper && spot.hasEvent;
          },
        ),
      ),
      //上方条形数据
      aboveBarData: BarAreaData(
        show: true,
        // color: aboveLineColor,
        color: aboveLineColor.withOpacity(0.4),
        cutOffY: cutOffYValue,
        applyCutOffY: true,
        //点位拉线, 不满足需求，不能拉到最下面
        spotsLine: BarAreaSpotsLine(
          show: false,
          applyCutOffY: false,
          flLineStyle: FlLine(
            color: ThemeService.instance.colorScheme.tertiary,
            strokeWidth: 2,
          ),
          checkToShowSpotLine: (spot) {
            return spot is SpotWrapper && spot.hasEvent;
          },
        ),
      ),
      //点数据
      dotData: FlDotData(
        show: true,
        getDotPainter: (FlSpot spot, double xPercentage, LineChartBarData bar, int index) {
          //妈蛋的，每个点都需要paint
          // return _createDotPainter(spot, xPercentage, bar, index);
          // 自定义画笔绘制
          // controller.measureChartHeight();
          return SportImagePainter(
            images: controller.imageMap,
            imageSize: 10,
            spot: controller.spotList[index],
            //20为margin top, 10为图片大小
            heightOffset: (controller.measureChartHeight() - 20) - 10,
            radius: 10 / 2,
          );
        },
        // checkToShowDot: (spot, barData) {
        //   return !(spot.x == 0 && spot.y == 0) && spot is SpotWrapper && spot.hasEvent;
        // },
      ),
    );
  }

  //这个index 是 点数据的index ，不是文本的index
  Widget bottomTitleWidgets(double index, TitleMeta meta) {
    String bottomLabel = controller.xValues[index.toInt()];
    return SideTitleWidget(
        axisSide: meta.axisSide,
        space: 4,
        child: CustomText(bottomLabel,
            style: index == 45
                ? ThemeService.instance.textTheme.bodySmall
                : ThemeService.instance.textTheme.labelMedium));
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      // child: Text('\$ ${value + 0.5}', style: style),
      // child: Text('${value + 0.5}', style: ThemeService.instance.textTheme.bodyMedium),
      child: SizedBox(height: 0),
    );
  }

  ///播放动画画面
  ///赛事直播动画
  _buildPlayScreenExpand() {
    return CustomExpandChild(
      // collapsedVisibilityFactor: 0.1,
      // indicatorIconColor: Colors.red,
        indicatorIconSize: 20,
        hideIndicatorOnExpand: false,
        expandIndicatorStyle: ExpandIndicatorStyle.icon,
        // indicatorIcon: Icons.cake,
        // indicatorHintTextStyle: const TextStyle(fontSize: 16),
        // indicatorBuilder: (context, onTap, expanded) => InkWell(
        //   onTap: onTap,
        //   child: FlutterLogo(
        //     style: expanded
        //         ? FlutterLogoStyle.horizontal
        //         : FlutterLogoStyle.stacked,
        //     size: 40,
        //   ),
        // ),
        child: Column(
          children: [
            _buildLiveAnima(),
            _buildMenuTab(),
            //测试按钮
          ],
        ));
  }

  ///直播动画
  _buildLiveAnima() {
    return Obx(() {
      return CustomSportStatisticsLive(
          spotWrapper: controller.spotList.isNotEmpty ? controller.spotList.last : null);
    });
  }

  ///底部菜单
  _buildMenuTab() {
    return Container(
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
    );
  }

  @override
  void dispose() {
    super.dispose();
    log("开发日志：view...dispose...");
  }
}

List<Tab> tabsNoIcons = [
  Tab(
    text: S.current.random_text_273,
  ),
  Tab(
    text: S.current.random_text_274,
  ),
  Tab(
    text: S.current.home_challenge,
  ),
  Tab(
    text: S.current.random_text_728,
  ),
];
