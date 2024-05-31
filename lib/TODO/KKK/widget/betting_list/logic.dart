import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/l10n.dart';
import '../../pages/betting/casino/betting_casino_state.dart';
import '../../pages/betting/sport/betting_sport_state.dart';
import '../../services/theme/theme_service.dart';

class BettinglistLogic extends GetxController with GetTickerProviderStateMixin {
  late List<Tab> tabs;
  late TabController? tabController;
  List<BetSlipData> betSlipList = [
    BetSlipData(
        name: 'Blackjack',
        icon: 'assets/images/bet_slip/ic_bet_list_icon.webp',
        money: '4423.42114....',
        moneyIcon: 'assets/images/bet_slip/ic_eth_bet_icon.webp'),
  ].obs;
  List<SportBetBean> betSportList = [
    SportBetBean(
      betTitle: S.current.random_text_272,
      money: '-4423.42114....',
    ),
  ].obs;
  List<CompetitionBean> competitonList = [
    CompetitionBean(
        name: S.current.random_text_238,
        icon: 'assets/images/bet_slip/ic_no_one.webp',
        money: '\$19,782,2390',
        moneyIcon: 'assets/images/bet_slip/ic_eth_bet_icon.webp',
        bonusMoney: '35%'),
  ].obs;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this);
    for (int i = 0; i < 20; i++) {
      betSlipList.add(BetSlipData(
          name: 'Blackjack',
          icon: 'assets/images/bet_slip/ic_bet_list_icon.webp',
          money: '4423.42114....',
          moneyIcon: 'assets/images/bet_slip/ic_eth_bet_icon.webp'));
    }
    for (int i = 0; i < 20; i++) {
      betSportList.add(SportBetBean(
        betTitle: S.current.random_text_272,
        money: '-4423.42114....',
      ));
    }
    for (int i = 0; i < 20; i++) {
      competitonList.add(CompetitionBean(
          name: S.current.random_text_238,
          icon: 'assets/images/bet_slip/ic_no_two.webp',
          money: '\$19,782,2390',
          moneyIcon: 'assets/images/bet_slip/ic_eth_bet_icon.webp',
          bonusMoney: '35%'));
    }
    super.onInit();
  }

  buildData(){
    tabs = [
      Tab(
        child: Text(S.current.casino_bet, style: ThemeService().theme.textTheme.bodyMedium),
      ),
      Tab(
        child: Text(S.current.sport_bet, style: ThemeService().theme.textTheme.bodyMedium),
      ),
      Tab(
        key: ValueKey('raceLeaderboard'),
        child: Text(S.current.race_leaderboard, style: ThemeService().theme.textTheme.bodyMedium),
      ),
    ].obs;
  }
}

class CompetitionBean {
  int? betId; //0：投注单 1:我的投注 3：风云榜 4:竞赛 5:所有投注
  String? icon;
  String name;
  String? money;
  String? moneyIcon;
  String? bonusMoney;

  CompetitionBean({
    required this.name,
    this.icon,
    this.money,
    this.betId,
    this.moneyIcon,
    this.bonusMoney,
  });
}
