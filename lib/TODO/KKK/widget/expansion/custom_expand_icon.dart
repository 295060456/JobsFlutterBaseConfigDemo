import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bet/widget/custom_asset_icon.dart';
import 'dart:math' as math;

import 'package:flutter_bet/widget/custom_icon.dart';

import '../../services/theme/theme_service.dart';

class CustomExpandIcon extends StatefulWidget {
  const CustomExpandIcon(
      {super.key,
      this.isExpanded = false,
      this.size = 24.0,
      this.iconSize,
      required this.onPressed,
      this.padding = const EdgeInsets.all(12.0),
      this.color,
      this.disabledColor,
      this.expandedColor,
      this.closeIcon,
      this.tweenEnd,
      this.expandIcon});

  final bool isExpanded;

  final double size;

  final double? iconSize;

  final ValueChanged<bool>? onPressed;

  final EdgeInsetsGeometry padding;

  final Color? color;

  final Color? disabledColor;

  final Color? expandedColor;

  final String? closeIcon;
  final String? expandIcon;
  final double? tweenEnd;

  @override
  State<CustomExpandIcon> createState() => _ExpandIconState();
}

class _ExpandIconState extends State<CustomExpandIcon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _iconTurns;

   late final Animatable<double> _iconTurnTween;

  @override
  void initState() {
    super.initState();
    _iconTurnTween =
        Tween<double>(begin: 0.0, end: widget.tweenEnd??0.25).chain(CurveTween(curve: Curves.fastOutSlowIn));
    _controller = AnimationController(duration: kThemeAnimationDuration, vsync: this);
    _iconTurns = _controller.drive(_iconTurnTween);
    // If the widget is initially expanded, rotate the icon without animating it.
    if (widget.isExpanded) {
      _controller.value = math.pi;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CustomExpandIcon oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  void _handlePressed() {
    widget.onPressed?.call(widget.isExpanded);
  }

  Color get _iconColor {
    if (widget.isExpanded && widget.expandedColor != null) {
      return widget.expandedColor!;
    }

    if (widget.color != null) {
      return widget.color!;
    }

    switch (Theme.of(context).brightness) {
      case Brightness.light:
        return Colors.black54;
      case Brightness.dark:
        return Colors.white60;
    }
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterial(context));
    assert(debugCheckHasMaterialLocalizations(context));
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final String onTapHint =
        widget.isExpanded ? localizations.expandedIconTapHint : localizations.collapsedIconTapHint;

    return Semantics(
      onTapHint: widget.onPressed == null ? null : onTapHint,
      child: IconButton(
        padding: widget.padding,
        iconSize: widget.size,
        color: _iconColor,
        disabledColor: widget.disabledColor,
        onPressed: widget.onPressed == null ? null : _handlePressed,
        icon: RotationTransition(
          turns: _iconTurns,
          child: widget.isExpanded
              ? CustomAssetIcon(
                  name: widget.expandIcon ?? 'assets/images/home/ic_arrow_down.webp',size:widget.iconSize ?? ThemeService().theme.iconTheme.size,
                )
              : CustomAssetIcon(
                  name: widget.closeIcon ?? 'assets/images/home/ic_arrow_right.webp',size:widget.iconSize ?? ThemeService().theme.iconTheme.size,
                ),
        ),
      ),
    );
  }
}
