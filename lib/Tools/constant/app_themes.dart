import 'package:flutter/material.dart';

import '../theme/theme_color.dart';

/// @class : AppThemes
/// @date : 2023/01/06
/// @name : alvin
/// @description : 一些主题色的常量

class AppThemes {
  ///general color name
  static const black = Color(0xFF000000);
  static const milkWhite = Color(0xFFFAFBFD);
  static const blueBayoux = Color(0xff38686A);
  static const bloodRed = Color(0xFFFFBF00);
  static Color greyWithOpacityHalf = Colors.grey.withOpacity(0.5);
  static const lightGray = Color(0xFFA6A6A6);
  static const goldOrange = Color(0xFFFC9300);
  @Deprecated("请使用ThemeService().colorScheme.primary")
  static const skyBlue = Color(0xFF1475E1);
  static const grassGreen = Color(0xFF81B337);
  static const goldYellow = Color(0xFFF9DD9D);
  static const yolkYello = Color(0xFFFFF9E6);
  static const matchGreen = Color(0xFF426729);
  static const deepBlue = Color(0xFF1A2C38);
  static const Color redCard = Color(0xFFCC0000);
  static const Color lineGreen = Color(0xFF304454);

  ///theme color list
  static List<ThemeColor> primaryColors = [
    ThemeColor('默认', skyBlue, 'normalColor'),
    ThemeColor('红色', redCard, 'redColor'),
    ThemeColor('蓝色', skyBlue, 'blueColor'),
    ThemeColor('绿色', grassGreen, 'greenColor'),
  ];

  /// primaryContainer 应用于需要比主容器更少强调的元素比如聊天发送按钮颜色
  static const Color primaryContainer = Color(0xFF00E701);

  /// onPrimaryContainer 适用于位于primaryContainer之上的内容（图标、文本等）
  static const Color onPrimaryContainer = Color(0xFF05080A);

  ///另一种不常见的主题色比primary浅一些
  ///比较少用的一些主题颜色例如赔率Text、气泡、角标等
  static const Color secondaryColor = Color(0xFF4391e7);
  static const Color onSecondaryColor = Color(0xFF333333);

  ///第二种icon的颜色比iconColor浅一点
  static const Color secondaryIconColor = Color(0xFF557086);

  /// 颜色角色留给团队自行决定使用，旨在支持产品中更广泛的颜色表达
  @Deprecated("请使用ThemeService().colorScheme.tertiary")
  static const Color tertiaryColor = Color(0xFF2F4553);
  static const Color onTertiaryColor = Color(0xFFB1BAD3);

  ///Scaffold的默认颜色典型Material应用程序或应用程序内页面的背景颜色
  @Deprecated("请使用ThemeService().theme.scaffoldBackgroundColor")
  static const pageLightBackground = Color(0xFFF7F7FC); //浅色风格
  @Deprecated("请使用ThemeService().theme.scaffoldBackgroundColor")
  static const pageDarkBackground = Color(0xFF1A2C38); //暗黑风格

  ///和主题色primary有视觉区别的颜色
  ///例如TabBar的背景颜色
  @Deprecated("请使用ThemeService().colorScheme.surface")
  static const Color surfaceColor = Color(0xFF0F212E);
  ///TabBar的背景颜色
  static const Color tabBgColor = Color(0xFF2F4554);

  ///和surfaceColor有明显区别的控件颜色
  static const Color onSurfaceColor = Color(0xFFB1BAD3);

  /// surfaceVariant另一种和surface产生区别的背景色，常用于ListView Card
  static const Color surfaceVariant = Color(0xFF213743);

  /// surfaceVariant里面常用的文字颜色
  static const Color onSurfaceVariant = Color(0xFFB1BAD3);

  @Deprecated("请使用ThemeService().colorScheme.error")
  static const Color errorColor = Color(0xFFed4163);
  static const Color onErrorColor = textColorWhite;

  ///主题颜色，app的主要颜色，即整个屏幕和所有控件的主要颜色，首选颜色。
  ///Material默认长按波纹颜色
  static const Color rippleColor = Color(0x33E2E3E8);

  ///阴影颜色
  static const Color colorShadow = Color(0x66E0E6FD);

  ///widget color
  static Color dividerColor = const Color(0xFFF2F4F7).withOpacity(0.5);
  static const Color iconColor = Color(0xFFB1BAD3);
  static const Color widgetColorWhite = Color(0xFFFFFFFF);
  static const Color widgetColorDark = Color(0xFF000000);

  ///text color
  static const Color textColorWhite = Color(0xFFFFFFFF);
  static const Color textColorDark = Color(0xFF000000);
  static const Color textColorSecondary = Color(0xFFB1BAD3);
  static const Color textColorGrey = Color(0xFFA6A6A6);
  static const Color textColorLightGrey = Color(0xFFCCCCCC);
  static const Color hintTextColorWhite = Color(0x80FFFFFF);
  static const Color hintTextColor = Color(0xff57646d);

  ///other
  static const Color countDownIconColor = Color(0xFF105EB5);
  static const Color whiteD5DCEB = Color(0xFFD5DCEB);
  static const Color white566771 = Color(0xFF566771);
  static const Color countDownOverColor = Color(0xFF72ACED);
  static const Color loginSendColor = Color(0xFF05080a);
  static const Color chatRoomButtonColor = Color(0xFF00E701);
  static const Color scoreTextColor = Color(0xFFFF9800);
  static const Color frontStateColor = Color(0xFF1FFF20);
  static const Color reverseStateColor = Color(0xFFE91134);
  static const Color noBettingAllowedColor = Color(0xFF5D0718);
  static const Color chatRooCardColor = Color(0xFF263742);
  static const Color chatRoomOnlineGreenColor = Color(0XFF02E406);
  static const Color sportBetOddsColor = Color(0XFFFF9900);
  static const Color floatViewColor = Color(0XFF071D2A);
  static const Color betSlipItemTextColor = Color(0XFFB8BFD6);

  ///顶部Bar 余额的颜色
  static const Color ffd9d9d9 = Color(0xFFD9D9D9);
  static Color appBarShadowColor = Colors.black.withOpacity(0.6);
  static const Color sportBetOddColor = Color(0xFF4391E7);

  ///odd color
  static const Color oddBackColor = Color(0xFF071824);
  static const Color keyboardTextColor = Color(0xFFFFFFFF);

  ///点缀色
  static const Color greenAccentColor = Color(0xFF008A01);

  static const Color sportWidgetColor = Color(0xFF1D2E3B);

 ///娱乐城 前进后退按钮浅灰色
  static const Color ylclightGreyColor = Color(0xFF5C6777);

  ///与加载 骨架屏 颜色配置
  static const Color preLoadGray = Color(0xFF738299);

  ///轮盘报告背景色
  static const Color rotaryReportColor = Color(0xFF304554);
  ///分享背景色
  static const Color rotaryReportShareColor = Color(0xFF223847);
  static const Color walletRecommend = Color(0xFF00A201);
  ///活动领取状态色
  static const Color activityReceivingState= Color(0xFF4D5D6F);
  ///热门/赠送
  static const Color favorite= Color(0xFFF40000);
  ///活动
  static const Color activity= Color(0xFFD57300);
  ///客服标题
  static const Color csTitle= Color(0xFFCEDBE3);
  ///在线客服
  static const Color csSubtitle= Color(0xFF1A1A1A);
  ///客服描述
  static const Color csDesc= Color(0xFF737376);
  ///钱包输入框提示语颜色
  static const Color walletHintColor= Color(0xFF586E77);
  ///钱包金额背景
  static Color walletAmountBg = Color(0xFF1475E1).withOpacity(0.2);


}
