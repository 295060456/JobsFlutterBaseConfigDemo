import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 使用说明：
///
/// 1. 数据输入
///    - 中间表体部分仅需写入有效数据。
///    - 无效数据可用占位符（默认 "🈚️"，可自定义）替代。
///    - 如果数据列数超过表头列数，会以表头为基准进行截断显示。
///
/// 2. 表头显示
///    - 表头内容默认始终完整显示，不会被截断。
///    - 数据列可通过 `columnModes` 设置显示策略：
///      2.1 省略号显示：CellLayout.ellipsis（默认：多余部分用“...”）
///      2.2 缩小字体：CellLayout.shrink（字体缩小以适配单元格）
///      2.3 最长内容定宽：CellLayout.fitToLongest（整列宽度以最长内容撑开）
///      2.4 自动换行：CellLayout.wrap（内容过长时换行显示）
///
/// 3. 尺寸管理
///    - 列宽：通过 `columnWidths` 数组控制（含首列 + 所有数据列）。
///      · >0：固定宽度
///      · <=0 或 null：按 columnModes 或默认逻辑计算
///      · 未传 columnWidths：右侧数据列均分父容器剩余宽度
///
///    - 行高：通过 `rowHeights` 数组控制（含表头行 + 所有数据行）。
///      · >0：固定高度
///      · <=0 或 null：使用默认逻辑
///      · 未传 rowHeights：所有行（含表头）均分父容器剩余高度
///
///    - 首列模式（rowHeaderMode）：
///      · mode1：首列参与均分，宽度由均分逻辑决定
///      · mode2：首列单独固定（外部传入固定值或默认值），其余列再均分
///
/// 4. 冻结规则
///    - 表格超出屏幕高度时，默认冻结第一行（表头），可上下滑动。
///    - 表格超出屏幕宽度时，默认冻结第一列，可左右滑动。
///
/// 5. 滚动行为
///    - 横向滚动：冻结首列，剩余部分左右滑动。
///    - 纵向滚动：冻结首行，剩余部分上下滑动。

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
        title: 'JobsExcel',
        builder: (context, child) => ScrollConfiguration(
          behavior: const _NoBounceNoGlow(),
          child: child!,
        ),
        home: Scaffold(
          appBar: AppBar(title: const Text('JobsExcel@Model1')),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: JobsExcelBuildByMode1(
                horizontalTitles: horizontal,
                verticalTitles: vertical,
                rowsData: data,

                // 行高（含表头）
                rowHeights: const [
                  44, // 表头
                  48, // 第1行
                  48, // 第2行
                  48, // 第3行
                  48, // 第4行
                ],

                // 其他行为
                placeholder: "🈚️",
                columnModes: const [
                  CellLayout.fitToLongest, // 均分下只影响展示，不影响列宽
                  CellLayout.ellipsis,
                  CellLayout.wrap,
                  CellLayout.shrink,
                ],
                wrapMaxLines: 2,

                // 均分模式下这俩不会生效（留着也无碍）
                // minColWidth / maxColWidth 只在“非均分且未固定列”生效
                // 不需要 fillColumn（等分本就吃满）
                expandToMaxWidth: true,

                // 视觉
                borderWidth: 1,
                borderColor: const Color(0xFFE5E6EB),
                borderRadius: 10,

                headerXStyle: const TableSectionStyle(
                  bgColor: Color(0xFF00C2C7),
                  textColor: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                ),
                headerYStyle: const TableSectionStyle(
                  bgColor: Color(0xFFF6F7F9),
                  textColor: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                cellStyle: const TableSectionStyle(
                  bgColor: Colors.white,
                  textColor: Colors.black87,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                ),
              ),
            ),
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
        title: 'JobsExcel',
        builder: (context, child) => ScrollConfiguration(
          behavior: const _NoBounceNoGlow(),
          child: child!,
        ),
        home: Scaffold(
          appBar: AppBar(title: const Text('JobsExcel@Model2')),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: JobsExcelBuildByMode2(
                horizontalTitles: horizontal,
                verticalTitles: vertical,
                rowsData: data,

                // 行高（含表头）
                rowHeights: const [
                  44, // 表头
                  48, // 第1行
                  48, // 第2行
                  48, // 第3行
                  48, // 第4行
                ],

                // —— 模式2：首列固定，其他列按内容/约束自适应 ——
                firstColumnFixedWidth: 100,

                // 其他行为
                placeholder: "🈚️",
                columnModes: const [
                  CellLayout.fitToLongest, // 非均分时有效
                  CellLayout.ellipsis,
                  CellLayout.wrap,
                  CellLayout.shrink,
                ],
                wrapMaxLines: 2,

                // 非均分 → min/max 生效
                minColWidth: 56,
                maxColWidth: 200,

                expandToMaxWidth: true, // 不够宽时扩展未固定列
                respectFixedOnExpand: true, // 固定列不被拉伸

                // 视觉
                borderWidth: 1,
                borderColor: const Color(0xFFE5E6EB),
                borderRadius: 10,

                headerXStyle: const TableSectionStyle(
                  bgColor: Color(0xFF00C2C7),
                  textColor: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                ),
                headerYStyle: const TableSectionStyle(
                  bgColor: Color(0xFFF6F7F9),
                  textColor: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                cellStyle: const TableSectionStyle(
                  bgColor: Colors.white,
                  textColor: Colors.black87,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                ),
              ),
            ),
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
        title: 'JobsExcel',
        builder: (context, child) => ScrollConfiguration(
          behavior: const _NoBounceNoGlow(),
          child: child!,
        ),
        home: Scaffold(
          appBar: AppBar(title: const Text('JobsExcel@Model3')),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: JobsExcelBuildByMode3(
                horizontalTitles: horizontal,
                verticalTitles: vertical,
                rowsData: data,

                // 行高（含表头）
                rowHeights: const [44, 48, 48, 48, 48],

                // —— 模式3：首列固定 + 其余列等宽均分 ——
                firstColumnFixedWidth: 100,
                // 若你的 JobsExcel 未内置“等分剩余列”，打开兜底：
                // forceEqualSplitWithLayoutBuilder: true,

                // 其他展示/约束
                placeholder: "🈚️",
                columnModes: const [
                  CellLayout.fitToLongest,
                  CellLayout.ellipsis,
                  CellLayout.wrap,
                  CellLayout.shrink,
                ],
                wrapMaxLines: 2,
                minColWidth: 56,
                maxColWidth: 200,

                expandToMaxWidth: true,

                // 视觉
                borderWidth: 1,
                borderColor: const Color(0xFFE5E6EB),
                borderRadius: 10,
                headerXStyle: const TableSectionStyle(
                  bgColor: Color(0xFF00C2C7),
                  textColor: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                ),
                headerYStyle: const TableSectionStyle(
                  bgColor: Color(0xFFF6F7F9),
                  textColor: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                ),
                cellStyle: const TableSectionStyle(
                  bgColor: Colors.white,
                  textColor: Colors.black87,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

/// 去掉回弹/发光
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

/// 样式模型
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

/// 单元格显示策略（当该列没有指定固定宽时生效）
enum CellLayout { shrink, ellipsis, fitToLongest, wrap }

/// 首列宽度策略
enum FirstColumnMode {
  includeInEqualSplit, // 模式1：首列参与等分
  fixedAndExclude, // 模式2：首列固定并排除等分
}

/// 冻结首列 + 行高/列宽数组化 + 首列两种模式
class JobsExcel extends StatefulWidget {
  final List<String> horizontalTitles; // [0] = 左上角标题
  final List<String> verticalTitles; // 行头（不含表头）
  final List<List<String>> rowsData; // 每行长度 = horizontal.length - 1

  /// 列宽数组（含首列）。>0=固定；≤0/null=自动/等分
  /// 建议长度 == horizontalTitles.length；不足视为未指定
  final List<double?>? columnWidths;

  /// 行高数组（含表头）。>0=固定；≤0/null：
  ///   - 父容器有高度约束：等分（总高-表头）
  ///   - 无约束：用内在行高（字体+padding）
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
  }) : assert(horizontalTitles.length >= 1);

  @override
  State<JobsExcel> createState() => _JobsExcelState();
}

class _JobsExcelState extends State<JobsExcel> {
  final _vLeft = ScrollController();
  final _vRight = ScrollController();
  final _hRight = ScrollController();
  bool _syncing = false;

  // 常量：默认表头高 / 默认首列宽 / 最小内在行高
  static const double _kDefaultHeaderHeight = 44;
  static const double _kDefaultRowHeaderWidth = 95;
  static const double _kMinIntrinsicRowHeight = 28;

  @override
  void initState() {
    super.initState();
    _vLeft.addListener(_syncFromLeft);
    _vRight.addListener(_syncFromRight);
  }

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

  @override
  void dispose() {
    _vLeft.removeListener(_syncFromLeft);
    _vRight.removeListener(_syncFromRight);
    _vLeft.dispose();
    _vRight.dispose();
    _hRight.dispose();
    super.dispose();
  }

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

    // 情况B：传了 columnWidths → 固定优先，其余走策略
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
      final fixed = _tryGetColumnWidth(c + 1); // 注意：数据列索引+1
      if (fixed != null) {
        map[c] = FixedColumnWidth(fixed);
        continue;
      }

      // 自动：按 columnModes
      final mode = modes[c];

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

    return LayoutBuilder(
      builder: (context, constraints) {
        final headerHeight = _resolveHeaderHeight();

        // 高度约束（用于“等分行高”）
        final bool bounded = constraints.maxHeight.isFinite;
        // 注意：等分的是“数据区”高度
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
        // 1) 有 columnWidths 并且 [0] > 0：优先生效
        final fixedLeft = _tryGetColumnWidth(0);
        if (fixedLeft != null) {
          leftWidth = fixedLeft;
        } else {
          // 2) 没有指定 columnWidths[0]：看首列策略
          if (widget.columnWidths == null) {
            // 未提供 columnWidths → 等分模式下，首列是否参与等分
            if (widget.firstColumnMode == FirstColumnMode.includeInEqualSplit) {
              // 首列参与等分：先用总宽估一个 per；真实 per 稍后按右侧等分也会一致
              final seam = bw; // 左右中缝
              final per =
                  _px((constraints.maxWidth - seam) / math.max(1, cols));
              leftWidth = per;
            } else {
              // 首列固定并排除等分
              leftWidth =
                  _px(widget.firstColumnFixedWidth ?? _kDefaultRowHeaderWidth);
            }
          } else {
            // 提供了 columnWidths，但首列没有值 → 用默认固定 95
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
          // 等分场景下：如果首列参与等分，此 availableForRight 会变成
          // per * (cols-1)，而 per 和左侧的保持一致；如果是排除等分，则等分仅发生在数据列
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

        // ===== 铺满：把富余宽度分配给某一数据列（一般不会触发：等分本身已占满） =====
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
        final viewportBodyHeight =
            _px((availableHeight - headerSlotHeight).clamp(0, double.infinity));
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
                      physics: const ClampingScrollPhysics(),
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
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: headerSlotHeight, child: buildTR()),
                      SizedBox(
                        height: viewportBodyHeight,
                        child: SingleChildScrollView(
                          controller: _vRight,
                          physics: const ClampingScrollPhysics(),
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
    );
  }
}

/// 顶层外边框（在子组件之上绘制，避免被覆盖）
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

/// 公共默认样式
const _kBorderColor = Color(0xFFE5E6EB);

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

/// 模式 1：首列与其它列一起等宽分配；不需要 fixedWidth
Widget JobsExcelBuildByMode1({
  required List<String> horizontalTitles,
  required List<String> verticalTitles,
  required List<List<String>> rowsData,

  // 行高数组（含表头行）
  List<double>? rowHeights,

  // 列布局策略（对照 horizontalTitles 数量）
  List<CellLayout>? columnModes,

  // 包装/自适应
  bool expandToMaxWidth = true,
  int wrapMaxLines = 2,

  // 视觉
  double borderWidth = 1,
  Color borderColor = _kBorderColor,
  double borderRadius = 10,

  // 样式（可覆盖默认）
  TableSectionStyle headerXStyle = _kHeaderX,
  TableSectionStyle headerYStyle = _kHeaderY,
  TableSectionStyle cellStyle = _kCell,

  // 占位
  String placeholder = "🈚️",
}) {
  return JobsExcel(
    horizontalTitles: horizontalTitles,
    verticalTitles: verticalTitles,
    rowsData: rowsData,
    placeholder: placeholder,

    rowHeights: rowHeights,
    // ✅ 关键：首列参与均分
    firstColumnMode: FirstColumnMode.includeInEqualSplit,

    // 均分场景下，min/maxColWidth 仅对“非均分列”有意义——这里不会生效
    minColWidth: 56,
    maxColWidth: null,

    // 展开到最大宽度（均分通常就填满了）
    expandToMaxWidth: expandToMaxWidth,
    fillColumn: null,
    respectFixedOnExpand: true,

    // 列布局策略（长度 <= 列数，不传则全部默认）
    columnModes: columnModes ??
        const [
          CellLayout.fitToLongest,
          CellLayout.ellipsis,
          CellLayout.wrap,
          CellLayout.shrink,
        ],
    wrapMaxLines: wrapMaxLines,

    // 视觉
    borderWidth: borderWidth,
    borderColor: borderColor,
    borderRadius: borderRadius,

    headerXStyle: headerXStyle,
    headerYStyle: headerYStyle,
    cellStyle: cellStyle,
  );
}

/// 模式 2：首列固定宽度，其余列按内容/约束自适应（支持 min/maxColWidth）
/// - 更适合“行标题很长 / 需要稳定对齐”的表
Widget JobsExcelBuildByMode2({
  required List<String> horizontalTitles,
  required List<String> verticalTitles,
  required List<List<String>> rowsData,

  // 行高数组（含表头行）
  List<double>? rowHeights,

  // 首列宽
  double firstColumnFixedWidth = 140,

  // 列布局策略
  List<CellLayout>? columnModes,

  // 包装/自适应
  bool expandToMaxWidth = true,
  bool respectFixedOnExpand = true,
  int wrapMaxLines = 2,
  double minColWidth = 56,
  double? maxColWidth = 200,

  // 视觉
  double borderWidth = 1,
  Color borderColor = _kBorderColor,
  double borderRadius = 10,

  // 样式（可覆盖默认）
  TableSectionStyle headerXStyle = _kHeaderX,
  TableSectionStyle headerYStyle = _kHeaderY,
  TableSectionStyle cellStyle = _kCell,

  // 占位
  String placeholder = "🈚️",
}) {
  return JobsExcel(
    horizontalTitles: horizontalTitles,
    verticalTitles: verticalTitles,
    rowsData: rowsData,
    placeholder: placeholder,

    rowHeights: rowHeights,

    // ✅ 关键：首列固定
    firstColumnMode: FirstColumnMode.fixedAndExclude,
    firstColumnFixedWidth: firstColumnFixedWidth,

    // 非均分时这些会生效
    minColWidth: minColWidth,
    maxColWidth: maxColWidth,

    expandToMaxWidth: expandToMaxWidth,
    fillColumn: null,
    respectFixedOnExpand: respectFixedOnExpand,

    columnModes: columnModes ??
        const [
          CellLayout.fitToLongest,
          CellLayout.ellipsis,
          CellLayout.wrap,
          CellLayout.shrink,
        ],
    wrapMaxLines: wrapMaxLines,

    // 视觉
    borderWidth: borderWidth,
    borderColor: borderColor,
    borderRadius: borderRadius,

    headerXStyle: headerXStyle,
    headerYStyle: headerYStyle,
    cellStyle: cellStyle,
  );
}

/// 模式 3：首列固定宽度，其余列等宽均分
Widget JobsExcelBuildByMode3({
  required List<String> horizontalTitles,
  required List<String> verticalTitles,
  required List<List<String>> rowsData,
  List<double>? rowHeights,
  double firstColumnFixedWidth = 140,

  // 若你的 JobsExcel 需要显式开关，则传 true；若已内置该策略可忽略。
  bool equalSplitRest = true,

  // 其余通用项
  List<CellLayout>? columnModes,
  bool expandToMaxWidth = true,
  int wrapMaxLines = 2,
  double minColWidth = 56,
  double? maxColWidth = 220,
  double borderWidth = 1,
  Color borderColor = const Color(0xFFE5E6EB),
  double borderRadius = 10,
  TableSectionStyle headerXStyle = const TableSectionStyle(
    bgColor: Color(0xFF00C2C7),
    textColor: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
  ),
  TableSectionStyle headerYStyle = const TableSectionStyle(
    bgColor: Color(0xFFF6F7F9),
    textColor: Colors.black87,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
  ),
  TableSectionStyle cellStyle = const TableSectionStyle(
    bgColor: Colors.white,
    textColor: Colors.black87,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
  ),
  String placeholder = "🈚️",
}) {
  return JobsExcel(
    horizontalTitles: horizontalTitles,
    verticalTitles: verticalTitles,
    rowsData: rowsData,
    placeholder: placeholder,
    rowHeights: rowHeights,

    // 关键：首列固定
    firstColumnMode: FirstColumnMode.fixedAndExclude,
    firstColumnFixedWidth: firstColumnFixedWidth,

    // 非均分参数仍保留（库内按需使用）
    minColWidth: minColWidth,
    maxColWidth: maxColWidth,

    // 展开铺满；其余列在库内“走等宽均分”策略
    expandToMaxWidth: expandToMaxWidth,
    respectFixedOnExpand: true,

    columnModes: columnModes ??
        const [
          CellLayout.fitToLongest,
          CellLayout.ellipsis,
          CellLayout.wrap,
          CellLayout.shrink,
        ],
    wrapMaxLines: wrapMaxLines,

    borderWidth: borderWidth,
    borderColor: borderColor,
    borderRadius: borderRadius,
    headerXStyle: headerXStyle,
    headerYStyle: headerYStyle,
    cellStyle: cellStyle,
  );
}
