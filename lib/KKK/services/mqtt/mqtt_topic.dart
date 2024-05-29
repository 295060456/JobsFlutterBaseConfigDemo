class MqttTopic {
  //首页滚动公告
  static String adTopic = "p38/homeData" ;

  //站内信
  static String noticeTopic = "";

  //提现
  static String withDrawTopic = "";

  //充值
  static String depositTopic = "";

  //投注
  static String betTopic = "";

  //余额
  static String balanceTopic = "";

  //用户
  static String memberTopic = "";

  //体育
  static String sportTopic = "";

  //第三方登录
  static String thirdLoginTopic = "";

  //通知消息
  static String notifyTopic = "";

  //获取所有投注 娱乐城数据推送消息
  static String rankingAllCasinoTopic = "";

  //获取所有投注 体育数据推送消息
  static String rankingAllSportsTopic = "";

  //获取风云榜 娱乐城数据推送消息
  static String rankingListCasinoTopic = "";

  //获取风云榜 体育数据推送消息
  static String rankingListSportsTopic = "";

  //获取活动100推送消息
  static String activity100Topic = "";

  //获取入款卡/支付方式/支付方法/通道等有变动时推送消息
  static String depositFlushTopic = "";

  //获取后台配置登录注册改动推送消息
  static String loginRegTopic = "";

  //获取活动100 状态变化 推送消息
  static String activity100StateTopic = "";

  //删除聊天消息 推送消息
  static String delMsgTopic = "";

}

enum MqttMessageTypes {
  messageAd,
  messageNotice,
  messageWithdraw,
  messageDeposit,
  messageChat,
  messageBet,
  messageBalance,
  messageMember,
  messageSport,
  messageThirdLogin,
  messageNotify,
  notifyTopic,
  messageRankingAllCasino,
  messageRankingAllSports,
  messageRankingListCasino,
  messageRankingListSports,
  messageDepositFlush,
  messageLoginReg,
  messageActivity100,
  messageActivity100State,
  messageDelMsg,
}
