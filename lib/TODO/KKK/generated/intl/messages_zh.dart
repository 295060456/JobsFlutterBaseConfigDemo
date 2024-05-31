// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh';

  static String m0(start_number, end_number) =>
      "请输入 ${start_number} - ${end_number} 位数字组成的正确银行卡号";

  static String m1(currencyName) => "您${currencyName}的";

  static String m2(number) => "在线： ${number}";

  static String m3(title) => "下载全部${title}";

  static String m4(rate) => "当前汇率：${rate}";

  static String m5(one, two) => "查看全部 ${one} ${two}";

  static String m6(character_number) => "至少${character_number}个字符";

  static String m7(app_name_text, hCaptcha_text, privacy_policy_text,
          terms_of_service_text) =>
      "${app_name_text}受${hCaptcha_text}保护，${hCaptcha_text}${privacy_policy_text}和${terms_of_service_text}适用";

  static String m8(text_length) => "最大字符长度为 ${text_length}";

  static String m9(text_length) => "最小字符长度为 ${text_length}";

  static String m10(password_characters_length) =>
      "您的密码必须含有至少 ${password_characters_length} 个字符";

  static String m11(type7) => "以 ${type7} 支付";

  static String m12(number) => "${number} 天后过期";

  static String m13(month, day) => "${month} ${day}";

  static String m14(two, one) => "正显示 ${two} 款游戏中的 ${one} 个";

  static String m15(amount) => "${amount}";

  static String m16(name) => "前往 ${name}";

  static String m17(user_name) => "投资者：${user_name}";

  static String m18(currency) => "请确认发送${currency}到此地址，充值需要全网确认才能到账，请耐心等待！";

  static String m19(amount) => "最小金额不可小于等于${amount}";

  static String m20(minimal_amount) => "这里最小金额为${minimal_amount}";

  static String m21(amount) => "转入金额${amount}";

  static String m22(nextTime) => "下个领取在 ${nextTime}";

  static String m23(level, amount) => "距离 VIP ${level} 还差 ${amount} 积分";

  static String m24(time) => "充值奖金有效期至 ${time}";

  static String m25(zero) => "金额不能为${zero}";

  static String m26(number) => "您的资金密码含有${number}位数字";

  static String m27(user_name) => "欢迎${user_name}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "about_us": MessageLookupByLibrary.simpleMessage("关于我们"),
        "active_bet": MessageLookupByLibrary.simpleMessage("未结算"),
        "agree_terms_text":
            MessageLookupByLibrary.simpleMessage("我已阅读并同意条款与条件"),
        "agree_terms_tips":
            MessageLookupByLibrary.simpleMessage("请完整阅读条款与条件，然后滚动至末尾将其接受"),
        "all_bet": MessageLookupByLibrary.simpleMessage("所有投注"),
        "all_esports": MessageLookupByLibrary.simpleMessage("所有电子竞技"),
        "all_sports": MessageLookupByLibrary.simpleMessage("体育项目"),
        "alliance_activity": MessageLookupByLibrary.simpleMessage("活动"),
        "alliance_activity_name": MessageLookupByLibrary.simpleMessage("活动名称"),
        "alliance_capital": MessageLookupByLibrary.simpleMessage("资金"),
        "alliance_commission": MessageLookupByLibrary.simpleMessage("佣金"),
        "alliance_create_activity":
            MessageLookupByLibrary.simpleMessage("创建活动"),
        "alliance_game": MessageLookupByLibrary.simpleMessage("娱乐"),
        "alliance_monery_takeout":
            MessageLookupByLibrary.simpleMessage("提取可用佣金"),
        "alliance_plan": MessageLookupByLibrary.simpleMessage("保留计划"),
        "alliance_program": MessageLookupByLibrary.simpleMessage("联盟计划"),
        "alliance_recommendation": MessageLookupByLibrary.simpleMessage("推荐用户"),
        "alliance_sort": MessageLookupByLibrary.simpleMessage("排序依据"),
        "alliance_summary": MessageLookupByLibrary.simpleMessage("概述"),
        "already_have_an_account_text":
            MessageLookupByLibrary.simpleMessage("已有账户？"),
        "app_name_text": MessageLookupByLibrary.simpleMessage("Stake"),
        "back_list_action_text": MessageLookupByLibrary.simpleMessage("操作"),
        "back_list_player_text": MessageLookupByLibrary.simpleMessage("玩家"),
        "banking_text": MessageLookupByLibrary.simpleMessage("法定货币"),
        "bet_accept_any_odds": MessageLookupByLibrary.simpleMessage("接受所有赔率"),
        "bet_accept_only_higher_odds":
            MessageLookupByLibrary.simpleMessage("只接受更高的赔率"),
        "bet_again": MessageLookupByLibrary.simpleMessage("重新使用投注单"),
        "bet_agree_new_odds": MessageLookupByLibrary.simpleMessage("同意新赔率"),
        "bet_all_clean": MessageLookupByLibrary.simpleMessage("全部清除"),
        "bet_live": MessageLookupByLibrary.simpleMessage("滚球"),
        "bet_pay": MessageLookupByLibrary.simpleMessage("预计支付额"),
        "bet_pay_all": MessageLookupByLibrary.simpleMessage("总投注额"),
        "bet_settled": MessageLookupByLibrary.simpleMessage("已关闭"),
        "bet_stop": MessageLookupByLibrary.simpleMessage("暂停"),
        "bet_submit": MessageLookupByLibrary.simpleMessage("押下单项投注"),
        "bet_submit_tips_one":
            MessageLookupByLibrary.simpleMessage("您的投注单里不能含有暂停或已关闭的盘口投注项。"),
        "bet_submit_tips_two":
            MessageLookupByLibrary.simpleMessage("赔率已变更，您需先接受赔率更改方可进行投。"),
        "bet_submit_two": MessageLookupByLibrary.simpleMessage("押下复式投注"),
        "bet_tips_three":
            MessageLookupByLibrary.simpleMessage("来自同一赛事的多重投注项不能结合成复式投注。"),
        "bet_total_odds": MessageLookupByLibrary.simpleMessage("总赔率"),
        "betting_casino_begin_game":
            MessageLookupByLibrary.simpleMessage("  立即开始游戏！"),
        "billboard": MessageLookupByLibrary.simpleMessage("风云榜"),
        "bind_fail": MessageLookupByLibrary.simpleMessage("绑定失败"),
        "bind_pix_account": MessageLookupByLibrary.simpleMessage("绑定PIX账户"),
        "binding_bank_card": MessageLookupByLibrary.simpleMessage("绑定银行卡"),
        "binding_bank_card_account_name":
            MessageLookupByLibrary.simpleMessage("开户人姓名"),
        "binding_bank_card_account_opening_branch":
            MessageLookupByLibrary.simpleMessage("开户行地址"),
        "binding_bank_card_all_bound_accounts":
            MessageLookupByLibrary.simpleMessage("所有绑定账户"),
        "binding_bank_card_binding": MessageLookupByLibrary.simpleMessage("绑定"),
        "binding_bank_card_hint":
            MessageLookupByLibrary.simpleMessage("，请谨慎确定姓名，更改姓名将会非常麻烦"),
        "binding_bank_card_names_must_match":
            MessageLookupByLibrary.simpleMessage("姓名必须一致"),
        "binding_bank_card_number":
            MessageLookupByLibrary.simpleMessage("银行卡号"),
        "binding_bank_card_please_enter":
            MessageLookupByLibrary.simpleMessage("请输入"),
        "binding_bank_card_select_bank":
            MessageLookupByLibrary.simpleMessage("请选择银行"),
        "binding_bindPIX": MessageLookupByLibrary.simpleMessage("绑定PIX"),
        "binding_cannotBeChangedAfterBind":
            MessageLookupByLibrary.simpleMessage("绑定后不可更改"),
        "binding_confirmDeletion":
            MessageLookupByLibrary.simpleMessage("请您确认删除以下提款方式吗？"),
        "binding_pleaseEnterCorrect430DigitBankCardNumber": m0,
        "binding_pleaseEnterCorrectBankCardNumber":
            MessageLookupByLibrary.simpleMessage("请输入正确银行卡号"),
        "binding_pleaseEnterCorrectName":
            MessageLookupByLibrary.simpleMessage("请输入正确姓名"),
        "binding_pleaseEnterCorrectWithdrawalAddress":
            MessageLookupByLibrary.simpleMessage("请输入正确提币地址"),
        "binding_pleaseEnterThirdPartyAccount":
            MessageLookupByLibrary.simpleMessage("请输入第三方账户"),
        "binding_pleaseEnterWithdrawalAddress":
            MessageLookupByLibrary.simpleMessage("请输入提币地址"),
        "binding_pleaseEnterYourBankCardNumber":
            MessageLookupByLibrary.simpleMessage("请输入银行卡号码"),
        "binding_pleaseSelectPIXAccountType":
            MessageLookupByLibrary.simpleMessage("请选择PIX账户类型"),
        "binding_selectAgreement": MessageLookupByLibrary.simpleMessage("选择协议"),
        "binding_setAsDefaultAddress":
            MessageLookupByLibrary.simpleMessage("是否设为默认地址"),
        "binding_setAsDefaultCardNumber":
            MessageLookupByLibrary.simpleMessage("是否设为默认卡号"),
        "binding_tripartite_account_holder_name":
            MessageLookupByLibrary.simpleMessage("账户人姓名"),
        "binding_tripartite_account_type_please":
            MessageLookupByLibrary.simpleMessage("请选择账户类型"),
        "binding_your": m1,
        "button_save_text": MessageLookupByLibrary.simpleMessage("保存"),
        "buy_crypto": MessageLookupByLibrary.simpleMessage("购买加密货币"),
        "cardHolder": MessageLookupByLibrary.simpleMessage("卡包"),
        "casino_bet": MessageLookupByLibrary.simpleMessage("娱乐城投注"),
        "casino_des_one": MessageLookupByLibrary.simpleMessage("最领先的在线加密货币赌场"),
        "casino_des_two": MessageLookupByLibrary.simpleMessage(
            "浏览我们种类繁多的赌场游戏，让Stake为您提供既公平又有趣的在线博彩体验。直接通过您的浏览器在老虎机、真人娱乐场、21点、百家乐、轮盘以及数以千计的经典赌场游戏包括您最喜爱的Stake原创游戏上进行投注。"),
        "casinoplatformName": MessageLookupByLibrary.simpleMessage("平台名称"),
        "chaKanQuanBu": MessageLookupByLibrary.simpleMessage("查看全部"),
        "change_area_code_tips_text":
            MessageLookupByLibrary.simpleMessage("我们只服务国际电话区号列表中所列有的区域。"),
        "change_area_code_title_text":
            MessageLookupByLibrary.simpleMessage("国际电话区号"),
        "change_fund_password": MessageLookupByLibrary.simpleMessage("修改资金密码"),
        "chat_room_online_text": m2,
        "check_box_input_code_tips":
            MessageLookupByLibrary.simpleMessage("代码（可选的）"),
        "check_my_betlist": MessageLookupByLibrary.simpleMessage("查看我的投注"),
        "confirm": MessageLookupByLibrary.simpleMessage("确认"),
        "confirm_button_text": MessageLookupByLibrary.simpleMessage("确定"),
        "confirm_fund_password": MessageLookupByLibrary.simpleMessage("确认资金密码"),
        "confirm_new_password_text":
            MessageLookupByLibrary.simpleMessage("确认新密码"),
        "confirm_password": MessageLookupByLibrary.simpleMessage("确认密码"),
        "contact_customer_service":
            MessageLookupByLibrary.simpleMessage("联系客服"),
        "contains_alphabet_text":
            MessageLookupByLibrary.simpleMessage("含有大写和小写字母"),
        "contains_one_more_number_text":
            MessageLookupByLibrary.simpleMessage("含有至少1个数字"),
        "copy_text_to_authenticator_app": MessageLookupByLibrary.simpleMessage(
            "将代码复制到您的身份验证器应用程序(Aauthenticator App)"),
        "create_account_title":
            MessageLookupByLibrary.simpleMessage("填写您的详细信息"),
        "create_account_title_text":
            MessageLookupByLibrary.simpleMessage("创建账户"),
        "crypto_text": MessageLookupByLibrary.simpleMessage("加密货币"),
        "data_count_activity": MessageLookupByLibrary.simpleMessage("送奖活动"),
        "data_count_data": MessageLookupByLibrary.simpleMessage("统计数据"),
        "data_count_datacopy2": MessageLookupByLibrary.simpleMessage("统计数据"),
        "data_count_race": MessageLookupByLibrary.simpleMessage("竞赛"),
        "date_past_month": MessageLookupByLibrary.simpleMessage("近30天"),
        "date_past_today": MessageLookupByLibrary.simpleMessage("今日"),
        "date_past_week": MessageLookupByLibrary.simpleMessage("近7天"),
        "details": MessageLookupByLibrary.simpleMessage("详情"),
        "detailscopy1": MessageLookupByLibrary.simpleMessage("详情"),
        "detailscopy2": MessageLookupByLibrary.simpleMessage("详情"),
        "done_text": MessageLookupByLibrary.simpleMessage("完成"),
        "download_all_text": m3,
        "email_address_text": MessageLookupByLibrary.simpleMessage("电邮地址"),
        "email_already_exists_text":
            MessageLookupByLibrary.simpleMessage("邮箱地址已存在"),
        "email_error_tips":
            MessageLookupByLibrary.simpleMessage("这含有无效的电子邮件字符"),
        "email_verification_code":
            MessageLookupByLibrary.simpleMessage("邮箱验证码"),
        "error_title_text": MessageLookupByLibrary.simpleMessage("错误"),
        "fairness": MessageLookupByLibrary.simpleMessage("公平性"),
        "feedback_back_title": MessageLookupByLibrary.simpleMessage("返回上级页面"),
        "feedback_bonus_title": MessageLookupByLibrary.simpleMessage("待领取奖金："),
        "feedback_confirm_receive":
            MessageLookupByLibrary.simpleMessage("确认领取"),
        "feedback_content_sub": MessageLookupByLibrary.simpleMessage(
            "您的任何意见对我们都很重要，凡是有价值意见都将被采纳，一旦采纳将视重要程度给予不同现金奖励，欢迎您畅所欲言！"),
        "feedback_content_title": MessageLookupByLibrary.simpleMessage("内容："),
        "feedback_customer_service":
            MessageLookupByLibrary.simpleMessage("官方客服"),
        "feedback_expected_receive":
            MessageLookupByLibrary.simpleMessage("预计可领取："),
        "feedback_img_sub": MessageLookupByLibrary.simpleMessage(
            "仅能上传：png/jpg格式，最多上传5张，单张最大1M"),
        "feedback_rate": m4,
        "feedback_receive_amount_1":
            MessageLookupByLibrary.simpleMessage("您当前待领取金额为："),
        "feedback_receive_amount_2":
            MessageLookupByLibrary.simpleMessage("您可自由选择您想要的币种进行领取"),
        "feedback_receive_title": MessageLookupByLibrary.simpleMessage("领取奖金"),
        "feedback_rule_sub": MessageLookupByLibrary.simpleMessage(
            "我们已经设置了巨额奖金，专门收集反馈意见，以便我们优化系统和功能，给您带来更好的体验！一旦被采纳，将根据重要程度给予奖励（未采纳除外）"),
        "feedback_rule_title": MessageLookupByLibrary.simpleMessage("奖励规则"),
        "feedback_state_title": MessageLookupByLibrary.simpleMessage("反馈状态："),
        "feedback_title_content": MessageLookupByLibrary.simpleMessage("反馈内容"),
        "feedback_title_img": MessageLookupByLibrary.simpleMessage("图片"),
        "feedback_transfer_await": MessageLookupByLibrary.simpleMessage("待领取"),
        "feedback_transfer_received":
            MessageLookupByLibrary.simpleMessage("已领取"),
        "feedback_transfer_service":
            MessageLookupByLibrary.simpleMessage("客服转账"),
        "feedbacl_id_title": MessageLookupByLibrary.simpleMessage("反馈ID："),
        "fiat_currency_Depositor_is_name":
            MessageLookupByLibrary.simpleMessage("存款人姓名"),
        "fiat_currency_channel_selection":
            MessageLookupByLibrary.simpleMessage("通道选择"),
        "fiat_currency_confirm_promptly_after_successful_transfer_to_avoid_scoring_delays":
            MessageLookupByLibrary.simpleMessage("请转账成功后务必及时确认！否则可能造成延迟上分！"),
        "fiat_currency_deposit_hint":
            MessageLookupByLibrary.simpleMessage("为及时到账，请务必输入正确的存款人姓名"),
        "fiat_currency_drawing_bank":
            MessageLookupByLibrary.simpleMessage("出款银行"),
        "fiat_currency_payee_name":
            MessageLookupByLibrary.simpleMessage("收款人姓名"),
        "fiat_currency_select_the_payment_bank":
            MessageLookupByLibrary.simpleMessage("请选择出款银行"),
        "fiat_currency_transfer_amount_must_match_the_order_amount":
            MessageLookupByLibrary.simpleMessage("转账金额务必与订单金额一致"),
        "first_and_then_set_the_password":
            MessageLookupByLibrary.simpleMessage("请先绑定邮箱后在设置资金密码"),
        "forget_password_text": MessageLookupByLibrary.simpleMessage("忘记密码"),
        "forgot_your_fund_password_go_to":
            MessageLookupByLibrary.simpleMessage("忘记资金密码？前往 "),
        "fund_password_is_inconsistent":
            MessageLookupByLibrary.simpleMessage("两次输入的资金密码不一致"),
        "game_Category_no_results":
            MessageLookupByLibrary.simpleMessage("未找到结果"),
        "game_category_check_all": MessageLookupByLibrary.simpleMessage("查看所有"),
        "game_category_clear_seach_results":
            MessageLookupByLibrary.simpleMessage("清除搜索("),
        "game_category_recent_search":
            MessageLookupByLibrary.simpleMessage("近期搜索"),
        "game_category_repair": MessageLookupByLibrary.simpleMessage("场馆维护中"),
        "game_category_search_standards":
            MessageLookupByLibrary.simpleMessage("需要至少3个字符来进行搜索"),
        "game_detail_yue": MessageLookupByLibrary.simpleMessage("余额"),
        "game_live": MessageLookupByLibrary.simpleMessage("真人"),
        "game_slots": MessageLookupByLibrary.simpleMessage("电子"),
        "game_supplier": MessageLookupByLibrary.simpleMessage("游戏提供商"),
        "get_verification_code": MessageLookupByLibrary.simpleMessage("获取验证码"),
        "go_to_Binding": MessageLookupByLibrary.simpleMessage("前往绑定"),
        "go_to_casino": MessageLookupByLibrary.simpleMessage("前往娱乐城"),
        "go_to_sports_book": MessageLookupByLibrary.simpleMessage("前往体育博彩"),
        "hCaptcha_text": MessageLookupByLibrary.simpleMessage("hCaptcha"),
        "hello_text": MessageLookupByLibrary.simpleMessage("你好"),
        "homeChaKanQuanBu": m5,
        "home_blog": MessageLookupByLibrary.simpleMessage("博客"),
        "home_challenge": MessageLookupByLibrary.simpleMessage("挑战"),
        "home_forum": MessageLookupByLibrary.simpleMessage("论坛"),
        "home_game": MessageLookupByLibrary.simpleMessage("游戏"),
        "home_recent_games": MessageLookupByLibrary.simpleMessage("近期游戏记录"),
        "image_load_error": MessageLookupByLibrary.simpleMessage("加载失败了x_x"),
        "invalid_birthday_text": MessageLookupByLibrary.simpleMessage("无效的日期"),
        "kyc_address_prove_text": MessageLookupByLibrary.simpleMessage("地址证明"),
        "kyc_city_text": MessageLookupByLibrary.simpleMessage("城市"),
        "kyc_family_name_text": MessageLookupByLibrary.simpleMessage("姓氏"),
        "kyc_given_name_text": MessageLookupByLibrary.simpleMessage("名字"),
        "kyc_job_text": MessageLookupByLibrary.simpleMessage("职业（您的工作）"),
        "kyc_level_four_tips1_text":
            MessageLookupByLibrary.simpleMessage("请先完成三级验证"),
        "kyc_level_four_tips2_text": MessageLookupByLibrary.simpleMessage(
            "请上传您资金来源的证明。所有文件都必须放置在平面上，其四个角都要在画面内，且所有信息都应该清晰可辨。"),
        "kyc_level_front_text": MessageLookupByLibrary.simpleMessage("正面"),
        "kyc_level_money_source_text":
            MessageLookupByLibrary.simpleMessage("资金来源"),
        "kyc_level_number_four_text":
            MessageLookupByLibrary.simpleMessage("四级"),
        "kyc_level_number_one_text": MessageLookupByLibrary.simpleMessage("一级"),
        "kyc_level_number_three_text":
            MessageLookupByLibrary.simpleMessage("三级"),
        "kyc_level_number_two_text": MessageLookupByLibrary.simpleMessage("二级"),
        "kyc_level_one_tips_text":
            MessageLookupByLibrary.simpleMessage("如果您的详细信息发生变化，一级验证可以在其后更新。"),
        "kyc_level_personal_id_text":
            MessageLookupByLibrary.simpleMessage("身份证明"),
        "kyc_level_reverse_text": MessageLookupByLibrary.simpleMessage("背面"),
        "kyc_level_there_tips1_text":
            MessageLookupByLibrary.simpleMessage("请先完成二级验证"),
        "kyc_level_there_tips2_text": MessageLookupByLibrary.simpleMessage(
            "请上传您的身份证明。所有文件都必须放置在平面上，其四个角都要在画面内，且所有信息都应该清晰可辨。"),
        "kyc_level_two_tips1_text":
            MessageLookupByLibrary.simpleMessage("请先完成一级验证"),
        "kyc_level_two_tips2_text": MessageLookupByLibrary.simpleMessage(
            "请先上传您的身份证明。所有文件都必须放置在平面上，其四个角都要在画面内，且所有信息都应该清晰可辨"),
        "kyc_level_verify_title_text":
            MessageLookupByLibrary.simpleMessage("验证"),
        "kyc_live_place_text": MessageLookupByLibrary.simpleMessage("居住地"),
        "kyc_nationality_text": MessageLookupByLibrary.simpleMessage("所在国家"),
        "kyc_postal_code_text": MessageLookupByLibrary.simpleMessage("邮政编码"),
        "kyc_security_tips_text":
            MessageLookupByLibrary.simpleMessage("所有数据会被安全存储与加密。"),
        "kyc_type_support_text":
            MessageLookupByLibrary.simpleMessage("我们接收一下文件类型：png、jpg、pdf"),
        "language": MessageLookupByLibrary.simpleMessage("语言"),
        "least_character_text": m6,
        "live_support": MessageLookupByLibrary.simpleMessage("在线支持"),
        "login_bottom_protocol_text": m7,
        "login_text_field_account_tips":
            MessageLookupByLibrary.simpleMessage("电邮地址或用户名"),
        "login_text_field_password_tips":
            MessageLookupByLibrary.simpleMessage("密码"),
        "login_text_other_use": MessageLookupByLibrary.simpleMessage("或者使用"),
        "logout_text": MessageLookupByLibrary.simpleMessage("登出"),
        "max_character_limit_text": m8,
        "menu_odds": MessageLookupByLibrary.simpleMessage("赔率"),
        "message_read": MessageLookupByLibrary.simpleMessage("已读"),
        "message_send_button_text": MessageLookupByLibrary.simpleMessage("发送"),
        "message_unread": MessageLookupByLibrary.simpleMessage("未读"),
        "minimum_character_limit_text": m9,
        "monthly_text": MessageLookupByLibrary.simpleMessage("月度"),
        "multiple_bet": MessageLookupByLibrary.simpleMessage("复式投注"),
        "must_over_18_year_text":
            MessageLookupByLibrary.simpleMessage("您必须年满18岁以上"),
        "new_password_text": MessageLookupByLibrary.simpleMessage("新密码"),
        "newcomer_discount_tips_text":
            MessageLookupByLibrary.simpleMessage("迎新优惠仅限于注册后的24小时内有效"),
        "no_account_tips_text": MessageLookupByLibrary.simpleMessage("还未有账户？"),
        "no_crypto": MessageLookupByLibrary.simpleMessage("没加密货币？没问题"),
        "no_entries": MessageLookupByLibrary.simpleMessage("暂无条目"),
        "no_odds_changes_accepted":
            MessageLookupByLibrary.simpleMessage("不接受任何赔率变化"),
        "notification": MessageLookupByLibrary.simpleMessage("通知"),
        "notifs_announcement": MessageLookupByLibrary.simpleMessage("公告"),
        "notifs_as_read": MessageLookupByLibrary.simpleMessage("标记全部为已读"),
        "notifs_available": MessageLookupByLibrary.simpleMessage("暂无通知"),
        "notifs_available_tip":
            MessageLookupByLibrary.simpleMessage("您的互动将在此处显示"),
        "notifs_content_deposit_confirmed":
            MessageLookupByLibrary.simpleMessage("已成功处理您 %s %s 的存款。"),
        "notifs_content_deposit_pending":
            MessageLookupByLibrary.simpleMessage("已登记您 %s %s 的存款，正等待确认。"),
        "notifs_insert_feedback": MessageLookupByLibrary.simpleMessage("创建反馈"),
        "notifs_marquee": MessageLookupByLibrary.simpleMessage("跑马灯"),
        "notifs_my_feedback": MessageLookupByLibrary.simpleMessage("我的反馈"),
        "notifs_new": MessageLookupByLibrary.simpleMessage("新推出"),
        "notifs_rewarded_feedback":
            MessageLookupByLibrary.simpleMessage("有奖反馈"),
        "notifs_site_message": MessageLookupByLibrary.simpleMessage("站内信"),
        "notifs_title_deposit_confirmed":
            MessageLookupByLibrary.simpleMessage("已确认存款"),
        "notifs_title_deposit_pending":
            MessageLookupByLibrary.simpleMessage("存款待定中"),
        "odds_american": MessageLookupByLibrary.simpleMessage("美式"),
        "odds_decimal": MessageLookupByLibrary.simpleMessage("小数式"),
        "odds_fractional": MessageLookupByLibrary.simpleMessage("分数式"),
        "odds_hong_kong": MessageLookupByLibrary.simpleMessage("香港格式"),
        "odds_indonesian": MessageLookupByLibrary.simpleMessage("印尼格式"),
        "odds_malaysian": MessageLookupByLibrary.simpleMessage("马来格式"),
        "offerrs_redeem_bonus_drop":
            MessageLookupByLibrary.simpleMessage("兑换空投奖金"),
        "offers": MessageLookupByLibrary.simpleMessage("优惠"),
        "offers_code": MessageLookupByLibrary.simpleMessage("代码 *"),
        "offers_redeem_body": MessageLookupByLibrary.simpleMessage(
            "在我们的社交媒体平台（如 Twitter 和 Telegram）上获取空投奖金代码。"),
        "offers_welcome_offer": MessageLookupByLibrary.simpleMessage("迎新优惠"),
        "offers_welcome_offer_body":
            MessageLookupByLibrary.simpleMessage("迎新优惠仅限于注册后的 24 小时内有效。"),
        "old_password_text": MessageLookupByLibrary.simpleMessage("旧密码"),
        "only_supports_6_digit_pure_numbers":
            MessageLookupByLibrary.simpleMessage("仅支持6位纯数字"),
        "original_fund_password": MessageLookupByLibrary.simpleMessage("原资金密码"),
        "password_can_not_be_blank":
            MessageLookupByLibrary.simpleMessage("密码不能为空"),
        "password_contains_uppercase_and_lowercase_tips":
            MessageLookupByLibrary.simpleMessage("密码必须含有至少1个大写字母和1个小写字母"),
        "password_has_been_updated":
            MessageLookupByLibrary.simpleMessage("修改密码成功"),
        "password_required_characters": m10,
        "paymentDetails": MessageLookupByLibrary.simpleMessage("支付详情"),
        "phone_number_text": MessageLookupByLibrary.simpleMessage("手机号码"),
        "please_input_account_tips":
            MessageLookupByLibrary.simpleMessage("请输入账号"),
        "please_input_birthday_tips":
            MessageLookupByLibrary.simpleMessage("请输入您的出生日期"),
        "please_input_email_tips":
            MessageLookupByLibrary.simpleMessage("请输入电邮地址"),
        "please_input_message": MessageLookupByLibrary.simpleMessage("输入您的消息"),
        "please_input_password_tips":
            MessageLookupByLibrary.simpleMessage("请输入密码"),
        "please_input_user_name_tips":
            MessageLookupByLibrary.simpleMessage("请输入用户名"),
        "please_join_at_tips":
            MessageLookupByLibrary.simpleMessage("请在您的电邮地址中加入“@“符号"),
        "prevent_other_people_look":
            MessageLookupByLibrary.simpleMessage("防止他人偷看此页!"),
        "privacy_body_community_title_text":
            MessageLookupByLibrary.simpleMessage("社区"),
        "privacy_body_race_switch_tips_text":
            MessageLookupByLibrary.simpleMessage("其他用户将无法查看您的竞赛记录"),
        "privacy_body_sale_title_text":
            MessageLookupByLibrary.simpleMessage("营销"),
        "privacy_body_statistics_switch_tips_text":
            MessageLookupByLibrary.simpleMessage("其他用户无法查看您的输赢和投注的统计数据"),
        "privacy_body_statistics_switch_title_text":
            MessageLookupByLibrary.simpleMessage("隐藏所有统计数据"),
        "privacy_body_stealth_switch_tips_text":
            MessageLookupByLibrary.simpleMessage("您的投注不会出现在公开投注动态和投注预览中"),
        "privacy_body_stealth_switch_title_text":
            MessageLookupByLibrary.simpleMessage("启用隐身模式"),
        "privacy_body_switch_red_rain_tips_text":
            MessageLookupByLibrary.simpleMessage("防止您在聊天室中收到红包雨"),
        "privacy_body_switch_red_rain_title_text":
            MessageLookupByLibrary.simpleMessage("拒绝接收红包雨"),
        "privacy_body_switch_sale_tips_text":
            MessageLookupByLibrary.simpleMessage("选择不接收电邮或优惠"),
        "privacy_body_switch_sale_title_text":
            MessageLookupByLibrary.simpleMessage("接收营销电邮"),
        "privacy_body_take_effect_tips_text":
            MessageLookupByLibrary.simpleMessage("请容许长达30秒的时间使其更新生效"),
        "privacy_body_tips_text": MessageLookupByLibrary.simpleMessage(
            "用户隐私是我们的核心价值之一。这些设置将允许您在其他玩家面前完全匿名。"),
        "privacy_body_title_text": MessageLookupByLibrary.simpleMessage("隐私"),
        "privacy_policy": MessageLookupByLibrary.simpleMessage("隐私政策"),
        "privacy_policy_text": MessageLookupByLibrary.simpleMessage("隐私协议"),
        "profile": MessageLookupByLibrary.simpleMessage("个人资料"),
        "promotions": MessageLookupByLibrary.simpleMessage("促销活动"),
        "race_leaderboard": MessageLookupByLibrary.simpleMessage("竞赛排行榜"),
        "random_text_1": MessageLookupByLibrary.simpleMessage("我们已发送账户恢复电邮至\n"),
        "random_text_10": MessageLookupByLibrary.simpleMessage("二月"),
        "random_text_100": MessageLookupByLibrary.simpleMessage("货币类型"),
        "random_text_1000": MessageLookupByLibrary.simpleMessage("，最大红包"),
        "random_text_1001": MessageLookupByLibrary.simpleMessage("抱歉"),
        "random_text_1002": MessageLookupByLibrary.simpleMessage("本场红包已被领完"),
        "random_text_1003": MessageLookupByLibrary.simpleMessage("本场红包已参与"),
        "random_text_1004": MessageLookupByLibrary.simpleMessage("活动未开始，请稍后再试"),
        "random_text_1005": MessageLookupByLibrary.simpleMessage("活动提示"),
        "random_text_1006": MessageLookupByLibrary.simpleMessage("每天"),
        "random_text_1007": MessageLookupByLibrary.simpleMessage("每次"),
        "random_text_1008": MessageLookupByLibrary.simpleMessage("最低100.00提取"),
        "random_text_1009": MessageLookupByLibrary.simpleMessage("向随机玩家发送邀请"),
        "random_text_101": MessageLookupByLibrary.simpleMessage("预计可领取: "),
        "random_text_1010": MessageLookupByLibrary.simpleMessage("发送短信"),
        "random_text_1011": MessageLookupByLibrary.simpleMessage("取款进度"),
        "random_text_1012": MessageLookupByLibrary.simpleMessage("邮箱地址/手机号码"),
        "random_text_1013": MessageLookupByLibrary.simpleMessage("未绑定邮箱或手机，请"),
        "random_text_1014": MessageLookupByLibrary.simpleMessage("请输入电话号码"),
        "random_text_1015": MessageLookupByLibrary.simpleMessage("电话号码格式错误"),
        "random_text_1016": MessageLookupByLibrary.simpleMessage("用户名/邮箱登入"),
        "random_text_1017": MessageLookupByLibrary.simpleMessage("手机登入"),
        "random_text_1018": MessageLookupByLibrary.simpleMessage("忘记密码？"),
        "random_text_1019": MessageLookupByLibrary.simpleMessage("新用户？"),
        "random_text_102": MessageLookupByLibrary.simpleMessage("佣金钱包和余额"),
        "random_text_1020": MessageLookupByLibrary.simpleMessage(" 创建账号"),
        "random_text_1021": MessageLookupByLibrary.simpleMessage("直接登录"),
        "random_text_1022": MessageLookupByLibrary.simpleMessage("邮箱"),
        "random_text_1023": MessageLookupByLibrary.simpleMessage("用户名3-14位"),
        "random_text_1024": MessageLookupByLibrary.simpleMessage("输入推荐代码"),
        "random_text_1025": MessageLookupByLibrary.simpleMessage("我同意"),
        "random_text_1026": MessageLookupByLibrary.simpleMessage(" 用户协议 "),
        "random_text_1027": MessageLookupByLibrary.simpleMessage("并确定我已满18岁"),
        "random_text_1028":
            MessageLookupByLibrary.simpleMessage("字段”用户协议“为必填项"),
        "random_text_1029":
            MessageLookupByLibrary.simpleMessage("我同意接收 Win6 的营销促销信息"),
        "random_text_103": MessageLookupByLibrary.simpleMessage("兑换领取币总汇率"),
        "random_text_1030": MessageLookupByLibrary.simpleMessage("注册 OAuth"),
        "random_text_1031": MessageLookupByLibrary.simpleMessage("请填写您的详细信息"),
        "random_text_1032": MessageLookupByLibrary.simpleMessage("用户协议"),
        "random_text_1033": MessageLookupByLibrary.simpleMessage("邮箱验证"),
        "random_text_1034": MessageLookupByLibrary.simpleMessage(
            "请输入发送至 justin888@gmail.com 的6位验证码，该验证码的有效期为5分钟。"),
        "random_text_1035": MessageLookupByLibrary.simpleMessage("没有收到验证码？"),
        "random_text_1036": MessageLookupByLibrary.simpleMessage("电话验证"),
        "random_text_1037": MessageLookupByLibrary.simpleMessage(
            "请输入发送至 +86 18988888888 的6位验证码。该验证码的有效期为5分钟。"),
        "random_text_1038": MessageLookupByLibrary.simpleMessage("电子邮件"),
        "random_text_1039":
            MessageLookupByLibrary.simpleMessage("短信已发送至您的手机，如果您多次尝试后仍未收到验证码。"),
        "random_text_1040":
            MessageLookupByLibrary.simpleMessage("短信已发送至您的邮箱，如果您多次尝试后仍未收到验证码，"),
        "random_text_1041":
            MessageLookupByLibrary.simpleMessage("1.检查您的电话是否停机。"),
        "random_text_1042":
            MessageLookupByLibrary.simpleMessage("1.检查您的邮箱是否正确。"),
        "random_text_1043":
            MessageLookupByLibrary.simpleMessage("2.检查短信是否在垃圾箱中。"),
        "random_text_1044":
            MessageLookupByLibrary.simpleMessage("2.检查邮件是否在垃圾箱中。"),
        "random_text_1045":
            MessageLookupByLibrary.simpleMessage("3.该消息可能会延迟几分钟，请10分钟后尝试。"),
        "random_text_1046": MessageLookupByLibrary.simpleMessage("请输入验证码"),
        "random_text_1047": MessageLookupByLibrary.simpleMessage("手机验证"),
        "random_text_1048": MessageLookupByLibrary.simpleMessage("请输入发送至 "),
        "random_text_1049":
            MessageLookupByLibrary.simpleMessage(" 的6位验证码。该验证码的有效期为5分钟。"),
        "random_text_105": MessageLookupByLibrary.simpleMessage("统计时间"),
        "random_text_1050": MessageLookupByLibrary.simpleMessage("重新发送"),
        "random_text_1051":
            MessageLookupByLibrary.simpleMessage("您的密码必须含有至少8个字符"),
        "random_text_1052":
            MessageLookupByLibrary.simpleMessage(" 的6位验证码。该验证码的有效期为5分钟。"),
        "random_text_1053": MessageLookupByLibrary.simpleMessage("提交成功"),
        "random_text_1054": MessageLookupByLibrary.simpleMessage("审核通过"),
        "random_text_1055": MessageLookupByLibrary.simpleMessage("审核拒绝"),
        "random_text_1056":
            MessageLookupByLibrary.simpleMessage("活动未开始,请稍后再试..."),
        "random_text_1057": MessageLookupByLibrary.simpleMessage("您当前未满足领取条件"),
        "random_text_1058": MessageLookupByLibrary.simpleMessage("申请中"),
        "random_text_1059": MessageLookupByLibrary.simpleMessage("您的返现正在申请中"),
        "random_text_106": MessageLookupByLibrary.simpleMessage("投注单数量"),
        "random_text_1060": MessageLookupByLibrary.simpleMessage("未知错误"),
        "random_text_1061": MessageLookupByLibrary.simpleMessage("当前等级"),
        "random_text_1062": MessageLookupByLibrary.simpleMessage("距离下级还需:"),
        "random_text_1063": MessageLookupByLibrary.simpleMessage("负盈利返现"),
        "random_text_1064":
            MessageLookupByLibrary.simpleMessage("您本周玩游戏将会获得最高"),
        "random_text_1065": MessageLookupByLibrary.simpleMessage("%返现"),
        "random_text_1066": MessageLookupByLibrary.simpleMessage("结算后"),
        "random_text_1067": MessageLookupByLibrary.simpleMessage("天内可领取"),
        "random_text_1068": MessageLookupByLibrary.simpleMessage("总计"),
        "random_text_1069": MessageLookupByLibrary.simpleMessage("掷大于"),
        "random_text_107": MessageLookupByLibrary.simpleMessage("存款金额"),
        "random_text_1070": MessageLookupByLibrary.simpleMessage("低等"),
        "random_text_1071": MessageLookupByLibrary.simpleMessage("高等"),
        "random_text_1072":
            MessageLookupByLibrary.simpleMessage("金额已派送到您对应货币钱包"),
        "random_text_1073": MessageLookupByLibrary.simpleMessage("暂无返水可领取"),
        "random_text_1074": MessageLookupByLibrary.simpleMessage(
            "满足VIP晋级所需的积分要求，即可晋级相应VIP等级，获得相应晋级奖金，如连续晋级多级，可领取全部等级晋级奖金；"),
        "random_text_1075": MessageLookupByLibrary.simpleMessage(
            "在最近90天内满足保级所需的积分要求，即可保留当前VIP等级。如果90天内无法满足保级积分需求，则会降低一级VIP等级；"),
        "random_text_1076": MessageLookupByLibrary.simpleMessage("当前等级已达最高"),
        "random_text_1077": MessageLookupByLibrary.simpleMessage("保持当前等级还需要"),
        "random_text_1078": MessageLookupByLibrary.simpleMessage(
            "活动说明:本活动领取的奖金将会根据您选择的货币派送,第一次领取成功后系统将会根据您领取的货币作为本活动固定领取货币。"),
        "random_text_1079": MessageLookupByLibrary.simpleMessage("邮箱地址"),
        "random_text_107_copy": MessageLookupByLibrary.simpleMessage("充值金额"),
        "random_text_108": MessageLookupByLibrary.simpleMessage("（次数）"),
        "random_text_1080": MessageLookupByLibrary.simpleMessage("手机区号"),
        "random_text_1081": MessageLookupByLibrary.simpleMessage("获得更多次数"),
        "random_text_1082": MessageLookupByLibrary.simpleMessage("下级累计存款"),
        "random_text_1083": MessageLookupByLibrary.simpleMessage("下级累计打码"),
        "random_text_1084": MessageLookupByLibrary.simpleMessage("下级首存人数"),
        "random_text_1085": MessageLookupByLibrary.simpleMessage("下级打码人数"),
        "random_text_1086": MessageLookupByLibrary.simpleMessage("自身累计存款"),
        "random_text_1087": MessageLookupByLibrary.simpleMessage("自身累计打码"),
        "random_text_1088": MessageLookupByLibrary.simpleMessage("自身存款次数"),
        "random_text_1089": MessageLookupByLibrary.simpleMessage("邀请"),
        "random_text_109": MessageLookupByLibrary.simpleMessage("取款金额"),
        "random_text_1090": MessageLookupByLibrary.simpleMessage("个好友"),
        "random_text_1091": MessageLookupByLibrary.simpleMessage("下级首存"),
        "random_text_1092": MessageLookupByLibrary.simpleMessage("下级打码"),
        "random_text_1093": MessageLookupByLibrary.simpleMessage("累计存款"),
        "random_text_1094": MessageLookupByLibrary.simpleMessage("累计打码"),
        "random_text_1095": MessageLookupByLibrary.simpleMessage("已邀请"),
        "random_text_1096": MessageLookupByLibrary.simpleMessage("下级已存款"),
        "random_text_1097": MessageLookupByLibrary.simpleMessage("下级已打码"),
        "random_text_1098": MessageLookupByLibrary.simpleMessage("下级已首存"),
        "random_text_1099": MessageLookupByLibrary.simpleMessage("下级已打码人"),
        "random_text_11": MessageLookupByLibrary.simpleMessage("三月"),
        "random_text_110": MessageLookupByLibrary.simpleMessage("存取款差额"),
        "random_text_1100": MessageLookupByLibrary.simpleMessage("已存款"),
        "random_text_1101": MessageLookupByLibrary.simpleMessage("已打码"),
        "random_text_1102": MessageLookupByLibrary.simpleMessage("已累积邀请"),
        "random_text_1103": MessageLookupByLibrary.simpleMessage("下级已累计存款"),
        "random_text_1104": MessageLookupByLibrary.simpleMessage("下级已累计打码"),
        "random_text_1105": MessageLookupByLibrary.simpleMessage("下级已累计首存"),
        "random_text_1106": MessageLookupByLibrary.simpleMessage("已累计存款"),
        "random_text_1107": MessageLookupByLibrary.simpleMessage("已累计打码"),
        "random_text_1108": MessageLookupByLibrary.simpleMessage("，奖励"),
        "random_text_1109": MessageLookupByLibrary.simpleMessage("次抽奖"),
        "random_text_111": MessageLookupByLibrary.simpleMessage("（当前余额）"),
        "random_text_1110": MessageLookupByLibrary.simpleMessage("，已奖励"),
        "random_text_1111": MessageLookupByLibrary.simpleMessage("此用户未显示的统计数据"),
        "random_text_1112": MessageLookupByLibrary.simpleMessage("安全的"),
        "random_text_1113": MessageLookupByLibrary.simpleMessage("普通的"),
        "random_text_1114": MessageLookupByLibrary.simpleMessage("高风险"),
        "random_text_1115": MessageLookupByLibrary.simpleMessage("手机验证码"),
        "random_text_1116": MessageLookupByLibrary.simpleMessage("没有手机？"),
        "random_text_1117": MessageLookupByLibrary.simpleMessage("没有邮箱？"),
        "random_text_1118": MessageLookupByLibrary.simpleMessage("使用邮箱"),
        "random_text_1119": MessageLookupByLibrary.simpleMessage("使用手机"),
        "random_text_112": MessageLookupByLibrary.simpleMessage("统计日期"),
        "random_text_1120": MessageLookupByLibrary.simpleMessage("积分奖金"),
        "random_text_1121": MessageLookupByLibrary.simpleMessage("晋级"),
        "random_text_1122": MessageLookupByLibrary.simpleMessage("真实姓名"),
        "random_text_1123": MessageLookupByLibrary.simpleMessage("银行卡"),
        "random_text_1124": MessageLookupByLibrary.simpleMessage("姓名"),
        "random_text_1125": MessageLookupByLibrary.simpleMessage("提款账号"),
        "random_text_1126": MessageLookupByLibrary.simpleMessage("钱包地址"),
        "random_text_1127": MessageLookupByLibrary.simpleMessage("绑定加密货币"),
        "random_text_1128": MessageLookupByLibrary.simpleMessage("请输入开户网点"),
        "random_text_1129": MessageLookupByLibrary.simpleMessage("请输入正确的CPF"),
        "random_text_113": MessageLookupByLibrary.simpleMessage("领取总额"),
        "random_text_1130": MessageLookupByLibrary.simpleMessage("存款货币"),
        "random_text_1131": MessageLookupByLibrary.simpleMessage("提款货币"),
        "random_text_1132": MessageLookupByLibrary.simpleMessage("赠送+"),
        "random_text_1133": MessageLookupByLibrary.simpleMessage("图标"),
        "random_text_1134": MessageLookupByLibrary.simpleMessage("请输入姓名"),
        "random_text_1135": MessageLookupByLibrary.simpleMessage("选择支付方式"),
        "random_text_1136": MessageLookupByLibrary.simpleMessage("选择网络"),
        "random_text_1137": MessageLookupByLibrary.simpleMessage("选择付款方式"),
        "random_text_1138": MessageLookupByLibrary.simpleMessage("展示更多"),
        "random_text_1139": MessageLookupByLibrary.simpleMessage("法币"),
        "random_text_114": MessageLookupByLibrary.simpleMessage("反水"),
        "random_text_1140": MessageLookupByLibrary.simpleMessage("请先绑定收款信息"),
        "random_text_1141": MessageLookupByLibrary.simpleMessage("提款地址"),
        "random_text_1142": MessageLookupByLibrary.simpleMessage("添加收款账号"),
        "random_text_1143": MessageLookupByLibrary.simpleMessage("提款银行"),
        "random_text_1144": MessageLookupByLibrary.simpleMessage("提款金额"),
        "random_text_1145": MessageLookupByLibrary.simpleMessage("手机号未注册"),
        "random_text_1146": MessageLookupByLibrary.simpleMessage("邮箱未注册"),
        "random_text_1147": MessageLookupByLibrary.simpleMessage("请同意我们的用户协议"),
        "random_text_1148": MessageLookupByLibrary.simpleMessage("请输入6位验证码"),
        "random_text_1149": MessageLookupByLibrary.simpleMessage("验证码正确"),
        "random_text_115": MessageLookupByLibrary.simpleMessage("代理佣金"),
        "random_text_1150": MessageLookupByLibrary.simpleMessage("登录密码修改成功"),
        "random_text_1151": MessageLookupByLibrary.simpleMessage(
            "是指垂直发展的成员，统一叫直属团队。\n\n(1) B1、B2、B3贡献给A、(8万+5万+3万) x0.20=3200。\n\n(2) C1、C2贡献给B1、(10万+4万)x0.018=2520。 \n\n(3) C3贡献给B3、61万x0.02=12200。"),
        "random_text_1152": MessageLookupByLibrary.simpleMessage(
            "是指下级、下下级、下下下级...等发展的成员，统一叫其他团队，本公司可无限发展下级，二级结构作为例子阐述。\n\n(1) 来自C1、C2因B1总业绩14万、只享受0.018的返佣比例、而A总业绩91万、享受0.02的返佣比例、那么A和B1之间产生了返佣差额为：0.02-0.018=0.002此差额即为C1和C2贡献给A的部分、所以C1和C2贡献给A：(10万+4万)×0.002=280。\n\n(2) 来自C3因B3总业绩61万、享受0.02的返佣比例、A总业绩91万、享受0.02返佣比例、那么A和B3之间产生的返佣差额为：0.02-0.02=0、C3贡献给A：61万x0/万=0。"),
        "random_text_1153": MessageLookupByLibrary.simpleMessage(
            "(1) C3给力，间接让A的所有业绩都享受更高返佣比例。 \n\n(2) B2可能比较懒，没有发展下级，则无收益。\n\n(3) B3虽然加入比较晚，且属于A的下级，但其下级C3给力，让B3直接享受更高返佣比例，所以B3无论何时加入，处于谁的下级，不管身处于第几级，收益永远不受影响，不再吃他人下级的亏，发展也不被制约。\n\n(4) 这是一套绝对公平公正的代理模式，并不会因为谁加入得晚，而永远被踩在脚下。"),
        "random_text_1154": MessageLookupByLibrary.simpleMessage("佣金比例表如下"),
        "random_text_1155": MessageLookupByLibrary.simpleMessage("必须达到"),
        "random_text_1156": MessageLookupByLibrary.simpleMessage("解锁聊天功能"),
        "random_text_1157": MessageLookupByLibrary.simpleMessage("发送失败"),
        "random_text_1158": MessageLookupByLibrary.simpleMessage("原创"),
        "random_text_1159": MessageLookupByLibrary.simpleMessage("您当前无奖金可领取"),
        "random_text_116": MessageLookupByLibrary.simpleMessage("是"),
        "random_text_1160": MessageLookupByLibrary.simpleMessage("您当前无返水可领取"),
        "random_text_1161":
            MessageLookupByLibrary.simpleMessage("您必须验证您的手机号码才能进行提款"),
        "random_text_1162": MessageLookupByLibrary.simpleMessage("验证码"),
        "random_text_1163":
            MessageLookupByLibrary.simpleMessage("当前兑换的货币将根据市场实时汇率进行兑换"),
        "random_text_1164": MessageLookupByLibrary.simpleMessage("国际电话区号"),
        "random_text_1165": MessageLookupByLibrary.simpleMessage("邀请好友 1-10 人"),
        "random_text_1166": MessageLookupByLibrary.simpleMessage("送15/人"),
        "random_text_1167": MessageLookupByLibrary.simpleMessage("分享"),
        "random_text_1168": MessageLookupByLibrary.simpleMessage("投注编号"),
        "random_text_1169": MessageLookupByLibrary.simpleMessage("请输入反馈内容"),
        "random_text_117": MessageLookupByLibrary.simpleMessage("否"),
        "random_text_1170": MessageLookupByLibrary.simpleMessage("消息中心"),
        "random_text_1171": MessageLookupByLibrary.simpleMessage("PIX类型"),
        "random_text_1172": MessageLookupByLibrary.simpleMessage("请以英文字母开头"),
        "random_text_1173": MessageLookupByLibrary.simpleMessage("最小字符长度为"),
        "random_text_1174": MessageLookupByLibrary.simpleMessage("让球"),
        "random_text_1175": MessageLookupByLibrary.simpleMessage("DD"),
        "random_text_1176": MessageLookupByLibrary.simpleMessage("Meibo Safe"),
        "random_text_1177": MessageLookupByLibrary.simpleMessage("邀请好友"),
        "random_text_1178": MessageLookupByLibrary.simpleMessage("暂无反馈"),
        "random_text_1179": MessageLookupByLibrary.simpleMessage("MM月dd日"),
        "random_text_118": MessageLookupByLibrary.simpleMessage("在线"),
        "random_text_1180":
            MessageLookupByLibrary.simpleMessage("注意：请仔细核对收款地址，支付完成请点击我已支付"),
        "random_text_1181": MessageLookupByLibrary.simpleMessage("网路"),
        "random_text_1182": MessageLookupByLibrary.simpleMessage("收款地址"),
        "random_text_1183": MessageLookupByLibrary.simpleMessage("支付金额"),
        "random_text_1184": MessageLookupByLibrary.simpleMessage("取消存款"),
        "random_text_1185": MessageLookupByLibrary.simpleMessage("我已支付"),
        "random_text_1186": MessageLookupByLibrary.simpleMessage("银行名称"),
        "random_text_1187": MessageLookupByLibrary.simpleMessage("银行账号"),
        "random_text_1188": MessageLookupByLibrary.simpleMessage("请选择PIX类型"),
        "random_text_1189": MessageLookupByLibrary.simpleMessage("请选择银行名称"),
        "random_text_119": MessageLookupByLibrary.simpleMessage("离线"),
        "random_text_12": MessageLookupByLibrary.simpleMessage("四月"),
        "random_text_120": MessageLookupByLibrary.simpleMessage("次"),
        "random_text_120_copy": MessageLookupByLibrary.simpleMessage("次"),
        "random_text_121": MessageLookupByLibrary.simpleMessage("是否首存"),
        "random_text_122": MessageLookupByLibrary.simpleMessage("上次登录"),
        "random_text_123": MessageLookupByLibrary.simpleMessage("在线状态"),
        "random_text_124": MessageLookupByLibrary.simpleMessage("次数"),
        "random_text_125": MessageLookupByLibrary.simpleMessage("体育-"),
        "random_text_126": MessageLookupByLibrary.simpleMessage("查看"),
        "random_text_127": MessageLookupByLibrary.simpleMessage("结算时间"),
        "random_text_128": MessageLookupByLibrary.simpleMessage("类型"),
        "random_text_129": MessageLookupByLibrary.simpleMessage("业绩"),
        "random_text_13": MessageLookupByLibrary.simpleMessage("五月"),
        "random_text_132": MessageLookupByLibrary.simpleMessage("下一页:"),
        "random_text_133": MessageLookupByLibrary.simpleMessage("搜索:"),
        "random_text_134": MessageLookupByLibrary.simpleMessage("下级人数"),
        "random_text_135": MessageLookupByLibrary.simpleMessage("贡献佣金"),
        "random_text_136": MessageLookupByLibrary.simpleMessage("微信"),
        "random_text_137": MessageLookupByLibrary.simpleMessage("累计佣金"),
        "random_text_138": MessageLookupByLibrary.simpleMessage("已领取佣金"),
        "random_text_139": MessageLookupByLibrary.simpleMessage("上次佣金"),
        "random_text_14": MessageLookupByLibrary.simpleMessage("六月"),
        "random_text_140": MessageLookupByLibrary.simpleMessage("团队总数"),
        "random_text_141": MessageLookupByLibrary.simpleMessage("1人"),
        "random_text_142": MessageLookupByLibrary.simpleMessage("直属成员"),
        "random_text_143": MessageLookupByLibrary.simpleMessage("其他成员"),
        "random_text_144": MessageLookupByLibrary.simpleMessage("直属业绩"),
        "random_text_145": MessageLookupByLibrary.simpleMessage("其他业绩"),
        "random_text_146": MessageLookupByLibrary.simpleMessage("下属的投注"),
        "random_text_147": MessageLookupByLibrary.simpleMessage("有效投注额"),
        "random_text_148": MessageLookupByLibrary.simpleMessage("总投注单"),
        "random_text_149": MessageLookupByLibrary.simpleMessage("999,999,999单"),
        "random_text_15": MessageLookupByLibrary.simpleMessage("七月"),
        "random_text_150": MessageLookupByLibrary.simpleMessage("总输/赢"),
        "random_text_151": MessageLookupByLibrary.simpleMessage("复制成功"),
        "random_text_152": MessageLookupByLibrary.simpleMessage("推广信息"),
        "random_text_153": MessageLookupByLibrary.simpleMessage("更多"),
        "random_text_154": MessageLookupByLibrary.simpleMessage("点击保存二维码"),
        "random_text_155": MessageLookupByLibrary.simpleMessage("我的链接"),
        "random_text_156": MessageLookupByLibrary.simpleMessage("点击"),
        "random_text_157": MessageLookupByLibrary.simpleMessage("总业绩"),
        "random_text_158": MessageLookupByLibrary.simpleMessage("101万"),
        "random_text_159": MessageLookupByLibrary.simpleMessage("，总代理奖金"),
        "random_text_16": MessageLookupByLibrary.simpleMessage("八月"),
        "random_text_160": MessageLookupByLibrary.simpleMessage("16万"),
        "random_text_161": MessageLookupByLibrary.simpleMessage("，贡献"),
        "random_text_162": MessageLookupByLibrary.simpleMessage("85万"),
        "random_text_163": MessageLookupByLibrary.simpleMessage("直属"),
        "random_text_164": MessageLookupByLibrary.simpleMessage("贡献给"),
        "random_text_166": MessageLookupByLibrary.simpleMessage("和"),
        "random_text_167": MessageLookupByLibrary.simpleMessage("下级总业绩"),
        "random_text_168": MessageLookupByLibrary.simpleMessage("14万\n"),
        "random_text_169": MessageLookupByLibrary.simpleMessage("享受"),
        "random_text_17": MessageLookupByLibrary.simpleMessage("九月"),
        "random_text_170": MessageLookupByLibrary.simpleMessage("80/万"),
        "random_text_171": MessageLookupByLibrary.simpleMessage("B1自己有\n效投注8万"),
        "random_text_172": MessageLookupByLibrary.simpleMessage("举例说明如下:"),
        "random_text_173": MessageLookupByLibrary.simpleMessage(
            "本站点返佣以有效投注为依据，假设返佣比例为左上角表格。A在本站第一个发现商机，马上发展了B1、B2和B3，B1又往下发展了C1和C2，B2无下级，B3只发展了比较有实力的C3。几天后，B1本人的有效投注为8万，B2本人的有效投注为5万，B3本人的有效投注为3万，C1本人的有效投注为10万，C2本人的有效投注为4万，C3本人的有效投注达71万，则B1总业绩来自C1和C2共14万，对应返佣比例为80/万；B2无下级业绩为0；B3下级C3给力，总业绩为71万，对应返佣比例为100/万；A有来自直属团队16万和来自其他团队85万，总业绩为101万，对应返佣比例是100/万那么他们之间的收益计算方式如下:"),
        "random_text_174": MessageLookupByLibrary.simpleMessage("1、直属团队: "),
        "random_text_175": MessageLookupByLibrary.simpleMessage("举例说明如下:\n"),
        "random_text_176": MessageLookupByLibrary.simpleMessage(
            "本站点返佣以有效投注为依据，假设返佣比例为左上角表格。A在本站第一个发现商机，马上发展了B1、B2和B3，B1又往下发展了C1和C2，B2无下级，B3只发展了比较有实力的C3。\n几天后，B1本人的有效投注为8万，B2本人的有效投注为5万，B3本人的有效投注为3万，C1本人的有效投注为10万，C2本人的有效投注为4万，C3本人的有效投注达71万，则B1总业绩来自C1和C2共14万，对应返佣比例为80/万；B2无下级业绩为0；B3下级C3给力，总业绩为71万，对应返佣比例为100/万；A有来自直属团队16万和来自其他团队85万，总业绩为101万，对应返佣比例是100/万。\n那么他们之间的收益计算方式如下:\n\n1、"),
        "random_text_177": MessageLookupByLibrary.simpleMessage("直属团队"),
        "random_text_178": MessageLookupByLibrary.simpleMessage(
            ": \n是指垂直发展的成员，统一叫直属团队。\n(1) B1，B2，B3贡献给A: (8万+5万+3万)x100/万=1600。\n(2) C1和C2贡献给B1: (10万+4万)x80/万=1120。\n(3) C3贡献给B3: 71万x100/万=7100。\n\n2、"),
        "random_text_179": MessageLookupByLibrary.simpleMessage("其他团队"),
        "random_text_18": MessageLookupByLibrary.simpleMessage("十月"),
        "random_text_180": MessageLookupByLibrary.simpleMessage(
            ": \n是指下级、下下级、下下下级...等发展的成员，统一叫其他团队；因本系统可无限发展下级，为便于解说，本文只取2级结构作为例子阐述。\n(1)来自C1和C2：因B1总业绩14万，只享受80/万的返佣比例，而A总业绩101万，享受100/万的返佣比例，那么A和B1之间产生了返佣差额为：100-80=20/万，此差额即为C1和C2贡献给A的部分，所以C1和C2贡献给A：(10万+4万)×20/万=280。\n(2)来自C3：因B3总业绩71万，享受100/万的返佣比例，A总业绩101万，享受100/万的返佣比例，那么A和B3之间产生的返佣差额为：100-100=0/万，C3贡献给A：71万x0/万=0。\n\n"),
        "random_text_181": MessageLookupByLibrary.simpleMessage("3、总结说明:\n"),
        "random_text_182": MessageLookupByLibrary.simpleMessage(
            "(1)C3给力，间接让A的所有业绩都享受更高返佣比例。\n(2)B2可能比较懒，没有发展下级，则无收益。\n(3)B3虽然加入比较晚，且属于A的下级，但其下级C3给力，让B3直接享受更高返佣比例，所以B3无论何时加入，处于谁的下级，不管身处于第几级，收益永远不受影响，不再吃他人下级的亏，发展也不被制约。\n(4)这是一套绝对公平公正的代理模式，并不会因为谁加入得晚，而永远被踩在脚下。"),
        "random_text_183": MessageLookupByLibrary.simpleMessage("输入会员账号"),
        "random_text_185": MessageLookupByLibrary.simpleMessage("提交注册"),
        "random_text_186": MessageLookupByLibrary.simpleMessage("按账号搜索"),
        "random_text_187": MessageLookupByLibrary.simpleMessage("选择时间"),
        "random_text_188": MessageLookupByLibrary.simpleMessage("全部类型"),
        "random_text_189": MessageLookupByLibrary.simpleMessage("累计佣金："),
        "random_text_19": MessageLookupByLibrary.simpleMessage("十一月"),
        "random_text_191": MessageLookupByLibrary.simpleMessage("页/"),
        "random_text_192": MessageLookupByLibrary.simpleMessage("页"),
        "random_text_194": MessageLookupByLibrary.simpleMessage("跳至"),
        "random_text_196": MessageLookupByLibrary.simpleMessage("内容数字"),
        "random_text_197": MessageLookupByLibrary.simpleMessage("最小字符长度为 3"),
        "random_text_198": MessageLookupByLibrary.simpleMessage("可用佣金:"),
        "random_text_199": MessageLookupByLibrary.simpleMessage("活动点击量"),
        "random_text_20": MessageLookupByLibrary.simpleMessage("十二月"),
        "random_text_200": MessageLookupByLibrary.simpleMessage("可用金额"),
        "random_text_201": MessageLookupByLibrary.simpleMessage("可用金融"),
        "random_text_203": MessageLookupByLibrary.simpleMessage(
            "我们所有的游戏都带有不同的庄家优势百分比。您可以使用以下公式来计算您的佣金："),
        "random_text_204": MessageLookupByLibrary.simpleMessage(
            "所有体育投注均以 3% 的理论庄家优势进行。您可以使用以下公式来计算您的佣金："),
        "random_text_205": MessageLookupByLibrary.simpleMessage(
            "您若是个影响力极佳并能触及广大群众，或是处在其他特殊情况下的联盟会员，可请联系我们杰出的支持团队。经与联盟经理人讨论后，我们可争取为您定制一套联盟计划。这可能包括更高的佣金。"),
        "random_text_206": MessageLookupByLibrary.simpleMessage(
            "在 meibo.com 这里，玩家的满意度一直以来——也将一直都会——是第一要务。这是我们为以玩家和联盟会员身份与平台互动的用户们制定长期战略的核心。我们力求通过独特的计划和活动来奖励我们的玩家，达到玩家的满意。\n这些计划提供额外的资金和奖励，不仅为玩家们带来了更好的博彩体验，也有助于增加联盟佣金的总收入。\n计划包括：\n返水\n周度奖金\n月度奖金\n每小时 / 每日充值奖金\nVIP 级别奖金\n用这独特的方法，您的佣金是以实现这些成本后的庄家优势为依据。按照玩家获得福利的程度，您收到的庄家优势佣金将是任何游戏所宣传的大约少于 45% 的庄家优势。\n若您想要详细了解费用计算的细目，请随时通过支持人员与联盟经理联系。"),
        "random_text_207": MessageLookupByLibrary.simpleMessage(""),
        "random_text_209": MessageLookupByLibrary.simpleMessage("总存款次数"),
        "random_text_21":
            MessageLookupByLibrary.simpleMessage("步骤2/2:\t\t阅读并接受条款与条件"),
        "random_text_210":
            MessageLookupByLibrary.simpleMessage("可用金融\n2023-08-22"),
        "random_text_211": MessageLookupByLibrary.simpleMessage(
            "加入 meibo.com 的联盟计划，以推荐我们的品牌赚钱! 每当一位用户通过您的推荐链接注册并使用 meibo.com，您便会收到联盟佣金。\n身为 meibo.com 的联盟会员，所赚的佣金将以推荐用户在娱乐城和体育博彩中的总投注为依据。这跟传统联盟计划的不同之处在于无论推荐用户是赢或输，您都能获得同样的佣金！"),
        "random_text_212": MessageLookupByLibrary.simpleMessage("下载横幅"),
        "random_text_216": MessageLookupByLibrary.simpleMessage("暂无未结算的投注"),
        "random_text_217": MessageLookupByLibrary.simpleMessage("  立即开始下注！"),
        "random_text_218": MessageLookupByLibrary.simpleMessage("暂无已结算的投注"),
        "random_text_220": MessageLookupByLibrary.simpleMessage("支付额"),
        "random_text_220copy": MessageLookupByLibrary.simpleMessage("支付额"),
        "random_text_221": MessageLookupByLibrary.simpleMessage("暂无娱乐城投注"),
        "random_text_223": MessageLookupByLibrary.simpleMessage("于 "),
        "random_text_224": MessageLookupByLibrary.simpleMessage("乘数"),
        "random_text_225": MessageLookupByLibrary.simpleMessage("前往 "),
        "random_text_227": MessageLookupByLibrary.simpleMessage("投注额"),
        "random_text_228": MessageLookupByLibrary.simpleMessage("预计支付额"),
        "random_text_229": MessageLookupByLibrary.simpleMessage("兑现"),
        "random_text_232": MessageLookupByLibrary.simpleMessage("平"),
        "random_text_233": MessageLookupByLibrary.simpleMessage("赢一半"),
        "random_text_234": MessageLookupByLibrary.simpleMessage("输一半"),
        "random_text_235": MessageLookupByLibrary.simpleMessage("输部分"),
        "random_text_237": MessageLookupByLibrary.simpleMessage("投注者:"),
        "random_text_238": MessageLookupByLibrary.simpleMessage("隐身"),
        "random_text_239": MessageLookupByLibrary.simpleMessage("注册进行投注"),
        "random_text_241": MessageLookupByLibrary.simpleMessage("投注单为空"),
        "random_text_243": MessageLookupByLibrary.simpleMessage("之间的金额"),
        "random_text_244": MessageLookupByLibrary.simpleMessage("的"),
        "random_text_245":
            MessageLookupByLibrary.simpleMessage("该场馆暂不支持您所选的币种"),
        "random_text_246": MessageLookupByLibrary.simpleMessage("您有暂停的投注项"),
        "random_text_247":
            MessageLookupByLibrary.simpleMessage("同时最多只能添加10个投注项"),
        "random_text_248": MessageLookupByLibrary.simpleMessage("您有已关闭的投注项"),
        "random_text_249": MessageLookupByLibrary.simpleMessage("您的账户余额不足"),
        "random_text_250": MessageLookupByLibrary.simpleMessage("获取投注信息失败"),
        "random_text_251": MessageLookupByLibrary.simpleMessage("您有不支持复式投注的投注"),
        "random_text_252":
            MessageLookupByLibrary.simpleMessage("同一赛事的多个投注项不能组合为复式投注。"),
        "random_text_253": MessageLookupByLibrary.simpleMessage("越南-荷兰"),
        "random_text_254": MessageLookupByLibrary.simpleMessage("获胜"),
        "random_text_255": MessageLookupByLibrary.simpleMessage("荷兰"),
        "random_text_256": MessageLookupByLibrary.simpleMessage("胜负平"),
        "random_text_257": MessageLookupByLibrary.simpleMessage("聊天室规则"),
        "random_text_258": MessageLookupByLibrary.simpleMessage(
            "1. 请勿在聊天时发送垃圾消息并避免使用过多的大写字母。\n2. 请勿骚扰或冒犯其他用户及 Stake 工作人员。\n3. 请勿分享您或其他玩家的任何个人信息（包括社交媒体账号） \n4. 请勿向其他用户讨钱或要求贷款、下红包雨、或小费。 \n5. 严禁使用除了主账户外您任何其他账户聊天。 \n6. 不允许可被视为诈骗的可疑行为。 \n7. 请勿从事任何形式的广告/交易/销售/购买/提供服务。 \n8. 请勿讨论直播主、 Twitch 或任何其他类似平台。 \n9. 请勿使用网址缩短服务。一定要提交完整的链接。 \n10. 请勿分享编码、脚本或任何机器人程序的服务。 \n11. 请只使用聊天室指定的语言聊天，潜在的滥用行为将受到制裁。 \n12. 严禁谈论政治与宗教话题。"),
        "random_text_260": MessageLookupByLibrary.simpleMessage("近期游戏"),
        "random_text_263": MessageLookupByLibrary.simpleMessage("1,000 在玩"),
        "random_text_265": MessageLookupByLibrary.simpleMessage("重点介绍"),
        "random_text_268": MessageLookupByLibrary.simpleMessage("竞赛类排行榜"),
        "random_text_272": MessageLookupByLibrary.simpleMessage("福索维-泽夫勒"),
        "random_text_273": MessageLookupByLibrary.simpleMessage("大赢家"),
        "random_text_274": MessageLookupByLibrary.simpleMessage("幸运赢家"),
        "random_text_275": MessageLookupByLibrary.simpleMessage(
            "Wanted Dead or a Wild 暂无任何活跃的挑战"),
        "random_text_276": MessageLookupByLibrary.simpleMessage("庄家优势:"),
        "random_text_277": MessageLookupByLibrary.simpleMessage("百家乐"),
        "random_text_279": MessageLookupByLibrary.simpleMessage("桌面游戏"),
        "random_text_28": MessageLookupByLibrary.simpleMessage(
            "加入 meibo.com 的联盟计划，以推荐我们的品牌赚钱! 每当一位用户通过您的推荐链接注册并使用 meibo.com，您便会收到联盟佣金。"),
        "random_text_280":
            MessageLookupByLibrary.simpleMessage("\$100k 竞赛 - 24 小时"),
        "random_text_281": MessageLookupByLibrary.simpleMessage("结束时间：8小时后"),
        "random_text_282": MessageLookupByLibrary.simpleMessage("排名"),
        "random_text_286": MessageLookupByLibrary.simpleMessage("赛事"),
        "random_text_287": MessageLookupByLibrary.simpleMessage("更明智地下注"),
        "random_text_288": MessageLookupByLibrary.simpleMessage("立即注册"),
        "random_text_29": MessageLookupByLibrary.simpleMessage(
            "身为 meibo.com 的联盟会员，所赚的佣金将以推荐用户在娱乐城和体育博彩中的总投注为依据。这跟传统联盟计划的不同之处在于无论推荐用户是赢或输，您都能获得同样的佣金！"),
        "random_text_290": MessageLookupByLibrary.simpleMessage("欢迎归来，"),
        "random_text_296": MessageLookupByLibrary.simpleMessage("¥75000周度抽奖活动"),
        "random_text_297":
            MessageLookupByLibrary.simpleMessage("¥100,000竞赛-24小时"),
        "random_text_298":
            MessageLookupByLibrary.simpleMessage("Pragmatic空投奖金"),
        "random_text_3": MessageLookupByLibrary.simpleMessage("日期不能超过31号"),
        "random_text_30": MessageLookupByLibrary.simpleMessage("推荐链接"),
        "random_text_300": MessageLookupByLibrary.simpleMessage("阿尔法·罗密欧F1车队"),
        "random_text_301": MessageLookupByLibrary.simpleMessage("埃弗顿足球俱乐部"),
        "random_text_302": MessageLookupByLibrary.simpleMessage("坤·阿奎罗"),
        "random_text_303": MessageLookupByLibrary.simpleMessage("伊斯利·阿迪萨亚"),
        "random_text_304": MessageLookupByLibrary.simpleMessage("杰尔顿·阿尔梅达"),
        "random_text_305": MessageLookupByLibrary.simpleMessage("排球国家联赛"),
        "random_text_306": MessageLookupByLibrary.simpleMessage("：中文"),
        "random_text_307": MessageLookupByLibrary.simpleMessage("中文"),
        "random_text_308": MessageLookupByLibrary.simpleMessage("俱乐部友谊赛"),
        "random_text_309": MessageLookupByLibrary.simpleMessage("女足世界杯"),
        "random_text_31": MessageLookupByLibrary.simpleMessage("复制"),
        "random_text_310": MessageLookupByLibrary.simpleMessage("WTA大阪，日本，单打"),
        "random_text_311": MessageLookupByLibrary.simpleMessage("戴维斯杯网球锦标赛"),
        "random_text_312": MessageLookupByLibrary.simpleMessage("美国职业棒球大联盟"),
        "random_text_313": MessageLookupByLibrary.simpleMessage("韩国职业棒球联盟"),
        "random_text_314": MessageLookupByLibrary.simpleMessage("美式橄榄球"),
        "random_text_315": MessageLookupByLibrary.simpleMessage("美国职业橄榄球大联盟"),
        "random_text_316":
            MessageLookupByLibrary.simpleMessage("国家大学体育协会，常规赛季"),
        "random_text_317": MessageLookupByLibrary.simpleMessage("国家女子篮球协会"),
        "random_text_318": MessageLookupByLibrary.simpleMessage("全英篮球联赛"),
        "random_text_319": MessageLookupByLibrary.simpleMessage("彩虹六号"),
        "random_text_32": MessageLookupByLibrary.simpleMessage(
            "在 meibo.com 这里，玩家的满意度一直以来——也将一直都会——是第一要务。这是我们为以玩家和联盟会员身份与平台互动的用户们制定长期战略的核心。我们力求通过独特的计划和活动来奖励我们的玩家，达到玩家的满意。"),
        "random_text_321": MessageLookupByLibrary.simpleMessage("守望先锋"),
        "random_text_322": MessageLookupByLibrary.simpleMessage("王者荣耀"),
        "random_text_323": MessageLookupByLibrary.simpleMessage("无尽对决"),
        "random_text_324": MessageLookupByLibrary.simpleMessage("无谓契约"),
        "random_text_326": MessageLookupByLibrary.simpleMessage("3对3篮球"),
        "random_text_327": MessageLookupByLibrary.simpleMessage("澳洲篮球"),
        "random_text_328": MessageLookupByLibrary.simpleMessage("板球"),
        "random_text_329": MessageLookupByLibrary.simpleMessage("冰上曲棍球"),
        "random_text_33": MessageLookupByLibrary.simpleMessage(
            "这些计划提供额外的资金和奖励，不仅为玩家们带来了更好的博彩体验，也有助于增加联盟佣金的总收入。"),
        "random_text_330": MessageLookupByLibrary.simpleMessage("登山"),
        "random_text_331": MessageLookupByLibrary.simpleMessage("飞镖"),
        "random_text_332": MessageLookupByLibrary.simpleMessage("芬兰棒球"),
        "random_text_333": MessageLookupByLibrary.simpleMessage("改装车比赛"),
        "random_text_334": MessageLookupByLibrary.simpleMessage("高尔夫"),
        "random_text_335": MessageLookupByLibrary.simpleMessage("Odds：小数式"),
        "random_text_336": MessageLookupByLibrary.simpleMessage("语言：中文"),
        "random_text_337":
            MessageLookupByLibrary.simpleMessage("需要至少3个字符来进行搜索。"),
        "random_text_34": MessageLookupByLibrary.simpleMessage("计划包括："),
        "random_text_343": MessageLookupByLibrary.simpleMessage("APP更新"),
        "random_text_344": MessageLookupByLibrary.simpleMessage("备注"),
        "random_text_345": MessageLookupByLibrary.simpleMessage("正准备下载..."),
        "random_text_346": MessageLookupByLibrary.simpleMessage("下载完成"),
        "random_text_347": MessageLookupByLibrary.simpleMessage("提示"),
        "random_text_348": MessageLookupByLibrary.simpleMessage("下载失败，请确保网络通畅"),
        "random_text_349": MessageLookupByLibrary.simpleMessage("立即重试"),
        "random_text_35": MessageLookupByLibrary.simpleMessage("• 返水"),
        "random_text_350": MessageLookupByLibrary.simpleMessage("稍后尝试"),
        "random_text_351": MessageLookupByLibrary.simpleMessage("跨页面传参"),
        "random_text_352": MessageLookupByLibrary.simpleMessage("比赛详情"),
        "random_text_353": MessageLookupByLibrary.simpleMessage("最幸运奖杯1"),
        "random_text_354": MessageLookupByLibrary.simpleMessage("最幸运奖杯2"),
        "random_text_355": MessageLookupByLibrary.simpleMessage("最幸运奖杯3"),
        "random_text_357":
            MessageLookupByLibrary.simpleMessage("加入日期: 2023/07/01"),
        "random_text_357copy2": MessageLookupByLibrary.simpleMessage("加入日期: "),
        "random_text_358": MessageLookupByLibrary.simpleMessage("日期"),
        "random_text_359": MessageLookupByLibrary.simpleMessage("抽奖券"),
        "random_text_36": MessageLookupByLibrary.simpleMessage("• 周度奖金"),
        "random_text_360": MessageLookupByLibrary.simpleMessage("最幸运奖杯"),
        "random_text_362": MessageLookupByLibrary.simpleMessage("请求统计数据"),
        "random_text_363":
            MessageLookupByLibrary.simpleMessage("统计数据请求限制为每天24小时5次。"),
        "random_text_364": MessageLookupByLibrary.simpleMessage("正文01"),
        "random_text_365": MessageLookupByLibrary.simpleMessage("一日"),
        "random_text_366": MessageLookupByLibrary.simpleMessage("一个星期"),
        "random_text_367": MessageLookupByLibrary.simpleMessage("一个月"),
        "random_text_368": MessageLookupByLibrary.simpleMessage("三个月"),
        "random_text_369": MessageLookupByLibrary.simpleMessage("六个月"),
        "random_text_37": MessageLookupByLibrary.simpleMessage("• 月度奖金"),
        "random_text_370": MessageLookupByLibrary.simpleMessage("一年"),
        "random_text_371": MessageLookupByLibrary.simpleMessage("永久性"),
        "random_text_372": MessageLookupByLibrary.simpleMessage("22:43 后可编辑"),
        "random_text_373": MessageLookupByLibrary.simpleMessage("赌博限额"),
        "random_text_374":
            MessageLookupByLibrary.simpleMessage("赌博限额已设定为 1000.00/天"),
        "random_text_375": MessageLookupByLibrary.simpleMessage(
            "通过使用损失或投注限制来控制您的游戏或投注。这些限制允许您控制设定时间段内的最大损失或下注金额。对这些限制的任何更改都需要 24 小时的冷静期。"),
        "random_text_377": MessageLookupByLibrary.simpleMessage(
            "需要从 meibo.com 小休片刻吗？若要开始自动的自我排除过程，请点击下面的按钮以通过电邮接收确认说明。"),
        "random_text_378":
            MessageLookupByLibrary.simpleMessage("您的电邮地址必须经过验证后才能启动自我排除。"),
        "random_text_38":
            MessageLookupByLibrary.simpleMessage("• 每小时 / 每日充值奖金"),
        "random_text_380": MessageLookupByLibrary.simpleMessage("冷静期 23:33:12"),
        "random_text_381": MessageLookupByLibrary.simpleMessage("持续时间"),
        "random_text_383": MessageLookupByLibrary.simpleMessage("已设置自我排除"),
        "random_text_384":
            MessageLookupByLibrary.simpleMessage("您已将账户设置为自我排除模式"),
        "random_text_385": MessageLookupByLibrary.simpleMessage(
            "免责声明：在此做出的任何决定均为最终决定，并不可撤销。在提交您自我排除的请求之前，请提取您账户中的任何剩余余额。"),
        "random_text_386": MessageLookupByLibrary.simpleMessage("了解更多有关"),
        "random_text_387": MessageLookupByLibrary.simpleMessage("的消息"),
        "random_text_388": MessageLookupByLibrary.simpleMessage("标题"),
        "random_text_389": MessageLookupByLibrary.simpleMessage("消息"),
        "random_text_39": MessageLookupByLibrary.simpleMessage("• VIP 级别奖金"),
        "random_text_390": MessageLookupByLibrary.simpleMessage("日本-西班牙"),
        "random_text_391": MessageLookupByLibrary.simpleMessage("胜平负"),
        "random_text_392": MessageLookupByLibrary.simpleMessage("平局"),
        "random_text_393": MessageLookupByLibrary.simpleMessage("下半场"),
        "random_text_394": MessageLookupByLibrary.simpleMessage("兑换 1.00000"),
        "random_text_395": MessageLookupByLibrary.simpleMessage("投资者: Mamama"),
        "random_text_396":
            MessageLookupByLibrary.simpleMessage("于 2023/08/07 的 17:50"),
        "random_text_397": MessageLookupByLibrary.simpleMessage("成数："),
        "random_text_398": MessageLookupByLibrary.simpleMessage("支付额："),
        "random_text_4": MessageLookupByLibrary.simpleMessage("正在加载..."),
        "random_text_40": MessageLookupByLibrary.simpleMessage(
            "用这独特的方法，您的佣金是以实现这些成本后的庄家优势为依据。按照玩家获得福利的程度，您收到的庄家优势佣金将是任何游戏所宣传的大约少于 45% 的庄家优势。"),
        "random_text_403": MessageLookupByLibrary.simpleMessage("返水"),
        "random_text_404": MessageLookupByLibrary.simpleMessage("日俸禄"),
        "random_text_405": MessageLookupByLibrary.simpleMessage("周俸禄"),
        "random_text_406": MessageLookupByLibrary.simpleMessage("月俸禄"),
        "random_text_407": MessageLookupByLibrary.simpleMessage("暂无可领取活动礼金"),
        "random_text_408": MessageLookupByLibrary.simpleMessage("成功领取活动礼金 "),
        "random_text_409": MessageLookupByLibrary.simpleMessage("已达到最高等级"),
        "random_text_41": MessageLookupByLibrary.simpleMessage(
            "若您想要详细了解费用计算的细目，请随时通过支持人员与联盟经理联系。"),
        "random_text_410": MessageLookupByLibrary.simpleMessage("未领取"),
        "random_text_412": MessageLookupByLibrary.simpleMessage("已升级"),
        "random_text_413": MessageLookupByLibrary.simpleMessage("可领取"),
        "random_text_414": MessageLookupByLibrary.simpleMessage("待升级"),
        "random_text_415": MessageLookupByLibrary.simpleMessage("升级奖励"),
        "random_text_416": MessageLookupByLibrary.simpleMessage("助推奖金"),
        "random_text_417": MessageLookupByLibrary.simpleMessage(
            "您可以预期每周和每月根据您的游戏量获得奖金。玩得越多，获得的奖金就越多。"),
        "random_text_418": MessageLookupByLibrary.simpleMessage("近期游戏表现奖金"),
        "random_text_419": MessageLookupByLibrary.simpleMessage(
            "运气不佳？Stake 会在您每次升级时根据您的损失提供额外资金。"),
        "random_text_42": MessageLookupByLibrary.simpleMessage(
            "保留计划可让您的推荐用户在体育博彩和娱乐城里使用。不过，在计算体育投注的联盟佣金之前，保留计划的费用已被吸收，好让我们可设定标准的 3% 假定利润率。"),
        "random_text_420": MessageLookupByLibrary.simpleMessage("专属 VIP 服务代表"),
        "random_text_421": MessageLookupByLibrary.simpleMessage(
            "被分配一名将支持并满足您的投注需求的专属 VIP 服务代表。"),
        "random_text_422": MessageLookupByLibrary.simpleMessage("升级奖金"),
        "random_text_423": MessageLookupByLibrary.simpleMessage(
            "在每达到下个级别后获取奖金。所达级别越高，升级奖金就越大。"),
        "random_text_424": MessageLookupByLibrary.simpleMessage(
            "与您的专属 VIP 服务代表合作，根据您的投注需求定制福利。"),
        "random_text_425": MessageLookupByLibrary.simpleMessage("VIP级别对照"),
        "random_text_426": MessageLookupByLibrary.simpleMessage("投注金额"),
        "random_text_427": MessageLookupByLibrary.simpleMessage("月度奖金"),
        "random_text_428": MessageLookupByLibrary.simpleMessage("周度奖金"),
        "random_text_429": MessageLookupByLibrary.simpleMessage("每日奖金\n充值奖金"),
        "random_text_430": MessageLookupByLibrary.simpleMessage("奖金增长"),
        "random_text_431": MessageLookupByLibrary.simpleMessage("专属VIP服务\n代表"),
        "random_text_432": MessageLookupByLibrary.simpleMessage("万"),
        "random_text_433": MessageLookupByLibrary.simpleMessage("无与伦比的 VIP 体验"),
        "random_text_434":
            MessageLookupByLibrary.simpleMessage("解锁专属福利并获得无需任何附加条件即可立即提取的奖金。"),
        "random_text_436": MessageLookupByLibrary.simpleMessage("查看VIP级别表"),
        "random_text_437": MessageLookupByLibrary.simpleMessage("入门手册"),
        "random_text_438":
            MessageLookupByLibrary.simpleMessage("成为 VIP 是个既简单又富有回报的过程"),
        "random_text_439": MessageLookupByLibrary.simpleMessage("第一步"),
        "random_text_44": MessageLookupByLibrary.simpleMessage("(o 存款)"),
        "random_text_440": MessageLookupByLibrary.simpleMessage(
            "您的每笔赌注都会影响您 VIP 级别的进度。达到下个级别以解锁更多福利。"),
        "random_text_441": MessageLookupByLibrary.simpleMessage("第二步"),
        "random_text_442": MessageLookupByLibrary.simpleMessage("第三步"),
        "random_text_443": MessageLookupByLibrary.simpleMessage(
            "立即领取您的奖金。领取每日、周度和月度奖金的过程既简单又容易。"),
        "random_text_444": MessageLookupByLibrary.simpleMessage("体验"),
        "random_text_445": MessageLookupByLibrary.simpleMessage("奖励"),
        "random_text_446":
            MessageLookupByLibrary.simpleMessage("每次升级都能得到更棒的奖励"),
        "random_text_447": MessageLookupByLibrary.simpleMessage("支付宝账号"),
        "random_text_448": MessageLookupByLibrary.simpleMessage("绑定支付宝"),
        "random_text_449":
            MessageLookupByLibrary.simpleMessage("最低提款金额为：0.00020000"),
        "random_text_450": MessageLookupByLibrary.simpleMessage("我们将从您的余额扣除"),
        "random_text_451": MessageLookupByLibrary.simpleMessage("作为您提款的交易费用。"),
        "random_text_452": MessageLookupByLibrary.simpleMessage("搜索货币"),
        "random_text_453": MessageLookupByLibrary.simpleMessage("请输入完整验证码"),
        "random_text_455": MessageLookupByLibrary.simpleMessage("设置交易密码"),
        "random_text_456":
            MessageLookupByLibrary.simpleMessage("启用双重验证以让您的账户更加安全。"),
        "random_text_457": MessageLookupByLibrary.simpleMessage(
            "将代码复制到您的身份验证器应用程序（Authenticator App）"),
        "random_text_458": MessageLookupByLibrary.simpleMessage("防止他人看到此页！"),
        "random_text_46": MessageLookupByLibrary.simpleMessage("存款次数"),
        "random_text_461": MessageLookupByLibrary.simpleMessage("解除拉黑"),
        "random_text_462": MessageLookupByLibrary.simpleMessage("绑定加密货币收款地址"),
        "random_text_463": MessageLookupByLibrary.simpleMessage("绑定法币收款地址"),
        "random_text_464": MessageLookupByLibrary.simpleMessage("请输入开户人姓名"),
        "random_text_465":
            MessageLookupByLibrary.simpleMessage("绑定后不可更改，仅可新增当前开户人的支付方式"),
        "random_text_468": MessageLookupByLibrary.simpleMessage("银行账户"),
        "random_text_47": MessageLookupByLibrary.simpleMessage("代理等级"),
        "random_text_471":
            MessageLookupByLibrary.simpleMessage("每种货币可绑定5个提款方式"),
        "random_text_472":
            MessageLookupByLibrary.simpleMessage("每种加密货币最多可绑定2个提款地址"),
        "random_text_473": MessageLookupByLibrary.simpleMessage("新增"),
        "random_text_474": MessageLookupByLibrary.simpleMessage("电邮已发送至 \n"),
        "random_text_475": MessageLookupByLibrary.simpleMessage("电邮已发送"),
        "random_text_476": MessageLookupByLibrary.simpleMessage("成功更新电邮地址"),
        "random_text_477": MessageLookupByLibrary.simpleMessage("确认电邮已发送至 \n"),
        "random_text_478": MessageLookupByLibrary.simpleMessage("成功更新手机号码"),
        "random_text_479": MessageLookupByLibrary.simpleMessage("手机号码已更新为 "),
        "random_text_48": MessageLookupByLibrary.simpleMessage("晋升条件"),
        "random_text_481": MessageLookupByLibrary.simpleMessage("登录时间"),
        "random_text_482": MessageLookupByLibrary.simpleMessage("浏览器"),
        "random_text_483": MessageLookupByLibrary.simpleMessage("地区"),
        "random_text_485": MessageLookupByLibrary.simpleMessage("支付宝"),
        "random_text_486": MessageLookupByLibrary.simpleMessage("早盘"),
        "random_text_487": MessageLookupByLibrary.simpleMessage("冠军赛事"),
        "random_text_488": MessageLookupByLibrary.simpleMessage("联赛"),
        "random_text_489": MessageLookupByLibrary.simpleMessage("所有体育"),
        "random_text_49": MessageLookupByLibrary.simpleMessage("加入时间"),
        "random_text_491": MessageLookupByLibrary.simpleMessage("全场"),
        "random_text_492": MessageLookupByLibrary.simpleMessage("上半场"),
        "random_text_493": MessageLookupByLibrary.simpleMessage("按字母顺序排序"),
        "random_text_494": MessageLookupByLibrary.simpleMessage("测试"),
        "random_text_495": MessageLookupByLibrary.simpleMessage("复式投注 (2)"),
        "random_text_496": MessageLookupByLibrary.simpleMessage("竞赛24 小时"),
        "random_text_5": MessageLookupByLibrary.simpleMessage("注册成功"),
        "random_text_500": MessageLookupByLibrary.simpleMessage("搜索赛事"),
        "random_text_501": MessageLookupByLibrary.simpleMessage("最小字符长度为3"),
        "random_text_502": MessageLookupByLibrary.simpleMessage("最小字符长度为8"),
        "random_text_503": MessageLookupByLibrary.simpleMessage("电子邮件域不受支持"),
        "random_text_504":
            MessageLookupByLibrary.simpleMessage("请在您的电邮地址中加入 “.” 符号"),
        "random_text_505": MessageLookupByLibrary.simpleMessage("请输入有效的电邮地址"),
        "random_text_506":
            MessageLookupByLibrary.simpleMessage("您的用户名必须含有至少 3 个字符"),
        "random_text_507":
            MessageLookupByLibrary.simpleMessage("您的用户名不得超过 14 个字符"),
        "random_text_508":
            MessageLookupByLibrary.simpleMessage("年份必须大于或等于1900"),
        "random_text_509": MessageLookupByLibrary.simpleMessage("您的年龄不能超过120岁"),
        "random_text_51": MessageLookupByLibrary.simpleMessage("有效投注"),
        "random_text_510": MessageLookupByLibrary.simpleMessage("日期不能超过"),
        "random_text_511": MessageLookupByLibrary.simpleMessage("号"),
        "random_text_512":
            MessageLookupByLibrary.simpleMessage("您的用户名长度必须为3-14个字符"),
        "random_text_513": MessageLookupByLibrary.simpleMessage("注册子代理"),
        "random_text_514": MessageLookupByLibrary.simpleMessage("全部货币"),
        "random_text_515": MessageLookupByLibrary.simpleMessage("上级："),
        "random_text_516": MessageLookupByLibrary.simpleMessage("佣金钱包"),
        "random_text_517": MessageLookupByLibrary.simpleMessage("佣金记录"),
        "random_text_518": MessageLookupByLibrary.simpleMessage(" 时间"),
        "random_text_519": MessageLookupByLibrary.simpleMessage(" 类型"),
        "random_text_51copy2": MessageLookupByLibrary.simpleMessage("有效投注"),
        "random_text_52": MessageLookupByLibrary.simpleMessage("总输赢"),
        "random_text_520": MessageLookupByLibrary.simpleMessage("时间"),
        "random_text_521": MessageLookupByLibrary.simpleMessage("订单号"),
        "random_text_522": MessageLookupByLibrary.simpleMessage("类型选择"),
        "random_text_523": MessageLookupByLibrary.simpleMessage("会员输赢"),
        "random_text_524": MessageLookupByLibrary.simpleMessage("现金利润"),
        "random_text_525": MessageLookupByLibrary.simpleMessage("注册时间"),
        "random_text_526": MessageLookupByLibrary.simpleMessage("0人"),
        "random_text_527": MessageLookupByLibrary.simpleMessage("有效投注总额"),
        "random_text_528": MessageLookupByLibrary.simpleMessage("人"),
        "random_text_529": MessageLookupByLibrary.simpleMessage("去设置"),
        "random_text_53": MessageLookupByLibrary.simpleMessage("账号"),
        "random_text_530":
            MessageLookupByLibrary.simpleMessage("相册访问权限被禁用,请到设置中授予允许访问相册权限"),
        "random_text_531": MessageLookupByLibrary.simpleMessage("保存成功"),
        "random_text_532": MessageLookupByLibrary.simpleMessage("保存失败"),
        "random_text_533": MessageLookupByLibrary.simpleMessage("推广链接"),
        "random_text_534": MessageLookupByLibrary.simpleMessage("举例说明如下"),
        "random_text_535": MessageLookupByLibrary.simpleMessage(
            "本站点返佣以有效投注为依据，假设返佣比例为左上角表格。A在本站第一个发现商机，马上发展了B1、B2和B3，B1又往下发展了C1和C2，B2无下级，B3只发展了比较有实力的C3。\n\n几天后，B1本人的有效投注为8万，B2本人的有效投注为5万，B3本人的有效投注为3万，C1本人的有效投注为10万，C2本人的有效投注为4万，C3本人的有效投注达71万，则B1总业绩来自C1和C2共14万，对应返佣比例为80/万；B2无下级业绩为0；B3下级C3给力，总业绩为71万，对应返佣比例为100/万；A有来自直属团队16万和来自其他团队85万，总业绩为101万，对应返佣比例是100/万。\n\n那么他们之间的收益计算方式如下:"),
        "random_text_536": MessageLookupByLibrary.simpleMessage(
            "是指垂直发展的成员，统一叫直属团队。\n(1) B1，B2，B3贡献给A: (8万+5万+3万)x100/万=1600。\n\n(2) C1和C2贡献给B1: (10万+4万)x80/万=1120。\n\n(3) C3贡献给B3: 71万x100/万=7100。"),
        "random_text_537": MessageLookupByLibrary.simpleMessage(
            "是指下级、下下级、下下下级...等发展的成员，统一叫其他团队；因本系统可无限发展下级，为便于解说，本文只取2级结构作为例子阐述。\n\n(1)来自C1和C2：因B1总业绩14万，只享受80/万的返佣比例，而A总业绩101万，享受100/万的返佣比例，那么A和B1之间产生了返佣差额为：100-80=20/万，此差额即为C1和C2贡献给A的部分，所以C1和C2贡献给A：(10万+4万)×20/万=280。\n\n(2)来自C3：因B3总业绩71万，享受100/万的返佣比例，A总业绩101万，享受100/万的返佣比例，那么A和B3之间产生的返佣差额为：100-100=0/万，C3贡献给A：71万x0/万=0。"),
        "random_text_538": MessageLookupByLibrary.simpleMessage("总结说明"),
        "random_text_539": MessageLookupByLibrary.simpleMessage(
            "(1)C3给力，间接让A的所有业绩都享受更高返佣比例。\n\n(2)B2可能比较懒，没有发展下级，则无收益。\n\n(3)B3虽然加入比较晚，且属于A的下级，但其下级C3给力，让B3直接享受更高返佣比例，所以B3无论何时加入，处于谁的下级，不管身处于第几级，收益永远不受影响，不再吃他人下级的亏，发展也不被制约。\n\n(4)这是一套绝对公平公正的代理模式，并不会因为谁加入得晚，而永远被踩在脚下。"),
        "random_text_54": MessageLookupByLibrary.simpleMessage("推广教程"),
        "random_text_540": MessageLookupByLibrary.simpleMessage("电邮地址不能为空"),
        "random_text_541": MessageLookupByLibrary.simpleMessage("用户名不能为空"),
        "random_text_542": MessageLookupByLibrary.simpleMessage("请输入正确的电邮地址"),
        "random_text_543":
            MessageLookupByLibrary.simpleMessage("您的用户名长度必须为 3 - 14 个字符"),
        "random_text_544": MessageLookupByLibrary.simpleMessage("密码长度需大于或等于8位"),
        "random_text_545": MessageLookupByLibrary.simpleMessage("注册成功!"),
        "random_text_546": MessageLookupByLibrary.simpleMessage("注册失败!"),
        "random_text_547": MessageLookupByLibrary.simpleMessage("电邮地址 "),
        "random_text_548": MessageLookupByLibrary.simpleMessage("用户名 "),
        "random_text_549": MessageLookupByLibrary.simpleMessage("密码 "),
        "random_text_55": MessageLookupByLibrary.simpleMessage("我的推广"),
        "random_text_550": MessageLookupByLibrary.simpleMessage("结束时间"),
        "random_text_551": MessageLookupByLibrary.simpleMessage("搜索账号"),
        "random_text_552": MessageLookupByLibrary.simpleMessage("关键字"),
        "random_text_553": MessageLookupByLibrary.simpleMessage("小时后"),
        "random_text_554": MessageLookupByLibrary.simpleMessage("分钟后"),
        "random_text_555": MessageLookupByLibrary.simpleMessage("把以上"),
        "random_text_556": MessageLookupByLibrary.simpleMessage("项投注，加入我的投注单"),
        "random_text_557": MessageLookupByLibrary.simpleMessage("复式投注比大小："),
        "random_text_558": MessageLookupByLibrary.simpleMessage("赔率小于"),
        "random_text_559":
            MessageLookupByLibrary.simpleMessage("的投注项不能组合为复式投注"),
        "random_text_56": MessageLookupByLibrary.simpleMessage("我的佣金"),
        "random_text_560": MessageLookupByLibrary.simpleMessage("币种"),
        "random_text_561": MessageLookupByLibrary.simpleMessage("注单量"),
        "random_text_562": MessageLookupByLibrary.simpleMessage("输赢"),
        "random_text_563": MessageLookupByLibrary.simpleMessage("表情符号"),
        "random_text_564": MessageLookupByLibrary.simpleMessage(
            "1. 请勿在聊天时发送垃圾消息并避免使用过多的大写字母。"),
        "random_text_565":
            MessageLookupByLibrary.simpleMessage("2. 请勿骚扰或冒犯其他用户及 Meibo 工作人员。"),
        "random_text_566": MessageLookupByLibrary.simpleMessage(
            "3. 请勿分享您或其他玩家的任何个人信息（包括社交媒体账号）"),
        "random_text_567":
            MessageLookupByLibrary.simpleMessage("4. 请勿向其他用户讨钱或要求贷款、下红包雨、或小费。"),
        "random_text_568":
            MessageLookupByLibrary.simpleMessage("5. 严禁使用除了主账户外您任何其他账户聊天。"),
        "random_text_569":
            MessageLookupByLibrary.simpleMessage("6. 不允许可被视为诈骗的可疑行为。"),
        "random_text_57": MessageLookupByLibrary.simpleMessage("我的业绩"),
        "random_text_570": MessageLookupByLibrary.simpleMessage(
            "7. 请勿从事任何形式的广告/交易/销售/购买/提供服务。"),
        "random_text_571": MessageLookupByLibrary.simpleMessage(
            "8. 请勿讨论直播主、 Twitch 或任何其他类似平台。"),
        "random_text_572":
            MessageLookupByLibrary.simpleMessage("9. 请勿使用网址缩短服务。一定要提交完整的链接。"),
        "random_text_573":
            MessageLookupByLibrary.simpleMessage("10. 请勿分享编码、脚本或任何机器人程序的服务。"),
        "random_text_574": MessageLookupByLibrary.simpleMessage(
            "11. 请只使用聊天室指定的语言聊天，潜在的滥用行为将受到制裁。"),
        "random_text_575":
            MessageLookupByLibrary.simpleMessage("12. 严禁谈论政治与宗教话题。"),
        "random_text_576": MessageLookupByLibrary.simpleMessage("完整的规则可以在我们的"),
        "random_text_577": MessageLookupByLibrary.simpleMessage("上找到。"),
        "random_text_578": MessageLookupByLibrary.simpleMessage(" 在玩"),
        "random_text_579": MessageLookupByLibrary.simpleMessage("结束时间: "),
        "random_text_58": MessageLookupByLibrary.simpleMessage("所有数据"),
        "random_text_580": MessageLookupByLibrary.simpleMessage("1.条款"),
        "random_text_581": MessageLookupByLibrary.simpleMessage("2.条款"),
        "random_text_582": MessageLookupByLibrary.simpleMessage("下载更新"),
        "random_text_583": MessageLookupByLibrary.simpleMessage("新版本下载中!"),
        "random_text_584":
            MessageLookupByLibrary.simpleMessage("新版本正在努力的更新中，请稍等..."),
        "random_text_585": MessageLookupByLibrary.simpleMessage("当前版本号: "),
        "random_text_586": MessageLookupByLibrary.simpleMessage("最新版本号: "),
        "random_text_587": MessageLookupByLibrary.simpleMessage("已是最新版本号"),
        "random_text_588": MessageLookupByLibrary.simpleMessage("下载最新APP"),
        "random_text_589": MessageLookupByLibrary.simpleMessage("收款地址:"),
        "random_text_59": MessageLookupByLibrary.simpleMessage("直属财务"),
        "random_text_590": MessageLookupByLibrary.simpleMessage("账户类型:"),
        "random_text_591": MessageLookupByLibrary.simpleMessage("收款银行:"),
        "random_text_592": MessageLookupByLibrary.simpleMessage("尚未存款"),
        "random_text_593": MessageLookupByLibrary.simpleMessage("尚未提款"),
        "random_text_594": MessageLookupByLibrary.simpleMessage("暂无法定货币存款"),
        "random_text_595": MessageLookupByLibrary.simpleMessage("暂无法定货币提款"),
        "random_text_596": MessageLookupByLibrary.simpleMessage("年利率："),
        "random_text_597": MessageLookupByLibrary.simpleMessage("该币种最低存入金额为:"),
        "random_text_598": MessageLookupByLibrary.simpleMessage("了解更多有关保险库的信息"),
        "random_text_599": MessageLookupByLibrary.simpleMessage("请输入6位数字组成的密码"),
        "random_text_6": MessageLookupByLibrary.simpleMessage("我已阅读并同意"),
        "random_text_60": MessageLookupByLibrary.simpleMessage("直属投注"),
        "random_text_600": MessageLookupByLibrary.simpleMessage("累积奖金"),
        "random_text_601": MessageLookupByLibrary.simpleMessage("晋级标准"),
        "random_text_602": MessageLookupByLibrary.simpleMessage("保级标准"),
        "random_text_603": MessageLookupByLibrary.simpleMessage("日奖金"),
        "random_text_604": MessageLookupByLibrary.simpleMessage("周奖金"),
        "random_text_605": MessageLookupByLibrary.simpleMessage("月奖金"),
        "random_text_606": MessageLookupByLibrary.simpleMessage("保级说明"),
        "random_text_607": MessageLookupByLibrary.simpleMessage("稽核说明"),
        "random_text_608": MessageLookupByLibrary.simpleMessage("活动声明"),
        "random_text_609": MessageLookupByLibrary.simpleMessage("解释说明"),
        "random_text_61": MessageLookupByLibrary.simpleMessage("直属用户"),
        "random_text_610": MessageLookupByLibrary.simpleMessage(
            "满足VIP晋级要求（即打码都满足条件），即可晋级相应VIP等级，获得相应晋级奖金，如连续晋级多级，可领取全部等级晋级奖金； 2.日俸禄：达到VIP等级对应日俸禄要求，即可领取对应日奖金，每日00:00重置；"),
        "random_text_611": MessageLookupByLibrary.simpleMessage(
            "在晋级或降级后90天内满足保级要求（即打码都满足条件），即可保留当前VIP等级。如果90天内无法满足打码需求，则会降低一级VIP等级；"),
        "random_text_612": MessageLookupByLibrary.simpleMessage(
            "达到VIP等级对应日奖金要求，即可领取对应日奖金，每日00:00重置；"),
        "random_text_613": MessageLookupByLibrary.simpleMessage(
            "达到VIP等级对应周奖金要求，即可领取对应周奖金，每周一00:00重置；"),
        "random_text_614": MessageLookupByLibrary.simpleMessage(
            "每月充值及打码达到当前VIP等级对应月奖金要求，即可领取对应月奖金，每月1日00:00重置；"),
        "random_text_615": MessageLookupByLibrary.simpleMessage(
            "会员在达到某VIP等级后，若上个月充值及打码未达到保级要求，则自动降一个等级；"),
        "random_text_616": MessageLookupByLibrary.simpleMessage(
            "VIP所赠送的奖金需1倍流水（即稽核、打码或有效投注）才能提现，打码不限游戏平台；"),
        "random_text_617": MessageLookupByLibrary.simpleMessage(
            "本功能仅限账号本人进行正常游戏投注，禁止租借账号、无风险投注(对赌、对刷、低赔刷水)、恶意套利、使用外挂程式、机器人、利用协议、漏洞、接口、群控或其他技术手段参与，一经查核属实，本平台有权终止会员登录、暂停会员使用网站、及没收奖金和不当盈利的权利，无需特别通知；"),
        "random_text_618": MessageLookupByLibrary.simpleMessage(
            "会员领取VIP奖励时，本平台将默认会员同意且遵守对应条件等相关规定，为避免文字理解歧义，本平台保有本活动最终解释权。"),
        "random_text_619": MessageLookupByLibrary.simpleMessage("积分"),
        "random_text_62": MessageLookupByLibrary.simpleMessage("直属领取"),
        "random_text_620": MessageLookupByLibrary.simpleMessage("保级积分"),
        "random_text_621": MessageLookupByLibrary.simpleMessage("近7日"),
        "random_text_622": MessageLookupByLibrary.simpleMessage("近30日"),
        "random_text_623": MessageLookupByLibrary.simpleMessage("近90日"),
        "random_text_624": MessageLookupByLibrary.simpleMessage("VIP积分"),
        "random_text_625":
            MessageLookupByLibrary.simpleMessage("VIP积分将按照您的有效投注来计算"),
        "random_text_626":
            MessageLookupByLibrary.simpleMessage("1.汇率会根据市场波动实时同步"),
        "random_text_627":
            MessageLookupByLibrary.simpleMessage("2.会在您注单结算时的汇率为准"),
        "random_text_628":
            MessageLookupByLibrary.simpleMessage("3.已经统计的有效投注不会受后续汇率的影响"),
        "random_text_629": MessageLookupByLibrary.simpleMessage(
            "4.投注不同场馆将会获得不同的VIP积分累积,详情请查看下图"),
        "random_text_63": MessageLookupByLibrary.simpleMessage("返佣比例"),
        "random_text_630": MessageLookupByLibrary.simpleMessage("投注币种"),
        "random_text_631": MessageLookupByLibrary.simpleMessage("体育场馆积分"),
        "random_text_632": MessageLookupByLibrary.simpleMessage("真人场馆积分"),
        "random_text_633": MessageLookupByLibrary.simpleMessage("电子场馆积分"),
        "random_text_634": MessageLookupByLibrary.simpleMessage("捕鱼场馆积分"),
        "random_text_635": MessageLookupByLibrary.simpleMessage("活动奖金"),
        "random_text_636": MessageLookupByLibrary.simpleMessage("以"),
        "random_text_637": MessageLookupByLibrary.simpleMessage("结算"),
        "random_text_638":
            MessageLookupByLibrary.simpleMessage("请认真核对地址，地址错误资金将无法到账"),
        "random_text_639": MessageLookupByLibrary.simpleMessage("请选择国家"),
        "random_text_64": MessageLookupByLibrary.simpleMessage("新增子代理"),
        "random_text_640": MessageLookupByLibrary.simpleMessage("请填写城市"),
        "random_text_641": MessageLookupByLibrary.simpleMessage("PIX账户类型"),
        "random_text_642": MessageLookupByLibrary.simpleMessage("国家"),
        "random_text_643": MessageLookupByLibrary.simpleMessage("协议"),
        "random_text_644": MessageLookupByLibrary.simpleMessage("虚拟货币地址"),
        "random_text_645": MessageLookupByLibrary.simpleMessage(
            "请绑定提款信息\n1.每种货币只能绑定3个收款信息\n2.如需绑定更多，请先删除不常用"),
        "random_text_645c1": MessageLookupByLibrary.simpleMessage("请绑定提款信息"),
        "random_text_645c2":
            MessageLookupByLibrary.simpleMessage("1.每种货币只能绑定3个收款信息"),
        "random_text_645c3":
            MessageLookupByLibrary.simpleMessage("2.如需绑定更多，请先删除不常用"),
        "random_text_646": MessageLookupByLibrary.simpleMessage("绑定收款账号"),
        "random_text_647": MessageLookupByLibrary.simpleMessage("绑定收款银行卡"),
        "random_text_648": MessageLookupByLibrary.simpleMessage("绑定收款地址"),
        "random_text_649": MessageLookupByLibrary.simpleMessage(
            "每种货币只能绑定3个收款信息，如需绑定更多，请先删除不常用"),
        "random_text_65": MessageLookupByLibrary.simpleMessage("篮球"),
        "random_text_650": MessageLookupByLibrary.simpleMessage("兑换"),
        "random_text_651": MessageLookupByLibrary.simpleMessage("支付"),
        "random_text_652": MessageLookupByLibrary.simpleMessage("汇率: "),
        "random_text_653": MessageLookupByLibrary.simpleMessage("支付方式"),
        "random_text_654": MessageLookupByLibrary.simpleMessage("请下拉选择充值金额"),
        "random_text_655":
            MessageLookupByLibrary.simpleMessage("该币种您暂无收款信息\n请前往卡包绑定收款信息"),
        "random_text_655c1": MessageLookupByLibrary.simpleMessage("该币种您暂无收款信息"),
        "random_text_655c2":
            MessageLookupByLibrary.simpleMessage("请前往卡包绑定收款信息"),
        "random_text_656": MessageLookupByLibrary.simpleMessage("前往卡包"),
        "random_text_657": MessageLookupByLibrary.simpleMessage("请先绑定银行卡"),
        "random_text_658":
            MessageLookupByLibrary.simpleMessage("您是首次提款,需要先设置资金密码 "),
        "random_text_659":
            MessageLookupByLibrary.simpleMessage("您是首次提款,需要先设置双重验证"),
        "random_text_660": MessageLookupByLibrary.simpleMessage("标记"),
        "random_text_661": MessageLookupByLibrary.simpleMessage("备忘录"),
        "random_text_662": MessageLookupByLibrary.simpleMessage("请先绑定地址"),
        "random_text_663": MessageLookupByLibrary.simpleMessage("网络"),
        "random_text_664": MessageLookupByLibrary.simpleMessage("存款币种"),
        "random_text_665": MessageLookupByLibrary.simpleMessage("余额："),
        "random_text_666": MessageLookupByLibrary.simpleMessage("收起"),
        "random_text_667":
            MessageLookupByLibrary.simpleMessage("该币种暂无存款渠道，\n请稍后再试或联系客服"),
        "random_text_668":
            MessageLookupByLibrary.simpleMessage("您的密码必须含有至少 8 个字符"),
        "random_text_669": MessageLookupByLibrary.simpleMessage("您的验证码必须是6位数字"),
        "random_text_670": MessageLookupByLibrary.simpleMessage("登录密码"),
        "random_text_671": MessageLookupByLibrary.simpleMessage("禁用"),
        "random_text_672": MessageLookupByLibrary.simpleMessage("验证电邮已重新发送至 "),
        "random_text_673": MessageLookupByLibrary.simpleMessage("已重新发送电邮"),
        "random_text_674": MessageLookupByLibrary.simpleMessage("确认电邮地址已发送至 "),
        "random_text_675": MessageLookupByLibrary.simpleMessage("密码必须含有至少一个数字"),
        "random_text_676":
            MessageLookupByLibrary.simpleMessage("您的密码长度必须至少为8个字符"),
        "random_text_677": MessageLookupByLibrary.simpleMessage("密码不一致"),
        "random_text_678":
            MessageLookupByLibrary.simpleMessage("您还没绑定邮箱！请先绑定邮箱后再设置资金密码"),
        "random_text_679": MessageLookupByLibrary.simpleMessage("加时"),
        "random_text_68": MessageLookupByLibrary.simpleMessage("棒球"),
        "random_text_680": MessageLookupByLibrary.simpleMessage("虚拟体育"),
        "random_text_681": MessageLookupByLibrary.simpleMessage("暂无未结算的赌注"),
        "random_text_682": MessageLookupByLibrary.simpleMessage("盘口类型"),
        "random_text_683": MessageLookupByLibrary.simpleMessage("暂无盘口可用"),
        "random_text_684": MessageLookupByLibrary.simpleMessage("暂无收藏赛事"),
        "random_text_685": MessageLookupByLibrary.simpleMessage("已完成"),
        "random_text_686": MessageLookupByLibrary.simpleMessage("处理中"),
        "random_text_687": MessageLookupByLibrary.simpleMessage("活动一"),
        "random_text_688": MessageLookupByLibrary.simpleMessage("活动二"),
        "random_text_689": MessageLookupByLibrary.simpleMessage("活动三"),
        "random_text_69": MessageLookupByLibrary.simpleMessage("羽毛球"),
        "random_text_690": MessageLookupByLibrary.simpleMessage("活动四"),
        "random_text_691": MessageLookupByLibrary.simpleMessage("今日不再提示"),
        "random_text_692": MessageLookupByLibrary.simpleMessage("站内公告"),
        "random_text_693": MessageLookupByLibrary.simpleMessage("VIP独享返水优惠"),
        "random_text_694": MessageLookupByLibrary.simpleMessage(
            "在您的每一次投注之后，都会按照您的vip等级，每日给您返水优惠。"),
        "random_text_695": MessageLookupByLibrary.simpleMessage("领取失败"),
        "random_text_696": MessageLookupByLibrary.simpleMessage("成功领取"),
        "random_text_697": MessageLookupByLibrary.simpleMessage("晋级奖金领取"),
        "random_text_698": MessageLookupByLibrary.simpleMessage("成功领取晋级奖金"),
        "random_text_699":
            MessageLookupByLibrary.simpleMessage("您的 VIP 等级已达到最高"),
        "random_text_700":
            MessageLookupByLibrary.simpleMessage("立即注册以开始在赌场或体育盘口上进行投注。"),
        "random_text_701": MessageLookupByLibrary.simpleMessage(
            "立即领取您的奖金。领取每日、每周和每月奖金的过程既简单又容易。"),
        "random_text_702": MessageLookupByLibrary.simpleMessage(
            "Meibo通过不间断送出的奖金提供了独特且无与伦比的体验"),
        "random_text_703": MessageLookupByLibrary.simpleMessage(
            "领取说明：本活动奖金均是以USDT发放；您可以自行选择领取的货币，货币间汇率采用市场实时汇率。"),
        "random_text_704":
            MessageLookupByLibrary.simpleMessage("请认真核对卡号，卡号错误资金将无法到账"),
        "random_text_705": MessageLookupByLibrary.simpleMessage("是否设为默认账户"),
        "random_text_706":
            MessageLookupByLibrary.simpleMessage("请认真核对账户，账户错误资金将无法到账"),
        "random_text_707": MessageLookupByLibrary.simpleMessage("兑换 "),
        "random_text_708": MessageLookupByLibrary.simpleMessage("以 "),
        "random_text_709": MessageLookupByLibrary.simpleMessage(" 支付"),
        "random_text_709c1": m11,
        "random_text_71": MessageLookupByLibrary.simpleMessage("账号："),
        "random_text_710": MessageLookupByLibrary.simpleMessage("确认提款"),
        "random_text_711": MessageLookupByLibrary.simpleMessage("可提款金额 "),
        "random_text_712": MessageLookupByLibrary.simpleMessage("\n全部提款还需流水 "),
        "random_text_713": MessageLookupByLibrary.simpleMessage("该币种暂无存款渠道，"),
        "random_text_714": MessageLookupByLibrary.simpleMessage("请稍后再试或联系客服"),
        "random_text_715": MessageLookupByLibrary.simpleMessage("修改资金密码成功"),
        "random_text_716": MessageLookupByLibrary.simpleMessage("资金密码设置成功"),
        "random_text_717": MessageLookupByLibrary.simpleMessage("体育场馆维护中..."),
        "random_text_718": MessageLookupByLibrary.simpleMessage("维护时间"),
        "random_text_719": MessageLookupByLibrary.simpleMessage("至"),
        "random_text_72": MessageLookupByLibrary.simpleMessage("上级ID："),
        "random_text_720": MessageLookupByLibrary.simpleMessage("回到主页"),
        "random_text_721": MessageLookupByLibrary.simpleMessage("暂无数据"),
        "random_text_722": MessageLookupByLibrary.simpleMessage("拍摄"),
        "random_text_723": MessageLookupByLibrary.simpleMessage("相册"),
        "random_text_724": MessageLookupByLibrary.simpleMessage("关闭"),
        "random_text_725": MessageLookupByLibrary.simpleMessage("已验证"),
        "random_text_726": MessageLookupByLibrary.simpleMessage("重新加载"),
        "random_text_727": MessageLookupByLibrary.simpleMessage("没有更多数据"),
        "random_text_728": MessageLookupByLibrary.simpleMessage("描述"),
        "random_text_729": MessageLookupByLibrary.simpleMessage("直播"),
        "random_text_73": MessageLookupByLibrary.simpleMessage("直属会员111111"),
        "random_text_730": MessageLookupByLibrary.simpleMessage("实时统计"),
        "random_text_731": MessageLookupByLibrary.simpleMessage("消失"),
        "random_text_732": MessageLookupByLibrary.simpleMessage("让分"),
        "random_text_733": MessageLookupByLibrary.simpleMessage("分钟"),
        "random_text_734": MessageLookupByLibrary.simpleMessage("秒"),
        "random_text_735": MessageLookupByLibrary.simpleMessage("开始时间:"),
        "random_text_736": MessageLookupByLibrary.simpleMessage("积分牌"),
        "random_text_737": MessageLookupByLibrary.simpleMessage("加载失败，请重试"),
        "random_text_738": MessageLookupByLibrary.simpleMessage("加载异常"),
        "random_text_739": MessageLookupByLibrary.simpleMessage("服务加载异常"),
        "random_text_74": MessageLookupByLibrary.simpleMessage("可领取："),
        "random_text_740": MessageLookupByLibrary.simpleMessage("加载中..."),
        "random_text_741": MessageLookupByLibrary.simpleMessage("当前下载状态：还未开始"),
        "random_text_742": MessageLookupByLibrary.simpleMessage(" 立即更新"),
        "random_text_743": MessageLookupByLibrary.simpleMessage("跳过更新"),
        "random_text_744": MessageLookupByLibrary.simpleMessage("请输入名字"),
        "random_text_745": MessageLookupByLibrary.simpleMessage("请输入姓氏"),
        "random_text_746": MessageLookupByLibrary.simpleMessage("请输入城市"),
        "random_text_747": MessageLookupByLibrary.simpleMessage("请输入详细地址"),
        "random_text_748": MessageLookupByLibrary.simpleMessage("请输入正确的PIX账户"),
        "random_text_749": MessageLookupByLibrary.simpleMessage("佣金转换"),
        "random_text_750":
            MessageLookupByLibrary.simpleMessage("您当前佣金钱包金额按照USDT汇率换算合计约为："),
        "random_text_751":
            MessageLookupByLibrary.simpleMessage("您可以选择转换成您想要的货币"),
        "random_text_752": MessageLookupByLibrary.simpleMessage("转换后货币"),
        "random_text_753": MessageLookupByLibrary.simpleMessage("预计累计可获得"),
        "random_text_754": MessageLookupByLibrary.simpleMessage("确认转换"),
        "random_text_755": MessageLookupByLibrary.simpleMessage("佣金转账"),
        "random_text_756": MessageLookupByLibrary.simpleMessage("佣金提取成功"),
        "random_text_757": MessageLookupByLibrary.simpleMessage("提取佣金"),
        "random_text_758": MessageLookupByLibrary.simpleMessage("转移到钱包"),
        "random_text_759":
            MessageLookupByLibrary.simpleMessage("转到钱包后需要1倍有效投注才可提款"),
        "random_text_76": MessageLookupByLibrary.simpleMessage("记录"),
        "random_text_760": MessageLookupByLibrary.simpleMessage("合计约为："),
        "random_text_761": MessageLookupByLibrary.simpleMessage("佣金币种转换"),
        "random_text_762": MessageLookupByLibrary.simpleMessage("转账"),
        "random_text_763": MessageLookupByLibrary.simpleMessage("本周"),
        "random_text_764": MessageLookupByLibrary.simpleMessage("本月"),
        "random_text_765": MessageLookupByLibrary.simpleMessage("本季度"),
        "random_text_766": MessageLookupByLibrary.simpleMessage("返回"),
        "random_text_767": MessageLookupByLibrary.simpleMessage("保险库说明"),
        "random_text_768": MessageLookupByLibrary.simpleMessage("最低存入金额"),
        "random_text_769": MessageLookupByLibrary.simpleMessage("年利率"),
        "random_text_77": MessageLookupByLibrary.simpleMessage(""),
        "random_text_770":
            MessageLookupByLibrary.simpleMessage("您必须验证您的电邮地址才能进行存款"),
        "random_text_771": MessageLookupByLibrary.simpleMessage("年前"),
        "random_text_772": MessageLookupByLibrary.simpleMessage("月前"),
        "random_text_773": MessageLookupByLibrary.simpleMessage("天前"),
        "random_text_773copy2": MessageLookupByLibrary.simpleMessage("1天前"),
        "random_text_774": MessageLookupByLibrary.simpleMessage("小时前"),
        "random_text_775": MessageLookupByLibrary.simpleMessage("分钟前"),
        "random_text_776": MessageLookupByLibrary.simpleMessage("刚刚"),
        "random_text_777": MessageLookupByLibrary.simpleMessage("兑换货币"),
        "random_text_778": MessageLookupByLibrary.simpleMessage("提款失败"),
        "random_text_779": MessageLookupByLibrary.simpleMessage("兑换货币成功"),
        "random_text_78": MessageLookupByLibrary.simpleMessage(""),
        "random_text_780": MessageLookupByLibrary.simpleMessage("送"),
        "random_text_781": MessageLookupByLibrary.simpleMessage("IP"),
        "random_text_782": MessageLookupByLibrary.simpleMessage("提款成功"),
        "random_text_783": MessageLookupByLibrary.simpleMessage("提款失败"),
        "random_text_784": MessageLookupByLibrary.simpleMessage("存款成功"),
        "random_text_785": MessageLookupByLibrary.simpleMessage("存款失败"),
        "random_text_786": MessageLookupByLibrary.simpleMessage("存款进行中"),
        "random_text_787": MessageLookupByLibrary.simpleMessage("您的\t\t"),
        "random_text_788": MessageLookupByLibrary.simpleMessage("提款成功"),
        "random_text_789": MessageLookupByLibrary.simpleMessage("提款进行中"),
        "random_text_79": MessageLookupByLibrary.simpleMessage(""),
        "random_text_790": MessageLookupByLibrary.simpleMessage("存款已到账"),
        "random_text_791": MessageLookupByLibrary.simpleMessage("存款正在进行中"),
        "random_text_792": MessageLookupByLibrary.simpleMessage("提款已到账"),
        "random_text_793": MessageLookupByLibrary.simpleMessage("提款正在进行中"),
        "random_text_794": MessageLookupByLibrary.simpleMessage("暂无已结算的赌注"),
        "random_text_795": MessageLookupByLibrary.simpleMessage("该币种暂无提款渠道，"),
        "random_text_796": MessageLookupByLibrary.simpleMessage("您的"),
        "random_text_797": MessageLookupByLibrary.simpleMessage("于 "),
        "random_text_798": MessageLookupByLibrary.simpleMessage("的 "),
        "random_text_799":
            MessageLookupByLibrary.simpleMessage("已成功复制，分享到聊天室吧！"),
        "random_text_8": MessageLookupByLibrary.simpleMessage("步骤1/2:\t\t"),
        "random_text_80": MessageLookupByLibrary.simpleMessage(""),
        "random_text_800": MessageLookupByLibrary.simpleMessage("已成功复制，在线分享吧！"),
        "random_text_801": MessageLookupByLibrary.simpleMessage("目标"),
        "random_text_802": MessageLookupByLibrary.simpleMessage("结果"),
        "random_text_803": MessageLookupByLibrary.simpleMessage("风险"),
        "random_text_804": MessageLookupByLibrary.simpleMessage("中等"),
        "random_text_805": MessageLookupByLibrary.simpleMessage("排数"),
        "random_text_806": MessageLookupByLibrary.simpleMessage("庄家"),
        "random_text_807": MessageLookupByLibrary.simpleMessage("闲家"),
        "random_text_808": MessageLookupByLibrary.simpleMessage("掷小于"),
        "random_text_809": MessageLookupByLibrary.simpleMessage("获胜机率"),
        "random_text_81": MessageLookupByLibrary.simpleMessage(""),
        "random_text_810": MessageLookupByLibrary.simpleMessage("可证明的公平"),
        "random_text_811": MessageLookupByLibrary.simpleMessage("服务器种子"),
        "random_text_812": MessageLookupByLibrary.simpleMessage("种子尚未揭示"),
        "random_text_813": MessageLookupByLibrary.simpleMessage("服务器种子（散列化）"),
        "random_text_814": MessageLookupByLibrary.simpleMessage("客户端种子"),
        "random_text_815": MessageLookupByLibrary.simpleMessage("现实标志"),
        "random_text_816":
            MessageLookupByLibrary.simpleMessage("轮换您的种子配对以验证这比赌注"),
        "random_text_817": MessageLookupByLibrary.simpleMessage("什么是可证明的公平？"),
        "random_text_818": MessageLookupByLibrary.simpleMessage("散列"),
        "random_text_819": MessageLookupByLibrary.simpleMessage("种子"),
        "random_text_82": MessageLookupByLibrary.simpleMessage(""),
        "random_text_820": MessageLookupByLibrary.simpleMessage("验证赌注"),
        "random_text_821": MessageLookupByLibrary.simpleMessage("反馈提交成功！"),
        "random_text_822": MessageLookupByLibrary.simpleMessage("无法使用货币"),
        "random_text_823": MessageLookupByLibrary.simpleMessage("系统错误"),
        "random_text_824": MessageLookupByLibrary.simpleMessage("兑换成功"),
        "random_text_825":
            MessageLookupByLibrary.simpleMessage("请完整阅读条款与条件，然后滚动至末尾将其接受。"),
        "random_text_826": MessageLookupByLibrary.simpleMessage("体育博彩"),
        "random_text_827": MessageLookupByLibrary.simpleMessage("最新促销活动"),
        "random_text_828": MessageLookupByLibrary.simpleMessage("结束于 "),
        "random_text_829": MessageLookupByLibrary.simpleMessage("免费获得100钱币"),
        "random_text_830": MessageLookupByLibrary.simpleMessage("账户姓名"),
        "random_text_831": MessageLookupByLibrary.simpleMessage("报告"),
        "random_text_832": MessageLookupByLibrary.simpleMessage("我的邀请"),
        "random_text_833": MessageLookupByLibrary.simpleMessage("规则"),
        "random_text_834": MessageLookupByLibrary.simpleMessage("邀请好友帮忙提款"),
        "random_text_835": MessageLookupByLibrary.simpleMessage("转入至钱包仍需 "),
        "random_text_836": MessageLookupByLibrary.simpleMessage("和朋友分享"),
        "random_text_837": MessageLookupByLibrary.simpleMessage("放弃 "),
        "random_text_838": MessageLookupByLibrary.simpleMessage(" BRL 的提现"),
        "random_text_839": MessageLookupByLibrary.simpleMessage("免费获得钱币"),
        "random_text_84": MessageLookupByLibrary.simpleMessage("捕鱼"),
        "random_text_840": MessageLookupByLibrary.simpleMessage("快速提取"),
        "random_text_841": MessageLookupByLibrary.simpleMessage("免费旋转并赢得真钱"),
        "random_text_842": MessageLookupByLibrary.simpleMessage("抽奖"),
        "random_text_843": MessageLookupByLibrary.simpleMessage("您还需要  "),
        "random_text_844": MessageLookupByLibrary.simpleMessage("  才能提现到钱包"),
        "random_text_845": m12,
        "random_text_846": MessageLookupByLibrary.simpleMessage("立即下注"),
        "random_text_847": MessageLookupByLibrary.simpleMessage("刚刚收到"),
        "random_text_848": MessageLookupByLibrary.simpleMessage("邀请好友帮忙提现"),
        "random_text_849":
            MessageLookupByLibrary.simpleMessage("2.向随机玩家发送帮助邀请"),
        "random_text_85": MessageLookupByLibrary.simpleMessage("棋牌"),
        "random_text_850": MessageLookupByLibrary.simpleMessage("WhatsApp发送"),
        "random_text_851": MessageLookupByLibrary.simpleMessage("短信发送"),
        "random_text_852": MessageLookupByLibrary.simpleMessage("恭喜您好运，你赢了"),
        "random_text_853": MessageLookupByLibrary.simpleMessage("4 提现至 Pix 仍需"),
        "random_text_854": MessageLookupByLibrary.simpleMessage("索取更多现金"),
        "random_text_855": MessageLookupByLibrary.simpleMessage("您很快就可以取款"),
        "random_text_856": MessageLookupByLibrary.simpleMessage("即将支付的总金额"),
        "random_text_857": MessageLookupByLibrary.simpleMessage("付款请求已提交"),
        "random_text_858": MessageLookupByLibrary.simpleMessage("您还需要 "),
        "random_text_859": MessageLookupByLibrary.simpleMessage(" 才能提现到钱包"),
        "random_text_860": MessageLookupByLibrary.simpleMessage("将存入您的钱包账户"),
        "random_text_861": MessageLookupByLibrary.simpleMessage("邀请朋友帮忙"),
        "random_text_862": MessageLookupByLibrary.simpleMessage("请开启权限"),
        "random_text_863": MessageLookupByLibrary.simpleMessage("免费获得"),
        "random_text_864": MessageLookupByLibrary.simpleMessage("钱币"),
        "random_text_865": MessageLookupByLibrary.simpleMessage("1小时内提取"),
        "random_text_866": MessageLookupByLibrary.simpleMessage("您所在的地区无法使用"),
        "random_text_867": MessageLookupByLibrary.simpleMessage("刚刚兑现"),
        "random_text_868": MessageLookupByLibrary.simpleMessage("星期一"),
        "random_text_869": MessageLookupByLibrary.simpleMessage("星期二"),
        "random_text_870": MessageLookupByLibrary.simpleMessage("星期三"),
        "random_text_871": MessageLookupByLibrary.simpleMessage("星期四"),
        "random_text_872": MessageLookupByLibrary.simpleMessage("星期五"),
        "random_text_873": MessageLookupByLibrary.simpleMessage("星期六"),
        "random_text_874": MessageLookupByLibrary.simpleMessage("星期日"),
        "random_text_875": MessageLookupByLibrary.simpleMessage("你真幸运！"),
        "random_text_876": MessageLookupByLibrary.simpleMessage("全部币种"),
        "random_text_877": MessageLookupByLibrary.simpleMessage("新资金密码"),
        "random_text_878": MessageLookupByLibrary.simpleMessage("验证码发送成功"),
        "random_text_879": MessageLookupByLibrary.simpleMessage("申请转入钱包"),
        "random_text_88": MessageLookupByLibrary.simpleMessage("级别"),
        "random_text_880": MessageLookupByLibrary.simpleMessage("您可以转入到钱包"),
        "random_text_881": MessageLookupByLibrary.simpleMessage("立即申请"),
        "random_text_882": MessageLookupByLibrary.simpleMessage("立即转入钱包"),
        "random_text_883": MessageLookupByLibrary.simpleMessage("全部活动"),
        "random_text_884": MessageLookupByLibrary.simpleMessage("待审核"),
        "random_text_885": MessageLookupByLibrary.simpleMessage("当前积分 "),
        "random_text_886": MessageLookupByLibrary.simpleMessage("进度 "),
        "random_text_887": MessageLookupByLibrary.simpleMessage("保级还需 "),
        "random_text_888": MessageLookupByLibrary.simpleMessage("S"),
        "random_text_889":
            MessageLookupByLibrary.simpleMessage("您下注使用的所有货币会标准化为竞赛货币"),
        "random_text_89": MessageLookupByLibrary.simpleMessage("返佣金额"),
        "random_text_890": MessageLookupByLibrary.simpleMessage("请点击重试"),
        "random_text_891": MessageLookupByLibrary.simpleMessage("原创游戏"),
        "random_text_892": MessageLookupByLibrary.simpleMessage("您好👋"),
        "random_text_893": MessageLookupByLibrary.simpleMessage("我们能提供什么帮助？"),
        "random_text_894": MessageLookupByLibrary.simpleMessage("24/7在线客服"),
        "random_text_895":
            MessageLookupByLibrary.simpleMessage("客服服务可帮助解决问题并回答问题"),
        "random_text_896": MessageLookupByLibrary.simpleMessage("活动详情"),
        "random_text_897": MessageLookupByLibrary.simpleMessage("12%返现"),
        "random_text_898": MessageLookupByLibrary.simpleMessage("最高:25%"),
        "random_text_899": MessageLookupByLibrary.simpleMessage("5000投注到等级2"),
        "random_text_9": MessageLookupByLibrary.simpleMessage("一月"),
        "random_text_900": MessageLookupByLibrary.simpleMessage("您本周的返现"),
        "random_text_901":
            MessageLookupByLibrary.simpleMessage("您本周玩游戏将会获得最高25%返现"),
        "random_text_902": MessageLookupByLibrary.simpleMessage("统计时间："),
        "random_text_903": MessageLookupByLibrary.simpleMessage("发放时间："),
        "random_text_904": MessageLookupByLibrary.simpleMessage("立即领取"),
        "random_text_905": MessageLookupByLibrary.simpleMessage("领取时间："),
        "random_text_906": MessageLookupByLibrary.simpleMessage("返现等级"),
        "random_text_907": MessageLookupByLibrary.simpleMessage("返现比例"),
        "random_text_908": MessageLookupByLibrary.simpleMessage("条款和规则"),
        "random_text_909": MessageLookupByLibrary.simpleMessage("每周提供的返现作为奖励。"),
        "random_text_910": MessageLookupByLibrary.simpleMessage(
            "每周返现的计算周期从周一 00:00 到周日 23:59。"),
        "random_text_911": MessageLookupByLibrary.simpleMessage(
            "返现申请时间：从下周一 06:00 到周五 23:59，过期将无法领取。"),
        "random_text_912":
            MessageLookupByLibrary.simpleMessage("实际损失金额乘以返现比例即为本周的返现金额。"),
        "random_text_913": MessageLookupByLibrary.simpleMessage(
            "如果您在返现活动期间没有进行过任何投注，或者上周的收益或总收益超过了您的损失，您将不会收到返现。"),
        "random_text_914":
            MessageLookupByLibrary.simpleMessage("每人每周返现奖励的最高限额为 10000 巴西雷亚尔。"),
        "random_text_915":
            MessageLookupByLibrary.simpleMessage("返现金额可直接提取或用于继续游戏。"),
        "random_text_916": MessageLookupByLibrary.simpleMessage("马上参与！"),
        "random_text_917": MessageLookupByLibrary.simpleMessage("邀请详情"),
        "random_text_918": MessageLookupByLibrary.simpleMessage("有效"),
        "random_text_919": MessageLookupByLibrary.simpleMessage("无效"),
        "random_text_92": MessageLookupByLibrary.simpleMessage("贡献人数"),
        "random_text_920": MessageLookupByLibrary.simpleMessage("下级累计充值"),
        "random_text_921": MessageLookupByLibrary.simpleMessage("或以上"),
        "random_text_922": MessageLookupByLibrary.simpleMessage("下级累计投注"),
        "random_text_923": MessageLookupByLibrary.simpleMessage("下级累计充值次数"),
        "random_text_924": MessageLookupByLibrary.simpleMessage("2次或以上"),
        "random_text_925": MessageLookupByLibrary.simpleMessage("下级累计充值天数"),
        "random_text_926": MessageLookupByLibrary.simpleMessage("存入一笔试试看"),
        "random_text_927": MessageLookupByLibrary.simpleMessage("推广活动"),
        "random_text_928": MessageLookupByLibrary.simpleMessage("快捷分享"),
        "random_text_929": MessageLookupByLibrary.simpleMessage("有效推广人数 0 人"),
        "random_text_930":
            MessageLookupByLibrary.simpleMessage("什么是有效推广人数？（满足以下有所条件）"),
        "random_text_931": MessageLookupByLibrary.simpleMessage("活动要求"),
        "random_text_932":
            MessageLookupByLibrary.simpleMessage("累计充值满足活动要求，每日00:00清零"),
        "random_text_933": MessageLookupByLibrary.simpleMessage("指定存款"),
        "random_text_934": MessageLookupByLibrary.simpleMessage("总存款"),
        "random_text_935": MessageLookupByLibrary.simpleMessage("活动内容"),
        "random_text_936": MessageLookupByLibrary.simpleMessage(
            "1.每日存款累计，可获得不同级别的奖动。存入越多，奖励越大，最高可达0.02 \n\n2.活动期间，每天00:00，累计充值金额将清零，您可以继续充值领取奖励 \n\n3,奖励只能次日领取，且只能在ios、Android、H5、PC平台手动领取，未领取无效 \n\n4.本次活动奖金（不含本金）需1倍有效投注才能提现，投注不限游戏平台 \n\n5.本活动仅限账户所有者正常手动操作、出租、使用作弊软件、机器人、不同账户之问对赌、相互操纵、套利、API、协议、利用漏洞、群控或其他技术手段禁止，否则奖励可能被取消、扣除，或账户被冻结甚至列入黑名单 \n\n6.为了避免文字理解上的差异，平台保留对本次活动的最终解释权"),
        "random_text_937": MessageLookupByLibrary.simpleMessage("天降奖金 存入一笔试试看"),
        "random_text_938": MessageLookupByLibrary.simpleMessage("保级提示"),
        "random_text_939": MessageLookupByLibrary.simpleMessage("领取返水"),
        "random_text_939copy2": MessageLookupByLibrary.simpleMessage(""),
        "random_text_94": MessageLookupByLibrary.simpleMessage("成功领取佣金"),
        "random_text_940": MessageLookupByLibrary.simpleMessage("生日奖金"),
        "random_text_941": MessageLookupByLibrary.simpleMessage("平台"),
        "random_text_942": MessageLookupByLibrary.simpleMessage("比例"),
        "random_text_943": MessageLookupByLibrary.simpleMessage("保级充值还需 "),
        "random_text_944": MessageLookupByLibrary.simpleMessage("保级打码还需 "),
        "random_text_945": MessageLookupByLibrary.simpleMessage("红包活动"),
        "random_text_946": MessageLookupByLibrary.simpleMessage("每场红包100000"),
        "random_text_947": MessageLookupByLibrary.simpleMessage("，最大红包8888"),
        "random_text_948":
            MessageLookupByLibrary.simpleMessage("1.每次红包雨都免费分发100,000雷亚尔"),
        "random_text_949":
            MessageLookupByLibrary.simpleMessage("2.最大现金下降额：每次红包都免费分发"),
        "random_text_95": MessageLookupByLibrary.simpleMessage("到您的 账户"),
        "random_text_950":
            MessageLookupByLibrary.simpleMessage("3.已充值的会员可以免费领取"),
        "random_text_951":
            MessageLookupByLibrary.simpleMessage("4.所领取的现金可用于游戏或直接提取"),
        "random_text_952":
            MessageLookupByLibrary.simpleMessage("5.VIP会员等级越高，领取的现金越多"),
        "random_text_953": MessageLookupByLibrary.simpleMessage(
            "6.为了避免文字理解上的差异，平台保留对本次活动的最终解释权"),
        "random_text_954": MessageLookupByLibrary.simpleMessage("  金钱如雨每天6次  "),
        "random_text_955": MessageLookupByLibrary.simpleMessage("金钱如雨\n拆包有奖"),
        "random_text_956": MessageLookupByLibrary.simpleMessage("每天6次"),
        "random_text_957": MessageLookupByLibrary.simpleMessage("每月1日至7日"),
        "random_text_958": MessageLookupByLibrary.simpleMessage("每周五、周六、周日"),
        "random_text_959": MessageLookupByLibrary.simpleMessage("每天3次"),
        "random_text_96": MessageLookupByLibrary.simpleMessage("领取成功"),
        "random_text_960": MessageLookupByLibrary.simpleMessage("其他时间"),
        "random_text_961": MessageLookupByLibrary.simpleMessage("下一场红包"),
        "random_text_962": MessageLookupByLibrary.simpleMessage("幸运奖金"),
        "random_text_963": MessageLookupByLibrary.simpleMessage("进行中"),
        "random_text_964": MessageLookupByLibrary.simpleMessage("未开启"),
        "random_text_965":
            MessageLookupByLibrary.simpleMessage("存款+投注（连续7天后重置）"),
        "random_text_966": MessageLookupByLibrary.simpleMessage("下级首次充值"),
        "random_text_967": MessageLookupByLibrary.simpleMessage("天"),
        "random_text_967_copy": MessageLookupByLibrary.simpleMessage("天"),
        "random_text_968": MessageLookupByLibrary.simpleMessage("有效推广人数 "),
        "random_text_969": MessageLookupByLibrary.simpleMessage(" 人"),
        "random_text_97": MessageLookupByLibrary.simpleMessage("佣金领取"),
        "random_text_970": MessageLookupByLibrary.simpleMessage("/23人"),
        "random_text_971": MessageLookupByLibrary.simpleMessage("总充值"),
        "random_text_972": MessageLookupByLibrary.simpleMessage("直属充值"),
        "random_text_973": MessageLookupByLibrary.simpleMessage("其他充值"),
        "random_text_974": MessageLookupByLibrary.simpleMessage("当前打码 "),
        "random_text_975": MessageLookupByLibrary.simpleMessage("充值"),
        "random_text_976": MessageLookupByLibrary.simpleMessage("打码"),
        "random_text_977": MessageLookupByLibrary.simpleMessage("您已领取成功"),
        "random_text_978": MessageLookupByLibrary.simpleMessage("暂无可领取返水"),
        "random_text_979": MessageLookupByLibrary.simpleMessage("场馆"),
        "random_text_98": MessageLookupByLibrary.simpleMessage("您当前佣金可领取："),
        "random_text_980":
            MessageLookupByLibrary.simpleMessage("1.所有投注币种金额系统将会自动换算成USDT"),
        "random_text_981":
            MessageLookupByLibrary.simpleMessage("2.汇率将会按照注单结算时的市场汇率为准"),
        "random_text_982":
            MessageLookupByLibrary.simpleMessage("3.已经统计的有效投注不会受后续汇率影响"),
        "random_text_983":
            MessageLookupByLibrary.simpleMessage("1.所有充值的货币将会根据市场实时汇率进行换算"),
        "random_text_984":
            MessageLookupByLibrary.simpleMessage("2.汇率会按照充值成功时的市场汇率为准"),
        "random_text_985":
            MessageLookupByLibrary.simpleMessage("打码将按照您的有效投注额来计算"),
        "random_text_986":
            MessageLookupByLibrary.simpleMessage("充值将按照市场汇率算成USDT"),
        "random_text_987": MessageLookupByLibrary.simpleMessage("每月"),
        "random_text_988": MessageLookupByLibrary.simpleMessage("日"),
        "random_text_988cpoy2": m13,
        "random_text_989": MessageLookupByLibrary.simpleMessage("周一"),
        "random_text_99": MessageLookupByLibrary.simpleMessage("你可自由选择币种领取"),
        "random_text_990": MessageLookupByLibrary.simpleMessage("周二"),
        "random_text_991": MessageLookupByLibrary.simpleMessage("周三"),
        "random_text_992": MessageLookupByLibrary.simpleMessage("周四"),
        "random_text_993": MessageLookupByLibrary.simpleMessage("周五"),
        "random_text_994": MessageLookupByLibrary.simpleMessage("周六"),
        "random_text_995": MessageLookupByLibrary.simpleMessage("周日"),
        "random_text_996": MessageLookupByLibrary.simpleMessage("每"),
        "random_text_997": MessageLookupByLibrary.simpleMessage("兑换失败"),
        "random_text_998": MessageLookupByLibrary.simpleMessage("领取并兑换"),
        "random_text_999": MessageLookupByLibrary.simpleMessage("每场红包"),
        "random_text_fix1":
            MessageLookupByLibrary.simpleMessage("请在您的电邮地址中加入 “@” 符号"),
        "random_text_fix2": MessageLookupByLibrary.simpleMessage("已发送密码重置电邮"),
        "random_text_fix3": MessageLookupByLibrary.simpleMessage(
            "别忘了在您离开之前先查看我们丰富的娱乐城与体育博彩促销活动"),
        "reacquire": MessageLookupByLibrary.simpleMessage("重新获取"),
        "receive": MessageLookupByLibrary.simpleMessage("领取"),
        "recover_password_text": MessageLookupByLibrary.simpleMessage("恢复密码"),
        "recover_password_title_text":
            MessageLookupByLibrary.simpleMessage("重置密码"),
        "redeem_bonus_text": MessageLookupByLibrary.simpleMessage("兑换空头奖金"),
        "redeem_bonus_tips_text": MessageLookupByLibrary.simpleMessage(
            "在我们的社交媒体平台（如Twitter和Telegram）上获取空投奖金代码"),
        "redeem_code_text": MessageLookupByLibrary.simpleMessage("代码"),
        "reg_next": MessageLookupByLibrary.simpleMessage("继续"),
        "register_an_account": MessageLookupByLibrary.simpleMessage("注册账户"),
        "register_protocol_title":
            MessageLookupByLibrary.simpleMessage("条款与条件"),
        "resend_email_text": MessageLookupByLibrary.simpleMessage("重新发送"),
        "responsible_btn_clear_limit":
            MessageLookupByLibrary.simpleMessage("清除限额"),
        "responsible_btn_request_self_exclusion":
            MessageLookupByLibrary.simpleMessage("请求自我排除"),
        "responsible_for_gambling":
            MessageLookupByLibrary.simpleMessage("负责任博彩"),
        "responsible_gaming": MessageLookupByLibrary.simpleMessage("负责任博彩"),
        "responsible_label_loss_limits":
            MessageLookupByLibrary.simpleMessage("损失限额"),
        "responsible_tab_betting_limits":
            MessageLookupByLibrary.simpleMessage("投注限额"),
        "responsible_title_self_exclusion":
            MessageLookupByLibrary.simpleMessage("自我排除"),
        "s_2fa_body_code_text": MessageLookupByLibrary.simpleMessage("双重验证码"),
        "s_2fa_body_code_text1": MessageLookupByLibrary.simpleMessage("双重验证码"),
        "s_2fa_body_tips_text":
            MessageLookupByLibrary.simpleMessage("启用双重验证以让您的账户更加安全。"),
        "s_2fa_body_title_text": MessageLookupByLibrary.simpleMessage("关闭双重验证"),
        "s_2fa_body_warning_text": MessageLookupByLibrary.simpleMessage(
            "禁用后需要重新在Authenticator中添加秘钥，旧的秘钥将失效"),
        "search_game": MessageLookupByLibrary.simpleMessage("搜索游戏"),
        "set_fund_password": MessageLookupByLibrary.simpleMessage("设置资金密码"),
        "setting": MessageLookupByLibrary.simpleMessage("设置"),
        "settled_bet": MessageLookupByLibrary.simpleMessage("已结算"),
        "setup_pay_password_button_text":
            MessageLookupByLibrary.simpleMessage("电邮验证"),
        "setup_pay_password_title_text":
            MessageLookupByLibrary.simpleMessage("资金密码将用于保护提款，保险库取款安全"),
        "showingContentNow": m14,
        "single_bet": MessageLookupByLibrary.simpleMessage("单项投注"),
        "snack_bar_normal_tips": MessageLookupByLibrary.simpleMessage("温馨提示"),
        "social_account_text": MessageLookupByLibrary.simpleMessage("社交账号"),
        "sponsorships": MessageLookupByLibrary.simpleMessage("赞助活动"),
        "sport_add_more": MessageLookupByLibrary.simpleMessage("加载更多"),
        "sport_all": MessageLookupByLibrary.simpleMessage("全部"),
        "sport_bet": MessageLookupByLibrary.simpleMessage("体育投注"),
        "sport_bet_dota2": MessageLookupByLibrary.simpleMessage("刀塔2"),
        "sport_bet_football": MessageLookupByLibrary.simpleMessage("足球"),
        "sport_bet_handicap": MessageLookupByLibrary.simpleMessage("让分盘"),
        "sport_bet_hot": MessageLookupByLibrary.simpleMessage("热门赛事"),
        "sport_bet_lol": MessageLookupByLibrary.simpleMessage("英雄联盟"),
        "sport_bet_page": MessageLookupByLibrary.simpleMessage("主页"),
        "sport_bet_pingpong": MessageLookupByLibrary.simpleMessage("乒乓球"),
        "sport_bet_puck": MessageLookupByLibrary.simpleMessage("冰球"),
        "sport_bet_score": MessageLookupByLibrary.simpleMessage("总分盘"),
        "sport_bet_tennis": MessageLookupByLibrary.simpleMessage("网球"),
        "sport_bet_volleyball": MessageLookupByLibrary.simpleMessage("排球"),
        "sport_bet_winning": MessageLookupByLibrary.simpleMessage("获胜盘"),
        "sport_betting_begin_bet":
            MessageLookupByLibrary.simpleMessage("立即开始下注"),
        "sport_champion": MessageLookupByLibrary.simpleMessage("冠军投注"),
        "sport_des_one": MessageLookupByLibrary.simpleMessage("最棒的加密货币在线体育博彩"),
        "sport_des_two": MessageLookupByLibrary.simpleMessage(
            "通过我们的体育博彩平台投注于来自世界各地的体育团队、选手及联赛。在综合格斗、篮球、足球等多个体育赛事的各种博彩项目上以及滚球盘口中进行投注，享受无与伦比的体育博彩体验。"),
        "sport_event_list_begin_time":
            MessageLookupByLibrary.simpleMessage("开始时间"),
        "sport_event_list_over": MessageLookupByLibrary.simpleMessage("已结束"),
        "sport_event_list_sort_ab": MessageLookupByLibrary.simpleMessage("所有"),
        "sport_event_list_sort_hot": MessageLookupByLibrary.simpleMessage("热门"),
        "sport_event_list_time_hour_after":
            MessageLookupByLibrary.simpleMessage("开始时间：60小时后"),
        "sport_event_list_time_min_after":
            MessageLookupByLibrary.simpleMessage("开始时间：60分钟后"),
        "sport_event_list_time_sec_after":
            MessageLookupByLibrary.simpleMessage("开始时间：60秒后"),
        "sport_fav_comming_rolling":
            MessageLookupByLibrary.simpleMessage("即将开始的热门赛事"),
        "sport_fav_hot_rolling": MessageLookupByLibrary.simpleMessage("收藏"),
        "sport_lock": MessageLookupByLibrary.simpleMessage("关盘"),
        "sport_locked": MessageLookupByLibrary.simpleMessage("锁盘"),
        "sport_nodata": MessageLookupByLibrary.simpleMessage("无数据"),
        "sport_rolling_coming":
            MessageLookupByLibrary.simpleMessage("滚球和即将开赛的盘口"),
        "sport_tabbar_coming": MessageLookupByLibrary.simpleMessage("即将开赛"),
        "sport_tabbar_favorites": MessageLookupByLibrary.simpleMessage("收藏夹"),
        "sport_tabbar_hall": MessageLookupByLibrary.simpleMessage("大厅"),
        "sport_tabbar_mybet": MessageLookupByLibrary.simpleMessage("我的投注"),
        "sport_tabbar_rank": MessageLookupByLibrary.simpleMessage("竞赛排行"),
        "sport_tabbar_rolling": MessageLookupByLibrary.simpleMessage("滚球盘"),
        "sport_unlogin": MessageLookupByLibrary.simpleMessage("未登录"),
        "sports_betting_rules": MessageLookupByLibrary.simpleMessage("体育博彩规则"),
        "start_game_text": MessageLookupByLibrary.simpleMessage("开始游戏"),
        "state_pending": MessageLookupByLibrary.simpleMessage("待处理"),
        "state_processed": MessageLookupByLibrary.simpleMessage("已处理"),
        "statistics_title_lose_text": MessageLookupByLibrary.simpleMessage("输"),
        "statistics_title_total_text":
            MessageLookupByLibrary.simpleMessage("总投注额"),
        "statistics_title_win_text": MessageLookupByLibrary.simpleMessage("赢"),
        "submit_bet_result": MessageLookupByLibrary.simpleMessage("已成功押下总值"),
        "submit_bet_result_amount": m15,
        "submit_text": MessageLookupByLibrary.simpleMessage("提交"),
        "success_pwd": MessageLookupByLibrary.simpleMessage("成功"),
        "successfullyCopi": MessageLookupByLibrary.simpleMessage("已成功复制!"),
        "tab_bar_chat_room": MessageLookupByLibrary.simpleMessage("聊天室"),
        "tab_bar_ent": MessageLookupByLibrary.simpleMessage("娱乐城"),
        "tab_bar_ent_copy": MessageLookupByLibrary.simpleMessage("娱乐城"),
        "tab_bar_exchange_text": MessageLookupByLibrary.simpleMessage("优惠兑换"),
        "tab_bar_kyc_text": MessageLookupByLibrary.simpleMessage("KYC验证"),
        "tab_bar_menu": MessageLookupByLibrary.simpleMessage("浏览"),
        "tab_bar_order": MessageLookupByLibrary.simpleMessage("投注"),
        "tab_bar_orders": MessageLookupByLibrary.simpleMessage("投注单"),
        "tab_bar_sports": MessageLookupByLibrary.simpleMessage("体育"),
        "tab_bar_title_2fa_text": MessageLookupByLibrary.simpleMessage("双重验证"),
        "tab_bar_title_2fa_textcopy2":
            MessageLookupByLibrary.simpleMessage("双重验证"),
        "tab_bar_title_black_list_text":
            MessageLookupByLibrary.simpleMessage("黑名单"),
        "tab_bar_title_change_password_text":
            MessageLookupByLibrary.simpleMessage("修改密码"),
        "tab_bar_title_contact_text":
            MessageLookupByLibrary.simpleMessage("联系方式"),
        "tab_bar_title_data_statistics_text":
            MessageLookupByLibrary.simpleMessage("统计数据"),
        "tab_bar_title_google_verification_text":
            MessageLookupByLibrary.simpleMessage("谷歌验证"),
        "tab_bar_title_login_log_text":
            MessageLookupByLibrary.simpleMessage("登录日志"),
        "tab_bar_title_privacy_text":
            MessageLookupByLibrary.simpleMessage("隐私选项"),
        "tab_bar_title_trophy_text": MessageLookupByLibrary.simpleMessage("奖杯"),
        "tab_bar_title_withdrawal_info_text":
            MessageLookupByLibrary.simpleMessage("出款资料"),
        "terms_of_service_text": MessageLookupByLibrary.simpleMessage("服务条款"),
        "text_field_birthday_tips":
            MessageLookupByLibrary.simpleMessage("出生日期"),
        "text_field_user_name_tips":
            MessageLookupByLibrary.simpleMessage("用户名"),
        "text_filed_tips_repeat_password_text":
            MessageLookupByLibrary.simpleMessage("重复密码"),
        "token_invalid_text": MessageLookupByLibrary.simpleMessage("您的令牌已过期"),
        "top_login": MessageLookupByLibrary.simpleMessage("登录"),
        "top_login_copy": MessageLookupByLibrary.simpleMessage("登录"),
        "top_register": MessageLookupByLibrary.simpleMessage("注册"),
        "top_sports": MessageLookupByLibrary.simpleMessage("顶级体育项目"),
        "top_wallet_setting": MessageLookupByLibrary.simpleMessage("钱包设置"),
        "transaction_password": MessageLookupByLibrary.simpleMessage("交易密码"),
        "transaction_password_set_successfully":
            MessageLookupByLibrary.simpleMessage("交易密码设置成功"),
        "transaction_records": MessageLookupByLibrary.simpleMessage("交易记录"),
        "transactions_detail_bet": MessageLookupByLibrary.simpleMessage("投注:"),
        "transactions_detail_blockchan_protocol":
            MessageLookupByLibrary.simpleMessage("交易协议:"),
        "transactions_detail_card": MessageLookupByLibrary.simpleMessage("信用卡"),
        "transactions_detail_card_number":
            MessageLookupByLibrary.simpleMessage("收款账户:"),
        "transactions_detail_coin_type":
            MessageLookupByLibrary.simpleMessage("币种:"),
        "transactions_detail_help":
            MessageLookupByLibrary.simpleMessage("如需帮助，请联系在线支持"),
        "transactions_detail_means":
            MessageLookupByLibrary.simpleMessage("交易方式:"),
        "transactions_detail_odds": MessageLookupByLibrary.simpleMessage("乘数:"),
        "transactions_detail_order_id":
            MessageLookupByLibrary.simpleMessage("订单编号:"),
        "transactions_detail_pay": MessageLookupByLibrary.simpleMessage("支付额:"),
        "transactions_detail_play": m16,
        "transactions_detail_player": m17,
        "transactions_detail_state":
            MessageLookupByLibrary.simpleMessage("状态:"),
        "transactions_detail_state_confirmed":
            MessageLookupByLibrary.simpleMessage("已确认"),
        "transactions_detail_state_confirming":
            MessageLookupByLibrary.simpleMessage("确认中"),
        "transactions_detail_state_fail":
            MessageLookupByLibrary.simpleMessage("失败"),
        "transactions_detail_state_time_out":
            MessageLookupByLibrary.simpleMessage("订单超时"),
        "transactions_detail_time":
            MessageLookupByLibrary.simpleMessage("交易时间:"),
        "transactions_other": MessageLookupByLibrary.simpleMessage("其他"),
        "transactions_other_bonus": MessageLookupByLibrary.simpleMessage("奖金"),
        "transactions_other_campaign_withdrawal":
            MessageLookupByLibrary.simpleMessage("活动佣金取款"),
        "transactions_other_drop": MessageLookupByLibrary.simpleMessage("空投奖金"),
        "transactions_other_rains_received":
            MessageLookupByLibrary.simpleMessage("收到的红包雨"),
        "transactions_other_reload_claim":
            MessageLookupByLibrary.simpleMessage("充值奖金领取"),
        "twice_password_error_text":
            MessageLookupByLibrary.simpleMessage("两次输入的密码不一致"),
        "two_password_inputs_are_inconsistent":
            MessageLookupByLibrary.simpleMessage("两次密码输入不一致"),
        "user_name_error_tips":
            MessageLookupByLibrary.simpleMessage("用户名含有无效的字符"),
        "user_name_uppercase_error_tips":
            MessageLookupByLibrary.simpleMessage("用户名不能包含大写字符"),
        "username_already_exists_text":
            MessageLookupByLibrary.simpleMessage("此用户名已被使用，请选择另一用户名"),
        "vault": MessageLookupByLibrary.simpleMessage("保险库"),
        "vault_Cancel_deposit_request":
            MessageLookupByLibrary.simpleMessage("取消存款申请"),
        "vault_Confirm_deposit_with_full_amount_excluding_fees_to_avoid_issues_with_crediting":
            MessageLookupByLibrary.simpleMessage(
                "请确认收款地址存入完整金额（不含手续费），否则可能导致无法上分"),
        "vault_USDT_transfer_in_progress_Please_wait_for_confirmation": m18,
        "vault_address": MessageLookupByLibrary.simpleMessage("地址"),
        "vault_amount": MessageLookupByLibrary.simpleMessage("金额"),
        "vault_amountCannotExceedMaximum":
            MessageLookupByLibrary.simpleMessage("金额不能超过最大值"),
        "vault_confirm_payment": MessageLookupByLibrary.simpleMessage("确认支付"),
        "vault_confirmedExtractionFromVault":
            MessageLookupByLibrary.simpleMessage("已确认从保险库提取"),
        "vault_confirmedExtractionFromVaultcopy2":
            MessageLookupByLibrary.simpleMessage(""),
        "vault_currency": MessageLookupByLibrary.simpleMessage("保险库货币"),
        "vault_deposit": MessageLookupByLibrary.simpleMessage("存入"),
        "vault_deposit_vault": MessageLookupByLibrary.simpleMessage("存入保险库"),
        "vault_enteringVault": MessageLookupByLibrary.simpleMessage("进保险库"),
        "vault_have_deposited": MessageLookupByLibrary.simpleMessage("我已存款"),
        "vault_increase_your_account_security_with_double_verification":
            MessageLookupByLibrary.simpleMessage("通过双重验证提高您的账户安全性"),
        "vault_max_value": MessageLookupByLibrary.simpleMessage("最大值"),
        "vault_minimum_amount_limit_text": m19,
        "vault_recharge_amount": MessageLookupByLibrary.simpleMessage("充值金额"),
        "vault_successfullyStor": MessageLookupByLibrary.simpleMessage("成功存放"),
        "vault_take_out": MessageLookupByLibrary.simpleMessage("取出"),
        "vault_takeout": MessageLookupByLibrary.simpleMessage("保险库取款"),
        "vault_the_minimal_amount_is": m20,
        "vault_this_field_is_required":
            MessageLookupByLibrary.simpleMessage("请选择地址"),
        "vault_transfer_amount": m21,
        "vault_transfer_to_address":
            MessageLookupByLibrary.simpleMessage("转入地址"),
        "vault_turn_on_two_step_verification":
            MessageLookupByLibrary.simpleMessage("启用双重验证"),
        "vault_two_step_verification":
            MessageLookupByLibrary.simpleMessage("双重验证"),
        "vault_vaultDeposits": MessageLookupByLibrary.simpleMessage("保险库存款"),
        "vault_withdraw_money": MessageLookupByLibrary.simpleMessage("提款"),
        "verification_code_must_be_filled":
            MessageLookupByLibrary.simpleMessage("验证码不能为空"),
        "version": MessageLookupByLibrary.simpleMessage("版本号"),
        "vip": MessageLookupByLibrary.simpleMessage("VIP"),
        "vip_bouns_history_tab_amount":
            MessageLookupByLibrary.simpleMessage("领取金额"),
        "vip_bouns_history_tab_time":
            MessageLookupByLibrary.simpleMessage("领取时间"),
        "vip_bouns_history_tab_type":
            MessageLookupByLibrary.simpleMessage("领取类型"),
        "vip_bouns_total": MessageLookupByLibrary.simpleMessage("领取总额："),
        "vip_club": MessageLookupByLibrary.simpleMessage("VIP俱乐部"),
        "vip_commission_history": MessageLookupByLibrary.simpleMessage("领取记录"),
        "vip_commission_receive": MessageLookupByLibrary.simpleMessage("一键领取"),
        "vip_degree_of_progress": MessageLookupByLibrary.simpleMessage("进展程度"),
        "vip_get_recharge_bonus":
            MessageLookupByLibrary.simpleMessage("领取充值奖金"),
        "vip_level": MessageLookupByLibrary.simpleMessage("暂无级别"),
        "vip_level_copper": MessageLookupByLibrary.simpleMessage("铜"),
        "vip_next_collection_is_at": m22,
        "vip_next_level": m23,
        "vip_recharge_bonus": MessageLookupByLibrary.simpleMessage("充值奖金"),
        "vip_recharge_bonus_is_valid_until": m24,
        "vip_rule_content": MessageLookupByLibrary.simpleMessage(
            "1.晋级标准：满足VIP晋级要求（即打码都满足条件），即可晋级相应VIP等级，获得相应晋级奖金，如连续晋级多级，可领取全部等级晋级奖金；\n\n2.日俸禄：达到VIP等级对应日俸禄要求，即可领取对应日奖金，每日00:00重置； \n\n3.周俸禄：达到VIP等级对应周俸禄要求，即可领取对应周奖金，每周一00:00重置； \n\n4.月俸禄：每月充值及打码达到当前VIP等级对应月俸禄要求，即可领取对应月奖金，每月1日00:00重置； \n\n5.保级说明：会员在达到某VIP等级后，若上个月充值及打码未达到保级要求，则自动降一个等级； \n\n6.稽核说明：VIP所赠送的奖金需1倍流水（即稽核、打码或有效投注）才能提现，打码不限游戏平台； \n\n7.活动声明：本功能仅限账号本人进行正常游戏投注，禁止租借账号、无风险投注(对赌、对刷、低赔刷水)、恶意套利、使用外挂程式、机器人、利用协议、漏洞、接口、群控或其他技术手段参与，一经查核属实，本平台有权终止会员登录、暂停会员使用网站、及没收奖金和不当盈利的权利，无需特别通知； \n\n8.解释说明：会员领取VIP奖励时，本平台将默认会员同意且遵守对应条件等相关规定，为避免文字理解歧义，本平台保有本活动最终解释权。"),
        "vip_rule_title": MessageLookupByLibrary.simpleMessage("VIP规则说明"),
        "vip_tab_bouns": MessageLookupByLibrary.simpleMessage("晋级奖金"),
        "vip_tab_bouns_day": MessageLookupByLibrary.simpleMessage("日俸禄奖金"),
        "vip_tab_bouns_month": MessageLookupByLibrary.simpleMessage("月俸禄奖金"),
        "vip_tab_bouns_week": MessageLookupByLibrary.simpleMessage("周俸禄奖金"),
        "vip_tab_exp": MessageLookupByLibrary.simpleMessage("晋级经验"),
        "vip_tab_level": MessageLookupByLibrary.simpleMessage("等级"),
        "vip_tab_turnover": MessageLookupByLibrary.simpleMessage("状态"),
        "vip_welfare": MessageLookupByLibrary.simpleMessage("福利"),
        "vip_your_progress": MessageLookupByLibrary.simpleMessage("您的 VIP 进度"),
        "viprule_content1": MessageLookupByLibrary.simpleMessage(
            "1.晋级标准：满足VIP晋级要求（即打码都满足条件），即可晋级相应VIP等级，获得相应晋级奖金，如连续晋级多级，可领取全部等级晋级奖金"),
        "viprule_content2": MessageLookupByLibrary.simpleMessage(
            "2.日俸禄：达到VIP等级对应日俸禄要求，即可领取对应日奖金，每日00:00重置"),
        "viprule_content3": MessageLookupByLibrary.simpleMessage(
            "3.周俸禄：达到VIP等级对应周俸禄要求，即可领取对应周奖金，每周一00:00重置"),
        "viprule_content4": MessageLookupByLibrary.simpleMessage(
            "4.月俸禄：每月充值及打码达到当前VIP等级对应月俸禄要求，即可领取对应月奖金，每月1日00:00重置"),
        "viprule_content5": MessageLookupByLibrary.simpleMessage(
            "5.保级说明：会员在达到某VIP等级后，若上个月充值及打码未达到保级要求，则自动降一个等级"),
        "viprule_content6": MessageLookupByLibrary.simpleMessage(
            "6.稽核说明：VIP所赠送的奖金需1倍流水（即稽核、打码或有效投注）才能提现，打码不限游戏平台"),
        "viprule_content7": MessageLookupByLibrary.simpleMessage(
            "7.活动声明：本功能仅限账号本人进行正常游戏投注，禁止租借账号、无风险投注(对赌、对刷、低赔刷水)、恶意套利、使用外挂程式、机器人、利用协议、漏洞、接口、群控或其他技术手段参与，一经查核属实，本平台有权终止会员登录、暂停会员使用网站、及没收奖金和不当盈利的权利，无需特别通知"),
        "viprule_content8": MessageLookupByLibrary.simpleMessage(
            "8.解释说明：会员领取VIP奖励时，本平台将默认会员同意且遵守对应条件等相关规定，为避免文字理解歧义，本平台保有本活动最终解释权"),
        "viprule_content_copy1": MessageLookupByLibrary.simpleMessage(
            "满足VIP晋级要求（即打码都满足条件），即可晋级相应VIP等级，获得相应晋级奖金，如连续晋级多级，可领取全部等级晋级奖金；"),
        "wallet": MessageLookupByLibrary.simpleMessage("钱包"),
        "wallet_accountOpeningOutlets":
            MessageLookupByLibrary.simpleMessage("开户网点"),
        "wallet_amountCannotBe": m25,
        "wallet_bankSelection": MessageLookupByLibrary.simpleMessage("银行选择"),
        "wallet_cancel": MessageLookupByLibrary.simpleMessage("取消"),
        "wallet_confirmDelete": MessageLookupByLibrary.simpleMessage("确认删除"),
        "wallet_currency": MessageLookupByLibrary.simpleMessage("货币"),
        "wallet_deleteConfirmation":
            MessageLookupByLibrary.simpleMessage("删除确认"),
        "wallet_deposit": MessageLookupByLibrary.simpleMessage("存款"),
        "wallet_deposit_copy": MessageLookupByLibrary.simpleMessage("存款"),
        "wallet_email_hint_auth":
            MessageLookupByLibrary.simpleMessage("您必须验证您的电邮地址才能进行提款"),
        "wallet_email_open": MessageLookupByLibrary.simpleMessage("打开 Gmail"),
        "wallet_enterFundPassword":
            MessageLookupByLibrary.simpleMessage("输入资金密码"),
        "wallet_fundPassword": MessageLookupByLibrary.simpleMessage("资金密码"),
        "wallet_fundPasswordcopy2":
            MessageLookupByLibrary.simpleMessage("资金密码"),
        "wallet_goToSettings": MessageLookupByLibrary.simpleMessage("前往设置"),
        "wallet_hideChangeBalance":
            MessageLookupByLibrary.simpleMessage("隐藏零钱余额"),
        "wallet_maximumAmountIs": MessageLookupByLibrary.simpleMessage("最大金额为"),
        "wallet_minimumAmountIs": MessageLookupByLibrary.simpleMessage("最小金额为"),
        "wallet_paymentBankCard": MessageLookupByLibrary.simpleMessage("出款银行卡"),
        "wallet_pixAccount": MessageLookupByLibrary.simpleMessage("PIX账号"),
        "wallet_pleaseBindWithdrawalMethodBeforeMakingWithdrawal":
            MessageLookupByLibrary.simpleMessage("请先绑定提款方式，再进行提款"),
        "wallet_pleaseEnterAmount":
            MessageLookupByLibrary.simpleMessage("10.00-100000.00"),
        "wallet_pleaseEnterFundPassword":
            MessageLookupByLibrary.simpleMessage("请输入资金密码"),
        "wallet_pleaseEnterNameDepositor":
            MessageLookupByLibrary.simpleMessage("请输入存款人姓名"),
        "wallet_pleaseSelectAmount":
            MessageLookupByLibrary.simpleMessage("请选择金额"),
        "wallet_pleaseSelectPIXAccount":
            MessageLookupByLibrary.simpleMessage("请选择PIX账号"),
        "wallet_search": MessageLookupByLibrary.simpleMessage("搜索"),
        "wallet_setFundPassword":
            MessageLookupByLibrary.simpleMessage("为了您的资金安全，请先设置资金密码"),
        "wallet_successfulApplicationForPayment":
            MessageLookupByLibrary.simpleMessage("出款申请成功"),
        "wallet_transferAmount": MessageLookupByLibrary.simpleMessage("转账金额"),
        "wallet_withdraw_money": MessageLookupByLibrary.simpleMessage("取款"),
        "wallet_yourFundPasswordContainsDigit": m26,
        "wallet_yourZeroBalanceWillNotBeDisplayedInWallet":
            MessageLookupByLibrary.simpleMessage("您为零数的余额不会显示在钱包中"),
        "welcome_body_text": m27,
        "welcome_title_text": MessageLookupByLibrary.simpleMessage("欢迎"),
        "withdraw_money_type": MessageLookupByLibrary.simpleMessage("提款方式"),
        "you_have_not_bound_your_email":
            MessageLookupByLibrary.simpleMessage("您还未绑定邮箱"),
        "yulecheng_casino": MessageLookupByLibrary.simpleMessage("真人娱乐场"),
        "yulecheng_hot_recoment": MessageLookupByLibrary.simpleMessage("热门推荐"),
        "yulecheng_nextpage": MessageLookupByLibrary.simpleMessage("下一页"),
        "yulecheng_prepage": MessageLookupByLibrary.simpleMessage("上一页"),
        "yulecheng_savegame_tofavorite":
            MessageLookupByLibrary.simpleMessage("把游戏添加到收藏夹中"),
        "yulecheng_selectShowBalance":
            MessageLookupByLibrary.simpleMessage("选择您的显示余额"),
        "yulecheng_slot": MessageLookupByLibrary.simpleMessage("老虎机"),
        "yulecheng_special_slot": MessageLookupByLibrary.simpleMessage("特色老虎机"),
        "yulecheng_trygame": MessageLookupByLibrary.simpleMessage("试玩模式"),
        "yulecheng_zanwushoucang":
            MessageLookupByLibrary.simpleMessage("暂无任何收藏,请使用")
      };
}
