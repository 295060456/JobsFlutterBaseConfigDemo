import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/controllers/global_state_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../pages/sport/model.dart';
import '../../services/theme/theme_service.dart';
import '../tab_bar/custom_tab_bar_with_icon.dart';

class CustomSportTabbar extends StatefulWidget {
  final List<SportTabModel> tabsJson;
  final void Function(int) onTap;
  final int initIndex;
  Color? textColor;

  bool isLogin;
  bool isSport;

  final TabController? tabController;

  CustomSportTabbar(this.tabsJson, this.onTap, this.initIndex, this.isLogin, this.isSport,
      {super.key, this.tabController, this.textColor});

  @override
  State<CustomSportTabbar> createState() => _CustomSportTabbarState();
}

class _CustomSportTabbarState extends State<CustomSportTabbar> {
  List<Tab> tabs = [];

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    tabs = widget.tabsJson.asMap().entries.map((s) {
      var e = s.value;
      var index = s.key;
      if (e.tgn != null && (e.tgn ?? '').isNotEmpty) {
        return Tab(
          child: Text(e.tgn?.replaceAll('/', '-') ?? '',
              style: ThemeService().theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  )),
        );
      } else {
        return Tab(
          child: Center(
            child: Row(
              children: [
                ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    getColor(index,color: AppThemes.iconColor),
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(
                    e.icon.toString(),
                    height: AppValues.sportHeight_14,
                    width: AppValues.sportHeight_14,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  e.name ?? '',
                  style: TextStyle(
                      color: getColor(index, color: widget.textColor ?? AppThemes.iconColor),
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                ),
              ],
            ),
          ),
        );
      }
    }).toList();

    return Padding(
      padding: EdgeInsets.only(
        left: AppValues.sportPadding_12.w,
        right: AppValues.sportPadding_12.w,
      ),
      // padding: EdgeInsets.zero,
      child: Container(
        height: AppValues.sportHeight_54.h,
        decoration: BoxDecoration(
          color: ThemeService().theme.colorScheme.surface, // Set background color
          borderRadius: BorderRadius.circular(
              AppValues.sportRadius_30), // Set the radius of the rounded corners
        ),
        child: tabs.isNotEmpty
            ? DefaultTabController(
                initialIndex: widget.initIndex,
                length: tabs.length,
                child: CustomTabBarWithIcon(
                  tabController: widget.tabController,
                  unselectedLabelStyle: ThemeService()
                      .theme
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                  labelStyle: ThemeService()
                      .theme
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w600),
                  tabs: tabs,
                  backgroundColor: ThemeService().theme.colorScheme.tertiary,
                  radius: AppValues.sportRadius_30,
                  height: AppValues.sportHeight_54.h,
                  buttonMargin: EdgeInsets.all(AppValues.sportHeight_5.h),
                  contentPadding: EdgeInsets.only(
                    left: AppValues.sportWidth_16.w,
                    right: AppValues.sportWidth_16.w,
                  ),
                  onTap: widget.onTap,
                  isSport: widget.isSport,
                  isShowScrollBar: true,
                  isLogin: widget.isLogin,
                ),
              )
            : Container(),
      ),
    );
  }

  getColor(int index, {Color color = Colors.grey}) {
    if (widget.isLogin) {
      return (index == widget.initIndex) ? Colors.white : color;
    } else {
      if (index == 2 || index == 3) {
        return Colors.grey;
      } else {
        return Colors.white;
      }
    }
  }
}
