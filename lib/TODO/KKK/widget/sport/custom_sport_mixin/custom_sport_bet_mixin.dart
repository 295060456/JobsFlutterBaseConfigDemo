import 'package:flutter/material.dart';
import 'package:flutter_bet/pages/sport/sport_detail/model.dart';
import 'package:get/get.dart';
import '../../../controllers/global_state_controller.dart';
import '../../../generated/l10n.dart';
import '../../../services/theme/theme_service.dart';

// A mixin for widgets that need to show an animation when clicked
mixin CustomSportBetMixin {
  void showButtonAnimation(BuildContext context, Offset startOffset, Size size, bool isAdd) {
    final overlayEntry = OverlayEntry(
      builder: (context) {
        return CustomSportBetOverlay(startOffset: startOffset, size: size, isAdd: isAdd);
      },
    );

    Overlay.of(context).insert(overlayEntry);

    Future.delayed(const Duration(milliseconds: 500), () {
      overlayEntry.remove();
    });
  }

  betOrder(M bet) {
    var g = Get.find<GlobalStateController>();
    if (g.bets.map((e) => e.wid).toList().contains(bet.wid)) {
      g.bets.removeWhere((element) => element.wid == bet.wid);
      bet.isChoose = false;
    } else {
      g.bets.add(bet);
      bet.isChoose = true;
    }
    g.bets.removeWhere((element) => element.showState == 1);
  }

  filterBet(List<SportMatchModel>? nl, List<SportMatchModel>? ol, bool i) {
    var g = Get.find<GlobalStateController>();
    nl?.forEach((q) {
      SportMatchModel? oo =
          ol?.firstWhere((selement) => selement.ei == q.ei, orElse: () => SportMatchModel());
      q.ml?.forEach((element) {
        if ((ol != null) && (ol.isNotEmpty)) {
          Ml? oldS =
              oo?.ml?.firstWhere((selement) => selement.mlid == element.mlid, orElse: () => Ml());
          if (oldS?.ms != null) {
            element.ms?.forEach((e) {
              try {
                M? oldbet = oldS?.ms?.firstWhere((ss) => ss.wid == e.wid);
                if (oldbet != null) {
                  if (i) {
                    e.oov = e.ov;
                    e.ov = oldbet?.ov;
                    double ov = double.parse(e.ov ?? '');
                    double oov = double.parse(e.oov ?? '');
                    if (ov > oov) {
                      e.isUp = 1;
                    } else if (oov < ov) {
                      e.isUp = 0;
                    } else {
                      e.isUp = 2;
                    }
                  } else {
                    e.oov = oldbet.ov;
                    double ov = double.parse(e.ov ?? '');
                    double oov = double.parse(e.oov ?? '');
                    if (ov > oov) {
                      e.isUp = 1;
                    } else if (oov < ov) {
                      e.isUp = 0;
                    } else {
                      e.isUp = 2;
                    }
                  }
                }
              } catch (err) {
                print(err);
              }
            });
          }
        }

        element.ms?.forEach((e) {
          if (g.bets.map((p) => p.wid).toList().contains(e.wid)) {
            e.isChoose = true;
          } else {
            e.isChoose = false;
          }
        });
      });
    });
  }

  // filterBetChoose(List<SportMatchModel>? l){
  //   var g = Get.find<GlobalStateController>();
  //   l?.forEach((a) {
  //     a.ml?.forEach((b) {
  //       b.ms?.forEach((c) {
  //         if (g.bets.map((p) => p.wid).toList().contains(c.wid)) {
  //           c.isChoose = true;
  //         }else{
  //
  //         }
  //       });
  //     });
  //   });
  // }

  filterReduceBet(List<SportMatchModel>? nl, String ei) {
    nl?.removeWhere((element) => element.ei == ei);
  }

  List<List<SportMatchModel>> groupByCi(List<SportMatchModel> sportList, String title, String cName) {
    Map<String, List<SportMatchModel>> groupedMap = {};
    List<List<SportMatchModel>> groupedArrays = [];


    if (title == S.current.sport_tabbar_coming) {
      SportMatchModel model = SportMatchModel();
      model.ml = sportList.expand((element) => element.ml ?? []).cast<Ml>().toList();
      model.cn = cName;
      groupedArrays = [
        [model]
      ];
    } else {
      for (var sportMatchModel in sportList) {
        String ci = sportMatchModel.ci ?? "default";
        groupedMap.putIfAbsent(ci, () => []).add(sportMatchModel);
      }

      groupedArrays = groupedMap.values.toList();
    }

    return groupedArrays;
  }
}

// A widget for the animation overlay
class CustomSportBetOverlay extends StatefulWidget {
  final Offset startOffset;
  final Size size;
  final bool isAdd;

  const CustomSportBetOverlay(
      {super.key, required this.startOffset, required this.size, required this.isAdd});

  @override
  _CustomSportBetOverlayState createState() => _CustomSportBetOverlayState();
}

class _CustomSportBetOverlayState extends State<CustomSportBetOverlay>
    with SingleTickerProviderStateMixin {
  late Offset currentPosition;
  late Animation<double> _scaleAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
    currentPosition = widget.startOffset;
    if (!widget.isAdd) {
      _startAnimation();
    }
  }

  // Start the animation when the widget is created
  void _startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 0));

    setState(() {
      currentPosition = Offset(
        (Get.width - 1 * widget.size.width) / 2,
        Get.height - kBottomNavigationBarHeight - widget.size.height / 2,
      );
      _controller.forward().whenComplete(() {
        // _controller.dispose(); // Stop and dispose of the animation controller
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Release the animation controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: widget.isAdd ? 0 : 250),
      top: currentPosition.dy,
      left: currentPosition.dx,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final double scale = _scaleAnimation.value;
          final double translateX = (1.0 - scale);
          final double translateY = (1.0 - scale);

          return Transform.translate(
            offset: Offset(translateX, translateY),
            child: Transform.scale(
              scale: scale,
              child: Container(
                  width: widget.size.width,
                  height: widget.size.height,
                  color:
                      !widget.isAdd ? ThemeService().theme.colorScheme.primary : Colors.transparent
                  // : ThemeService().theme.colorScheme.onPrimaryContainer,
                  ),
            ),
          );
        },
      ),
    );
  }
}
