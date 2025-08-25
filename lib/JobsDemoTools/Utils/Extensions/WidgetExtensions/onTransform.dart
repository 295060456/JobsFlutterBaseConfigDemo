import 'package:flutter/material.dart';

extension JobsWidgetTransformExtension on Widget {
  Widget rotate(
    double angle, {
    Key? key,
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

  Widget scale(
    double? scale, {
    Key? key,
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

  Widget transform(
    Matrix4 transform, {
    Key? key,
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

  /// 二维平移 (Offset)
  Widget translate2D(double dx, double dy,
      {Key? key, bool transformHitTests = true, FilterQuality? filterQuality}) {
    return Transform.translate(
      key: key,
      offset: Offset(dx, dy),
      transformHitTests: transformHitTests,
      filterQuality: filterQuality,
      child: this,
    );
  }

  /// 三维平移 (Matrix4.translationValues)
  Widget translate3D(double x, double y, double z,
      {Key? key, bool transformHitTests = true, FilterQuality? filterQuality}) {
    return Transform(
      key: key,
      transform: Matrix4.translationValues(x, y, z),
      transformHitTests: transformHitTests,
      filterQuality: filterQuality,
      child: this,
    );
  }
}
