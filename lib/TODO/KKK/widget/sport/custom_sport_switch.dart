import 'package:flutter_bet/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constant/app_values.dart';
import '../../services/theme/theme_service.dart';
import '../custom_text.dart';
import '../switch/custom_switch.dart';

class CustomSportSwitch extends StatefulWidget {
  bool isChoose;

  CustomSportSwitch(this.isChoose, {super.key});

  @override
  State<CustomSportSwitch> createState() => _CustomSportSwitchState();
}

class _CustomSportSwitchState extends State<CustomSportSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: AppValues.sportPadding_12.w,
        right: AppValues.sportPadding_12.w,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(AppValues.sportRadius_4)),
        color: ThemeService().colorScheme.surface,
      ),
      height: 44.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomText(
            S.current.random_text_729,
            style: ThemeService().theme.textTheme.bodyMedium!.copyWith(
                color: ThemeService().colorScheme.inverseSurface,
                fontSize: AppValues.fontBodyMediumSize,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(width: AppValues.sportPadding_12.w),
          CustomSwitch(
            value: widget.isChoose,
            onChanged: (newValue) {
              setState(() {
                widget.isChoose = !widget.isChoose;
              });
            },
          ),
          SizedBox(width: AppValues.sportPadding_12.w),
          CustomText(S.current.random_text_736,
              style: ThemeService().theme.textTheme.bodyMedium!.copyWith(
                  color: ThemeService().colorScheme.inverseSurface,
                  fontSize: AppValues.fontBodyMediumSize,
                  fontWeight: FontWeight.w400)),
          SizedBox(width: AppValues.sportPadding_12.w),
        ],
      ),
    );
  }
}
