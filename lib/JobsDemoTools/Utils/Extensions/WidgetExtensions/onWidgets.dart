import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/Utils/Extensions/AnyExtensions/onNum.dart';

// 使用示例
// return Text("点我试试,试试就试试")
//     .center() // 居中
//     .align(Alignment.bottomRight) // 指定对齐方式
//     .padding(const EdgeInsets.all(12)) // 内边距
//     .margin(const EdgeInsets.only(bottom: 20)) // 外边距
//     .backgroundColor(Colors.blueAccent) // 背景色
//     .setBorderBy(color: const Color(0xFF2B3140), width: 1, radius: 8.br)
//     .size(width: 200, height: 60) // 固定宽高
//     .tooltip("这是一个按钮") // Tooltip 提示
//     .opacity(0.5) // 透明度
//     .rotate(0.1) // 旋转（单位是弧度）
//     .scale(1.1) // 缩放
//     .transform(Matrix4.translationValues(5, 0, 0)) // 位移变换
//     .clipOval() // 裁剪成圆形
//     .hero("myHeroTag") // Hero 动画（需配合页面跳转）
//     .safeArea() // SafeArea 包裹
//     .scrollable();

extension JobsWidgetExtension on Widget {
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

  /// Flutter.DecoratedBox
  /// DecoratedBox 不会控制大小，它只是负责绘制 decoration 和 child，
  Widget decoratedBox(
    Decoration? decoration, {
    Key? key,
    DecorationPosition? position,
  }) =>
      DecoratedBox(
        key: key,
        decoration: decoration ?? const BoxDecoration(),
        position: position ?? DecorationPosition.background,
        child: this,
      );

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
extension ClipRRectExtension on Widget {
  Widget clipRRectRadius([double r = 8.0]) => clipRRect(r);
}

/// 排列对齐
extension AlignExtension on Widget {
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

/// Flutter.Container.BoxDecoration
extension ContainerExtension on Widget {
  Widget margin(EdgeInsetsGeometry margin, {Key? key}) =>
      container(margin: margin, key: key);
  Widget bgColor(Color color, {Key? key}) => container(color: color, key: key);
  Widget setBorderBy({
    Key? key,
    Color color = Colors.black,
    double width = 1.0,
    double radius = 0,
  }) =>
      container(
        key: key,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: width),
          borderRadius: radius.br,
        ),
      );

  /// 通用装饰容器（可带圆角/形状/边框/阴影/背景图）
  Widget containerByBoxDecoration({
    Key? key,
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    double? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BlendMode? backgroundBlendMode,
    BoxShape shape = BoxShape.rectangle,

    // 常用容器属性（可选）
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    double? width,
    double? height,
    BoxConstraints? constraints,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
  }) {
    return container(
      key: key,
      alignment: alignment,
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      constraints: constraints,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      // 注意：Container 的 color 与 decoration.color 不能同时使用
      // 统一放到 decoration.color 中
      decoration: BoxDecoration(
        color: color,
        image: image,
        border: border,
        borderRadius: shape == BoxShape.rectangle ? (borderRadius ?? 0).br : 0.br,
        boxShadow: boxShadow,
        gradient: gradient,
        backgroundBlendMode: backgroundBlendMode,
        shape: shape,
      ),
    );
  }

  /// 纯背景色
  Widget bg(Color color, {Key? key}) =>
      containerByBoxDecoration(key: key, color: color);

  /// 圆角
  Widget radiusByDouble(double radius, {Key? key}) => containerByBoxDecoration(
      key: key, borderRadius: radius);

  /// 自定义圆角
  Widget radiusByGeometry(double r, {Key? key}) =>
      containerByBoxDecoration(key: key, borderRadius: r);

  /// 边框（全边）
  Widget borderAll({
    Key? key,
    Color? color,
    double? width,
    BorderStyle? style,
  }) =>
      containerByBoxDecoration(
        key: key,
        border: Border.all(
            color: color ?? const Color(0xFF000000),
            width: width ?? 1.0,
            style: style ?? BorderStyle.solid),
      );

  /// 边框（单边）
  Widget borderOnly({
    Key? key,
    Color? left,
    Color? top,
    Color? right,
    Color? bottom,
    double? leftWidth,
    double? topWidth,
    double? rightWidth,
    double? bottomWidth,
  }) =>
      containerByBoxDecoration(
        key: key,
        border: Border(
          left: BorderSide(
              color: left ?? Colors.transparent, width: leftWidth ?? 1),
          top: BorderSide(
              color: top ?? Colors.transparent, width: topWidth ?? 1),
          right: BorderSide(
              color: right ?? Colors.transparent, width: rightWidth ?? 1),
          bottom: BorderSide(
              color: bottom ?? Colors.transparent, width: bottomWidth ?? 1),
        ),
      );

  /// 阴影（预设强度）
  Widget shadowXs({Key? key, Color? color}) =>
      containerByBoxDecoration(key: key, boxShadow: [
        BoxShadow(
            color: color ?? Colors.black26,
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(0, 1)),
      ]);

  Widget shadowSm({Key? key, Color? color}) =>
      containerByBoxDecoration(key: key, boxShadow: [
        BoxShadow(
            color: color ?? Colors.black26,
            blurRadius: 6,
            spreadRadius: 0,
            offset: const Offset(0, 2)),
      ]);

  Widget shadowMd({Key? key, Color? color}) =>
      containerByBoxDecoration(key: key, boxShadow: [
        BoxShadow(
            color: color ?? Colors.black26,
            blurRadius: 12,
            spreadRadius: 0,
            offset: const Offset(0, 4)),
      ]);

  /// 线性渐变
  Widget linearGradient(
    List<Color> colors, {
    Key? key,
    List<double>? stops,
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
  }) =>
      containerByBoxDecoration(
        key: key,
        gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: begin ?? Alignment.centerLeft,
            end: end ?? Alignment.centerRight),
      );

  /// 径向渐变
  Widget radialGradient(
    List<Color> colors, {
    Key? key,
    List<double>? stops,
    AlignmentGeometry? center,
    double radius = 0.5,
  }) =>
      containerByBoxDecoration(
        key: key,
        gradient: RadialGradient(
            colors: colors,
            stops: stops,
            center: center ?? Alignment.center,
            radius: radius),
      );

  /// 背景图
  Widget bgImage(
    ImageProvider provider, {
    Key? key,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    ImageRepeat? repeat,
    Rect? centerSlice,
    ColorFilter? colorFilter,
    BlendMode? blendMode,
  }) =>
      containerByBoxDecoration(
        key: key,
        image: DecorationImage(
          image: provider,
          fit: fit ?? BoxFit.cover,
          alignment: alignment ?? Alignment.center,
          repeat: repeat ?? ImageRepeat.noRepeat,
          centerSlice: centerSlice,
          colorFilter: colorFilter,
          // Flutter 最新实现里背景混合通过 backgroundBlendMode；这里保留给高级用法
        ),
        backgroundBlendMode: blendMode,
      );

  /// 圆形容器（自动裁剪为圆；radius 与 shape: circle 互斥，这里按规范做禁用）
  Widget circle({
    Key? key,
    Color? color,
    BoxBorder? border,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    DecorationImage? image,
    double? size,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    AlignmentGeometry? alignment,
    Clip? clipBehavior,
  }) =>
      containerByBoxDecoration(
        key: key,
        color: color,
        border: border,
        boxShadow: boxShadow,
        gradient: gradient,
        image: image,
        shape: BoxShape.circle,
        width: size,
        height: size,
        padding: padding,
        margin: margin,
        alignment: alignment,
        clipBehavior: clipBehavior ?? Clip.antiAlias, // 圆形建议抗锯齿裁剪,
      );
}

/// Flutter.DecoratedBox
extension DecoratedBoxExtension on Widget {
  /// 纯背景色
  Widget backgroundCor(Color color, {Key? key}) => decoratedBox(
        BoxDecoration(color: color),
        key: key,
      );

  /// 圆角矩形
  Widget radiusOnDecoratedBoxByDouble(double radius, {Key? key}) =>
      decoratedBox(
        BoxDecoration(
          borderRadius: radius.br,
        ),
        key: key,
      );

  /// 自定义圆角
  Widget radiusOnBoxDecorationByGeometry(double r, {Key? key}) => decoratedBox(
        BoxDecoration(borderRadius: r.br),
        key: key,
      );

  /// 边框（全边）
  Widget borderAll({
    Key? key,
    Color? color,
    double? width,
    BorderStyle? style,
  }) =>
      decoratedBox(
        BoxDecoration(
          border: Border.all(
              color: color ?? const Color(0xFF000000),
              width: width ?? 1.0,
              style: style ?? BorderStyle.solid),
        ),
        key: key,
      );

  /// 边框（单边）
  Widget borderOnly({
    Key? key,
    Color? left,
    Color? top,
    Color? right,
    Color? bottom,
    double? leftWidth,
    double? topWidth,
    double? rightWidth,
    double? bottomWidth,
  }) =>
      decoratedBox(
        BoxDecoration(
          border: Border(
            left: BorderSide(
                color: left ?? Colors.transparent, width: leftWidth ?? 1.0),
            top: BorderSide(
                color: top ?? Colors.transparent, width: topWidth ?? 1.0),
            right: BorderSide(
                color: right ?? Colors.transparent, width: rightWidth ?? 1.0),
            bottom: BorderSide(
                color: bottom ?? Colors.transparent, width: bottomWidth ?? 1.0),
          ),
        ),
        key: key,
      );

  /// 阴影
  Widget shadow({
    Key? key,
    List<BoxShadow>? shadows,
  }) =>
      decoratedBox(
        BoxDecoration(boxShadow: shadows),
        key: key,
      );

  /// 线性渐变
  Widget linearGradient(
    List<Color> colors, {
    Key? key,
    List<double>? stops,
    AlignmentGeometry? begin,
    AlignmentGeometry? end,
  }) =>
      decoratedBox(
        BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: begin ?? Alignment.centerLeft,
            end: end ?? Alignment.centerRight,
          ),
        ),
        key: key,
      );

  /// 背景图
  Widget bgImage(
    ImageProvider provider, {
    Key? key,
    BoxFit? fit,
    AlignmentGeometry? alignment,
    ImageRepeat? repeat,
  }) =>
      decoratedBox(
        BoxDecoration(
          image: DecorationImage(
            image: provider,
            fit: fit ?? BoxFit.cover,
            alignment: alignment ?? Alignment.center,
            repeat: repeat ?? ImageRepeat.noRepeat,
          ),
        ),
        key: key,
      );

  /// 圆形
  Widget circle({
    Key? key,
    Color? color,
    double? size,
    BoxBorder? border,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    DecorationImage? image,
  }) =>
      decoratedBox(
          BoxDecoration(
            color: color,
            border: border,
            boxShadow: boxShadow,
            gradient: gradient,
            image: image,
            shape: BoxShape.circle,
          ),
          key: key);
}

/// Flutter.Container.decoration
extension DecoratedBoxExtensions on Widget {
  /// 纯装饰入口（不改大小/布局），等价于用 Container 包一层 Decoration
  Widget decoratedOnContainer({
    Key? key,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    Clip? clipBehavior,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
  }) =>
      Container(
        key: key,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        clipBehavior: clipBehavior ?? Clip.none,
        alignment: alignment,
        padding: padding,
        child: this,
      );

  /// 背景色
  Widget backgroundColor(
    Color color, {
    Key? key,
  }) =>
      decoratedOnContainer(
        key: key,
        decoration: BoxDecoration(
          color: color,
        ),
      );

  /// 渐变背景（可带圆角/形状/阴影/背景图）
  Widget gradient(
    Gradient gradient, {
    Key? key,
  }) =>
      decoratedOnContainer(
        key: key,
        decoration: BoxDecoration(
          gradient: gradient,
        ),
      );

  /// 全边框（可组合：圆角/阴影/背景色/渐变/背景图/形状）
  Widget borderOnDecoratedBox({
    Key? key,
    Color? color,
    double? width,
    BorderStyle? style,
    double? radius,
    BoxShape? shape,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    Color? background,
    DecorationImage? image,
    Clip clip = Clip.none,
  }) =>
      decoratedOnContainer(
        key: key,
        decoration: BoxDecoration(
          color: background,
          gradient: gradient,
          image: image,
          shape: shape ?? BoxShape.rectangle,
          borderRadius: shape == BoxShape.rectangle ? (radius ?? 0).br : 0.br,
          border: Border.all(
              color: color ?? Colors.black,
              width: width ?? 1.0,
              style: style ?? BorderStyle.solid),
          boxShadow: boxShadow,
        ),
        clipBehavior: clip,
      );

  /// 指定边的边框（top/right/bottom/left）
  Widget borderOnly({
    Key? key,
    Color? color,
    double? width,
    BorderStyle? style,
    Set<AxisDirection>? sides, // ✅ 用系统 AxisDirection
    double? radius,
    BoxShape? shape,
    Color? background,
    Clip clip = Clip.none,
  }) {
    BorderSide s(AxisDirection dir) => (sides?.contains(dir) ?? false)
        ? BorderSide(
            color: color ?? Colors.black,
            width: width ?? 1.0,
            style: style ?? BorderStyle.solid,
          )
        : BorderSide.none;

    return decoratedOnContainer(
      key: key,
      decoration: BoxDecoration(
        color: background,
        shape: shape ?? BoxShape.rectangle,
        borderRadius: shape == BoxShape.rectangle ? (radius ?? 0).br : 0.br,
        border: Border(
          top: s(AxisDirection.up),
          right: s(AxisDirection.right),
          bottom: s(AxisDirection.down),
          left: s(AxisDirection.left),
        ),
      ),
      clipBehavior: clip,
    );
  }

  /// 圆角裁剪（更可靠的裁剪边角）
  Widget decoratedBoxRadius(Key? key, double radius,
          {Clip clip = Clip.antiAlias}) =>
      ClipRRect(
          key: key, borderRadius: radius.br, clipBehavior: clip, child: this);

  /// 阴影（可叠加背景/渐变/背景图/圆角/形状）
  Widget boxShadow({
    Key? key,
    List<BoxShadow>? shadows,
    double? radius,
    BoxShape? shape,
    Color? background,
    Gradient? gradient,
    DecorationImage? image,
    Clip? clip,
  }) =>
      decoratedOnContainer(
        key: key,
        decoration: BoxDecoration(
          color: background,
          gradient: gradient,
          image: image,
          shape: shape ?? BoxShape.rectangle,
          borderRadius: shape == BoxShape.rectangle ? (radius ?? 0).br : 0.br,
          boxShadow: shadows ??
              const [
                BoxShadow(
                  blurRadius: 8,
                  offset: Offset(0, 4),
                  color: Colors.black26,
                ),
              ],
        ),
        clipBehavior: clip ?? Clip.none,
      );

  /// 前景装饰（例如前景边框/蒙层/水印）
  Widget foreground(Key? key, Decoration decoration, {Clip clip = Clip.none}) =>
      decoratedOnContainer(
          key: key, foregroundDecoration: decoration, clipBehavior: clip);
}
