import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constant/app_themes.dart';
import '../../constant/app_values.dart';
import '../../generated/l10n.dart';
import '../../services/theme/theme_service.dart';

class CustomSportSearch extends StatefulWidget {
  final Function(String) onStringCallback;
  final TextEditingController? controller;
  const CustomSportSearch(this.onStringCallback,this.controller,{super.key});

  @override
  State<CustomSportSearch> createState() => _CustomSportSearchState();
}

class _CustomSportSearchState extends State<CustomSportSearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppValues.sportPadding_12.w,
        right: AppValues.sportPadding_12.w,
      ),
      child: Container(
        height: 44.h,
        decoration: BoxDecoration(
          border: Border.all(color: ThemeService().colorScheme.tertiary, width: 1.0),
          // Add a border
          borderRadius: BorderRadius.zero, // Set border radius to 0
        ),
        child: CupertinoSearchTextField(
          controller: widget.controller,
          style: const TextStyle(
            color: AppThemes.textColorWhite, // Set text color to red
          ),
          backgroundColor: ThemeService().colorScheme.surface,
          borderRadius: BorderRadius.circular(0),
          placeholder: S.current.wallet_search,
          // Use the prefixIcon property to customize the icon.
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: 3),
            child: Icon(
              Icons.search, // You can use any custom icon you want here.
              color: CupertinoColors.systemGrey, // Customize the icon color.
            ),
          ),
          // You can also customize the other properties as needed.
          // onSubmitted: (v)=>widget.onStringCallback(v),
          onChanged: (v)=>widget.onStringCallback(v),
        ),
      ),
    );
  }
}
