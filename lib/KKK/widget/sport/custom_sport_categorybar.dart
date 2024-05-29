import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/generated/l10n.dart';
import 'package:flutter_bet/pages/sport/tabmodel.dart';
import 'package:flutter_bet/services/branch/branch_service.dart';
import 'package:flutter_bet/widget/network_image/custom_network_image.dart';
import 'package:flutter_bet/widget/sport/custom_sport_tab_bar_point.dart';
import 'package:flutter_bet/widget/sport/until/custom_sport_until.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constant/app_themes.dart';
import '../../pages/sport/common_model/sport_filter.dart';
import '../../services/theme/theme_service.dart';

class CustomSportCategoryBar extends StatefulWidget {
  List<SportHallCountModel> tabData;
  final ValueChanged<int>? onTap;
  String? title;
  int? index;
  ListFilter? model;

  CustomSportCategoryBar(this.tabData, this.onTap, {super.key, this.title, this.index,this.model});

  @override
  State<CustomSportCategoryBar> createState() => _CustomSportCategoryBarState();
}

class _CustomSportCategoryBarState extends State<CustomSportCategoryBar> {
  int chooeIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomSportCategoryBar oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    chooeIndex = widget.index ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    // chooeIndex = widget.index ?? 0;
    // print(widget.index);
    return Padding(
      padding: EdgeInsets.only(
          top: AppValues.sportPadding_12.h,
          left: AppValues.sportPadding_12.w,
          right: AppValues.sportPadding_12.w),
      child: Container(
        width: Get.width - AppValues.sportWidth_20.w,
        // color: Colors.red,
        // color: ThemeService().theme.colorScheme.surface,

        child: Column(
          children: [
            Container(
              width: Get.width - 24.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppValues.sportRadius_8), // 设置圆角半径
                color: ThemeService().theme.colorScheme.surface,
                // color: Colors.cyanAccent
              ),
              height: AppValues.sportHeight_104.h,
              child: widget.tabData.length > (widget.index ?? 0)
                  ? DefaultTabController(
                      initialIndex: widget.index ?? 0,
                      length: widget.tabData.length,
                      child: CustomSportTabBarPoint(
                        onTap: (e) {
                          if (mounted) {
                            setState(() {
                              widget.index = e;
                            });
                          }
                          if (widget.onTap != null) {
                            widget.onTap!(e);
                          }
                        },
                        indicatorColor: ThemeService().theme.colorScheme.secondary,
                        tabs: widget.tabData.asMap().entries.map((entry) {
                          int index = entry.key;
                          SportHallCountModel e = entry.value;
                          bool isSelected = (widget.index == index);
                          return Tab(
                            iconMargin: EdgeInsets.zero,
                            height: AppValues.sportHeight_63.h,
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Positioned(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: AppValues.sportHeight_9.h,
                                            right: AppValues.sportPadding_11.w,
                                            left: AppValues.sportPadding_11.w),
                                        child: ColorFiltered(
                                          colorFilter: ColorFilter.mode(
                                            isSelected
                                                ? Colors.white
                                                : Color(0xFFB1BAD3), // 更改为您想要的颜色
                                            BlendMode.srcIn, // BlendMode用于定义如何混合颜色和图像。
                                          ),
                                          child: ((index == 0) &&
                                                  (widget.title == S.current.sport_tabbar_coming))
                                              ? Image.asset(
                                                  'assets/images/sport/sport_all.webp',
                                                  width: AppValues.sportWidth_28.w,
                                                  height: AppValues.sportHeight_28.h,
                                                )
                                              : CustomNetWorkImage(
                                                  imageUrl:
                                                      BranchService.instance.current.asset_url +
                                                          (e.spic ?? ''),
                                                  width: AppValues.sportWidth_28.w,
                                                  height: AppValues.sportHeight_28.h,
                                                  placeholder: Image.asset(
                                                    'assets/images/sport/s_999.webp',
                                                    width: AppValues.sportWidth_28.w,
                                                    height: AppValues.sportHeight_28.h,
                                                  ),
                                                  errorWidget: Image.asset(
                                                    'assets/images/sport/s_999.webp',
                                                    width: AppValues.sportWidth_28.w,
                                                    height: AppValues.sportHeight_28.h,
                                                  ),

                                                ),
                                        ),
                                        // child: Image.asset(
                                        //   SportUntil().tabImage(isSelected, e.si ?? 999),
                                        //   width: AppValues.sportWidth_28.w,
                                        //   height: AppValues.sportHeight_28.h,
                                        // ),
                                      ),
                                    ),
                                    // if (widget.title != S.current.sport_fav_comming_rolling &&
                                    //     widget.title != S.current.sport_fav_hot_rolling)
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Container(
                                        constraints: BoxConstraints(
                                          minWidth: AppValues.sportWidth_22.w, // 设置最小宽度
                                        ),
                                        padding: EdgeInsets.all(AppValues.padding_2.w),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? ThemeService().colorScheme.primary
                                              : AppThemes.oddBackColor,
                                          borderRadius:
                                              BorderRadius.circular(AppValues.sportRadius_8),
                                        ),
                                        child: Text(
                                          _getCount(e), // 角标内容
                                          style: ThemeService().textTheme.bodySmall!.copyWith(
                                              fontSize: AppValues.fontLabelSmallSize.sp,
                                              color: isSelected
                                                  ? AppThemes.textColorDark
                                                  : AppThemes.textColorLightGrey,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppValues.sportHeight_7.h,
                                ),
                                Text(
                                  processString(e.sn.toString()),
                                  style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : AppThemes.textColorLightGrey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }

  String _getCount(SportHallCountModel e) {
    if (widget.title == S.current.sport_tabbar_rolling) {
      switch (widget.model!.lfid) {
        case 1:
          return e.tc.toString();
        case 2:
          return e.lc.toString();
        case 3:
          return e.ec.toString();
        case 4:
          return e.cc.toString();
        case 5:
          return e.oc.toString();
        default:
          return e.lc.toString();
      }
    }  else if (widget.title == S.current.random_text_680) {
      return e.vsc.toString();
    }  else if (widget.title == S.current.sport_tabbar_coming) {
      return e.nc.toString();
    } else if (widget.title == S.current.sport_fav_hot_rolling) {
      return e.cc.toString();
    } else {
      return e.lc.toString();
    }
  }

  String processString(String input) {
    if (input == null || input.isEmpty) {
      return '';
    }

    int totalLength = 0;
    int index = 0;

    String newStr = '';

    for (int i = 0; i < input.length; i++) {
      if (isChinese(input[i])) {
        totalLength += 2;
      } else {
        totalLength++;
      }
    }

    int tempTotle = 0;
    if (totalLength >= 8) {
      for (int i = 0; i < input.length; i++) {
        if (isChinese(input[i])) {
          tempTotle += 2;
          newStr = newStr + input[i];
        } else {
          tempTotle++;
          newStr = newStr + input[i];
        }
        if (tempTotle > 3) {
          break;
        }
      }
      return newStr + '...';
    } else {
      return input;
    }
  }

  bool isChinese(String char) {
    if (char == null || char.isEmpty) {
      return false;
    }

    int firstChar = char.codeUnitAt(0);
    return (firstChar >= 0x4e00 && firstChar <= 0x9fff);
  }

}
