import 'package:flutter/material.dart';


/*
Text.rich(
  TextSpan(
    text: 'VIP ',
    children: [
      TextSpan(
        text: 'Gold',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ],
  ),
).color(Colors.blue).size(16); // 依然保留 span 结构
*/

extension JobsTextExtension on Text {
  // ---------- 核心：安全重建（兼容 data / textSpan） ----------
  Text _rebuild({
    TextStyle? style,
    StrutStyle? strutStyle,
    TextAlign? textAlign,
    TextDirection? textDirection,
    Locale? locale,
    bool? softWrap,
    TextOverflow? overflow,
    double? textScaleFactor, // 兼容旧版
    TextScaler? textScaler, // 新版
    int? maxLines,
    String? semanticsLabel,
    TextWidthBasis? textWidthBasis,
    TextHeightBehavior? textHeightBehavior,
    Color? selectionColor,
  }) {
    // 以现有 style 为基，合并新 style
    final mergedStyle = (this.style ?? const TextStyle()).merge(style);

    if (textSpan != null) {
      return Text.rich(
        textSpan!,
        key: key,
        style: mergedStyle,
        strutStyle: strutStyle ?? this.strutStyle,
        textAlign: textAlign ?? this.textAlign,
        textDirection: textDirection ?? this.textDirection,
        locale: locale ?? this.locale,
        softWrap: softWrap ?? this.softWrap,
        overflow: overflow ?? this.overflow,
        textScaler: textScaler ??
            this.textScaler ??
            (textScaleFactor != null
                ? TextScaler.linear(textScaleFactor)
                : null),
        maxLines: maxLines ?? this.maxLines,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
        textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
        selectionColor: selectionColor ?? this.selectionColor,
      );
    } else {
      return Text(
        data ?? '',
        key: key,
        style: mergedStyle,
        strutStyle: strutStyle ?? this.strutStyle,
        textAlign: textAlign ?? this.textAlign,
        textDirection: textDirection ?? this.textDirection,
        locale: locale ?? this.locale,
        softWrap: softWrap ?? this.softWrap,
        overflow: overflow ?? this.overflow,
        textScaler: textScaler ??
            this.textScaler ??
            (textScaleFactor != null
                ? TextScaler.linear(textScaleFactor)
                : null),
        maxLines: maxLines ?? this.maxLines,
        semanticsLabel: semanticsLabel ?? this.semanticsLabel,
        textWidthBasis: textWidthBasis ?? this.textWidthBasis,
        textHeightBehavior: textHeightBehavior ?? this.textHeightBehavior,
        selectionColor: selectionColor ?? this.selectionColor,
      );
    }
  }

  // ---------- 样式级别：一次性传入完整 TextStyle ----------
  Text textStyle(TextStyle style) => _rebuild(style: style);

  // 支持函数式修改已有 style
  Text styleModify(TextStyle Function(TextStyle current) f) =>
      _rebuild(style: f(style ?? const TextStyle()));

  // ---------- 单属性链式设置（都可与其它叠加） ----------
  Text color(Color c) => _rebuild(style: TextStyle(color: c));
  Text size(double s) => _rebuild(style: TextStyle(fontSize: s));
  Text weight(FontWeight w) => _rebuild(style: TextStyle(fontWeight: w));
  Text bold() => weight(FontWeight.bold);
  Text semiBold() => weight(FontWeight.w600);
  Text medium() => weight(FontWeight.w500);
  Text light() => weight(FontWeight.w300);

  Text letterSpacing(double v) => _rebuild(style: TextStyle(letterSpacing: v));
  Text heightLine(double? h) => _rebuild(style: TextStyle(height: h));
  Text fontFamily(String f) => _rebuild(style: TextStyle(fontFamily: f));
  Text italic() =>
      _rebuild(style: const TextStyle(fontStyle: FontStyle.italic));
  Text underline([Color? c]) => _rebuild(
      style:
          TextStyle(decoration: TextDecoration.underline, decorationColor: c));
  Text lineThrough([Color? c]) => _rebuild(
      style: TextStyle(
          decoration: TextDecoration.lineThrough, decorationColor: c));
  Text overline([Color? c]) => _rebuild(
      style:
          TextStyle(decoration: TextDecoration.overline, decorationColor: c));

  // 布局/行为类
  Text align(TextAlign a) => _rebuild(textAlign: a);
  Text max(int? lines) => _rebuild(maxLines: lines);
  Text overflowEllipsis() => _rebuild(overflow: TextOverflow.ellipsis);
  Text overflowFade() => _rebuild(overflow: TextOverflow.fade);
  Text soft(bool? wrap) => _rebuild(softWrap: wrap);
  Text scale(double f) => _rebuild(textScaler: TextScaler.linear(f));
  Text dir(TextDirection d) => _rebuild(textDirection: d);
  Text localeOf(Locale l) => _rebuild(locale: l);
  Text widthBasis(TextWidthBasis b) => _rebuild(textWidthBasis: b);
  Text heightBehavior(TextHeightBehavior b) => _rebuild(textHeightBehavior: b);

  // 组合便捷法
  Text headline() => size(18).semiBold().letterSpacing(0.2);
  Text subTitle() => size(14).color(const Color(0xFF9AA3B2));
}
