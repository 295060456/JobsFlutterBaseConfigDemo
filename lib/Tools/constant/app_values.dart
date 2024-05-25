import 'dart:io';
import 'package:flutter_bet/services/branch/branch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_urls_values.dart';

abstract class AppValues {
  ///**********: app values : **********
  static const String registerPolicyUrl = 'https://www.baidu.com/';

  ///**********: Branch values : **********
  static Branch defaultBranch = AppUrlsValues.envConfig;

  ///**********: radius values : **********
  static const double defaultRadius = 12;
  static const double radiusZero = 0;
  static const double smallRadius = 4.0;
  static const double radius_2 = 2;
  static const double radius_6 = 6;
  static const double radius_12 = 12;
  static const double largeRadius = 24;
  static const double roundedButtonRadius = 4;
  static const double extraLargeRadius = 36;

  ///**********: padding values : **********
  ///值：12
  static const double defaultPadding = 12;
  static const double paddingZero = 0;
  static const double smallPadding = 4;
  static const double halfPadding = 6;
  static const double extraSmallPadding = 6;
  static const double largePadding = 20;
  static const double extraLargePadding = 32;
  static const double padding_4 = 4;
  static const double padding_2 = 2;
  static const double padding_3 = 3;
  static const double padding_6 = 6;
  static const double padding_8 = 8;
  static const double padding_10 = 10;
  static const double padding_14 = 14;
  static const double padding_16 = 16;
  static const double padding_18 = 18;
  static const double buttonVerticalPadding = 12;

  ///**********: margin values : **********
  ///值：16
  static const double defaultMargin = 16;
  static const double marginZero = 0;
  static const double smallMargin = 4;
  static const double extraSmallMargin = 6;
  static const double halfMargin = 8;
  static const double largeMargin = 20;
  static const double margin_2 = 2;
  static const double margin_4 = 4;
  static const double margin_6 = 6;
  static const double margin_8 = 8;
  static const double margin_10 = 10;
  static const double margin_12 = 12;
  static const double margin_14 = 14;
  static const double margin_18 = 18;
  static const double margin_20 = 20;
  static const double margin_24 = 24;
  static const double margin_30 = 30;
  static const double margin_32 = 32;
  static const double margin_40 = 40;
  static const double extraLargeMargin = 36;
  static const double marginBelowVerticalLine = 64;
  static const double extraLargeSpacing = 96;

  /// 适配H5
  static double barTopHeight = Platform.isIOS ? 112 : 90.w;
  static double barTopHeightMargin = barTopHeight + margin_12;

  static double barBottomHeight = 75;
  static double barBottomHeightMargin = barBottomHeight + margin_12;

  //应对弹窗 无留边距
  static double barTopBottomHeight = barTopHeight + barBottomHeight;

  //应对弹窗 留边距
  static double barTopBottomHeightMargin = barTopHeightMargin + barBottomHeightMargin;

  ///**********: gap values : **********

  ///**********: button values : **********
  /// 默认高度
  static const double defaultButtonHeight = 44;
  static const double defaultTextHeight = 40;

  /// 默认最小宽度
  static const double defaultButtonMiniWidth = 84;

  /// 默认水平间距（CustomSmallMainButton使用）
  static const double defaultButtonHorizontalPadding = 6;

  /// 默认垂直间距（CustomSmallMainButton使用）
  static const double defaultButtonVerticalPadding = 8;
  static const double defaultBorderWith = 2;

  ///

  ///**********: elevation values : **********
  static const double elevation = 16;
  static const double smallElevation = 8;
  static const double extraSmallElevation = 4;
  static const double largeElevation = 24;

  ///**********: Image Sizes : **********
  static const double circularImageDefaultSize = 90;
  static const double circularImageSize_30 = 30;
  static const double circularImageDefaultBorderSize = 0;
  static const double circularImageDefaultElevation = 0;
  static const double momentThumbnailDefaultSize = 80;
  static const double momentSmallThumbnailDefaultSize = 32;
  static const double collectionThumbnailDefaultSize = 150;
  static const double defaultViewPortFraction = 0.9;
  static const int defaultAnimationDuration = 300;
  static const double listBottomEmptySpace = 20;
  static const double maxButtonWidth = 496;
  static const double stackedImageDefaultBorderSize = 4;
  static const double stackedImageDefaultSpaceFactor = 0.4;
  static const double stackedImageDefaultSize = 30;

  ///**********: Icon Sizes : **********
  static const double iconDefaultSize = 18;
  static const double emoticonDefaultSize = 22;
  static const double iconSize_20 = 20;
  static const double iconSize_22 = 22;
  static const double iconSize_18 = 18;
  static const double iconSmallSize = 14;
  static const double iconSmallerSize = 12;
  static const double iconSize_14 = 14;
  static const double iconSize_28 = 28;
  static const double iconLargeSize = 36;
  static const double iconExtraLargerSize = 96;
  static const double appBarIconSize = 32;

  ///**********: Custom AppBar Sizes : **********
  static const double customAppBarSize = 144.0;
  static const double collapsedAppBarSize = 70.0;
  static const double customAppBarElevation = 4.0;

  ///**********: Pagination values : **********
  static const int defaultPageSize = 20;
  static const int defaultPageNumber = 1;

  ///**********: Time values : **********
  static const int defaultDebounceTimeInMilliSeconds = 1000;
  static const int defaultThrottleTimeInMilliSeconds = 500;

  ///*********** Font Size value: ********
  static const double fontBodyLargeSize = 18;
  static const double fontBodyMediumSize = 14;
  static const double fontBodySmallSize = 12;

  static const double fontTileLargeSize = 20;
  static const double fontTitleMediumSize = 18;
  static const double fontTileSmallSize = 16;

  static const double fontHeadlineSmallSize = 24;

  static const double fontLabelLargeSize = 14;
  static const double fontLabelMediumSize = 12;
  static const double fontLabelSmallSize = 10;

  ///**********: Extra : **********
  static const double fullViewPort = 1;
  static const double indicatorDefaultSize = 8;
  static const double indicatorShadowBlurRadius = 1;
  static const double indicatorShadowSpreadRadius = 0;
  static const double appbarActionRippleRadius = 50;
  static const double activeIndicatorSize = 8;
  static const double inactiveIndicatorSize = 10;
  static const double datePickerHeightOnIos = 270;
  static const int maxCharacterCountOfQuote = 108;
  static const double barrierColorOpacity = 0.4;

  static const double height_16 = 16;
  static const double width_12 = 12;
  static const double height_12 = 12;

  ///**********: Alliance : **********
  static const double allianceHeight_1 = 1;
  static const double allianceHeight_4 = 4;
  static const double allianceHeight_8 = 8;
  static const double allianceHeight_13 = 13;
  static const double allianceHeight_18 = 18;
  static const double allianceHeight_20 = 20;
  static const double allianceHeight_25 = 25;
  static const double allianceHeight_30 = 30;
  static const double allianceHeight_36 = 36;
  static const double allianceHeight_42 = 42;
  static const double allianceHeight_44 = 44;
  static const double allianceHeight_54 = 54;
  static const double allianceHeight_62 = 62;
  static const double allianceHeight_91 = 91;
  static const double allianceHeight_153 = 153;
  static const double allianceHeight_158 = 158;
  static const double allianceHeight_190 = 190;
  static const double allianceHeight_216 = 216;

  static const double allianceWidth_6 = 6;
  static const double allianceWidth_118 = 118;
  static const double allianceWidth_124 = 124;
  static const double allianceWidth_14_5 = 14.5;
  static const double allianceWidth_152 = 152;
  static const double allianceWidth_153 = 153;
  static const double allianceWidth_216 = 216;
  static const double allianceWidth_303 = 303;

  static const double alliancePadding_20 = 20;
  static const double alliancePadding_12 = 12;
  static const double alliancePadding_10 = 10;

  static const double allianceIcon_9_41 = 9.41;
  static const double allianceIcon_10_45 = 10.45;
  static const double allianceIcon_20 = 20;

  ///**********: Sport : **********
  static const double sportHeight_1 = 1;
  static const double sportHeight_2 = 2;
  static const double sportHeight_3 = 3;
  static const double sportHeight_4 = 4;
  static const double sportHeight_5 = 5;
  static const double sportHeight_6 = 6;
  static const double sportHeight_6_5 = 6.5;
  static const double sportHeight_7 = 7;
  static const double sportHeight_8 = 8;
  static const double sportHeight_9 = 9;
  static const double sportHeight_12 = 12;
  static const double sportHeight_13 = 13;
  static const double sportHeight_14 = 14;
  static const double sportHeight_16 = 16;
  static const double sportHeight_18 = 18;
  static const double sportHeight_19 = 19;
  static const double sportHeight_20 = 20;
  static const double sportHeight_24 = 24;
  static const double sportHeight_25 = 25;
  static const double sportHeight_28 = 28;
  static const double sportHeight_30 = 30;
  static const double sportHeight_32 = 32;
  static const double sportHeight_36 = 36;
  static const double sportHeight_42 = 42;
  static const double sportHeight_44 = 44;
  static const double sportHeight_50 = 50;
  static const double sportHeight_54 = 54;
  static const double sportHeight_55 = 55;
  static const double sportHeight_56 = 56;
  static const double sportHeight_60 = 60;
  static const double sportHeight_62 = 62;
  static const double sportHeight_63 = 63;
  static const double sportHeight_91 = 91;
  static const double sportHeight_101 = 101;
  static const double sportHeight_102 = 102;
  static const double sportHeight_104 = 104;
  static const double sportHeight_107 = 107;
  static const double sportHeight_108 = 108;
  static const double sportHeight_153 = 153;
  static const double sportHeight_155 = 155;
  static const double sportHeight_158 = 158;
  static const double sportHeight_174 = 174;
  static const double sportHeight_175 = 175;
  static const double sportHeight_188 = 188;
  static const double sportHeight_190 = 190;
  static const double sportHeight_200 = 200;
  static const double sportHeight_216 = 216;
  static const double sportHeight_233 = 233;

  static const double sportWidth_4 = 4;
  static const double sportWidth_5 = 5;
  static const double sportWidth_6 = 6;
  static const double sportWidth_8 = 8;
  static const double sportWidth_10 = 10;
  static const double sportWidth_11 = 11;
  static const double sportWidth_14_5 = 14.5;
  static const double sportWidth_16 = 16;
  static const double sportWidth_20 = 20;
  static const double sportWidth_22 = 22;
  static const double sportWidth_28 = 28;
  static const double sportWidth_30 = 30;
  static const double sportWidth_32 = 32;
  static const double sportWidth_40 = 40;
  static const double sportWidth_44 = 44;
  static const double sportWidth_48 = 48;
  static const double sportWidth_54 = 54;
  static const double sportWidth_80 = 80;
  static const double sportWidth_103 = 103;
  static const double sportWidth_118 = 118;
  static const double sportWidth_124 = 124;
  static const double sportWidth_153 = 153;
  static const double sportWidth_158 = 158;
  static const double sportWidth_216 = 216;
  static const double sportWidth_303 = 303;
  static const double sportWidth_320 = 320;
  static const double sportWidth_351 = 351;

  static const double sportPadding_4 = 4;
  static const double sportPadding_5 = 5;
  static const double sportPadding_6 = 6;
  static const double sportPadding_8 = 8;
  static const double sportPadding_10 = 10;
  static const double sportPadding_11 = 11;
  static const double sportPadding_12 = 12;
  static const double sportPadding_16 = 16;
  static const double sportPadding_20 = 20;
  static const double sportPadding_24 = 24;
  static const double sportPadding_28 = 28;

  static const double sportIcon_9_41 = 9.41;
  static const double sportIcon_10 = 10;
  static const double sportIcon_10_45 = 10.45;
  static const double sportIcon_12 = 12;
  static const double sportIcon_14 = 14;
  static const double sportIcon_16 = 16;
  static const double sportIcon_18 = 18;
  static const double sportIcon_30 = 30;
  static const double sportIcon_32 = 32;
  static const double sportIcon_112 = 112;

  static const double sportRadius_2 = 2;
  static const double sportRadius_4 = 4;
  static const double sportRadius_8 = 8;
  static const double sportRadius_10 = 10;
  static const double sportRadius_16 = 16;
  static const double sportRadius_21 = 21;
  static const double sportRadius_22 = 22;
  static const double sportRadius_23 = 23;
  static const double sportRadius_30 = 30;
}
