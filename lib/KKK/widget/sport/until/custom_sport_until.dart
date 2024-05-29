import 'package:flutter_bet/pages/sport/sport_detail/model.dart';

class SportUntil{

  int getRowsCount(Ml e) {
    switch (e.pid) {
      case 1:
        return 2;
      case 2:
        return 2;
      case 3:
        return 3;
      default:
        return 3;
    }
  }


  List<List<T>> splitArrayIntoGroups<T>(List<T> array, int groupSize) {
    if (array.length < 1 || groupSize < 1) {
      return [];
    }

    List<List<T>> result = [];

    for (int i = 0; i < array.length; i += groupSize) {
      int end = i + groupSize;
      if (end > array.length) {
        end = array.length;
      }

      List<T> group = array.sublist(i, end);
      result.add(group);
    }

    return result;
  }

  String tabImage(bool c, int si) {
    switch (si) {
      case 0:
        return 'assets/images/sport/sport_all.webp';
      case 1:
        return 'assets/images/sport/s_1.webp';
      case 2:
        return 'assets/images/sport/s_2.webp';
      case 3:
        return 'assets/images/sport/s_3.webp';
      case 6:
        return 'assets/images/sport/s_6.webp';
      case 7:
        return 'assets/images/sport/s_7.webp';
      case 8:
        return 'assets/images/sport/s_8.webp';
      case 11:
        return 'assets/images/sport/s_11.webp';
      case 13:
        return 'assets/images/sport/s_13.webp';
      case 15:
        return 'assets/images/sport/s_15.webp';
      case 18:
        return 'assets/images/sport/s_18.webp';
      case 19:
        return 'assets/images/sport/s_19.webp';
      case 21:
        return 'assets/images/sport/s_21.webp';
      case 23:
        return 'assets/images/sport/s_23.webp';
      case 25:
        return 'assets/images/sport/s_29.webp';
      case 29:
        return 'assets/images/sport/s_29.webp';
      case 31:
        return 'assets/images/sport/s_31.webp';
      case 32:
        return 'assets/images/sport/s_32.webp';
      case 34:
        return 'assets/images/sport/s_34.webp';
      case 36:
        return 'assets/images/sport/s_36.webp';
      case 40:
        return 'assets/images/sport/s_40.webp';
      case 41:
        return 'assets/images/sport/s_41.webp';
      default:
        return 'assets/images/sport/s_999.webp';
    }
  }

  // String tabImage(bool c, int si) {
  //   switch (si) {
  //     case 0:
  //       if (c) {
  //         return 'assets/images/sport/sport_all.webp';
  //       } else {
  //         return 'assets/images/sport/sport_all.webp';
  //       }
  //     case 1:
  //       if (c) {
  //         return 'assets/images/sport/sport_s_zu.webp';
  //       } else {
  //         return 'assets/images/sport/sport_zu.webp';
  //       }
  //     case 3:
  //       if (c) {
  //         return 'assets/images/sport/sport_s_wang.webp';
  //       } else {
  //         return 'assets/images/sport/sport_wang.webp';
  //       }
  //     case 7:
  //       if (c) {
  //         return 'assets/images/sport/sport_s_yumao.webp';
  //       } else {
  //         return 'assets/images/sport/sport_yumao.webp';
  //       }
  //     case 8:
  //       if (c) {
  //         return 'assets/images/sport/sport_s_bang.webp';
  //       } else {
  //         return 'assets/images/sport/sport_bang.webp';
  //       }
  //     case 13:
  //       if (c) {
  //         return 'assets/images/sport/sport_s_ ban.webp';
  //       } else {
  //         return 'assets/images/sport/sport_ban.webp';
  //       }
  //     case 19:
  //       if (c) {
  //         return 'assets/images/sport/sport_s_meishi.webp';
  //       } else {
  //         return 'assets/images/sport/sport_meishi.webp';
  //       }
  //     case 36:
  //       if (c) {
  //         return 'assets/images/sport/sport_s_pingpang.webp';
  //       } else {
  //         return 'assets/images/sport/sport_pingpang.webp';
  //       }
  //     case 40:
  //       if (c) {
  //         return 'assets/images/sport/sport_s_pai.webp';
  //       } else {
  //         return 'assets/images/sport/sport_pai.webp';
  //       }
  //
  //     default:
  //       if (c) {
  //         return 'assets/images/sport/sport_s_ ban.webp';
  //       } else {
  //         return 'assets/images/sport/sport_ban.webp';
  //       }
  //
  //   }
  // }


  String detailBackImage(int si) {
    switch (si) {
      case 1:
        return 'assets/images/sport/sport_zuqiu.webp';

      case 3:
        return 'assets/images/sport/sport_wangqiu.webp';

      case 7:
        return 'assets/images/sport/sport_yumaoqiu.webp';

      // case 8:
      //   return 'assets/images/sport/sport_bangqiu.webp';

      case 13:
        return 'assets/images/sport/sport_banqiu.webp';

      // case 19:
      //   return 'assets/images/sport/sport_meishiqiu.webp';

      case 36:
        return 'assets/images/sport/sport_pingpangqiu.webp';

      case 40:
        return 'assets/images/sport/sport_paiqiu.webp';

      default:
        return 'assets/images/sport/sport_tongyong.webp';

        // if (c) {
        //   return 'assets/images/sport/sport_s_tiyong.webp';
        // } else {
        //   return 'assets/images/sport/sport_tiyong.webp';
        // }
        break;
    }
  }


}