import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// 使用示例
// return Text("点我试试,试试就试试")
//     .center() // 居中
//     .align(Alignment.bottomRight) // 指定对齐方式
//     .padding(const EdgeInsets.all(12)) // 内边距
//     .margin(const EdgeInsets.only(bottom: 20)) // 外边距
//     .backgroundColor(Colors.blueAccent) // 背景色
//     .border(color: Colors.white, width: 2) // 边框
//     .radius(16) // 圆角
//     .size(width: 200, height: 60) // 固定宽高
//     .tooltip("这是一个按钮") // Tooltip 提示
//     .opacity(0.9) // 透明度
//     .rotate(0.1) // 旋转（单位是弧度）
//     .scale(1.1) // 缩放
//     .transform(Matrix4.translationValues(5, 0, 0)) // 位移变换
//     .clipOval() // 裁剪成圆形
//     .hero("myHeroTag") // Hero 动画（需配合页面跳转）
//     .safeArea() // SafeArea 包裹
//     .scrollable();

extension JobsWidgetExtension on Widget {
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

  Widget expanded({Key? key, int flex = 1}) =>
      Expanded(key: key, flex: flex, child: this);

  Widget center({Key? key, double? widthFactor, double? heightFactor}) =>
      Center(
          key: key,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: this);

  Widget align({
    Key? key,
    AlignmentGeometry alignment = Alignment.center,
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
  Widget decoratedBox({
    Key? key,
    required Decoration decoration,
    DecorationPosition position = DecorationPosition.background,
  }) =>
      DecoratedBox(
        key: key,
        decoration: decoration,
        position: position,
        child: this,
      );

  Widget clipRRect({
    Key? key,
    BorderRadiusGeometry borderRadius = BorderRadius.zero,
    CustomClipper<RRect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) =>
      ClipRRect(
        key: key,
        borderRadius: borderRadius,
        clipper: clipper,
        clipBehavior: clipBehavior,
        child: this,
      );

  Widget size({double? width, double? height, Key? key}) =>
      SizedBox(key: key, width: width, height: height, child: this);

  Widget infinity() =>
      SizedBox(width: double.infinity, height: double.infinity, child: this);

  Widget tooltip({
    Key? key,
    String? message,
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
        key: key,
        message: message,
        richMessage: richMessage,
        height: height,
        padding: padding,
        margin: margin,
        verticalOffset: verticalOffset,
        preferBelow: preferBelow,
        excludeFromSemantics: excludeFromSemantics,
        decoration: decoration,
        textStyle: textStyle,
        textAlign: textAlign,
        waitDuration: waitDuration,
        showDuration: showDuration,
        exitDuration: exitDuration,
        enableTapToDismiss: enableTapToDismiss,
        triggerMode: triggerMode,
        enableFeedback: enableFeedback,
        onTriggered: onTriggered,
        child: this,
      );

  Widget opacity({
    Key? key,
    required double opacity,
    bool alwaysIncludeSemantics = false,
  }) =>
      Opacity(
        key: key,
        opacity: opacity,
        alwaysIncludeSemantics: alwaysIncludeSemantics,
        child: this,
      );

  Widget transform({
    Key? key,
    required Matrix4 transform,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
  }) =>
      Transform(
        key: key,
        transform: transform,
        origin: origin,
        alignment: alignment,
        transformHitTests: transformHitTests,
        filterQuality: filterQuality,
        child: this,
      );

  Widget hero({
    Key? key,
    required Object tag,
    CreateRectTween? createRectTween,
    HeroFlightShuttleBuilder? flightShuttleBuilder,
    HeroPlaceholderBuilder? placeholderBuilder,
    bool transitionOnUserGestures = false,
  }) =>
      Hero(
        key: key,
        tag: tag,
        createRectTween: createRectTween,
        flightShuttleBuilder: flightShuttleBuilder,
        placeholderBuilder: placeholderBuilder,
        transitionOnUserGestures: transitionOnUserGestures,
        child: this,
      );

  Widget clipOval({
    Key? key,
    CustomClipper<Rect>? clipper,
    Clip clipBehavior = Clip.antiAlias,
  }) =>
      ClipOval(
        key: key,
        clipper: clipper,
        clipBehavior: clipBehavior,
        child: this,
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
        maintainBottomViewPadding: maintainBottomViewPadding,
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
        key: key,
        scrollDirection: scrollDirection,
        reverse: reverse,
        padding: padding,
        primary: primary,
        physics: physics,
        controller: controller,
        dragStartBehavior: dragStartBehavior,
        clipBehavior: clipBehavior,
        hitTestBehavior: hitTestBehavior,
        restorationId: restorationId,
        keyboardDismissBehavior: keyboardDismissBehavior,
        child: this,
      );
}

/// 裁剪
extension ClipRRectExtension on Widget {
  Widget radius([double r = 8.0]) =>
      clipRRect(borderRadius: BorderRadius.circular(r));
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

/// 位置
extension TransformExtension on Widget {
  Widget rotate({
    Key? key,
    required double angle,
    Offset? origin,
    AlignmentGeometry alignment = Alignment.center,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
  }) =>
      Transform.rotate(
        key: key,
        angle: angle,
        origin: origin,
        alignment: alignment,
        transformHitTests: transformHitTests,
        filterQuality: filterQuality,
        child: this,
      );

  Widget translate({
    Key? key,
    required Offset offset,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
  }) =>
      Transform.translate(
        key: key,
        offset: offset,
        transformHitTests: transformHitTests,
        filterQuality: filterQuality,
        child: this,
      );

  Widget scale({
    Key? key,
    double? scale,
    double? scaleX,
    double? scaleY,
    Offset? origin,
    AlignmentGeometry alignment = Alignment.center,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
  }) =>
      Transform.scale(
        key: key,
        scale: scale,
        scaleX: scaleX,
        scaleY: scaleY,
        origin: origin,
        alignment: alignment,
        transformHitTests: transformHitTests,
        filterQuality: filterQuality,
        child: this,
      );

  Widget flip({
    Key? key,
    bool flipX = false,
    bool flipY = false,
    Offset? origin,
    bool transformHitTests = true,
    FilterQuality? filterQuality,
  }) =>
      Transform.flip(
        key: key,
        flipX: flipX,
        flipY: flipY,
        origin: origin,
        transformHitTests: transformHitTests,
        filterQuality: filterQuality,
        child: this,
      );
}

/// Flutter.Container.BoxDecoration
extension ContainerExtension on Widget {
  Widget margin(EdgeInsetsGeometry margin, {Key? key}) =>
      container(margin: margin, key: key);
  Widget bgColor(Color color, {Key? key}) => container(color: color, key: key);
  Widget border({
    Key? key,
    Color color = Colors.black,
    double width = 1.0,
    BorderRadiusGeometry? radius,
  }) =>
      container(
        key: key,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: width),
          borderRadius: radius,
        ),
      );

  /// 通用装饰容器（可带圆角/形状/边框/阴影/背景图）
  Widget containerByBoxDecoration({
    Key? key,
    Color? color,
    DecorationImage? image,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
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
        borderRadius: shape == BoxShape.rectangle ? borderRadius : null,
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
  Widget rounded(double radius, {Key? key}) => containerByBoxDecoration(
      key: key, borderRadius: BorderRadius.circular(radius));

  /// 自定义圆角
  Widget radius(BorderRadiusGeometry r, {Key? key}) =>
      containerByBoxDecoration(key: key, borderRadius: r);

  /// 边框（全边）
  Widget borderAll({
    Key? key,
    Color color = const Color(0xFF000000),
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
  }) =>
      containerByBoxDecoration(
        key: key,
        border: Border.all(color: color, width: width, style: style),
      );

  /// 边框（单边）
  Widget borderOnly({
    Key? key,
    Color left = Colors.transparent,
    Color top = Colors.transparent,
    Color right = Colors.transparent,
    Color bottom = Colors.transparent,
    double leftWidth = 1,
    double topWidth = 1,
    double rightWidth = 1,
    double bottomWidth = 1,
  }) =>
      containerByBoxDecoration(
        key: key,
        border: Border(
          left: BorderSide(color: left, width: leftWidth),
          top: BorderSide(color: top, width: topWidth),
          right: BorderSide(color: right, width: rightWidth),
          bottom: BorderSide(color: bottom, width: bottomWidth),
        ),
      );

  /// 阴影（预设强度）
  Widget shadowXs({Key? key, Color color = Colors.black26}) =>
      containerByBoxDecoration(key: key, boxShadow: [
        BoxShadow(
            color: color,
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(0, 1)),
      ]);

  Widget shadowSm({Key? key, Color color = Colors.black26}) =>
      containerByBoxDecoration(key: key, boxShadow: [
        BoxShadow(
            color: color,
            blurRadius: 6,
            spreadRadius: 0,
            offset: const Offset(0, 2)),
      ]);

  Widget shadowMd({Key? key, Color color = Colors.black26}) =>
      containerByBoxDecoration(key: key, boxShadow: [
        BoxShadow(
            color: color,
            blurRadius: 12,
            spreadRadius: 0,
            offset: const Offset(0, 4)),
      ]);

  /// 线性渐变
  Widget linearGradient(
    List<Color> colors, {
    Key? key,
    List<double>? stops,
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
  }) =>
      containerByBoxDecoration(
        key: key,
        gradient: LinearGradient(
            colors: colors, stops: stops, begin: begin, end: end),
      );

  /// 径向渐变
  Widget radialGradient(
    List<Color> colors, {
    Key? key,
    List<double>? stops,
    AlignmentGeometry center = Alignment.center,
    double radius = 0.5,
  }) =>
      containerByBoxDecoration(
        key: key,
        gradient: RadialGradient(
            colors: colors, stops: stops, center: center, radius: radius),
      );

  /// 背景图
  Widget bgImage(
    ImageProvider provider, {
    Key? key,
    BoxFit fit = BoxFit.cover,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    ColorFilter? colorFilter,
    BlendMode? blendMode,
  }) =>
      containerByBoxDecoration(
        key: key,
        image: DecorationImage(
          image: provider,
          fit: fit,
          alignment: alignment,
          repeat: repeat,
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
    Clip clipBehavior = Clip.antiAlias, // 圆形建议抗锯齿裁剪
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
        clipBehavior: clipBehavior,
      );
}

/// Flutter.DecoratedBox
extension DecoratedBoxExtension on Widget {
  /// 纯背景色
  Widget backgroundCor(Color color, {Key? key}) => decoratedBox(
        key: key,
        decoration: BoxDecoration(color: color),
      );

  /// 圆角矩形
  Widget rounded(double radius, {Key? key}) => decoratedBox(
        key: key,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
      );

  /// 自定义圆角
  Widget radius(BorderRadiusGeometry r, {Key? key}) => decoratedBox(
        key: key,
        decoration: BoxDecoration(borderRadius: r),
      );

  /// 边框（全边）
  Widget borderAll({
    Key? key,
    Color color = const Color(0xFF000000),
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
  }) =>
      decoratedBox(
        key: key,
        decoration: BoxDecoration(
          border: Border.all(color: color, width: width, style: style),
        ),
      );

  /// 边框（单边）
  Widget borderOnly({
    Key? key,
    Color left = Colors.transparent,
    Color top = Colors.transparent,
    Color right = Colors.transparent,
    Color bottom = Colors.transparent,
    double leftWidth = 1,
    double topWidth = 1,
    double rightWidth = 1,
    double bottomWidth = 1,
  }) =>
      decoratedBox(
        key: key,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: left, width: leftWidth),
            top: BorderSide(color: top, width: topWidth),
            right: BorderSide(color: right, width: rightWidth),
            bottom: BorderSide(color: bottom, width: bottomWidth),
          ),
        ),
      );

  /// 阴影
  Widget shadow({
    Key? key,
    List<BoxShadow>? shadows,
  }) =>
      decoratedBox(
        key: key,
        decoration: BoxDecoration(boxShadow: shadows),
      );

  /// 线性渐变
  Widget linearGradient(
    List<Color> colors, {
    Key? key,
    List<double>? stops,
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
  }) =>
      decoratedBox(
        key: key,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            begin: begin,
            end: end,
          ),
        ),
      );

  /// 背景图
  Widget bgImage(
    ImageProvider provider, {
    Key? key,
    BoxFit fit = BoxFit.cover,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
  }) =>
      decoratedBox(
        key: key,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: provider,
            fit: fit,
            alignment: alignment,
            repeat: repeat,
          ),
        ),
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
        key: key,
        decoration: BoxDecoration(
          color: color,
          border: border,
          boxShadow: boxShadow,
          gradient: gradient,
          image: image,
          shape: BoxShape.circle,
        ),
      );

  // 核心实现：用 DecoratedBox 包裹
  Widget decoratedBox({
    Key? key,
    Decoration? decoration,
  }) =>
      DecoratedBox(
        key: key,
        decoration: decoration ?? const BoxDecoration(),
        child: this,
      );
}

/// Flutter.Container.decoration
extension DecoratedBoxExtensions on Widget {
  /// 纯装饰入口（不改大小/布局），等价于用 Container 包一层 Decoration
  Widget decoratedOnContainer({
    Key? key,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    Clip clipBehavior = Clip.none,
    AlignmentGeometry? alignment,
    EdgeInsetsGeometry? padding,
  }) =>
      Container(
        key: key,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        clipBehavior: clipBehavior,
        alignment: alignment,
        padding: padding,
        child: this,
      );

  /// 背景色（可带圆角/形状/混合模式/前景装饰）
  Widget backgroundColor(
    Color color, {
    Key? key,
    BorderRadiusGeometry? radius,
    BoxShape shape = BoxShape.rectangle,
    BlendMode? backgroundBlendMode,
    Decoration? foreground, // 若想加前景蒙层/边框
    Clip clip = Clip.none,
    DecorationPosition position = DecorationPosition.background,
  }) =>
      decoratedOnContainer(
        key: key,
        decoration: BoxDecoration(
          color: color,
          shape: shape,
          backgroundBlendMode: backgroundBlendMode,
          borderRadius: shape == BoxShape.rectangle ? radius : null,
        ),
        foregroundDecoration: foreground,
        clipBehavior: clip,
      );

  /// 渐变背景（可带圆角/形状/阴影/背景图）
  Widget gradient(
    Gradient gradient, {
    Key? key,
    BorderRadiusGeometry? radius,
    BoxShape shape = BoxShape.rectangle,
    List<BoxShadow>? shadows,
    DecorationImage? image,
    Clip clip = Clip.none,
  }) =>
      decoratedOnContainer(
        key: key,
        decoration: BoxDecoration(
          gradient: gradient,
          image: image,
          shape: shape,
          borderRadius: shape == BoxShape.rectangle ? radius : null,
          boxShadow: shadows,
        ),
        clipBehavior: clip,
      );

  /// 全边框（可组合：圆角/阴影/背景色/渐变/背景图/形状）
  Widget border({
    Key? key,
    Color color = Colors.black,
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
    BorderRadiusGeometry? radius,
    BoxShape shape = BoxShape.rectangle,
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
          shape: shape,
          borderRadius: shape == BoxShape.rectangle ? radius : null,
          border: Border.all(color: color, width: width, style: style),
          boxShadow: boxShadow,
        ),
        clipBehavior: clip,
      );

  /// 指定边的边框（top/right/bottom/left）
  Widget borderOnly({
    Key? key,
    Color color = Colors.black,
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
    bool top = false,
    bool right = false,
    bool bottom = false,
    bool left = false,
    BorderRadiusGeometry? radius,
    BoxShape shape = BoxShape.rectangle,
    Color? background,
    Clip clip = Clip.none,
  }) {
    BorderSide s(bool on) => on
        ? BorderSide(color: color, width: width, style: style)
        : BorderSide.none;
    return decoratedOnContainer(
      key: key,
      decoration: BoxDecoration(
        color: background,
        shape: shape,
        borderRadius: shape == BoxShape.rectangle ? radius : null,
        border: Border(
          top: s(top),
          right: s(right),
          bottom: s(bottom),
          left: s(left),
        ),
      ),
      clipBehavior: clip,
    );
  }

  /// 圆角裁剪（更可靠的裁剪边角）
  Widget radius(Key? key, BorderRadiusGeometry radius,
          {Clip clip = Clip.antiAlias}) =>
      ClipRRect(
          key: key, borderRadius: radius, clipBehavior: clip, child: this);

  /// 阴影（可叠加背景/渐变/背景图/圆角/形状）
  Widget boxShadow({
    Key? key,
    List<BoxShadow>? shadows,
    BorderRadiusGeometry? radius,
    BoxShape shape = BoxShape.rectangle,
    Color? background,
    Gradient? gradient,
    DecorationImage? image,
    Clip clip = Clip.none,
  }) =>
      decoratedOnContainer(
        key: key,
        decoration: BoxDecoration(
          color: background,
          gradient: gradient,
          image: image,
          shape: shape,
          borderRadius: shape == BoxShape.rectangle ? radius : null,
          boxShadow: shadows ??
              const [
                BoxShadow(
                  blurRadius: 8,
                  offset: Offset(0, 4),
                  color: Colors.black26,
                ),
              ],
        ),
        clipBehavior: clip,
      );

  /// 前景装饰（例如前景边框/蒙层/水印）
  Widget foreground(Key? key, Decoration decoration, {Clip clip = Clip.none}) =>
      decoratedOnContainer(
          key: key, foregroundDecoration: decoration, clipBehavior: clip);
}
