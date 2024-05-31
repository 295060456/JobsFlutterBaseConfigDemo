import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Marquee extends StatefulWidget {
  Marquee({required this.child, this.speed = 10, Key? key}) : super(key: key);

  final Widget child;
  final int speed;

  @override
  State<StatefulWidget> createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late ScrollController _scrollController;
  SingleChildScrollView? _scrollView;

  double _space = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: widget.speed));
    _animation = Tween(begin: 0.1, end: 100.0).animate(_controller);
    _animation.addListener(() {
      if (_scrollController.hasClients) {
        if (_scrollView != null && _scrollController.position.hasContentDimensions) {
          var index = _animation.value / 100;
          _scrollController.jumpTo(index * _scrollController.position.maxScrollExtent);
        }
        if (_scrollController.position.hasViewportDimension && _space == 0) {
          setState(() {
            _space = _scrollController.position.viewportDimension;
          });
        }
      }
    });
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    _scrollView = SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      child: _scrollController.hasClients
          ? Container(
            child: Row(
                children: [
                  SizedBox(
                    width: _space,
                  ),
                  widget.child,
                  SizedBox(
                    width: _space,
                  ),
                ],
              ),
          )
          : const SizedBox(),
    );
    return _scrollView ?? Column();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
