import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_values.dart';
import 'package:flutter_bet/pages/sport/sport_detail/model.dart';
import '../../custom_asset_icon.dart';

class CustomSportOddChangeAnimation extends StatefulWidget {
  final bool isOddsUp;
  bool isIconVisible;
  M e;

  CustomSportOddChangeAnimation(this.e,{super.key, required this.isOddsUp, required this.isIconVisible});

  @override
  // ignore: library_private_types_in_public_api
  _CustomSportOddChangeAnimationState createState() => _CustomSportOddChangeAnimationState();
}

class _CustomSportOddChangeAnimationState extends State<CustomSportOddChangeAnimation>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> _animationTranslate;
  late Animation<Offset> _animationTranslateDown;
  late Animation<double> _animationOpacity;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    _animationOpacity = TweenSequence<double>([
      TweenSequenceItem<double>(
        tween: Tween(begin: 1.0, end: 0.4),
        weight: 1.0,
      ),
      // Add more TweenSequenceItems as needed.
    ]).animate(controller);

    _animationTranslate = TweenSequence<Offset>([
      TweenSequenceItem<Offset>(
        tween: Tween(begin: Offset(0, 8), end: Offset(0, -5.0)),
        weight: 1.0,
      ),
      // Add more TweenSequenceItems as needed.
    ]).animate(controller);

    _animationTranslateDown = TweenSequence<Offset>([
      TweenSequenceItem<Offset>(
        tween: Tween(begin: Offset(0, -8), end: Offset(0, 5.0)),
        weight: 1.0,
      ),
      // Add more TweenSequenceItems as needed.
    ]).animate(controller);


    widget.isIconVisible = true;
    controller.reset();
    controller.forward().whenComplete(() {
      widget.e.isUp = 2;
      // Handle animation completion if needed.
      controller.reset();
      controller.forward().whenComplete(() {
        // Handle animation completion if needed.
        setState(() {
          widget.isIconVisible = false;
          widget.e.isUp = 2;
        });
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.e.isUp);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: widget.e.isUp == 1 ? _animationTranslate.value : _animationTranslateDown.value,
          child: Opacity(
            opacity: _animationOpacity.value,
            child: (widget.e.isUp ?? 2) < 2
                ? Padding(
                  padding: const EdgeInsets.only(left: AppValues.sportPadding_8),
                  child: CustomAssetIcon(
                      name: widget.e.isUp == 1
                          ? 'assets/images/bet_slip/ic_odds_up.webp'
                          : 'assets/images/bet_slip/ic_odds_down.webp',
                      size: 10,
                    ),
                )
                : Container(), // Hide the icon if not visible
          ),
        );
      },
    );
  }

}
