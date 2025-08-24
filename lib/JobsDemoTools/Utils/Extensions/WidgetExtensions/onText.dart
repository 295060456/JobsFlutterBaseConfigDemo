import 'package:flutter/material.dart';

extension JobsTextExtension on Text {
  Widget textStyle(TextStyle style) => Text(
        (this).data ?? '',
        key: (this).key,
        style: style.merge((this).style),
        strutStyle: (this).strutStyle,
        textAlign: (this).textAlign,
        textDirection: (this).textDirection,
        locale: (this).locale,
        softWrap: (this).softWrap,
        overflow: (this).overflow,
        textScaler: (this).textScaler,
        maxLines: (this).maxLines,
        semanticsLabel: (this).semanticsLabel,
        textWidthBasis: (this).textWidthBasis,
        textHeightBehavior: (this).textHeightBehavior,
        selectionColor: (this).selectionColor,
      );

  Text color(Color c) => Text(
        data ?? '',
        key: key,
        style: (style ?? const TextStyle()).copyWith(color: c),
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaler: textScaler,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );

  Text size(double s) => Text(
        data ?? '',
        key: key,
        style: (style ?? const TextStyle()).copyWith(fontSize: s),
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaler: textScaler,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );

  Text bold() => Text(
        data ?? '',
        key: key,
        style:
            (style ?? const TextStyle()).copyWith(fontWeight: FontWeight.bold),
        strutStyle: strutStyle,
        textAlign: textAlign,
        textDirection: textDirection,
        locale: locale,
        softWrap: softWrap,
        overflow: overflow,
        textScaler: textScaler,
        maxLines: maxLines,
        semanticsLabel: semanticsLabel,
        textWidthBasis: textWidthBasis,
        textHeightBehavior: textHeightBehavior,
        selectionColor: selectionColor,
      );
} // 可滚动包裹
