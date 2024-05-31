enum OddContestType {
  /// 滚球盘
  rolling(type: 1),

  /// 即将开赛
  coming(type: 2),

  ///已结束
  over(type: 3);

  final int type;
  // final String name;

  const OddContestType({required this.type});


}

enum OddCountType {
  /// two
  two,

  /// three
  three,
}

enum OddStatusType {
  rolling,
  seletcted,
  unSeletcted,
  settled,//已结算
  closed, //关盘
  opening, //开盘
  locked; //锁盘
//   closed(type: 0, name: "关盘"),
//   opening(type: 1, name: "开盘"),
//   locked(type: 2, name: "锁盘");
}

enum SportCategotyType {
  sport_hall,
  sport_vr,
  sport_mybet,
  sport_fav,
  sport_rolling,
  sport_coming,
  sport_loading,
}

enum SportListCategotyType { sport_rolling, sport_hot, sport_other }

enum SportClikType {
  detail,
  odd,
  filter,
  fav,
  more,
  other,
  change,
}

enum SportWinningType {
  winning,
  handicap,
  score,
}
typedef SportBetClick = void Function(SportClikType type, int? section, int? row, int colum, int si, String eid);
// typedef SportBetMinAnimationCompelete = void Function();


typedef SportDetailClick = void Function();

typedef SportWinningStyleClick = void Function(String ss);
