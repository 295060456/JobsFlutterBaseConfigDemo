import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/Utils/Extensions/AnyExtensions/onNum.dart';

extension JobsWidgetExtensions on Widget {
  Widget builder(
    Widget Function(BuildContext ctx, Widget child) build, {
    Key? key,
  }) {
    final child = this; // 避免闭包里多次 capture this
    return Builder(
      key: key,
      builder: (ctx) => build(ctx, child),
    );
  }

  Widget container({
    Key? key,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    Color? color,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    EdgeInsetsGeometry? margin,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
  }) =>
      Container(
        key: key,
        alignment: alignment,
        padding: padding,
        color: color,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        width: width,
        height: height,
        constraints: constraints,
        margin: margin,
        transform: transform,
        transformAlignment: transformAlignment,
        clipBehavior: clipBehavior,
        child: this,
      );

  /// ⚠️ Expanded 只能在 Flex 容器（Row/Column/Flex）里面使用
  Widget expanded({Key? key, int flex = 1}) =>
      Expanded(key: key, flex: flex, child: this);

  Widget center({Key? key, double? widthFactor, double? heightFactor}) =>
      Center(
          key: key,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: this);

  Widget align(
    AlignmentGeometry alignment, {
    Key? key,
    double? widthFactor,
    double? heightFactor,
  }) =>
      Align(
        key: key,
        alignment: alignment,
        widthFactor: widthFactor,
        heightFactor: heightFactor,
        child: this,
      );

  Widget padding(EdgeInsetsGeometry padding, {Key? key}) =>
      Padding(key: key, padding: padding, child: this);

  Widget clipRRect(
    double? borderRadius, {
    Key? key,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) =>
      ClipRRect(
        key: key,
        borderRadius: (borderRadius ?? 0).br,
        clipper: clipper,
        clipBehavior: clipBehavior,
        child: this,
      );

  Widget size({double? width, double? height, Key? key}) =>
      SizedBox(key: key, width: width, height: height, child: this);

  Widget infinity() =>
      SizedBox(width: double.infinity, height: double.infinity, child: this);

  Widget tooltip(
    String? message, {
    Key? key,
    InlineSpan? richMessage,
    double? height,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? verticalOffset,
    bool? preferBelow,
    bool? excludeFromSemantics,
    Decoration? decoration,
    TextStyle? textStyle,
    TextAlign? textAlign,
    Duration? waitDuration,
    Duration? showDuration,
    Duration? exitDuration,
    bool enableTapToDismiss = true,
    TooltipTriggerMode? triggerMode,
    bool? enableFeedback,
    TooltipTriggeredCallback? onTriggered,
  }) =>
      Tooltip(
        key: key, // Widget 唯一标识
        message: message ?? '暂无数据'.tr, // 简单文字提示（优先级高于 richMessage）
        richMessage: richMessage, // 富文本提示（可包含多样式 TextSpan）
        height: height, // Tooltip 高度
        padding: padding, // 内边距（文字和边框之间的间距）
        margin: margin, // 外边距（Tooltip 与目标 Widget 的间距）
        verticalOffset: verticalOffset, // Tooltip 与目标 Widget 的垂直偏移量
        preferBelow: preferBelow, // 是否优先显示在目标 Widget 下方
        excludeFromSemantics: excludeFromSemantics, // 是否从无障碍语义中排除
        decoration: decoration, // Tooltip 外观样式（背景色、圆角、阴影等）
        textStyle: textStyle, // Tooltip 文字样式
        textAlign: textAlign, // 文字对齐方式
        waitDuration: waitDuration, // 鼠标悬停/长按后显示 Tooltip 的延迟时间
        showDuration: showDuration, // Tooltip 显示时长
        exitDuration: exitDuration, // Tooltip 消失的过渡时长
        enableTapToDismiss: enableTapToDismiss, // 点击后是否允许关闭 Tooltip
        triggerMode: triggerMode, // 触发模式（悬停/长按/点击）
        enableFeedback: enableFeedback, // 是否启用触觉/声音反馈
        onTriggered: onTriggered, // 当 Tooltip 被触发时的回调
        child: this, // 需要被包裹的目标 Widget
      );

  Widget opacity(
    double opacity, {
    Key? key,
    bool alwaysIncludeSemantics = false,
  }) =>
      Opacity(
        key: key, // Widget 唯一标识
        opacity: opacity, // 透明度 (0.0 = 完全透明, 1.0 = 不透明)
        /// 是否始终将子 widget 包含在语义树中：
        //   true  → 即使透明度为 0，依然能被无障碍/辅助功能读取
        //   false → 透明度为 0 时，不会被无障碍读取（默认）
        alwaysIncludeSemantics: alwaysIncludeSemantics,
        child: this, // 需要被设置透明度的目标 Widget
      );

  Widget hero(
    Object tag, {
    Key? key,
    CreateRectTween? createRectTween,
    HeroFlightShuttleBuilder? flightShuttleBuilder,
    HeroPlaceholderBuilder? placeholderBuilder,
    bool? transitionOnUserGestures,
  }) =>
      Hero(
        key: key, // Widget 唯一标识
        tag: tag, // Hero 动画的唯一标识符（必须全局唯一，通常是字符串或对象）
        createRectTween: createRectTween, // 自定义 Rect 过渡动画（控制位移/缩放路径）
        /// 自定义 Hero 在“飞行”过程中的 widget 外观
        /// 比如：从缩略图切换到大图，可以自定义过渡效果
        flightShuttleBuilder: flightShuttleBuilder,

        /// 在源页面/目标页面构建占位 Widget
        /// 避免 Hero 被移走后留下空白
        placeholderBuilder: placeholderBuilder,

        /// 是否允许在手势导航（比如 iOS 右滑返回）时触发 Hero 动画
        transitionOnUserGestures: (transitionOnUserGestures ?? false),

        child: this, // 被包裹的目标 Widget（实际做 Hero 动画的内容）
      );

  Widget clipOval({
    Key? key,
    CustomClipper<Rect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) =>
      ClipOval(
        key: key, // Widget 唯一标识
        clipper: clipper, // 自定义裁剪规则（可选，若为空则按椭圆/圆裁剪）
        /// 裁剪行为：
        ///   Clip.none      → 不裁剪
        ///   Clip.hardEdge  → 硬边裁剪，性能最好
        ///   Clip.antiAlias → 抗锯齿裁剪（默认），平滑边缘但稍耗性能
        ///   Clip.antiAliasWithSaveLayer → 抗锯齿+保存图层，效果最好但性能最差
        clipBehavior: clipBehavior,
        child: this, // 需要被裁剪成圆形/椭圆的目标 Widget
      );

  Widget safeArea({
    Key? key,
    bool left = true,
    bool top = true,
    bool right = true,
    bool bottom = true,
    EdgeInsets minimum = EdgeInsets.zero,
    bool maintainBottomViewPadding = false,
  }) =>
      SafeArea(
        key: key,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
        minimum: minimum,
        maintainBottomViewPadding:
            maintainBottomViewPadding, // 是否在键盘弹出时 保留底部系统内边距（padding）。
        child: this,
      );

  Widget scrollable({
    Key? key,
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    EdgeInsetsGeometry? padding,
    bool? primary,
    ScrollPhysics? physics,
    ScrollController? controller,
    DragStartBehavior dragStartBehavior = DragStartBehavior.start,
    Clip clipBehavior = Clip.hardEdge,
    HitTestBehavior hitTestBehavior = HitTestBehavior.opaque,
    String? restorationId,
    ScrollViewKeyboardDismissBehavior keyboardDismissBehavior =
        ScrollViewKeyboardDismissBehavior.manual,
  }) =>
      SingleChildScrollView(
        key: key, // Widget 唯一标识

        /// 滚动方向：
        /// Axis.vertical   → 垂直滚动（默认）
        /// Axis.horizontal → 水平滚动
        scrollDirection: scrollDirection,

        /// 是否反向滚动：
        ///   true  → 内容从尾部开始显示，滚动方向相反
        ///   false → 正常方向（默认）
        reverse: reverse,

        /// 内边距，作用在 child 外围（比如上下左右加留白）
        padding: padding,

        /// 是否使用 PrimaryScrollController：
        ///   true  → 自动和 Scaffold 里的默认滚动控制器绑定
        ///   false → 自己控制
        ///   null  → Flutter 自动决定（通常竖直滚动时默认 true）
        primary: primary,

        /// 滚动物理特性：
        ///   BouncingScrollPhysics() → iOS 弹性回弹
        ///   ClampingScrollPhysics() → Android 越界阻尼
        ///   AlwaysScrollableScrollPhysics() → 始终可滚动
        ///   NeverScrollableScrollPhysics() → 禁止滚动
        physics: physics,

        /// 自定义 ScrollController，用于手动控制/监听滚动位置
        controller: controller,

        /// 拖拽手势识别起点：
        ///   DragStartBehavior.start → 手指按下时立刻触发拖动（默认）
        ///   DragStartBehavior.down  → 要移动一定距离才触发
        dragStartBehavior: dragStartBehavior,

        /// 裁剪模式（默认 Clip.hardEdge）：
        ///   none      → 不裁剪
        ///   hardEdge  → 硬裁剪
        ///   antiAlias → 抗锯齿裁剪
        ///   antiAliasWithSaveLayer → 抗锯齿+保存图层（性能最低）
        clipBehavior: clipBehavior,

        /// 命中测试行为，决定手势如何穿透：
        ///   opaque    → 总是响应命中（即使透明区域）
        ///   translucent → 透明区域也能命中
        ///   deferToChild → 交给子组件决定（默认）
        hitTestBehavior: hitTestBehavior,

        /// 状态恢复 ID，用于 Flutter 状态恢复框架
        /// 让滚动位置在应用重启后也能恢复
        restorationId: restorationId,

        /// 键盘消失方式：
        ///   manual           → 手动关闭（默认）
        ///   onDrag           → 下拉/滑动时自动收起键盘
        keyboardDismissBehavior: keyboardDismissBehavior,

        /// 被包裹的子组件（通常是 Column / Row / 大组件树）
        child: this,
      );
}

/// 裁剪
extension ClipRRectExtensions on Widget {
  Widget clipRRectRadius([double r = 8.0]) => clipRRect(r);
}

/// 排列对齐
extension AlignExtensions on Widget {
  Widget alignLeft({Key? key}) => Align(
        key: key,
        alignment: Alignment.centerLeft,
        child: this,
      );
  Widget alignRight({Key? key}) =>
      Align(key: key, alignment: Alignment.centerRight, child: this);
  Widget alignTop({Key? key}) =>
      Align(key: key, alignment: Alignment.topCenter, child: this);
  Widget alignBottom({Key? key}) =>
      Align(key: key, alignment: Alignment.bottomCenter, child: this);
}

/// 设置 Widget 外观
extension JobsStyleX on Widget {
  JobsStyled get style => JobsStyled(child: this);

  JobsStyled padding(EdgeInsetsGeometry v) => style.padding(v);
  JobsStyled margin(EdgeInsetsGeometry v) => style.margin(v);

  JobsStyled bg(Color c) => style.bg(c);
  JobsStyled gradient(Gradient g) => style.gradient(g);

  JobsStyled radius(double r) => style.radius(r);
  JobsStyled radiusOnly({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) =>
      style.radiusOnly(
        topLeft: topLeft,
        topRight: topRight,
        bottomLeft: bottomLeft,
        bottomRight: bottomRight,
      );

  JobsStyled border({
    Color color = const Color(0x1F000000),
    double width = 1,
    BorderStyle borderStyle = BorderStyle.solid,
  }) =>
      style.border(color: color, width: width, borderStyle: borderStyle);

  JobsStyled borderOnly({
    Color? leftColor,
    double? leftWidth,
    BorderStyle? leftStyle,
    Color? topColor,
    double? topWidth,
    BorderStyle? topStyle,
    Color? rightColor,
    double? rightWidth,
    BorderStyle? rightStyle,
    Color? bottomColor,
    double? bottomWidth,
    BorderStyle? bottomStyle,
  }) =>
      style.borderOnly(
        leftColor: leftColor,
        leftWidth: leftWidth,
        leftStyle: leftStyle,
        topColor: topColor,
        topWidth: topWidth,
        topStyle: topStyle,
        rightColor: rightColor,
        rightWidth: rightWidth,
        rightStyle: rightStyle,
        bottomColor: bottomColor,
        bottomWidth: bottomWidth,
        bottomStyle: bottomStyle,
      );

  JobsStyled shadow({List<BoxShadow>? shadows}) =>
      style.shadow(shadows: shadows);
  JobsStyled clip([bool v = true]) => style.clip(v);
}

/// 可累积样式包装
class JobsStyled extends StatelessWidget {
  final Widget child;

  final EdgeInsetsGeometry? _padding;
  final EdgeInsetsGeometry? _margin;
  final BoxDecoration? _decoration;
  final bool _clipContent;

  const JobsStyled({
    super.key,
    required this.child,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxDecoration? decoration,
    bool clipContent = false,
  })  : _padding = padding,
        _margin = margin,
        _decoration = decoration,
        _clipContent = clipContent;

  // —— 合并两个 BoxDecoration（尽量不丢信息）
  BoxDecoration _mergeDecoration(BoxDecoration? a, BoxDecoration? b) {
    if (a == null) return b ?? const BoxDecoration();
    if (b == null) return a;
    return BoxDecoration(
      color: b.color ?? a.color,
      gradient: b.gradient ?? a.gradient,
      image: b.image ?? a.image,
      border: b.border ?? a.border,
      borderRadius: b.borderRadius ?? a.borderRadius,
      boxShadow: [...(a.boxShadow ?? const []), ...(b.boxShadow ?? const [])],
      shape: b.shape != BoxShape.rectangle ? b.shape : a.shape,
      backgroundBlendMode: b.backgroundBlendMode ?? a.backgroundBlendMode,
    );
  }

  // ✅ 内边距
  JobsStyled padding(EdgeInsetsGeometry v) => JobsStyled(
      padding: v,
      margin: _margin,
      decoration: _decoration,
      clipContent: _clipContent,
      child: child);
  // ✅ 外边距
  JobsStyled margin(EdgeInsetsGeometry v) => JobsStyled(
      padding: _padding,
      margin: v,
      decoration: _decoration,
      clipContent: _clipContent,
      child: child);

// ✅ 背景图
  JobsStyled bgImage(DecorationImage img) => JobsStyled(
        padding: _padding,
        margin: _margin,
        decoration: _mergeDecoration(_decoration, BoxDecoration(image: img)),
        clipContent: _clipContent,
        child: child,
      );

  // ✅ 背景色
  JobsStyled bg(Color c) => JobsStyled(
        padding: _padding,
        margin: _margin,
        decoration: _mergeDecoration(_decoration, BoxDecoration(color: c)),
        clipContent: _clipContent,
        child: child,
      );
  // ✅ 圆角
  JobsStyled radius(double r) => JobsStyled(
        padding: _padding,
        margin: _margin,
        decoration: _mergeDecoration(
            _decoration, BoxDecoration(borderRadius: BorderRadius.circular(r))),
        clipContent: true,
        child: child,
      );

  // ✅ 分别设置四个角的圆角（传 null 表示不改该角）
  JobsStyled radiusOnly({
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    final br = BorderRadius.only(
      topLeft: (topLeft ?? 0).toDouble().radius,
      topRight: (topRight ?? 0).toDouble().radius,
      bottomLeft: (bottomLeft ?? 0).toDouble().radius,
      bottomRight: (bottomRight ?? 0).toDouble().radius,
    );
    return JobsStyled(
      padding: _padding,
      margin: _margin,
      decoration:
          _mergeDecoration(_decoration, BoxDecoration(borderRadius: br)),
      clipContent: true,
      child: child,
    );
  }

  // ✅ 边
  JobsStyled border({
    Color color = const Color(0x1F000000),
    double width = 1,
    BorderStyle borderStyle = BorderStyle.solid,
  }) =>
      JobsStyled(
        padding: _padding,
        margin: _margin,
        decoration: _mergeDecoration(
            _decoration,
            BoxDecoration(
                border: Border.all(
                    color: color, width: width, style: borderStyle))),
        clipContent: _clipContent,
        child: child,
      );

  // ✅ 单边边框（未传的边保持不变）
  JobsStyled borderOnly({
    Color? leftColor,
    double? leftWidth,
    BorderStyle? leftStyle,
    Color? topColor,
    double? topWidth,
    BorderStyle? topStyle,
    Color? rightColor,
    double? rightWidth,
    BorderStyle? rightStyle,
    Color? bottomColor,
    double? bottomWidth,
    BorderStyle? bottomStyle,
  }) {
    BorderSide? mk(Color? c, double? w, BorderStyle? s) =>
        (c == null && w == null && s == null)
            ? null
            : BorderSide(
                color: c ?? const Color(0x1F000000),
                width: w ?? 1,
                style: s ?? BorderStyle.solid);

    final only = Border(
      left: mk(leftColor, leftWidth, leftStyle) ?? BorderSide.none,
      top: mk(topColor, topWidth, topStyle) ?? BorderSide.none,
      right: mk(rightColor, rightWidth, rightStyle) ?? BorderSide.none,
      bottom: mk(bottomColor, bottomWidth, bottomStyle) ?? BorderSide.none,
    );

    // 若已有 border，则优先用新传入的覆盖对应边
    final mergedBorder = () {
      final exist = (_decoration?.border as Border?);
      if (exist == null) return only;
      BorderSide pick(BorderSide a, BorderSide b) =>
          (b.style != BorderStyle.none || b.width != 0) ? b : a;
      return Border(
        left: pick(exist.left, only.left),
        top: pick(exist.top, only.top),
        right: pick(exist.right, only.right),
        bottom: pick(exist.bottom, only.bottom),
      );
    }();

    return JobsStyled(
      padding: _padding,
      margin: _margin,
      decoration:
          _mergeDecoration(_decoration, BoxDecoration(border: mergedBorder)),
      clipContent: _clipContent,
      child: child,
    );
  }

  // ✅ 渐变背景（线性/径向/扫掠均可）
  JobsStyled gradient(Gradient g) => JobsStyled(
        padding: _padding,
        margin: _margin,
        decoration: _mergeDecoration(_decoration, BoxDecoration(gradient: g)),
        clipContent: _clipContent,
        child: child,
      );
  // ✅ 阴影
  JobsStyled shadow({List<BoxShadow>? shadows}) => JobsStyled(
        padding: _padding,
        margin: _margin,
        decoration: _mergeDecoration(
            _decoration,
            BoxDecoration(
                boxShadow: shadows ??
                    [const BoxShadow(blurRadius: 10, offset: Offset(0, 4))])),
        clipContent: _clipContent,
        child: child,
      );
  // ✅ 子类容是否被裁剪
  JobsStyled clip([bool v = true]) => JobsStyled(
      padding: _padding,
      margin: _margin,
      decoration: _decoration,
      clipContent: v,
      child: child);

  @override
  Widget build(BuildContext context) {
    Widget w = child;

    // 1) 内边距
    if (_padding != null) {
      w = Padding(padding: _padding, child: w);
    }

    // 2) 装饰（背景/边框/渐变/圆角/阴影）
    final dec = _decoration; // 避免多次 ! 操作
    if (dec != null) {
      // 2.1 需要裁剪：优先处理圆形，其次处理圆角
      if (_clipContent) {
        if (dec.shape == BoxShape.circle) {
          w = ClipOval(child: w);
        } else {
          final br = dec.borderRadius?.resolve(Directionality.of(context));
          if (br != null) {
            w = ClipRRect(borderRadius: br, child: w);
          }
        }
      }

      // 2.2 实际绘制装饰
      w = DecoratedBox(decoration: dec, child: w);
    }

    // 3) 外边距
    if (_margin != null) {
      w = Padding(padding: _margin!, child: w);
    }

    return w;
  }
}
