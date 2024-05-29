import 'package:flutter/material.dart';
import 'package:flutter_bet/app/modules/restricted/bindings/restricted_binding.dart';
import 'package:flutter_bet/app/modules/restricted/views/restricted_view.dart';
import 'package:flutter_bet/app/modules/vaultDescriptions/views/vault_descriptions_view.dart';
import 'package:flutter_bet/app/modules/wallet/bindings/wallet_binding.dart';
import 'package:flutter_bet/middleware/auth_middleware.dart';
import 'package:flutter_bet/pages/alliance/index/binding.dart';
import 'package:flutter_bet/pages/bet_list/bet_list_view.dart';
import 'package:flutter_bet/pages/chat_room/index/binding.dart';
import 'package:flutter_bet/pages/chat_room/index/view.dart';
import 'package:flutter_bet/pages/find/YulechengCategoryPage/binding.dart';
import 'package:flutter_bet/pages/find/YulechengCategoryPage/index.dart';
import 'package:flutter_bet/pages/find/binding.dart';
import 'package:flutter_bet/pages/find/view.dart';
import 'package:flutter_bet/pages/find/yulechengtouzhurank/index.dart';
import 'package:flutter_bet/pages/front/front_binding.dart';
import 'package:flutter_bet/pages/front/front_view.dart';
import 'package:flutter_bet/pages/home/home_binding.dart';
import 'package:flutter_bet/pages/home/home_view.dart';
import 'package:flutter_bet/pages/main/binding.dart';
import 'package:flutter_bet/pages/main/view.dart';
import 'package:flutter_bet/pages/match/detail/binding.dart';
import 'package:flutter_bet/pages/match/detail/view.dart';
import 'package:flutter_bet/pages/notifs/binding.dart';
import 'package:flutter_bet/pages/notifs/view.dart';
import 'package:flutter_bet/pages/personal_center/data_count/data_count_view.dart';
import 'package:flutter_bet/pages/personal_center/offers/bindings.dart';
import 'package:flutter_bet/pages/personal_center/offers/view.dart';
import 'package:flutter_bet/pages/personal_center/transactions/index/binding.dart';
import 'package:flutter_bet/pages/personal_center/transactions/index/view.dart';
import 'package:flutter_bet/pages/personal_center/vip/binding.dart';
import 'package:flutter_bet/pages/personal_center/vip/view.dart';
import 'package:flutter_bet/pages/personal_center/vip/vip_fanshui_details/binding.dart';
import 'package:flutter_bet/pages/personal_center/vip/vip_fanshui_details/view.dart';
import 'package:flutter_bet/pages/sport//binding.dart';
import 'package:flutter_bet/pages/sport/sport_bet/view.dart';
import 'package:flutter_bet/pages/sport/sport_favorite/view.dart';
import 'package:flutter_bet/pages/sport/sport_side/binding.dart';
import 'package:flutter_bet/pages/sport/sport_side/view.dart';
import 'package:flutter_bet/pages/sport/view.dart';
import 'package:flutter_bet/pages/mine/binding.dart';
import 'package:flutter_bet/pages/mine/view.dart';
import 'package:flutter_bet/pages/splash/binding.dart';
import 'package:flutter_bet/pages/splash/view.dart';
import 'package:flutter_bet/pages/test/button/binding.dart';
import 'package:flutter_bet/pages/test/button/view.dart';
import 'package:flutter_bet/pages/test/color/binding.dart';
import 'package:flutter_bet/pages/test/color/view.dart';
import 'package:flutter_bet/pages/test/custom_state/binding.dart';
import 'package:flutter_bet/pages/test/custom_state/view.dart';
import 'package:flutter_bet/pages/test/expansion/expansion_binding.dart';
import 'package:flutter_bet/pages/test/hud/binding.dart';
import 'package:flutter_bet/pages/test/hud/view.dart';
import 'package:flutter_bet/pages/test/index/binding.dart';
import 'package:flutter_bet/pages/test/index/view.dart';
import 'package:flutter_bet/pages/test/keybord/binding.dart';
import 'package:flutter_bet/pages/test/keybord/view.dart';
import 'package:flutter_bet/pages/test/life_cycle/binding.dart';
import 'package:flutter_bet/pages/test/life_cycle/view.dart';
import 'package:flutter_bet/pages/test/need_login/binding.dart';
import 'package:flutter_bet/pages/test/need_login/view.dart';
import 'package:flutter_bet/pages/test/other_widget/binding.dart';
import 'package:flutter_bet/pages/test/other_widget/view.dart';
import 'package:flutter_bet/pages/test/refresh/binding.dart';
import 'package:flutter_bet/pages/test/refresh/view.dart';
import 'package:flutter_bet/pages/test/snack_bar/binding.dart';
import 'package:flutter_bet/pages/test/snack_bar/view.dart';
import 'package:flutter_bet/pages/test/state/binding.dart';
import 'package:flutter_bet/pages/test/state/view.dart';
import 'package:flutter_bet/pages/test/tabbar/tabbar_binding.dart';
import 'package:flutter_bet/pages/test/tabbar/tabbar_view.dart';
import 'package:flutter_bet/pages/test/text/binding.dart';
import 'package:flutter_bet/pages/test/text/view.dart';
import 'package:flutter_bet/pages/betting/betting_binding.dart';
import 'package:flutter_bet/pages/betting/betting_view.dart';
import 'package:flutter_bet/pages/web_browser/binding.dart';
import 'package:flutter_bet/pages/web_browser/view.dart';
import 'package:get/get.dart';

import '../app/modules/FiatPaymentDetails/bindings/fiat_payment_details_binding.dart';
import '../app/modules/FiatPaymentDetails/views/fiat_payment_details_view.dart';
import '../app/modules/binding_bank_card/bindings/binding_bank_card_binding.dart';
import '../app/modules/binding_bank_card/views/binding_bank_card_view.dart';
import '../app/modules/binding_pix/bindings/binding_pix_binding.dart';
import '../app/modules/binding_pix/views/binding_pix_view.dart';
import '../app/modules/binding_virtual_address/bindings/binding_virtual_address_binding.dart';
import '../app/modules/binding_virtual_address/views/binding_virtual_address_view.dart';
import '../app/modules/commission_conversion/bindings/commission_conversion_binding.dart';
import '../app/modules/commission_conversion/views/commission_conversion_view.dart';
import '../app/modules/commission_deposit_withdrawal/bindings/commission_deposit_withdrawal_binding.dart';
import '../app/modules/commission_deposit_withdrawal/views/commission_deposit_withdrawal_view.dart';
import '../app/modules/commission_wallet/bindings/commission_wallet_binding.dart';
import '../app/modules/commission_wallet/views/commission_wallet_view.dart';
import '../app/modules/csHome/bindings/cs_home_binding.dart';
import '../app/modules/csHome/controllers/cs_home_controller.dart';
import '../app/modules/csHome/views/cs_home_view.dart';
import '../app/modules/csHome/views/cs_webview_view.dart';
import '../app/modules/redPacket/bindings/red_packet_binding.dart';
import '../app/modules/redPacket/views/red_packet_view.dart';
import '../app/modules/rotary/bindings/rotary_binding.dart';
import '../app/modules/rotary/views/rotary_view.dart';
import '../app/modules/statistical_data/bindings/statistical_data_binding.dart';
import '../app/modules/statistical_data/views/statistical_data_view.dart';
import '../app/modules/vault/bindings/vault_binding.dart';
import '../app/modules/vault/views/vault_view.dart';
import '../app/modules/vaultDescriptions/bindings/vault_descriptions_binding.dart';
import '../app/modules/virtual_payment_details/bindings/virtual_payment_details_binding.dart';
import '../app/modules/virtual_payment_details/views/virtual_payment_details_view.dart';
import '../app/modules/wallet/views/wallet_view.dart';
import '../pages/account/login/binding.dart';
import '../pages/account/login/view.dart';
import '../pages/account/register/binding.dart';
import '../pages/account/register/view.dart';
import '../pages/activity/activity_cash_back/index.dart';
import '../pages/activity/activity_custom/index.dart';
import '../pages/activity/activity_promotion/activity_promotion_binding.dart';
import '../pages/activity/activity_promotion/activity_promotion_view.dart';
import '../pages/activity/all_promotions/all_promotions_binding.dart';
import '../pages/activity/all_promotions/all_promotions_view.dart';
import '../pages/activity/single_promontions/single_promotions_binding.dart';
import '../pages/activity/single_promontions/single_promotions_view.dart';
import '../pages/alliance/index/view.dart';
import '../pages/alliance_plan/agent_level/agent_level_binding.dart';
import '../pages/alliance_plan/agent_level/agent_level_view.dart';
import '../pages/alliance_plan/alliance_plan_binding.dart';
import '../pages/alliance_plan/alliance_plan_view.dart';
import '../pages/alliance_plan/alliance_tabbarview_test.dart';
import '../pages/alliance_plan/commission_history/commission_history_binding.dart';
import '../pages/alliance_plan/commission_history/commission_history_view.dart';
import '../pages/alliance_plan/commission_receive/commission_receive_binding.dart';
import '../pages/alliance_plan/commission_receive/commission_receive_view.dart';
import '../pages/bet_list/bet_list_binding.dart';
import '../pages/betting/both/betting_both_binding.dart';
import '../pages/betting/both/betting_both_view.dart';
import '../pages/personal_center/about_us/widgets/responsible_for_gambling/index.dart';
import '../pages/personal_center/data_count/data_count_binding.dart';
import '../pages/personal_center/vip_club/vip_club_binding.dart';
import '../pages/personal_center/vip_club/vip_club_view.dart';
import '../pages/personal_center/about_us/index.dart';
import '../pages/setup/index/binding.dart';
import '../pages/setup/index/view.dart';
import '../pages/sport/sport_bet/binding.dart';
import '../pages/sport/sport_champion_detail/binding.dart';
import '../pages/sport/sport_champion_detail/view.dart';
import '../pages/sport/sport_detail/binding.dart';
import '../pages/sport/sport_detail/view.dart';
import '../pages/sport/sport_event/sport_event_binding.dart';
import '../pages/sport/sport_event/sport_event_view.dart';
import '../pages/sport/sport_favorite/binding.dart';
import '../pages/test/expansion/expansion_view.dart';
import '../pages/find/yulecheng_details/index.dart';

/// @class : Routes
/// @name : alvin
/// @description :页面管理
abstract class Routes {
  ///入口模块
  static const String splashPage = '/splash';

  ///tabber模块
  static const String mainPage = '/main';

  /// 其他方式登录
  static const String login3rdPage = "/login3rd";

  ///通过输入验证码登陆
  static const String loginByCodePage = '/login/input_code';

  ///入口模块
  static const String msgPage = '/msg';

  ///消息
  static const String notifsPage = '/notifs';

  ///主页
  static const String homePage = '/home';

  ///webView
  static const String webViewPage = '/webView';

  ///我的
  static const String minePage = '/mine';

  ///比赛
  static const String matchPage = '/match';

  ///发现
  static const String findPage = '/find';

  ///动弹
  static const String topicPage = '/topic';

  ///动弹
  static const String matchDetailPage = '/match/detail';

  ///测试CustomButton
  static const String testButtonPage = '/test/button';

  ///测试状态页面
  static const String testStatePage = '/test/state';

  ///测试自定义状态页面
  static const String testCustomStatePage = '/test/custom_state';

  ///测试生命周期
  static const String testLifeCyclePage = '/test/life_cycle';

  ///测试生命周期
  static const String testHUDPage = '/test/hud';

  ///测试拦截器
  static const String needLoginPage = '/need/login';

  ///测试文字
  static const String testTextPage = '/test/text';

  ///测试调色板
  static const String testColorPage = '/test/color';

  ///测试调色板
  static const String testTabbarPage = '/test/tabbar';

  ///测试snack_bar
  static const String testSnackBarPage = '/test/snack_bar';

  ///测试刷新组件
  static const testRefreshPage = '/test/refresh/';

  ///测试其它widget
  static const testOtherPage = '/test/other/widget';

  ///测试其它widget
  static const expansionPage = '/test/other/expansion';

  ///测试键盘
  static const testKeyboardPage = '/test/keyboard';

  ///测试首页
  static const testIndexPage = '/test/index/';

  // 娱乐城模块
  static const yulechengDetailPage = '/find/yulechengDetails/';

  // 娱乐城模块
  static const yulechengCategoryPage = '/find/yulechengCategory/';

  // 娱乐城排行版

  static const yulechengRankPage = '/find/yulechengRankPage/';

  // 联盟计划
  static const lianMengJiHuaPage = '/AllianceDtailsPage';

  ///聊天室
  static const chatRoomPage = '/chatRoom';

  /// 首页
  static const frontPage = '/frontPage';

  /// 体育投注记录
  static const betListPage = '/betListPage';

  /// 首页浏览 菜单页的 我的投注
  static const browseMenuMyBetting = '/browseMenuMyBetting';

  static const sideSportList = '/sideSportList';

  static const sport_hall = '/sport_hall';
  static const sport_mybet = '/sport_mybet';
  static const sport_collection = '/sport_collection';
  static const sport_rolling = '/sport_rolling';
  static const sport_coming = '/sport_coming';
  static const sport_detail = '/sport_detail';
  static const sport_champion_detail = '/sport_champion_detail';
  static const sport_side = '/sport_side';
  static const sport_event_detail = '/sport_event_detail'; //体育赛事明细：包括即将开赛盘口、冠军投注、全部[足球、篮球等等]
  static const loginPage = '/login_page';
  static const registerPage = '/register_page';
  static const setupPage = '/setup_page';

  /*=================个人中心 路由别名=================*/
  static const personalWallet = '/personal_wallet'; //个人中心-钱包
  static const personalBankCard = '/personal_bankcard';
  static const personalPix = '/personal_pix';
  static const personalAddress = '/personal_address';
  static const personalVault = '/personal_vault'; //个人中心-保险库
  static const personalVip = '/personal_vip'; //个人中心-Vip
  static const vipFanshuiPage = '/personal_vipFanshui'; //个人中心-Vip-返水

  static const personalVipRecord = '/personal_vip_record';
  static const fiatCurrencyDetails = '/fiat_currency_details';
  static const virtualDetails = '/virtual_currency_details';
  static const commissionWallet = '/commission_walletView';
  static const commissionConversionView = '/commission_conversionView';
  static const commissionDepositWithDrawalView = '/commissionDepositWithDrawalView';
  static const STATISTICAL_DATA = '/statistical-data';
  static const vaultDescriptionsView = '/vault_descriptions_view';

  static const personalAlliancePlan = '/personal_alliance_plan'; //个人中心-联盟计划
  static const personalDataCount = '/personal_data_count'; //个人中心-数据统计
  static const personalTransaction = '/personal_transaction'; //个人中心-交易记录
  static const personalSportBetting = '/personal_sport_betting'; //个人中心-体育投注
  static const personalSetting = '/personal_setting'; //个人中心-设置
  static const personalResponsible = '/personal_responsible'; //个人中心-负责任博彩
  static const personalDiscount = '/personal_discount'; //个人中心-优惠兑换
  static const personalOnlineSupport = '/personal_Online_support'; //个人中心-在线支持
  static const personalLoginOut = '/personal_login_out'; //个人中心-退出登陆
  static const personalAboutUs = '/personal_about_us'; //个人中心-关于我们

  /*====个人中心 二级模块别名====*/
  static const personalAgentLevel = '/personal_agent_level'; //联盟计划-点击头像-代理等级
  static const personalCommissionReceive = '/personal_commission_receive'; //联盟计划-领取佣金
  static const personalCommissionHistory = '/personal_commission_history'; //联盟计划-佣金历史
  static const personalVipClub = '/personal_vip_club'; //个人中心-vip俱乐部
  /*=================个人中心 路由别名 end=================*/

  /*====home 菜单模块别名 activity 活动香港 ===============*/
  static const homeAllPromotions = '/home_all_promotions'; // 促销活动，查看全部
  static const homeSinglePromotions = '/home_single_promotions'; // 促销活动，独立活动列表、娱乐城、体育
  static const activityPromotions = '/activity_promotions'; //推广活动界面
  static const rotary = '/rotary'; // 转盘
  static const cashback = '/cash_back'; // 返现
  static const customActivity = '/custom_activity'; // 自定义活动
  static const csHome = '/csHome';
  static const csWebView = '/csWebView';
  static const redPacket = '/red-packet';

  static const RESTRICTED = '/restricted';

  ///页面合集
  static final routePage = [
    GetPage(
        name: splashPage,
        page: () => SplashPage(),
        binding: SplashBinding(),
        transition: Transition.noTransition),
    GetPage(name: webViewPage, page: () => WebBrowserPage(), binding: WebBrowserBinding()),
    GetPage(name: msgPage, page: () => MessagePage(), binding: MessageBinding()),
    GetPage(name: notifsPage, page: () => NotifsPage(), binding: NotifsBinding()),
    GetPage(name: minePage, page: () => MinePage(), binding: MineBinding()),
    GetPage(
        name: loginPage,
        page: () => LoginPage(),
        binding: LoginBinding(),
        transition: Transition.downToUp),
    GetPage(
        name: registerPage,
        page: () => RegisterPage(),
        binding: RegisterBinding(),
        transition: Transition.downToUp),
    GetPage(
        name: mainPage,
        page: () => MainPage(),
        binding: MainBinding(),
        transition: Transition.noTransition),
    GetPage(
      name: findPage,
      page: () => GamePage(),
      binding: FindBinding(),
    ),
    GetPage(
      name: homePage,
      page: () => HomeMenuPage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: topicPage,
      page: () => BettingPage(),
      binding: BettingBinding(),
    ),
    GetPage(
      name: matchDetailPage,
      page: () => MatchDetailPage(),
      binding: MatchDetailBinding(),
    ),
    GetPage(
      name: testButtonPage,
      page: () => TestButtonPage(),
      binding: TestButtonBinding(),
    ),
    GetPage(
      name: testStatePage,
      page: () => TestStatePage(),
      binding: TestStateBinding(),
    ),
    GetPage(
      name: testCustomStatePage,
      page: () => TestCustomStatePage(),
      binding: TestCustomStateBinding(),
    ),
    GetPage(
      name: testLifeCyclePage,
      page: () => TestLifeCyclePage(),
      binding: TestLifeCycleBinding(),
    ),
    GetPage(
      name: testHUDPage,
      page: () => TestHUDPage(),
      binding: TestHUDBinding(),
    ),
    GetPage(
      name: needLoginPage,
      page: () => NeedLoginPage(),
      binding: NeedLoginBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: testTextPage,
      page: () => TestTextPage(),
      binding: TestTextBinding(),
    ),
    GetPage(
      name: testColorPage,
      page: () => TestColorPage(),
      binding: TestColorBinding(),
    ),
    GetPage(
      name: testTabbarPage,
      page: () => TabbarPage(),
      binding: TabbarBinding(),
    ),
    GetPage(
      name: testSnackBarPage,
      page: () => TestSnackBarPage(),
      binding: TestSnackBarBinding(),
    ),
    GetPage(
      name: testOtherPage,
      page: () => TestOtherPage(),
      binding: TestOtherBinding(),
    ),
    GetPage(
      name: testRefreshPage,
      page: () => TestRefreshPage(),
      binding: TestRefreshBinding(),
    ),
    GetPage(
      name: expansionPage,
      page: () => ExpansionPage(),
      binding: ExpansionBinding(),
    ),
    GetPage(
      name: testIndexPage,
      page: () => TestPage(),
      binding: TestBinding(),
    ),

    GetPage(
      name: yulechengDetailPage,
      page: () => YulechenggamedetailsPage(),
      binding: YuLeChengDetailsBinding(),
    ), // 娱乐城详情页
    GetPage(
      name: yulechengCategoryPage,
      page: () => YulechengcategorypagePage(),
      binding: YulechengcategorypageBinding(),
    ), // 娱乐城详情页
    // GetPage(
    //   name: yulechengRankPage,
    //   page: () => YulechengtouzhurankPage(),
    //   binding: YulechengtouzhurankPageBinding(),
    // ),
    GetPage(
      name: Routes.lianMengJiHuaPage,
      page: () => AlliancePage(),
      binding: AllianceBinding(),
    ),
    GetPage(
      name: chatRoomPage,
      page: () => ChatRoomPage(),
      binding: ChatRoomBinding(),
    ),
    GetPage(
      name: testKeyboardPage,
      page: () => TestKeyboardPage(),
      binding: TestKeyboardBinding(),
    ),
    GetPage(
      name: frontPage,
      page: () => FrontPage(),
      binding: FrontBinding(),
    ),
    GetPage(
      name: betListPage,
      page: () => BetListPage(),
      binding: BetListBinding(),
    ),

    GetPage(
      name: sport_mybet,
      page: () => SportBetWidget(),
      binding: SportBetBinding(),
    ),
    GetPage(
      name: sport_collection,
      page: () => SportFavoriteWidget(),
      binding: SportFavoriteBinding(),
    ),

    GetPage(
      name: sport_detail,
      page: () => SportDetailPage(),
      binding: SportDetailBinding(),
    ),
    GetPage(
      name: sport_champion_detail,
      page: () => SportChampionDetailPage(),
      binding: Sport_champion_detailBinding(),
    ),
    GetPage(
      name: sport_event_detail,
      page: () => SportEventPage(),
      binding: SportEventBinding(),
    ),

    GetPage(
      name: setupPage,
      page: () => SetupPage(),
      binding: SetupBinding(),
    ),

    GetPage(
      name: sport_side,
      page: () => SportSidePage(),
      binding: SportSideBinding(),
    ),

    /*=================个人中心 路由区域=================*/
    GetPage(
      name: personalWallet,
      page: () => WalletView(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: personalBankCard,
      page: () => BindingBankCardView(),
      binding: BindingBankCardBinding(),
    ),
    GetPage(
      name: personalPix,
      page: () => const BindingPixView(),
      binding: BindingPixBinding(),
    ),
    GetPage(
      name: personalAddress,
      page: () => const BindingVirtualAddressView(),
      binding: BindingVirtualAddressBinding(),
    ),
    GetPage(
      name: personalVault,
      page: () => const VaultView(),
      binding: VaultBinding(),
    ),

    GetPage(
      name: commissionWallet,
      page: () => const CommissionWalletView(),
      binding: CommissionWalletBinding(),
    ),
    GetPage(
      name: commissionConversionView,
      page: () => CommissionConversionView(),
      binding: CommissionConversionBinding(),
    ),
    GetPage(
      name: commissionDepositWithDrawalView,
      page: () => const CommissionDepositWithdrawalView(),
      binding: CommissionDepositWithdrawalBinding(),
    ),
    GetPage(
      name: STATISTICAL_DATA,
      page: () => const StatisticalDataView(),
      binding: StatisticalDataBinding(),
    ),
    GetPage(
      name: vaultDescriptionsView,
      page: () => VaultDescriptionsView(),
      binding: VaultDescriptionsBinding(),
    ),

    ///个人中心-VIP
    GetPage(
      name: personalVip,
      page: () => VipHomePage(),
      binding: VipHomeBinding(),
    ),
    // VIP里的返水
    GetPage(
      name: vipFanshuiPage,
      page: () => VipLingQuFanshuiPage(),
      binding: VipFanshuiLingQuBinding(),
    ),
    // GetPage(
    //   name: personalVipRecord,
    //   page: () => VipLingQuRecordPage(),
    //   binding: VipLingQuBinding(),
    // ),
    GetPage(
      name: fiatCurrencyDetails,
      page: () => const FiatPaymentDetailsView(),
      binding: FiatPaymentDetailsBinding(),
    ),
    GetPage(
      name: virtualDetails,
      page: () => const VirtualPaymentDetailsView(),
      binding: VirtualPaymentDetailsBinding(),
    ),

    ///个人中心-联盟计划
    GetPage(
      name: personalAlliancePlan,
      page: () => AlliancePlanPage(),
      binding: AlliancePlanBinding(),
    ),

    ///个人中心-数据统计
    GetPage(
      name: personalDataCount,
      page: () => DataCountPage(),
      binding: DataCountBinding(),
    ),

    ///个人中心-交易记录
    GetPage(
      name: personalTransaction,
      page: () => TransactionsPage(),
      binding: TransactionsBinding(),
    ),

    ///个人中心-体育投注
    GetPage(
      name: personalSportBetting,
      page: () => Container(),
      binding: null,
    ),

    ///个人中心-设置
    GetPage(
      name: personalSetting,
      page: () => Container(),
      binding: null,
    ),

    ///个人中心-负责任博彩
    GetPage(
      name: personalResponsible,
      page: () => const ResponsibleForGamblingPage(),
      binding: ResponsibleForGamblingBinding(),
    ),

    ///个人中心-优惠兑换
    GetPage(
      name: personalDiscount,
      page: () => OffersPage(),
      binding: OffersBinding(),
    ),

    ///个人中心-在线支持
    GetPage(
      name: personalOnlineSupport,
      page: () => Container(),
      binding: null,
    ),

    ///个人中心-退出登陆
    GetPage(
      name: personalLoginOut,
      page: () => Container(),
      binding: null,
    ),

    ///个人中心-关于我们
    GetPage(
      name: personalAboutUs,
      page: () => AboutUsPage(),
      binding: AboutUsBinding(),
    ),

    /*====home 菜单模块别名 activity 活动香港=============*/
    // static const homeAllPromotions = '/home_all_promotions'; // 促销活动，查看全部
    GetPage(
      name: homeAllPromotions,
      page: () => AllPromotionsPage(),
      binding: AllPromotionsBinding(),
    ),

    //活动列表
    GetPage(
      name: homeSinglePromotions,
      page: () => SinglePromotionsPage(typeEnum: null),
      binding: SinglePromotionsBinding(),
    ),

    //推广活动
    GetPage(
      name: activityPromotions,
      page: () => ActivityPromotionPage(),
      binding: ActivityPromotionBinding(),
    ),

    ///转盘
    GetPage(
      name: rotary,
      page: () => RotaryView(),
      binding: RotaryBinding(),
    ),

    ///返现
    GetPage(
      name: cashback,
      page: () => ActivityCashBackPage(),
      binding: ActivityCashBackBinding(),
    ),

    ///自定义活动
    GetPage(
      name: customActivity,
      page: () => ActivityCustomPage(),
      binding: ActivityCustomBinding(),
    ),

    /*=================个人中心 路由区域 end=================*/

    /*=================个人中心 二级路由区域=================*/

    ///联盟计划-代理等级
    GetPage(
      name: personalAgentLevel,
      page: () => AgentLevelPage(),
      binding: AgentLevelBinding(),
    ),

    ///联盟计划-领取佣金
    GetPage(
      name: personalCommissionReceive,
      page: () => CommissionReceivePage(),
      binding: CommissionReceiveBinding(),
    ),

    ///联盟计划-佣金历史
    GetPage(
      name: personalCommissionHistory,
      page: () => CommissionHistoryPage(),
      binding: CommissionHistoryBinding(),
    ),

    ///个人中心-vip俱乐部
    GetPage(
      name: personalVipClub,
      page: () => VipClubPage(),
      binding: VipClubBinding(),
    ),
    /*=================个人中心 二级路由区域 end=================*/

    ///首页菜单 我的投注
    GetPage(
      name: browseMenuMyBetting,
      page: () => BettingBothPage(),
      binding: BettingBothBinding(),
    ),

    GetPage(
      name: RESTRICTED,
      page: () => const RestrictedView(),
      binding: RestrictedBinding(),
    ),

    GetPage(
      name: csHome,
      page: () => const CsHomeView(),
      binding: CsHomeBinding(),
    ),
    GetPage(
        name: csWebView,
        page: () => const CsWebviewView(),
        binding: CsHomeBinding()
    ),
    GetPage(
      name: redPacket,
      page: () => const RedPacketView(),
      binding: RedPacketBinding(),
    ),

  ];
}
