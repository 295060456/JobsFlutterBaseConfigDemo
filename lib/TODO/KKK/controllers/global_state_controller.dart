import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_bet/constant/app_cache_key.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/pages/setup/index/Brand.dart';
import 'package:flutter_bet/pages/sport/sport_detail/model.dart';
import 'package:flutter_bet/services/account_service.dart';
import 'package:flutter_bet/services/api/extension/account_api_service.dart';
import 'package:flutter_bet/services/encryption/encryption.dart';
import 'package:flutter_bet/services/mqtt/mqtt_service.dart';
import 'package:flutter_bet/services/mqtt/mqtt_topic.dart';
import 'package:flutter_bet/utils/available_domain_util.dart';
import 'package:flutter_bet/utils/channel_util.dart';
import 'package:flutter_bet/utils/route_util.dart';
import 'package:flutter_bet/utils/sp_util.dart';
import 'package:flutter_ulog/flutter_ulog.dart';
import 'package:get/get.dart';

import '../model/wallet/CurrencyBean.dart';
import '../pages/account/login/login_widget.dart';
import '../pages/betting/common_model/betting_common_params.dart';
import '../pages/main/code.dart';
import '../services/api/api_service.dart';
import '../services/event/event_service.dart';
import '../services/lang_service.dart' as lang;
import '../utils/deposit_withdrawal_notification_util.dart';
import '../utils/json_util.dart';
import 'global_biz_account_mixin.dart';
import 'global_biz_lang_mixin.dart';
import 'global_biz_mqtt_mixin.dart';
import 'global_biz_wallet_mixin.dart';

const kChangeMainPageEvent = 'kChangeMainPageEvent';

///全局公共Controller
class GlobalStateController extends GetxController
    with
        EventListener,
        GlobalBizLangMixin,
        GlobalBizAccountMixin,
        GlobalBizMqttMixin,
        GlobalBizWalletMixin {
  final count = 0.obs;
  final scale = 1.0.obs;

  ///是否显示顶部bar true显示 false隐藏
  final isShowTopBar = true.obs;

  ///是否显示底部bar true显示 false隐藏
  final isShowBottomBar = true.obs;

  ///是否显示在娱乐城页面
  final isInRecreationView = false.obs;

  ///活动通知
  final eventNotice = false.obs;

  /// 非维护状态
  final isNormal = true.obs;

  /// 登录注册配置接口更新
  final registerIndex = 0.obs;

  final betSlipType = 0.obs;

  ///投注单类型0:娱乐城 1:体育
  final menuSelectType = 0.obs;
  final showMenuImage = true.obs;
  final buttonSelectIndex = 1.obs; //底部按钮索引


  final oddsType = 5.obs; //赔率格式 5：小数式 6:分数式 7:美式 8:印尼格式 9:香港格式 10:马来格式
  final frontType = 0.obs;

  final csUrl = "".obs;
  final csSign = "".obs;
  int thirdPartyType = 0; //三方登录: 1:FB, 2:Google, 3:Twitch, 4:Line
  final isRestrictedView = false.obs; //是否在受限制页面

  String mqttRomain = AppValues.defaultBranch.ws_url.last;

  ///获取选中 货币的 保留小数 位置
  int get coinDecimal => currTypeSelected.value.decimal_places ?? 2;

  ///获取选中 货币的icon
  String get coinUrl => currTypeSelected.value.coinIc ?? "";

  String get coinCur => currTypeSelected.value.cur ?? "";

  CurrencyBean get selectedCoin => currTypeSelected.value;

  ///获取本事本身实例对象
  static GlobalStateController of() {
    return Get.find<GlobalStateController>();
  }

  ///未结算总数
  final unsettlement = 0.obs;

  RxMap sportData = {}.obs;

  AccountServiceListener? accountListener;

  StreamSubscription? subscriptionBet;

  Map<String, dynamic> betMessages = {};

  int lastMessageTime = 0;

  bool isHandleMsg = true;

  MqttServiceListener? _mqttServiceListener;

  //所有配置的货币。 读取本读json 的货币配置文件
  final localConfigCoinLists = <CurrencyBean>[];

  ///体育投注单 列表
  final bets = <M>[].obs;

  final isOpenVerificationAndPayPassword = false.obs; //是否开启了双重验证或者资金密码
  final isThirdLoginOk = false.obs; //第三方登录是否成功
  final thirdLoginEmail = ''.obs; //第三方登录邮箱号码
  final thirdId = ''.obs; //第三方登录id
  final brandDetailPc = {}.obs; //公共品牌信息Pc

  final reportList = [].obs;

  /// 底部排行榜 体育
  final rankSportsBets = [].obs;
  final rankSportsRank = [].obs;

  //顶部遮盖的导航返回时是否需要回到大厅
  RxBool backToMain = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getBrandDetail();
    getBrandPCDetail();
    getBrandBaseInfo();
    getPassWordConfig();
    if (AccountService.sharedInstance.isLogin()) {
      isLogin.value = true;
      inquireBalance();
      requestData();
      log("neco 已登录");
    }
    showMenuImage.value = true;
    oddsType.value = SPUtil().getInt(CacheKey.oddsType) ?? 5;
    langType.value = lang.LangService.sharedInstance.lang.toValue;
    accountListener = AccountServiceListener(onLoginSuccess: (model) {
      loginSuccess();
    }, onLogout: () {
      isLogin.value = false;
      MqttService.instance?.unsubscribeBalance();
      MqttService.instance?.unsubscribeMember();
      MqttService.instance?.unsubscribeNotifyTopic();
      MqttService.instance?.unsubscribeActivity100StateTopic();
    }, onTokenInvalid: () async {
      if (isLogin.value == true) {
        await AccountService.sharedInstance.logoutUser();
        RouteUtil.popView();

        // RouteUtil.pushToView(Routes.loginPage);
        showCustomLoginWidget();
      }
    });
    AccountService.sharedInstance.addListener(accountListener!);

    _mqttServiceListener = MqttServiceListener(onStatusChange: (event) async {
      switch (event.status) {
        case 1: //连接成功
          if (AccountService.sharedInstance.isLogin()) {
            await MqttService.instance?.subscribeBalance();
            await MqttService.instance?.subscribeMember();
            await MqttService.instance?.subscribeNotifyTopic();
            await MqttService.instance?.subscribeActivity100StateTopic();
          }
          await MqttService.instance?.subscribeSport();
          await MqttService.instance?.subscribeRankingListTopic();
          await MqttService.instance?.subscribeActivity100Topic();
          await MqttService.instance?.subscribeDepositFlushTopic();
          await MqttService.instance?.subscribeLoginRegTopic();
          // await MqttService.instance?.subscribeMsgDelTopic();//暂时搁置，不需要
          break;
        case 2: //连接断开
          break;
      }
    }, onReceiveMessage: (event) async {
      try {
        // log("global接收推送内容：${JsonUtil.encodeObj(event.message)}");
        if (event.messageType == MqttMessageTypes.messageBalance) {
          ///这里调用一下获取最新余额的接口
          AccountService.sharedInstance.getBalance(success: (balanceBean) {
            this.balanceBean.value = balanceBean;
            log('获取到余额信息=${jsonEncode(this.balanceBean.value)}');
            setBalance(flag: withdrawal);
          }, fail: (String? message) {
            print('获取余额失败=$message');
          });
        } else if (event.messageType == MqttMessageTypes.messageMember) {
          ///个人信息邮箱绑定成功
          log("neco个人信息邮箱绑定成功 ");
          await AccountService.sharedInstance.refreshUserInfo();
          await getBrandBaseInfo();
          await getPassWordConfig();
          isOpenVerificationAndPayPassword.value = true;
        } else if (event.messageType == MqttMessageTypes.messageNotify) {
          ///通知消息
          dealMqttMessageNotify(event);
        } else if (event.messageType == MqttMessageTypes.messageDepositFlush) {
          ///入款卡/支付方式/支付方法/通道等有变动时推送消息
          dcAvailableList();
        } else if (event.messageType == MqttMessageTypes.messageLoginReg) {
          ///后台配置登录注册改动推送消息
          //todo 1.重新获取登录注册后台配置信息 2.通知刷新界面
          // print('后台配置登录注册改动推送消息=${event.message}');
          registerIndex.value ++;
        }

        ///【娱乐城相关】
        else if (event.messageType == MqttMessageTypes.messageRankingAllCasino) {
          ///接收获取所有投注 娱乐城
          // log('接收mqtt数据-娱乐城-所有投注...${event.message}');
          dealMqttCasinoAllRanking(event);
        } else if (event.messageType == MqttMessageTypes.messageRankingListCasino) {
          ///接收获取风云榜 娱乐城
          // log('接收mqtt数据-娱乐城-风云榜...${event.message}');
          dealMqttCasinoStormRanking(event);
        }

        ///【体育相关】
        else if (event.messageType == MqttMessageTypes.messageSport) {
          ///赛事列表delta
          // log('接收mqtt数据-体育-赛事列表...${event.message}');
        } else if (event.messageType == MqttMessageTypes.messageRankingAllSports) {
          ///接收获取所有投注 体育
          // log('接收mqtt数据-体育-所有投注...${event.message}');
          var decode = event.message;
          if (decode != null) rankSportsBets.assignAll(decode);
        } else if (event.messageType == MqttMessageTypes.messageRankingListSports) {
          ///接收获取风云榜 体育
          // log('接收获取风云榜 体育=${event.message}');
          var decode = event.message;
          if (decode != null) rankSportsRank.assignAll(decode);
        }

        ///【活动相关】
        else if (event.messageType == MqttMessageTypes.messageActivity100) {
          ///接收获取活动100推送消息
          // log('接收获取活动100推送消息=${event.message}');
          var decode = event.message;
          reportList.assignAll(decode);
        } else if (event.messageType == MqttMessageTypes.messageActivity100State) {
          ///接收获取活动100 状态改变推送消息
          log('接收获取活动100 状态改变推送消息=${event.message}');
          eventNotice.value = true;
        }

        ///【聊天相关】
        else if (event.messageType == MqttMessageTypes.messageDelMsg) {
          ///接收后台删除聊天消息
          log('接收后台删除聊天消息=${event.message}');
        }

        ///【登陆相关】
        else if (event.messageType == MqttMessageTypes.messageThirdLogin) {
          ///第三方登录
          print('第三方登录=${event.message}');
          dynamic messageThirdLogin = event.message;
          String action = messageThirdLogin['action'];
          if (action == 'success') {
            String token = messageThirdLogin['extra_data']; //拿到token
            ///获取用户信息
            await AccountService.sharedInstance.refreshUserInfo(t: token);

            ///通知关闭注册界面
            isThirdLoginOk.value = true;

            ///取消订阅监听
            MqttService.instance?.unsubscribeMemberGoogle();
          } else if (action == 'register') {
            String email = messageThirdLogin['extra_data']?['email'] ?? ''; //拿到邮箱
            String id = messageThirdLogin['extra_data']?['id'] ?? ''; //拿到id
            if (email.isEmpty) {
              email = '0';
            }
            thirdId.value = id;
            thirdLoginEmail.value = email;
          } else if (action == 'error') {}
        }
      } catch (e) {
        log("global接收推送内容解析异常：--${event.messageType}---${JsonUtil.encodeObj(event.message)}");
        ULog.d(e);
      }
    });

    ///获取ws可用域名
    mqttRomain = await AvailableDomainUtil.getWsRomain(AppValues.defaultBranch.ws_url);
    MqttService.instance!.connectMqtt();
    MqttService.instance?.addListener(_mqttServiceListener!);


    // Uint8List? encrypt = Encryption.instance?.encrypt(Uint8List.fromList(utf8.encode('我是加密的')));
    // print('-----加密数据00=${encrypt.toString()}');
    // print('-----加密数据0000=${base64.encode(encrypt!)}');
    // Uint8List? decrypt = Encryption.instance?.decrypt(encrypt!);
    // print('-----解密数据11=${decrypt.toString()}');
    // print('-----解密数据1111=${utf8.decode(decrypt!)}');
  }

  @override
  Future<void> onReady() async {
    // TODO: implement onReady
    super.onReady();
    initCoinConfig();
    EventService.instance.addListener(kChangeMainPageEvent, this);
    //
    // final response = await Encryption.instance?.getData(''); // 这里替换为你想要请求的endpoint
    // print('------response解密前=${response?.data}');
    // Uint8List? decrypt = Encryption.instance?.decrypt(response?.data!);
    // print('------response解密数据=${decrypt.toString()}');
    // print('------response解密数据字符串=${utf8.decode(decrypt!)}');
  }

  ///读取本地coin json 配置文件
  void initCoinConfig() {
    currencyConfig().then((coinList) {
      localConfigCoinLists.assignAll(coinList);
      for (var coinBean in localConfigCoinLists) {
        coinBean.coinIc = "$coinIcDomain${coinBean.cur}$coinIcExtensionName";
      }
    });
  }

  void requestData() {
    getCsSign();
    brandCS();
    dcAvailableList();
    wcAvailableList();
    getExchangeRate();
  }

  ///是否显示顶部bar 和 底部Bar true显示 false隐藏
  void showOverlayView({bool isShowTopBarView = true, bool isShowBottomBarView = true}) {
    isShowTopBar.value = isShowTopBarView;
    isShowBottomBar.value = isShowBottomBarView;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    if (accountListener != null) {
      AccountService.sharedInstance.removeListener(accountListener!);
    }
    MqttService.instance?.removeListener(_mqttServiceListener!);
    MqttService.instance?.unsubscribeBalance();
  }

  Future<void> onArticleCollect() async {
    EventService.instance.dispatchEvent(kChangeMainPageEvent, MenuCode.GAME);
  }

  void increment() => count.value++;

  @override
  void onEvent(String eventId, event) {}

  ///获取品牌app信息
  Future<void> getBrandDetail({String tag = 'app'}) async {
    await ApiService.instance.getBrandDetail(
        tag: tag,
        success: (dynamic) {
          brandDetail.value = dynamic;
        },
        fail: (String? message) {});
  }

  ///获取品牌pc信息
  Future<void> getBrandPCDetail({String tag = 'pc'}) async {
    await ApiService.instance.getBrandDetail(
        tag: tag,
        success: (dynamic) {
          brandDetailPc.value = dynamic;
        },
        fail: (String? message) {});
  }

  ///获取品牌基础信息
  Future<void> getBrandBaseInfo({String tag = 'base'}) async {
    await ApiService.instance.getBrandDetail(
        tag: tag,
        success: (dynamic) {
          getBrandBase.value = dynamic;
        },
        fail: (String? message) {});
  }

  Future<void> getPassWordConfig() async {
    await ApiService.instance.getPassWordConfig(
        success: (dynamic) {
          log("neco  获取配置");
          brandBase.value = dynamic;
        },
        fail: (String? message) {});
  }

  ///我的投注页面中， 没有投注的情况下， 点击"立即开始下注" 跳转到首页的对应的 娱乐城 或者 体育见面
  Future<void> onClickEmptyBettingToHome(BettingFromPageType type) async {
    Get.back();
    if (type == BettingFromPageType.sideMenuBettingCasinoType) {
      EventService.instance.dispatchEvent(kChangeMainPageEvent, MenuCode.GAME);
    } else if (type == BettingFromPageType.sideMenuBettingSportType) {
      EventService.instance.dispatchEvent(kChangeMainPageEvent, MenuCode.MSG);
    }
  }

  //
  brandCS() async {
    await ApiService.instance.cs<Brand>(
        success: (bean) {
          log("客服${bean.toString()}");
          csUrl.value = bean[0].url ?? "";
        },
        fail: (message) {},
        tag: "kf",
        converter: (json) {
          return Brand.fromJson(json);
        });
  }

  //在线支持跳转签名
  getCsSign() async {
    await ApiService.instance.csSign(
        success: (sign) {
          csSign.value = sign;
        },
        fail: (message) {});
  }

  ///登录成功后逻辑处理
  Future<void> loginSuccess() async {
    isLogin.value = true;
    MqttService.instance?.subscribeBalance();
    MqttService.instance?.subscribeMember();
    MqttService.instance?.subscribeNotifyTopic();
    MqttService.instance?.subscribeActivity100StateTopic();
    inquireBalance();
    requestData();

    ///统计app登录成功
    FlutterPluginName.callMethod(CacheKey.loginApp);

    await getPassWordConfig();
  }
}
