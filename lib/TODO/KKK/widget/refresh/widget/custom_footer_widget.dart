import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/physics.dart' as physics;

import 'custom_footer_indicator.dart';

///自定义 列表 底部加载更多组件，
class CustomFooterWidget extends Footer {
  final Key? key;

  /// See [ProgressIndicator.backgroundColor].
  final Color? backgroundColor;

  /// See [ProgressIndicator.fontColor].
  final Color? color;

  /// See [ProgressIndicator.valueColor].
  final Animation<Color?>? valueColor;

  /// See [ProgressIndicator.semanticsLabel].
  final String? semanticsLabel;

  /// See [ProgressIndicator.semanticsLabel].
  final String? semanticsValue;

  /// Icon when [IndicatorResult.noMore].
  final Widget? noMoreIcon;

  /// Show bezier background.
  final bool showBezierBackground;

  /// Bezier background color.
  /// See [BezierBackground.color].
  final Color? bezierBackgroundColor;

  /// Bezier background animation.
  /// See [BezierBackground.useAnimation].
  final bool bezierBackgroundAnimation;

  /// Bezier background bounce.
  /// See [BezierBackground.bounce].
  final bool bezierBackgroundBounce;

  const CustomFooterWidget({
    this.key,
    double triggerOffset = 100,
    bool clamping = true,//是否固定，固定表示不是从底部出来，而是覆盖在上面
    IndicatorPosition position = IndicatorPosition.above,
    Duration processedDuration = const Duration(milliseconds: 200),
    physics.SpringDescription? spring,
    SpringBuilder? readySpringBuilder,
    bool springRebound = false,
    FrictionFactor? frictionFactor,
    bool safeArea = true,
    double? infiniteOffset,
    bool? hitOver,
    bool? infiniteHitOver,
    bool hapticFeedback = false,
    bool triggerWhenRelease = false,
    double maxOverOffset = double.infinity,
    this.backgroundColor,
    this.color,
    this.valueColor,
    this.semanticsLabel,
    this.semanticsValue,
    this.noMoreIcon,
    this.showBezierBackground = false,
    this.bezierBackgroundColor,
    this.bezierBackgroundAnimation = false,
    this.bezierBackgroundBounce = false,
  }) : super(
          triggerOffset: triggerOffset,
          clamping: clamping,
          processedDuration: processedDuration,
          spring: spring,
          readySpringBuilder: readySpringBuilder ??
              (bezierBackgroundAnimation ? kBezierSpringBuilder : kCustomSpringBuilder),
          springRebound: springRebound,
          frictionFactor: frictionFactor ??
              (showBezierBackground ? kBezierFrictionFactor : kCustomFrictionFactor),
          horizontalFrictionFactor: frictionFactor ??
              (showBezierBackground
                  ? kBezierHorizontalFrictionFactor
                  : kCustomHorizontalFrictionFactor),
          safeArea: safeArea,
          infiniteOffset: infiniteOffset,
          hitOver: hitOver,
          infiniteHitOver: infiniteHitOver,
          position: position,
          hapticFeedback: hapticFeedback,
          triggerWhenRelease: triggerWhenRelease,
          maxOverOffset: maxOverOffset,
        );

  @override
  Widget build(BuildContext context, IndicatorState state) {
    return CustomFooterIndicator(
      key: key,
      state: state,
      disappearDuration: processedDuration,
      reverse: !state.reverse,
      backgroundColor: backgroundColor,
      color: color,
      valueColor: valueColor,
      semanticsLabel: semanticsLabel,
      semanticsValue: semanticsValue,
      noMoreIcon: noMoreIcon,
      showBezierBackground: showBezierBackground,
      bezierBackgroundColor: bezierBackgroundColor,
      bezierBackgroundAnimation: bezierBackgroundAnimation,
      bezierBackgroundBounce: bezierBackgroundBounce,
    );
  }
}
