import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_themes.dart';
import 'package:flutter_bet/services/theme/theme_service.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;

  final ValueChanged<bool>? onChanged;

  final Color? activeColor;

  final Color? trackColor;

  final Color? thumbColor;

  /// The duration in milliseconds to change the state of the switch
  ///
  /// Defaults to the value of 200 milliseconds.
  final Duration duration;

  /// Defaults to a width of 40.0.
  final double width;

  /// Defaults to a width of 24.0.
  final double height;

  final ColorScheme? colorScheme;

  final bool disabled;

  /// The icon inside the toggle when the given value is true.
  /// activeIcon can be an Icon Widget, an Image or Fontawesome Icons.
  ///
  /// This property is optional.
  final Widget? activeIcon;

  /// The icon inside the toggle when the given value is false.
  /// inactiveIcon can be an Icon Widget, an Image or Fontawesome Icons.
  ///
  /// This property is optional.
  final Widget? inactiveIcon;

  /// The padding of the switch.
  ///
  /// Defaults to the value of 2.0.
  final double padding;

  /// The border radius of the switch.
  ///
  /// Defaults to the value of 20.0.
  final double borderRadius;

  /// The size of the toggle of the switch.
  ///
  /// Defaults to a size of 25.0.
  final double toggleSize;

  const CustomSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.activeColor,
    this.trackColor,
    this.thumbColor = Colors.white,
    this.duration = const Duration(milliseconds: 200),
    this.colorScheme,
    this.width = 40,
    this.disabled = false,
    this.height = 24,
    this.activeIcon,
    this.inactiveIcon,
    this.padding = 2.0,
    this.borderRadius = 20.0,
    this.toggleSize = 25.0,
  });

  @override
  State<StatefulWidget> createState() => _CustomSwitch();
}

class _CustomSwitch extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late final Animation _toggleAnimation;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      value: widget.value ? 1.0 : 0.0,
      duration: widget.duration,
    );
    _toggleAnimation = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomSwitch oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value == widget.value) return;

    if (widget.value) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final defaultColorScheme = ThemeService().colorScheme;
    Color? _toggleColor;
    Color? _switchColor;

    if (widget.value) {
      _toggleColor = widget.thumbColor;
      _switchColor = widget.trackColor ?? defaultColorScheme.primary;
    } else {
      _toggleColor = widget.thumbColor;
      _switchColor = defaultColorScheme.tertiary;
    }

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return SizedBox(
          width: widget.width,
          child: Align(
            child: GestureDetector(
              onTap: () {
                if (widget.disabled) return;
                if (widget.value) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
                if (widget.onChanged != null) widget.onChanged!(!widget.value);
              },
              child: Opacity(
                opacity: widget.disabled ? 0.6 : 1,
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  padding: EdgeInsets.symmetric(vertical: widget.padding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    color: _switchColor,
                    // border: _switchBorder,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: _toggleAnimation.value,
                        child: Container(
                          width: widget.toggleSize,
                          height: widget.toggleSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _toggleColor,
                            // border: _toggleBorder,
                          ),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Stack(
                              children: [
                                Center(
                                  child: AnimatedOpacity(
                                    opacity: widget.value ? 1.0 : 0.0,
                                    duration: widget.duration,
                                    child: widget.activeIcon,
                                  ),
                                ),
                                Center(
                                  child: AnimatedOpacity(
                                    opacity: !widget.value ? 1.0 : 0.0,
                                    duration: widget.duration,
                                    child: widget.inactiveIcon,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
