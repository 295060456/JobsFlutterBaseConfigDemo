import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 使用说明
///
/// 1) 数据与表头
///    - rowsData 只需传有效数据；缺口用占位符（默认 "🈚️"）自动补齐。
///    - 数据列数 > 表头列数时会以表头为准截断。
///    - 表头（首行/首列标题）默认完整显示。
///
/// 2) 显示策略（仅对“未固定列宽的列”生效）
///    - CellLayout.ellipsis 省略号
///    - CellLayout.shrink  缩小字体单行适配
///    - CellLayout.fitToLongest 按“最长内容 or 表头”撑开整列宽度
///    - CellLayout.wrap    自动换行（最多 wrapMaxLines）
///
/// 3) 行高 / 列宽
///    - rowHeights: >0=固定；未传：
///        · 若父容器有明确高度：数据区等分；
///        · 否则按内在高度（字体+padding）。
///    - columnWidths（含首列）：>0=固定；未传=按等分/策略计算。
///    - 首列模式：
///        · includeInEqualSplit：首列参与等分；
///        · fixedAndExclude    ：首列固定，其余再等分/自适配。
///
/// 4) 冻结规则
///    - 超高：冻结第一行（表头），数据区上下滚动；
///    - 超宽：冻结第一列（行头），右侧左右滚动。
///
/// 5) 滚动与手势
///    - disableInternalVerticalScroll / disableInternalHorizontalScroll：
///      最高优先级直透开关（默认 false）；为 true 时该方向内部**不滚**，拖拽交给父级。
///    - relayGestureToParentWhenAtEdge（默认 true）：
///      内部滚到边缘时，自动把该方向 physics 切换为 NeverScrollableScrollPhysics，
///      父级自然接力；一旦离开边缘或新一轮滚动开始，则恢复内部 physics。
///
/// 6) 铺满策略
///    - expandToMaxWidth：铺满父容器；
///    - respectFixedOnExpand：不拉伸已固定列；
///    - fillColumn：可指定把富余宽度补给哪一列（数据列索引 0..N-1，null=最后一列）。

// =============================== Demo 入口 ===============================
void main1() {
  final horizontal = ['回归后流水', 'VIP1', 'VIP2', 'VIP3', 'VIP4'];
  final vertical = ['≥1元', '≥2元', '≥3元', '≥4元'];
  final data = [
    ['1000元', '3000元', '6000元', '10000元'],
    ['2000元', '4000元', '8000元', '20000元'],
    ['—', '—', '—', '—'],
    ['—', '—', '—', '—'],
  ];

  runApp(
    ScreenUtilInit(
      designSize: const Size(1125, 2436),
      minTextAdapt: true,
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => ScrollConfiguration(
          behavior: const _NoBounceNoGlow(),
          child: child!,
        ),
        home: Scaffold(
          appBar:
              AppBar(title: const Text('JobsExcel@Model1 首列参与等分（纵向直透父级演示）')),
          body: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              JobsExcelBuildByMode1(
                horizontalTitles: horizontal,
                verticalTitles: vertical,
                rowsData: data,
                rowHeights: const [44, 48, 48, 48, 48],
                // 纵向完全交给父级（直透）
                disableInternalVerticalScroll: true,
                // 横向仍由内部处理
                disableInternalHorizontalScroll: false,
                relayGestureToParentWhenAtEdge: false,
              ),
              const SizedBox(height: 800),
            ],
          ),
        ),
      ),
    ),
  );
}

void main2() {
  final horizontal = ['回归后流水', 'VIP1', 'VIP2', 'VIP3', 'VIP4'];
  final vertical = ['≥1元', '≥2元', '≥3元', '≥4元'];
  final data = [
    ['1000元', '3000元', '6000元', '10000元'],
    ['2000元', '4000元', '8000元', '20000元'],
    ['—', '—', '—', '—'],
    ['—', '—', '—', '—'],
  ];

  runApp(
    ScreenUtilInit(
      designSize: const Size(1125, 2436),
      minTextAdapt: true,
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => ScrollConfiguration(
          behavior: const _NoBounceNoGlow(),
          child: child!,
        ),
        home: Scaffold(
          appBar: AppBar(
              title: const Text('JobsExcel@Model2 首列固定+内容自适配（到边缘→接力父级）')),
          body: ListView(
            padding: const EdgeInsets.all(12),
            children: [
              JobsExcelBuildByMode2(
                horizontalTitles: horizontal,
                verticalTitles: vertical,
                rowsData: data,
                rowHeights: const [44, 48, 48, 48, 48],
                firstColumnFixedWidth: 100,
                // 到边缘接力父级（推荐）
                relayGestureToParentWhenAtEdge: true,
              ),
              const SizedBox(height: 800),
            ],
          ),
        ),
      ),
    ),
  );
}

void main3() {
  final horizontal = ['回归后流水', 'VIP1', 'VIP2', 'VIP3', 'VIP4'];
  final vertical = ['≥1元', '≥2元', '≥3元', '≥4元'];
  final data = [
    ['1000元', '3000元', '6000元', '10000元'],
    ['2000元', '4000元', '8000元', '20000元'],
    ['—', '—', '—', '—'],
    ['—', '—', '—', '—'],
  ];

  runApp(
    ScreenUtilInit(
      designSize: const Size(1125, 2436),
      minTextAdapt: true,
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) => ScrollConfiguration(
          behavior: const _NoBounceNoGlow(),
          child: child!,
        ),
        home: Scaffold(
          appBar:
              AppBar(title: const Text('JobsExcel@Model3 首列固定+其余等分（到边缘→接力）')),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: JobsExcelBuildByMode3(
                horizontalTitles: horizontal,
                verticalTitles: vertical,
                rowsData: data,
                rowHeights: const [44, 48, 48, 48, 48],
                firstColumnFixedWidth: 100,
                relayGestureToParentWhenAtEdge: true,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

// =============================== Scroll 行为：去掉回弹/发光（可按需保留） ===============================
class _NoBounceNoGlow extends ScrollBehavior {
  const _NoBounceNoGlow();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
  @override
  Widget buildOverscrollIndicator(
          BuildContext context, Widget child, ScrollableDetails details) =>
      child;
}

// =============================== 样式 & 枚举 ===============================
class TableSectionStyle {
  final Color bgColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsetsGeometry padding;
  const TableSectionStyle({
    this.bgColor = Colors.transparent,
    this.textColor = Colors.black87,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
  });
}

/// 单元格显示策略（当该列没有固定宽时生效）
enum CellLayout { shrink, ellipsis, fitToLongest, wrap }

/// 首列宽度策略
enum FirstColumnMode {
  includeInEqualSplit, // 模式1：首列参与等分
  fixedAndExclude, // 模式2：首列固定并排除等分
}

// =============================== JobsExcel 核心实现 ===============================
class JobsExcel extends StatefulWidget {
  final List<String> horizontalTitles; // [0] = 左上角标题
  final List<String> verticalTitles; // 行头（不含表头）
  final List<List<String>> rowsData; // 每行长度 = horizontal.length - 1

  /// 列宽数组（含首列）。>0=固定；≤0/null=自动/等分
  final List<double?>? columnWidths;

  /// 行高数组（含表头）。>0=固定；≤0/null：见说明
  final List<double?>? rowHeights;

  /// 首列策略 & 固定宽
  final FirstColumnMode firstColumnMode;
  final double? firstColumnFixedWidth; // 模式2使用；未传→默认95

  /// 当列未被 columnWidths 指定时，用该策略决定列宽/展示
  final List<CellLayout>? columnModes;
  final int wrapMaxLines;

  final TableSectionStyle headerXStyle;
  final TableSectionStyle headerYStyle;
  final TableSectionStyle cellStyle;

  final Color borderColor;
  final double borderWidth;
  final double borderRadius;

  final String placeholder;

  /// 仅对“未被 columnWidths 指定”的列生效
  final double minColWidth;
  final double? maxColWidth;

  // 铺满相关
  final bool expandToMaxWidth;

  /// 数据区列索引（0..dataCols-1），null=最后一列
  final int? fillColumn;

  /// 铺满时是否尊重固定列（固定列不被拉伸）
  final bool respectFixedOnExpand;

  // ===== 新增（滚动/接力）=====
  /// 最高优先级：关闭内部纵向滚动（手势直透父级）
  final bool disableInternalVerticalScroll;

  /// 最高优先级：关闭内部横向滚动（手势直透父级）
  final bool disableInternalHorizontalScroll;

  /// 内部到边缘后是否把同向拖拽接力给父级（默认开）
  final bool relayGestureToParentWhenAtEdge;

  const JobsExcel({
    super.key,
    required this.horizontalTitles,
    required this.verticalTitles,
    required this.rowsData,
    this.columnWidths,
    this.rowHeights,
    this.firstColumnMode = FirstColumnMode.fixedAndExclude,
    this.firstColumnFixedWidth,
    this.columnModes,
    this.wrapMaxLines = 2,
    this.headerXStyle = const TableSectionStyle(),
    this.headerYStyle = const TableSectionStyle(),
    this.cellStyle = const TableSectionStyle(),
    this.borderColor = const Color(0xFFE5E6EB),
    this.borderWidth = 1,
    this.borderRadius = 0,
    this.placeholder = '-',
    this.minColWidth = 56,
    this.maxColWidth,
    this.expandToMaxWidth = true,
    this.fillColumn,
    this.respectFixedOnExpand = true,

    // 新增
    this.disableInternalVerticalScroll = false,
    this.disableInternalHorizontalScroll = false,
    this.relayGestureToParentWhenAtEdge = true,
  }) : assert(horizontalTitles.length >= 1);

  @override
  State<JobsExcel> createState() => _JobsExcelState();
}

class _JobsExcelState extends State<JobsExcel> {
  // 垂直：左（行头列）与右（数据区）需要同步
  final _vLeft = ScrollController();
  final _vRight = ScrollController();
  // 右侧：横向
  final _hRight = ScrollController();
  bool _syncing = false;

  // 动态 physics（NotificationListener 控制）
  late ScrollPhysics _vPhysics;
  late ScrollPhysics _hPhysics;

  // 常量：默认表头高 / 默认首列宽 / 最小内在行高
  static const double _kDefaultHeaderHeight = 44;
  static const double _kDefaultRowHeaderWidth = 95;
  static const double _kMinIntrinsicRowHeight = 28;
  static const double _kEdgeEps = 0.5;

  @override
  void initState() {
    super.initState();
    _vLeft.addListener(_syncFromLeft);
    _vRight.addListener(_syncFromRight);

    // 初始 physics（考虑直透开关）
    _vPhysics = widget.disableInternalVerticalScroll
        ? const NeverScrollableScrollPhysics()
        : const ClampingScrollPhysics();
    _hPhysics = widget.disableInternalHorizontalScroll
        ? const NeverScrollableScrollPhysics()
        : const ClampingScrollPhysics();
  }

  @override
  void dispose() {
    _vLeft.removeListener(_syncFromLeft);
    _vRight.removeListener(_syncFromRight);
    _vLeft.dispose();
    _vRight.dispose();
    _hRight.dispose();
    super.dispose();
  }

  // ─── 左右垂直滚动同步 ───
  void _syncFromLeft() {
    if (_syncing) return;
    _syncing = true;
    if (_vRight.hasClients) _vRight.jumpTo(_vLeft.position.pixels);
    _syncing = false;
  }

  void _syncFromRight() {
    if (_syncing) return;
    _syncing = true;
    if (_vLeft.hasClients) _vLeft.jumpTo(_vRight.position.pixels);
    _syncing = false;
  }

  // ─── Notification 统一处理：到边缘切 Never，离开边缘恢复 ───
  bool _onScrollNotification(ScrollNotification n) {
    // 直透开关优先：开了就不参与任何切换
    if (widget.disableInternalVerticalScroll && n.metrics.axis == Axis.vertical)
      return false;
    if (widget.disableInternalHorizontalScroll &&
        n.metrics.axis == Axis.horizontal) return false;

    if (!widget.relayGestureToParentWhenAtEdge) return false;

    if (n is ScrollStartNotification) {
      // 新一轮滚动开始 → 先恢复内部可滚（方便反向立刻接回）
      if (n.metrics.axis == Axis.vertical &&
          _vPhysics is NeverScrollableScrollPhysics) {
        setState(() => _vPhysics = const ClampingScrollPhysics());
      }
      if (n.metrics.axis == Axis.horizontal &&
          _hPhysics is NeverScrollableScrollPhysics) {
        setState(() => _hPhysics = const ClampingScrollPhysics());
      }
    } else if (n is ScrollUpdateNotification) {
      final atEdge = n.metrics.atEdge ||
          (n.metrics.pixels <= n.metrics.minScrollExtent + _kEdgeEps) ||
          (n.metrics.pixels >= n.metrics.maxScrollExtent - _kEdgeEps);
      if (n.metrics.axis == Axis.vertical) {
        if (atEdge) {
          if (_vPhysics is! NeverScrollableScrollPhysics) {
            setState(() => _vPhysics = const NeverScrollableScrollPhysics());
          }
        } else {
          if (_vPhysics is NeverScrollableScrollPhysics) {
            setState(() => _vPhysics = const ClampingScrollPhysics());
          }
        }
      } else if (n.metrics.axis == Axis.horizontal) {
        if (atEdge) {
          if (_hPhysics is! NeverScrollableScrollPhysics) {
            setState(() => _hPhysics = const NeverScrollableScrollPhysics());
          }
        } else {
          if (_hPhysics is NeverScrollableScrollPhysics) {
            setState(() => _hPhysics = const ClampingScrollPhysics());
          }
        }
      }
    }
    return false; // 不拦截，继续冒泡
  }

  // ─── 工具：像素对齐、文本宽度、内在行高 ───
  double _px(double v) {
    final dpr = MediaQuery.of(context).devicePixelRatio;
    return (v * dpr).round() / dpr;
  }

  double _textWidth(String text, TextStyle style) {
    final tp = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return tp.size.width;
  }

  double _intrinsicRowHeight(TableSectionStyle style) {
    final pad = (style.padding as EdgeInsets?) ?? EdgeInsets.zero;
    final fontH = style.fontSize * 1.2; // 近似行高
    final h = fontH + pad.top + pad.bottom;
    return _px(h < _kMinIntrinsicRowHeight ? _kMinIntrinsicRowHeight : h);
  }

  // 读取列宽：>0 用给定值；否则返回 null 表示“交给自动/等分”
  double? _tryGetColumnWidth(int col) {
    if (widget.columnWidths != null &&
        col < widget.columnWidths!.length &&
        (widget.columnWidths![col] ?? 0) > 0) {
      return _px(widget.columnWidths![col]!);
    }
    return null;
  }

  // 表头高度：rowHeights[0] > 0 → 用；否则默认 44
  double _resolveHeaderHeight() {
    if (widget.rowHeights != null &&
        widget.rowHeights!.isNotEmpty &&
        (widget.rowHeights![0] ?? 0) > 0) {
      return _px(widget.rowHeights![0]!);
    }
    return _px(_kDefaultHeaderHeight);
  }

  // 数据行高：固定 / 等分 / 内在
  List<double> _resolveBodyRowHeights({
    required int rows,
    required double? boundedBodyHeight,
  }) {
    if (widget.rowHeights != null) {
      return List<double>.generate(rows, (r) {
        final idx = 1 + r;
        if (idx < widget.rowHeights!.length &&
            (widget.rowHeights![idx] ?? 0) > 0) {
          return _px(widget.rowHeights![idx]!);
        }
        return _intrinsicRowHeight(widget.cellStyle);
      });
    }
    if (boundedBodyHeight != null) {
      final per = _px(boundedBodyHeight / math.max(1, rows));
      return List.filled(rows, per);
    } else {
      final h = _intrinsicRowHeight(widget.cellStyle);
      return List.filled(rows, h);
    }
  }

  // 右侧数据列宽：支持 columnWidths / 等分 / 自动策略
  Map<int, TableColumnWidth> _computeRightColumnWidths(
    List<List<String>> normalizedRows,
    List<CellLayout> modes,
    double availableForRight,
  ) {
    final cols = widget.horizontalTitles.length;
    final dataCols = cols - 1;

    // 情况A：columnWidths==null → 右侧数据列等分
    if (widget.columnWidths == null) {
      final avg = _px(availableForRight / math.max(1, dataCols));
      return {for (int c = 0; c < dataCols; c++) c: FixedColumnWidth(avg)};
    }

    // 情况B：列宽数组 + 策略
    final EdgeInsets headerPad =
        (widget.headerXStyle.padding as EdgeInsets?) ?? EdgeInsets.zero;
    final EdgeInsets cellPad =
        (widget.cellStyle.padding as EdgeInsets?) ?? EdgeInsets.zero;

    final headerStyle = TextStyle(
      color: widget.headerXStyle.textColor,
      fontSize: widget.headerXStyle.fontSize,
      fontWeight: widget.headerXStyle.fontWeight,
      height: 1.2,
    );
    final cellStyle = TextStyle(
      color: widget.cellStyle.textColor,
      fontSize: widget.cellStyle.fontSize,
      fontWeight: widget.cellStyle.fontWeight,
      height: 1.2,
    );

    final map = <int, TableColumnWidth>{};
    for (int c = 0; c < dataCols; c++) {
      final fixed = _tryGetColumnWidth(c + 1); // 数据列对应 columnWidths[c+1]
      if (fixed != null) {
        map[c] = FixedColumnWidth(fixed);
        continue;
      }

      // 自动：按 columnModes
      final mode = c < modes.length ? modes[c] : CellLayout.ellipsis;

      double wHeader = _textWidth(widget.horizontalTitles[c + 1], headerStyle) +
          headerPad.left +
          headerPad.right;

      double w = wHeader;
      if (mode == CellLayout.fitToLongest) {
        for (final row in normalizedRows) {
          final t = (c < row.length) ? row[c] : widget.placeholder;
          final wCell = _textWidth(t, cellStyle) + cellPad.left + cellPad.right;
          if (wCell > w) w = wCell;
        }
      }

      w = _px(w);
      if (w < widget.minColWidth) w = widget.minColWidth;
      if (widget.maxColWidth != null && w > widget.maxColWidth!)
        w = widget.maxColWidth!;
      map[c] = FixedColumnWidth(w);
    }
    return map;
  }

  // 单元格构建
  Widget _headerCell(String text, TableSectionStyle style,
      {double? width, required double height}) {
    final t = Text(
      text,
      maxLines: 1,
      softWrap: false,
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: style.textColor,
        fontSize: style.fontSize,
        fontWeight: style.fontWeight,
        height: 1.2,
      ),
    );
    final content = Container(
      color: style.bgColor,
      alignment: Alignment.center,
      padding: style.padding,
      child: t,
    );
    final fixedH = SizedBox(height: height, child: content);
    return width != null ? SizedBox(width: width, child: fixedH) : fixedH;
  }

  Widget _bodyCell(String text, TableSectionStyle style, CellLayout mode,
      {double? width,
      required double height,
      TextAlign align = TextAlign.center}) {
    Widget child = Text(
      text,
      maxLines: mode == CellLayout.wrap ? widget.wrapMaxLines : 1,
      softWrap: mode == CellLayout.wrap,
      overflow: mode == CellLayout.ellipsis
          ? TextOverflow.ellipsis
          : (mode == CellLayout.wrap
              ? TextOverflow.ellipsis
              : TextOverflow.visible),
      textAlign: align,
      style: TextStyle(
        color: style.textColor,
        fontSize: style.fontSize,
        fontWeight: style.fontWeight,
        height: 1.2,
      ),
    );

    if (mode == CellLayout.shrink) {
      child = FittedBox(
          fit: BoxFit.scaleDown, alignment: Alignment.center, child: child);
    }

    final content = Container(
      color: style.bgColor,
      alignment: Alignment.center,
      padding: style.padding,
      child: child,
    );

    final fixedH = SizedBox(height: height, child: content);
    return width != null ? SizedBox(width: width, child: fixedH) : fixedH;
  }

  List<String> _fitRow(List<String> row, int targetLen) {
    if (row.length == targetLen) return row;
    if (row.length > targetLen) return row.sublist(0, targetLen);
    return [...row, ...List.filled(targetLen - row.length, widget.placeholder)];
  }

  // 铺满：挑一个未固定的数据列；必要时尊重固定
  int? _chooseTargetDataColForExpand(int dataCols, int preferred) {
    final isFixed = _tryGetColumnWidth(preferred + 1) != null;
    if (!widget.respectFixedOnExpand || !isFixed) return preferred;
    for (int i = dataCols - 1; i >= 0; i--) {
      if (_tryGetColumnWidth(i + 1) == null) return i;
    }
    return null; // 全部固定
  }

  @override
  Widget build(BuildContext context) {
    final rows = widget.verticalTitles.length;
    final cols = widget.horizontalTitles.length;
    final dataCols = cols - 1;
    final bw = widget.borderWidth;

    // 规范化数据
    final normalized = List.generate(
      rows,
      (r) => _fitRow(
          r < widget.rowsData.length ? widget.rowsData[r] : const [], dataCols),
    );

    return NotificationListener<ScrollNotification>(
      onNotification: _onScrollNotification,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final headerHeight = _resolveHeaderHeight();

          // 高度约束（用于“等分行高”）
          final bool bounded = constraints.maxHeight.isFinite;
          final double? bodyAllocH = bounded
              ? _px((constraints.maxHeight - headerHeight)
                  .clamp(0, double.infinity))
              : null;

          // 数据行高：固定/等分/内在
          final rowHeights =
              _resolveBodyRowHeights(rows: rows, boundedBodyHeight: bodyAllocH);

          // 每列展示策略（仅对未固定宽的列有效）
          final modes = List<CellLayout>.generate(
            dataCols,
            (i) => widget.columnModes != null && i < widget.columnModes!.length
                ? widget.columnModes![i]
                : CellLayout.ellipsis,
          );

          // 先确定首列宽
          double leftWidth;
          final fixedLeft = _tryGetColumnWidth(0);
          if (fixedLeft != null) {
            leftWidth = fixedLeft;
          } else {
            if (widget.columnWidths == null) {
              if (widget.firstColumnMode ==
                  FirstColumnMode.includeInEqualSplit) {
                final seam = bw; // 左右中缝
                final per =
                    _px((constraints.maxWidth - seam) / math.max(1, cols));
                leftWidth = per;
              } else {
                leftWidth = _px(
                    widget.firstColumnFixedWidth ?? _kDefaultRowHeaderWidth);
              }
            } else {
              leftWidth =
                  _px(widget.firstColumnFixedWidth ?? _kDefaultRowHeaderWidth);
            }
          }

          // 右侧可用宽 = 总宽 - 左列宽 - 中缝
          final double availableForRight =
              constraints.maxWidth - (leftWidth + bw);

          // 计算右侧列宽
          final rightColWidths = _computeRightColumnWidths(
            normalized,
            modes,
            availableForRight,
          );

          // 计算高度（非约束情况下）
          final fullBodyContentHeight =
              rowHeights.fold<double>(0, (sum, h) => sum + h);
          final headerSlotHeight = headerHeight;

          // ── TL（左上）
          Widget buildTL() => Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: widget.borderColor, width: bw),
                    bottom: BorderSide(color: widget.borderColor, width: bw),
                  ),
                ),
                child: _headerCell(
                  widget.horizontalTitles[0],
                  widget.headerXStyle,
                  width: leftWidth,
                  height: headerHeight,
                ),
              );

          // ── TR（右上表头行）
          Table buildTR() => Table(
                border: TableBorder(
                  bottom: BorderSide(color: widget.borderColor, width: bw),
                  verticalInside:
                      BorderSide(color: widget.borderColor, width: bw),
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: rightColWidths,
                children: [
                  TableRow(
                    children: [
                      for (int c = 1; c < cols; c++)
                        _headerCell(
                            widget.horizontalTitles[c], widget.headerXStyle,
                            height: headerHeight),
                    ],
                  ),
                ],
              );

          // ── BR（右下表体）
          Table buildBR() => Table(
                border: TableBorder(
                  horizontalInside:
                      BorderSide(color: widget.borderColor, width: bw),
                  verticalInside:
                      BorderSide(color: widget.borderColor, width: bw),
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: rightColWidths,
                children: [
                  for (int r = 0; r < rows; r++)
                    TableRow(
                      children: [
                        for (int c = 0; c < dataCols; c++)
                          _bodyCell(
                            normalized[r][c],
                            widget.cellStyle,
                            modes[c],
                            height: rowHeights[r],
                          ),
                      ],
                    ),
                ],
              );

          // ── BL（左下行头列）
          Table buildBLTable() => Table(
                border: TableBorder(
                  right: BorderSide(color: widget.borderColor, width: bw),
                  horizontalInside:
                      BorderSide(color: widget.borderColor, width: bw),
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: {0: FixedColumnWidth(leftWidth)},
                children: [
                  for (int r = 0; r < rows; r++)
                    TableRow(
                      children: [
                        _bodyCell(
                          widget.verticalTitles[r],
                          widget.headerYStyle,
                          CellLayout.ellipsis,
                          width: leftWidth,
                          height: rowHeights[r],
                          align: TextAlign.start,
                        ),
                      ],
                    ),
                ],
              );

          // ===== 铺满（补列宽） =====
          double _sumRight(Map<int, TableColumnWidth> m) {
            double sum = 0;
            m.forEach((_, v) {
              if (v is FixedColumnWidth) sum += v.value;
            });
            return sum;
          }

          if (widget.expandToMaxWidth &&
              availableForRight.isFinite &&
              availableForRight > 0) {
            final currentRight = _sumRight(rightColWidths);
            final extra = availableForRight - currentRight;
            if (extra > 0 && dataCols > 0) {
              final preferred =
                  (widget.fillColumn ?? (dataCols - 1)).clamp(0, dataCols - 1);
              final target = _chooseTargetDataColForExpand(dataCols, preferred);
              if (target != null) {
                final cur = (rightColWidths[target] as FixedColumnWidth).value;
                rightColWidths[target] = FixedColumnWidth(cur + extra);
              }
            }
          }

          // ===== 计算最终可视高度 =====
          final availableHeight = constraints.maxHeight.isFinite
              ? constraints.maxHeight
              : fullBodyContentHeight + headerSlotHeight;
          final viewportBodyHeight = _px(
              (availableHeight - headerSlotHeight).clamp(0, double.infinity));
          final totalHeight = _px(headerSlotHeight + viewportBodyHeight);

          // ===== 核心布局 =====
          final core = SizedBox(
            height: totalHeight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 左列：TL + 可滚动 BL
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: headerSlotHeight, child: buildTL()),
                    SizedBox(
                      height: viewportBodyHeight,
                      width: leftWidth + bw,
                      child: SingleChildScrollView(
                        controller: _vLeft,
                        physics: _vPhysics,
                        scrollDirection: Axis.vertical,
                        child: buildBLTable(),
                      ),
                    ),
                  ],
                ),
                // 右列：横向容器里含 TR + BR
                Flexible(
                  child: SingleChildScrollView(
                    controller: _hRight,
                    physics: _hPhysics,
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: headerSlotHeight, child: buildTR()),
                        SizedBox(
                          height: viewportBodyHeight,
                          child: SingleChildScrollView(
                            controller: _vRight,
                            physics: _vPhysics,
                            scrollDirection: Axis.vertical,
                            child: buildBR(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );

          // 外圈圆角边框
          return ClipRRect(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            child: Stack(
              children: [
                core,
                Positioned.fill(
                  child: IgnorePointer(
                    child: CustomPaint(
                      foregroundPainter: _OuterBorderPainter(
                        radius: widget.borderRadius,
                        width: widget.borderWidth,
                        color: widget.borderColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// =============================== 外边框 Painter ===============================
class _OuterBorderPainter extends CustomPainter {
  _OuterBorderPainter({
    required this.radius,
    required this.width,
    required this.color,
  });
  final double radius;
  final double width;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final rrect =
        RRect.fromRectAndRadius(Offset.zero & size, Radius.circular(radius));
    final p = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width
      ..color = color;
    canvas.drawRRect(rrect.deflate(width / 2), p);
  }

  @override
  bool shouldRepaint(_OuterBorderPainter old) =>
      old.radius != radius || old.width != width || old.color != color;
}

// =============================== 默认样式常量 ===============================
const TableSectionStyle _kHeaderX = TableSectionStyle(
  bgColor: Color(0xFF00C2C7),
  textColor: Colors.white,
  fontSize: 15,
  fontWeight: FontWeight.w700,
  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
);

const TableSectionStyle _kHeaderY = TableSectionStyle(
  bgColor: Color(0xFFF6F7F9),
  textColor: Colors.black87,
  fontSize: 14,
  fontWeight: FontWeight.w600,
  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
);

const TableSectionStyle _kCell = TableSectionStyle(
  bgColor: Colors.white,
  textColor: Colors.black87,
  fontSize: 14,
  fontWeight: FontWeight.w400,
  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
);

// =============================== 三种 Builder（完整透传） ===============================

/// 模式 1：首列与其它列一起等宽分配
Widget JobsExcelBuildByMode1({
  // 必传
  required List<String> horizontalTitles,
  required List<String> verticalTitles,
  required List<List<String>> rowsData,

  // 尺寸
  List<double>? rowHeights, // 含表头
  List<double?>? columnWidths, // 含首列；>0=固定；等分一般不传
  double minColWidth = 56,
  double? maxColWidth, // 等分场景下一般不用
  bool expandToMaxWidth = true,
  int? fillColumn,
  bool respectFixedOnExpand = true,

  // 列展示策略（仅未固定列生效；数量=数据列数）
  List<CellLayout>? columnModes,
  int wrapMaxLines = 2,

  // 文本/占位
  String placeholder = "🈚️",

  // 视觉
  double borderWidth = 1,
  Color borderColor = const Color(0xFFE5E6EB),
  double borderRadius = 10,
  TableSectionStyle headerXStyle = _kHeaderX,
  TableSectionStyle headerYStyle = _kHeaderY,
  TableSectionStyle cellStyle = _kCell,

  // 新增（手势）
  bool disableInternalVerticalScroll = false,
  bool disableInternalHorizontalScroll = false,
  bool relayGestureToParentWhenAtEdge = true,
}) {
  return JobsExcel(
    horizontalTitles: horizontalTitles,
    verticalTitles: verticalTitles,
    rowsData: rowsData,
    rowHeights: rowHeights?.map((e) => e).toList(),
    columnWidths: columnWidths,
    firstColumnMode: FirstColumnMode.includeInEqualSplit,
    firstColumnFixedWidth: null,
    minColWidth: minColWidth,
    maxColWidth: maxColWidth,
    expandToMaxWidth: expandToMaxWidth,
    fillColumn: fillColumn,
    respectFixedOnExpand: respectFixedOnExpand,
    columnModes: columnModes,
    wrapMaxLines: wrapMaxLines,
    placeholder: placeholder,
    borderWidth: borderWidth,
    borderColor: borderColor,
    borderRadius: borderRadius,
    headerXStyle: headerXStyle,
    headerYStyle: headerYStyle,
    cellStyle: cellStyle,
    disableInternalVerticalScroll: disableInternalVerticalScroll,
    disableInternalHorizontalScroll: disableInternalHorizontalScroll,
    relayGestureToParentWhenAtEdge: relayGestureToParentWhenAtEdge,
  );
}

/// 模式 2：首列固定，其余按内容/约束自适应
Widget JobsExcelBuildByMode2({
  // 必传
  required List<String> horizontalTitles,
  required List<String> verticalTitles,
  required List<List<String>> rowsData,

  // 尺寸
  List<double>? rowHeights,
  List<double?>? columnWidths, // 允许和固定宽混用
  double firstColumnFixedWidth = 140,
  double minColWidth = 56,
  double? maxColWidth = 200,
  bool expandToMaxWidth = true,
  int? fillColumn,
  bool respectFixedOnExpand = true,

  // 列展示策略
  List<CellLayout>? columnModes,
  int wrapMaxLines = 2,

  // 文本/占位
  String placeholder = "🈚️",

  // 视觉
  double borderWidth = 1,
  Color borderColor = const Color(0xFFE5E6EB),
  double borderRadius = 10,
  TableSectionStyle headerXStyle = _kHeaderX,
  TableSectionStyle headerYStyle = _kHeaderY,
  TableSectionStyle cellStyle = _kCell,

  // 新增（手势）
  bool disableInternalVerticalScroll = false,
  bool disableInternalHorizontalScroll = false,
  bool relayGestureToParentWhenAtEdge = true,
}) {
  return JobsExcel(
    horizontalTitles: horizontalTitles,
    verticalTitles: verticalTitles,
    rowsData: rowsData,
    rowHeights: rowHeights?.map((e) => e).toList(),
    columnWidths: columnWidths,
    firstColumnMode: FirstColumnMode.fixedAndExclude,
    firstColumnFixedWidth: firstColumnFixedWidth,
    minColWidth: minColWidth,
    maxColWidth: maxColWidth,
    expandToMaxWidth: expandToMaxWidth,
    fillColumn: fillColumn,
    respectFixedOnExpand: respectFixedOnExpand,
    columnModes: columnModes,
    wrapMaxLines: wrapMaxLines,
    placeholder: placeholder,
    borderWidth: borderWidth,
    borderColor: borderColor,
    borderRadius: borderRadius,
    headerXStyle: headerXStyle,
    headerYStyle: headerYStyle,
    cellStyle: cellStyle,
    disableInternalVerticalScroll: disableInternalVerticalScroll,
    disableInternalHorizontalScroll: disableInternalHorizontalScroll,
    relayGestureToParentWhenAtEdge: relayGestureToParentWhenAtEdge,
  );
}

/// 模式 3：首列固定，其余等宽均分
Widget JobsExcelBuildByMode3({
  // 必传
  required List<String> horizontalTitles,
  required List<String> verticalTitles,
  required List<List<String>> rowsData,

  // 尺寸
  List<double>? rowHeights,
  List<double?>? columnWidths, // 可传但通常不必；其余列等分
  double firstColumnFixedWidth = 140,
  double minColWidth = 56,
  double? maxColWidth, // 等分场景通常 null
  bool expandToMaxWidth = true,
  int? fillColumn,
  bool respectFixedOnExpand = true,

  // 列展示策略
  List<CellLayout>? columnModes,
  int wrapMaxLines = 2,

  // 文本/占位
  String placeholder = "🈚️",

  // 视觉
  double borderWidth = 1,
  Color borderColor = const Color(0xFFE5E6EB),
  double borderRadius = 10,
  TableSectionStyle headerXStyle = _kHeaderX,
  TableSectionStyle headerYStyle = _kHeaderY,
  TableSectionStyle cellStyle = _kCell,

  // 新增（手势）
  bool disableInternalVerticalScroll = false,
  bool disableInternalHorizontalScroll = false,
  bool relayGestureToParentWhenAtEdge = true,
}) {
  return JobsExcel(
    horizontalTitles: horizontalTitles,
    verticalTitles: verticalTitles,
    rowsData: rowsData,
    rowHeights: rowHeights?.map((e) => e).toList(),
    columnWidths: columnWidths,
    firstColumnMode: FirstColumnMode.fixedAndExclude,
    firstColumnFixedWidth: firstColumnFixedWidth,
    minColWidth: minColWidth,
    maxColWidth: maxColWidth,
    expandToMaxWidth: expandToMaxWidth,
    fillColumn: fillColumn,
    respectFixedOnExpand: respectFixedOnExpand,
    columnModes: columnModes,
    wrapMaxLines: wrapMaxLines,
    placeholder: placeholder,
    borderWidth: borderWidth,
    borderColor: borderColor,
    borderRadius: borderRadius,
    headerXStyle: headerXStyle,
    headerYStyle: headerYStyle,
    cellStyle: cellStyle,
    disableInternalVerticalScroll: disableInternalVerticalScroll,
    disableInternalHorizontalScroll: disableInternalHorizontalScroll,
    relayGestureToParentWhenAtEdge: relayGestureToParentWhenAtEdge,
  );
}
