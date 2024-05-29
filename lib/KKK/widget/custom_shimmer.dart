import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

import '../constant/app_values.dart';

class CustomShimmer extends StatelessWidget {
  final int size;

  const CustomShimmer({
    super.key,
    this.size = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        decoration: BoxDecoration(
          color: AppThemes.chatRooCardColor,
          borderRadius: BorderRadius.circular(AppValues.smallRadius),
        ),
        margin: const EdgeInsets.symmetric(horizontal: AppValues.defaultPadding,vertical: AppValues.defaultPadding)
            .copyWith(bottom: AppValues.defaultPadding),
        child: Stack(
          children: [
            ListView.builder(
              padding: const EdgeInsets.only(top: AppValues.defaultPadding),
              itemCount: size,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      if (index == 0)
                        SizedBox(
                          height: 40,
                          width: double.infinity,
                          child: Row(
                            children: [
                              const SizedBox(width: 15,),
                              _childShimmerView(),
                              const Expanded(child: Center()),
                              FaIcon(
                                FontAwesomeIcons.angleDown,
                                size: AppValues.allianceIcon_10_45.w,
                              ),
                              const SizedBox(width: 17,),
                            ],
                          ),
                        ),
                      Container(
                        height: 2,
                        color: Colors.white12,
                        margin: EdgeInsets.only(bottom: 15, top: (index == 0)?5:20),
                      ),
                      SizedBox(
                        height: 25,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const SizedBox(width: 15,),
                            _childShimmerView(w: 160),
                            const Expanded(child: Center()),
                            _childShimmerView(w: 30),
                            _childShimmerView(w: 30),
                            const SizedBox(width: 17,),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        width: double.infinity,
                        child: Row(
                          children: [
                            const SizedBox(width: 15,),
                            _childShimmerView(w: 100),
                            const Expanded(child: Center()),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        width: double.infinity,
                        child: Center(
                          child: _childShimmerView(w: 80),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const SizedBox(width: 15,),
                            Expanded(child: _itemChildShimmerView(h: 16)),
                            const SizedBox(width: 10,),
                            Expanded(child: _itemChildShimmerView(h: 16)),
                            const SizedBox(width: 10,),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ));
  }

  _childShimmerView(
      {double w = 140,
        double h = 20,
        double radius = 3,
        double leftMargin = 0,
        double rightMargin = 0}) {
    return Shimmer.fromColors(
        baseColor: AppThemes.chatRooCardColor,
        highlightColor: AppThemes.textColorLightGrey,
        child: Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
              color: AppThemes.chatRooCardColor, borderRadius: BorderRadius.circular(radius)),
          margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
        ));
  }

  _itemChildShimmerView({double h = 20}) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(5)),
      padding: const EdgeInsets.only(left: 15),
      margin: const EdgeInsets.only(top: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           _childShimmerView(w: 80,h: h),
          const SizedBox(height: 4,),
          _childShimmerView(w: 40,h: h),
        ],
      ),
    );
  }
}
