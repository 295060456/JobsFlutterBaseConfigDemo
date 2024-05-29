import 'package:flutter/material.dart';
import 'package:flutter_bet/generated/l10n.dart';
import 'package:flutter_bet/pages/sport/common_model/sport_common_params.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constant/app_themes.dart';
import '../../../constant/app_values.dart';
import '../../../pages/sport/sport_detail/model.dart';
import '../../../services/theme/theme_service.dart';
import '../../../utils/odds_util.dart';
import '../../../utils/string_uril.dart';
import '../custom_sport_odd_type.dart';
import 'custom_sport_odd_change_animation.dart';

class CustomOddStatusWidget extends StatefulWidget {
  OddStatusType statusType;
  final OddCountType type;
  M e;
  SportHandicapApiType handicapStateType; //盘口状态

  CustomOddStatusWidget(this.e, this.type, this.statusType,
      {super.key, required this.handicapStateType});

  @override
  State<CustomOddStatusWidget> createState() => _CustomOddStatusWidgetState();
}

class _CustomOddStatusWidgetState extends State<CustomOddStatusWidget> {
  @override
  void didUpdateWidget(covariant CustomOddStatusWidget oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.e.isChoose != widget.e.isChoose) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // if(widget.e.mls != 1){
    //   widget.statusType = OddStatusType.closed;
    // }

    if (widget.handicapStateType == SportHandicapApiType.closed) {
      widget.statusType = OddStatusType.closed;
    } else if (widget.handicapStateType == SportHandicapApiType.locked) {
      widget.statusType = OddStatusType.locked;
    }
    // widget.statusType = OddStatusType.rolling;

    switch (widget.statusType) {
      // case OddStatusType.closed:
      // case OddStatusType.locked:
      //   return Container(
      //     width: oddWidth(widget.type),
      //     height: AppValues.sportHeight_56.h,
      //     decoration: BoxDecoration(
      //       color: ThemeService().theme.colorScheme.onPrimaryContainer,
      //       borderRadius: BorderRadius.circular(
      //           AppValues.sportRadius_4), // Add rounded corners, 10.0 is the radius
      //     ),
      //     child: Center(
      //       child: FaIcon(
      //         FontAwesomeIcons.lock,
      //         color: AppThemes.textColorSecondary,
      //         size: AppValues.allianceIcon_20.w,
      //       ),
      //     ),
      //   );
      case OddStatusType.settled:
        return Container(
          width: oddWidth(widget.type),
          height: AppValues.sportHeight_56.h,
          decoration: BoxDecoration(
            color: ThemeService().theme.colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(
                AppValues.sportRadius_4), // Add rounded corners, 10.0 is the radius
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: AppValues.sportPadding_6.w, right: AppValues.sportPadding_6.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.e.sn ?? '',
                    overflow: TextOverflow.clip,
                    style: ThemeService().theme.textTheme.bodyMedium!.copyWith(
                        color: AppThemes.textColorWhite.withOpacity(0.3),
                        fontSize: AppValues.fontBodyMediumSize,
                        fontWeight: FontWeight.w500)),
                SizedBox(height: AppValues.sportHeight_6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.current.settled_bet,
                        overflow: TextOverflow.clip,
                        style: ThemeService().theme.textTheme.bodyMedium!.copyWith(
                            color: AppThemes.textColorWhite.withOpacity(0.5),
                            fontSize: AppValues.fontBodyMediumSize,
                            fontWeight: FontWeight.w600)),
                    // CustomSportOddChangeAnimation(isOddsUp: true, isIconVisible: true),
                  ],
                ),
                // Padding(
                //   padding: EdgeInsets.only(left: 10.w),
                //   child: Image.asset(
                //     'assets/images/sport/sport_red.webp',
                //     width: 12.w,
                //     height: 9.h,
                //   ),
                // ),
              ],
            ),
          ),
        );
      default:
        // print('================${widget.e.isChoose}');
        var showData = "";
        var isLock = true;
        if (widget.statusType == OddStatusType.closed) {
          showData = S.current.bet_stop;
        } else if (widget.statusType == OddStatusType.locked) {
          showData = S.current.bet_stop;
        } else {
          showData = OddsUtil().covertOdds(double.tryParse(widget.e.ov ?? '0') ?? 0);
          //不锁
          isLock = false;
        }
        // case OddStatusType.locked:
        return Container(
          width: oddWidth(widget.type),
          height: AppValues.sportHeight_56.h,
          padding: EdgeInsets.only(
              left: AppValues.sportPadding_10.w, right: AppValues.sportPadding_10.w),
          decoration: BoxDecoration(
            color: widget.e.isChoose == true
                ? ThemeService().theme.colorScheme.primary
                : ThemeService().theme.colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(
                AppValues.sportRadius_4), // Add rounded corners, 10.0 is the radius
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Offstage(
                offstage: isLock,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringUtil().truncateString(widget.e.sn ?? '', 10),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: widget.e.isChoose == true
                            ? ThemeService().theme.textTheme.bodyMedium!.copyWith(
                                color: ThemeService().theme.colorScheme.surface,
                                fontSize: AppValues.fontBodyMediumSize,
                                fontWeight: FontWeight.w500)
                            : ThemeService().theme.textTheme.bodyMedium!.copyWith(
                                fontSize: AppValues.fontBodyMediumSize,
                                fontWeight: FontWeight.w500)),
                    SizedBox(height: AppValues.sportHeight_6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          showData,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: widget.e.isChoose == true
                              ? ThemeService().theme.textTheme.bodyMedium!.copyWith(
                                  fontSize: AppValues.fontBodyMediumSize,
                                  fontWeight: FontWeight.w600)
                              : ThemeService().theme.textTheme.bodyMedium!.copyWith(
                                  color: ThemeService().colorScheme.secondary,
                                  fontSize: AppValues.fontBodyMediumSize,
                                  fontWeight: FontWeight.w600),
                        ),
                        // if(widget.e.isChoose == false)
                        if (widget.e.isUp != 2)
                          CustomSportOddChangeAnimation(widget.e,
                              isOddsUp: widget.e.isUp == 1, isIconVisible: false),
                        if (widget.e.btn == S.current.random_text_732) Expanded(child: SizedBox()),
                        if (widget.e.btn == S.current.random_text_732)
                          Text(
                            widget.e.hdp ?? '',
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            style: ThemeService().theme.textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                  fontSize: AppValues.fontBodyMediumSize,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),

              //锁定 状态
              Offstage(
                offstage: !isLock,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringUtil().truncateString(widget.e.sn ?? '', 10),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: ThemeService().textTheme.bodyMedium!.copyWith(
                            fontSize: AppValues.fontBodyMediumSize,
                            fontWeight: FontWeight.w500,
                            // color: AppThemes.onSurfaceColor,
                            color: Colors.white.withOpacity(0.3),
                          ),
                    ),
                    SizedBox(height: AppValues.sportHeight_6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          showData,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: ThemeService().theme.textTheme.bodyMedium!.copyWith(
                                // color: ThemeService().colorScheme.secondary,
                                // color: AppThemes.onSurfaceColor,
                                color: Colors.white.withOpacity(0.5),
                                fontSize: AppValues.fontBodyMediumSize,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
    }
  }

  double oddWidth(OddCountType type) {
    return type == OddCountType.two ? 158.w : 103.w;
  }
}
