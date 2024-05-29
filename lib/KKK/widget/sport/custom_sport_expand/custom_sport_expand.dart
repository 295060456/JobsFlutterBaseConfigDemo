import 'package:flutter/material.dart';
import 'package:flutter_bet/constant/app_values.dart';

import 'custom_sport_expand_controller.dart';

class CustomSportExpand extends StatefulWidget {
  CustomSportExpand({
    Key? key,
    required this.isExpanded,
    required this.title,
    this.controller,
    this.countWidget,
    //widget
    this.decoration,
    this.padding = const EdgeInsets.all(16.0),
    this.margin,
    //title
    this.titleRowAxisAlignment = MainAxisAlignment.spaceBetween,
    this.expansionDirection = ExpansionDirection.expandDown,
    this.titleDecoration,
    this.titlePadding,
    this.titleMargin,
    this.arrowPadding,
    //content
    this.children,
    this.childrenDecoration,
    this.childrenPadding,
    this.childrenMargin,
    //trailing Widget
    this.trailing = const Icon(
      Icons.keyboard_arrow_right,
      size: 30,
    ),
    this.trailingDuration = const Duration(milliseconds: 350),
    this.trailingStartTurns = 0.0,
    this.trailingEndTurns = 0.25,
    this.trailingPosition = TrailingPosition.right,
    //Expand
    this.expandDuration = const Duration(milliseconds: 350),
    this.expandCurve = Curves.fastOutSlowIn,
  })  : content = null,
        super(key: key);

  ///content builder
  CustomSportExpand.content({
    Key? key,
    required this.isExpanded,
    required this.title,
    required this.content,
    this.controller,
    this.countWidget,
    //widget
    this.decoration,
    this.padding = const EdgeInsets.all(16.0),
    this.margin,
    //title
    this.titleRowAxisAlignment = MainAxisAlignment.spaceBetween,
    this.expansionDirection = ExpansionDirection.expandDown,
    this.titleDecoration,
    this.titlePadding,
    this.titleMargin,
    this.arrowPadding,
    //trailing
    this.trailing = const Icon(
      Icons.keyboard_arrow_right,
      size: 30,
    ),
    this.trailingDuration = const Duration(milliseconds: 350),
    this.trailingStartTurns = 0.0,
    this.trailingEndTurns = 0.25,
    this.trailingPosition = TrailingPosition.right,
    //Expand
    this.expandDuration = const Duration(milliseconds: 350),
    this.expandCurve = Curves.fastOutSlowIn,
  })  : children = null,
        childrenDecoration = null,
        childrenPadding = null,
        childrenMargin = null,
        super(key: key);

  ///control Expandable Widget
  final CustomSportExpandController? controller;

  ///expandableWidget's decoration
  final Decoration? decoration;

  ///expandableWidget's padding
  final EdgeInsetsGeometry? padding;

  ///expandableWidget's margin
  final EdgeInsetsGeometry? margin;

  ///title widget
  final Widget title;

  ///title countWidget
  final Widget? countWidget;

  ///title and trailing MainAxisAlignment in Row
  final MainAxisAlignment titleRowAxisAlignment;

  ///setting expansion direction
  ///ex: ExpansionDirection.expandUp content is on top of Title
  final ExpansionDirection expansionDirection;

  ///title's decoration
  final Decoration? titleDecoration;

  ///title's padding
  final EdgeInsetsGeometry? titlePadding;

  ///title's margin
  final EdgeInsetsGeometry? titleMargin;
  final EdgeInsetsGeometry? arrowPadding;

  ///content
  final Widget? content;

  ///children
  final List<Widget>? children;

  ///children's decoration
  final Decoration? childrenDecoration;

  ///children's padding
  final EdgeInsetsGeometry? childrenPadding;

  ///children's margin
  final EdgeInsetsGeometry? childrenMargin;

  /// Trailing Widget
  final Widget trailing;

  /// Trailing Widget's duration
  final Duration trailingDuration;

  ///Rotation start turns
  final double trailingStartTurns;

  ///Rotation end turns
  final double trailingEndTurns;

  ///trail's position
  ///ex: TrailingPosition.left: trailing is to the left of title
  final TrailingPosition trailingPosition;

  ///Expand animated duration
  final Duration expandDuration;

  ///Expand animated curve
  final Curve expandCurve;

  ///isExpanded
  bool isExpanded;

  @override
  State<StatefulWidget> createState() => _CustomSportExpandState();
}

class _CustomSportExpandState extends State<CustomSportExpand> {
  //Control expands or closes
  late final CustomSportExpandController controller;

  //Whether controller is created in the state
  bool isControllerCreateAtState = false;

  @override
  void initState() {
    super.initState();
    isControllerCreateAtState = widget.controller == null;
    controller = widget.controller ?? CustomSportExpandController(isExpanded: widget.isExpanded);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (isControllerCreateAtState) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomSportExpand oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);

    if(oldWidget.isExpanded != widget.isExpanded){
      if(widget.isExpanded){
        controller.expand();
      }else{
        controller.collapse();
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetColumn = [];
    if (widget.expansionDirection == ExpansionDirection.expandDown) {
      widgetColumn.add(getTitle());
      widgetColumn.add(getContent());
    } else {
      widgetColumn.add(getContent());
      widgetColumn.add(getTitle());
    }

    return Container(
      decoration: widget.decoration,
      padding: widget.padding,
      margin: widget.margin,
      child: Column(children: widgetColumn),
    );
  }

  Widget getTitle() {
    List<Widget> titleRow = [];
    if (widget.trailingPosition == TrailingPosition.right) {
      titleRow.add(Expanded(child: widget.title));
      //当未展开
      if (widget.countWidget != null && !controller.isExpanded) {
        // titleRow.add(const Spacer());
        titleRow.add(const SizedBox(width: AppValues.sportWidth_8));
        titleRow.add(widget.countWidget ?? SizedBox());
        titleRow.add(const SizedBox(width: AppValues.sportWidth_8));
        titleRow.add(getTrailing());
      }else{
        //当展开时
        titleRow.add(const SizedBox(width: AppValues.sportWidth_16));
        titleRow.add(getTrailing());
      }

    } else {
      // titleRow.add(getTrailing());
      // if (widget.countWidget != null && !controller.isExpanded) {
      //   titleRow.add(const Expanded(child: SizedBox()));
      //   titleRow.add(widget.countWidget ?? SizedBox());
      //   titleRow.add(const SizedBox(width: AppValues.sportWidth_8));
      // }
      // titleRow.add(widget.title);
    }

    return GestureDetector(
      onTap: () {
        controller.toggle();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        decoration: widget.titleDecoration,
        padding: widget.titlePadding,
        margin: widget.titleMargin,
        child: Row(
          mainAxisAlignment: widget.titleRowAxisAlignment,
          children: titleRow,
        ),
      ),
    );
  }

  //getTrailing Widget
  Widget getTrailing() {
    return Container(
      padding: widget.arrowPadding,
      child: AnimatedRotation(
        duration: widget.trailingDuration,
        turns: controller.isExpanded ? widget.trailingStartTurns : widget.trailingEndTurns,
        child: widget.trailing,
      ),
    );
  }

  //getContent Widget
  Widget getContent() {
    if (widget.content == null) {
      return AnimatedSize(
        duration: widget.expandDuration,
        curve: widget.expandCurve,
        child: !controller.isExpanded
            ? const SizedBox()
            : Container(
                decoration: widget.childrenDecoration,
                padding: widget.childrenPadding,
                margin: widget.childrenMargin,
                child: Column(
                  children: widget.children ?? [],
                ),
              ),
      );
    }

    return AnimatedSize(
      duration: widget.expandDuration,
      curve: widget.expandCurve,
      child: controller.isExpanded ? widget.content : const SizedBox(),
    );
  }
}

///expansion direction
enum ExpansionDirection {
  expandDown,
  expandUp,
}

///setting trail's position
enum TrailingPosition {
  left,
  right,
}
