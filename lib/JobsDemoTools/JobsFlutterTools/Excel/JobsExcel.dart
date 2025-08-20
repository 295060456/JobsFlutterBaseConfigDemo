import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * 使用说明：
 *
 * 1. 数据输入
 *    - 中间表体部分仅需写入有效数据。
 *    - 无效数据可用占位符（默认 "🈚️"，可自定义）替代。
 *    - 如果数据列数超过表头列数，会以表头为基准进行截断显示。
 *
 * 2. 表头显示
 *    - 表头内容默认始终完整显示，不会被截断。
 *    - 数据列可通过 `columnModes` 设置显示策略：
 *      2.1 省略号显示：CellLayout.ellipsis（默认，多余部分用“...”）
 *      2.2 缩小字体：CellLayout.shrink（字体缩小以适配单元格）
 *      2.3 最长内容定宽：CellLayout.fitToLongest（整列宽度以最长内容撑开）
 *      2.4 自动换行：CellLayout.wrap（内容过长时换行显示）
 *
 * 3. 冻结规则
 *    - 表格超出屏幕高度时，默认冻结第一行（表头），可上下滑动。
 *    - 表格超出屏幕宽度时，默认冻结第一列，可左右滑动。
 *
 * 4. 滚动行为
 *    - 横向滚动：冻结首列，剩余部分左右滑动。
 *    - 纵向滚动：冻结首行，剩余部分上下滑动。
 */

void main() {
  final horizontal = ['回归首存金额', '回归首存返利', '流水倍数', '备注1', '备注2'];
  final vertical = [
    '≥1元',
    '≥2元',
    '≥3元',
    '≥4元',
    '≥5元',
    '≥6元',
    '≥7元',
    '≥8元',
    '≥9元',
    '≥10元',
    '≥11元',
    '≥12元',
    '≥13元',
    '≥14元',
    '≥15元',
    '≥16元',
    '≥17元',
    '≥18元',
    '≥19元',
    '≥20元',
    '≥21元',
    '≥22元'
  ];
  final data = [
    ['28元', '1', '很长很长的说明文字会在这里进行自动换行展示（示例）', '—'],
    ['88元', '1', '短', '—'],
    ['188元', '1', '这行也可能比较长，需要两行展示', '—'],
    ['388元', '1', '—', '—'],
  ];

  runApp(
    ScreenUtilInit(
      designSize: const Size(1125, 2436),
      minTextAdapt: true,
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Excel',
        builder: (context, child) {
          // 全局取消回弹与发光（也可只在局部 ScrollView 上设置 physics）
          return ScrollConfiguration(
            behavior: const _NoBounceNoGlow(),
            child: child!,
          );
        },
        home: Scaffold(
          appBar: AppBar(title: const Text('JobsExcel')),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: JobsExcel(
                horizontalTitles: horizontal,
                verticalTitles: vertical,
                rowsData: data,
                placeholder: "🈚️",
                // 对应 horizontal: [回归首存金额, 回归首存返利, 流水倍数, 备注1, 备注2] -> 配置 4 项
                columnModes: const [
                  CellLayout.fitToLongest, // 回归首存返利：整个列以最长内容为标准定宽撑开
                  CellLayout.ellipsis, // 流水倍数：正常显示（多余用...）
                  CellLayout.wrap, // 备注1：换行显示（受 wrapMaxLines 和 rowHeight 影响）
                  CellLayout.shrink, // 备注2：缩小字体显示
                ],
                wrapMaxLines: 2, // wrap 模式最多显示的行数（默认 2）
                // 尺寸
                rowHeaderWidth: 140,
                headerHeight: 44,
                rowHeight: 48, // 如果要更多换行可适当增大
                borderWidth: 1,
                borderColor: const Color(0xFFE5E6EB),
                // 样式
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
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                ),
                cellStyle: const TableSectionStyle(
                  bgColor: Colors.white,
                  textColor: Colors.black87,
                  fontSize: 14,
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

/// 关闭回弹/发光
class _NoBounceNoGlow extends ScrollBehavior {
  const _NoBounceNoGlow();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      const ClampingScrollPhysics();
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

/// ================================== 样式模型 ==================================
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

/// 单元格显示策略
enum CellLayout {
  /// 表体文本自动缩小以适配列宽
  shrink,

  /// 表体文本正常字号，溢出省略号
  ellipsis,

  /// 列宽 = max(表头宽, 各行该列文本宽)；会拉宽整列（含表头）
  fitToLongest,

  /// 在固定行高内换行显示到 wrapMaxLines，超出以省略号结尾
  wrap,
}

/// ================================== 冻结首列（列宽以表头为准 + 四种表体风格） ==================================
class JobsExcel extends StatefulWidget {
  final List<String> horizontalTitles; // [0] = 左上角标题
  final List<String> verticalTitles; // 左列行头
  final List<List<String>> rowsData; // 每行长度 = horizontal.length - 1

  final List<CellLayout>? columnModes; // 长度 = dataCols；不传则全列 ellipsis
  final int wrapMaxLines; // wrap 模式最多行数

  final TableSectionStyle headerXStyle;
  final TableSectionStyle headerYStyle;
  final TableSectionStyle cellStyle;

  final Color borderColor;
  final double borderWidth;

  final String placeholder; // 无数据时的占位符号
  final double rowHeaderWidth; // 左列固定宽
  final double headerHeight; // 顶部行高(不含边框)
  final double rowHeight; // 数据行高(不含行内分隔线)

  // 可选：列宽上下限（应对极端长文本）
  final double minColWidth;
  final double? maxColWidth;

  const JobsExcel({
    super.key,
    required this.horizontalTitles,
    required this.verticalTitles,
    required this.rowsData,
    this.columnModes,
    this.wrapMaxLines = 2,
    this.headerXStyle = const TableSectionStyle(),
    this.headerYStyle = const TableSectionStyle(),
    this.cellStyle = const TableSectionStyle(),
    this.borderColor = const Color(0xFFE5E6EB),
    this.borderWidth = 1,
    this.placeholder = '-',
    this.rowHeaderWidth = 120,
    this.headerHeight = 44,
    this.rowHeight = 44,
    this.minColWidth = 56,
    this.maxColWidth,
  }) : assert(horizontalTitles.length >= 1);

  @override
  State<JobsExcel> createState() =>
      _JobsExcelState();
}

class _JobsExcelState
    extends State<JobsExcel> {
  final _vLeft = ScrollController();
  final _vRight = ScrollController();
  final _hRight = ScrollController();
  bool _syncing = false;

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

  Map<int, TableColumnWidth> _computeRightColumnWidths(
    List<List<String>> normalizedRows,
    List<CellLayout> modes,
  ) {
    final cols = widget.horizontalTitles.length;
    final dataCols = cols - 1;

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
      final mode = modes[c];
      // 先保证“表头必须完整显示”
      double wHeader = _textWidth(widget.horizontalTitles[c + 1], headerStyle) +
          headerPad.left +
          headerPad.right;

      double w = wHeader; // 默认以表头为准
      if (mode == CellLayout.fitToLongest) {
        // 按最长内容决定列宽（含表头）
        for (final row in normalizedRows) {
          final t = (c < row.length) ? row[c] : widget.placeholder;
          final wCell = _textWidth(t, cellStyle) + cellPad.left + cellPad.right;
          if (wCell > w) w = wCell;
        }
      }
      // 限制范围 + 像素对齐
      w = _px(w);
      if (w < widget.minColWidth) w = widget.minColWidth;
      if (widget.maxColWidth != null && w > widget.maxColWidth!) {
        w = widget.maxColWidth!;
      }
      map[c] = FixedColumnWidth(w);
    }
    return map;
  }

  // 表头 cell：强制完整显示（不省略不缩小，列宽已经保证够大）
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

  // 表体 cell：按列的 CellLayout 渲染
  Widget _bodyCell(String text, TableSectionStyle style, CellLayout mode,
      {double? width, required double height}) {
    Widget child = Text(
      text,
      maxLines: mode == CellLayout.wrap ? widget.wrapMaxLines : 1,
      softWrap: mode == CellLayout.wrap,
      overflow: mode == CellLayout.ellipsis
          ? TextOverflow.ellipsis
          : (mode == CellLayout.wrap
              ? TextOverflow.ellipsis
              : TextOverflow.visible),
      textAlign: TextAlign.center,
      style: TextStyle(
        color: style.textColor,
        fontSize: style.fontSize,
        fontWeight: style.fontWeight,
        height: 1.2,
      ),
    );

    if (mode == CellLayout.shrink) {
      // 自动缩小到容器内（单行）
      child = FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        child: child,
      );
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

  @override
  Widget build(BuildContext context) {
    final rows = widget.verticalTitles.length;
    final cols = widget.horizontalTitles.length;
    final dataCols = cols - 1;
    final bw = widget.borderWidth;

    final normalized = List.generate(
      rows,
      (r) => _fitRow(
        r < widget.rowsData.length ? widget.rowsData[r] : const [],
        dataCols,
      ),
    );

    final modes = List<CellLayout>.generate(
      dataCols,
      (i) => widget.columnModes != null && i < widget.columnModes!.length
          ? widget.columnModes![i]
          : CellLayout.ellipsis,
    );

    // 注意：表头真实占位高度 = headerHeight（边框画在内部）
    final headerSlotHeight = _px(widget.headerHeight);
    // 所有数据的“理论总高”（用于计算最大可滚动高度）
    final fullBodyContentHeight = _px(rows * (widget.rowHeight + bw));

    // 右侧列宽（表头优先，必要时按最长内容）
    final rightColWidths = _computeRightColumnWidths(normalized, modes);

    // ── TL
    Widget buildTL() => Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: widget.borderColor, width: bw),
              left: BorderSide(color: widget.borderColor, width: bw),
              bottom: BorderSide(color: widget.borderColor, width: bw),
            ),
          ),
          child: _headerCell(
            widget.horizontalTitles[0],
            widget.headerXStyle,
            width: widget.rowHeaderWidth,
            height: widget.headerHeight,
          ),
        );

    // ── TR
    Table buildTR() => Table(
          border: TableBorder(
            top: BorderSide(color: widget.borderColor, width: bw),
            right: BorderSide(color: widget.borderColor, width: bw),
            bottom: BorderSide(color: widget.borderColor, width: bw),
            horizontalInside:
                const BorderSide(color: Colors.transparent, width: 0),
            verticalInside: BorderSide(color: widget.borderColor, width: bw),
          ),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: rightColWidths,
          children: [
            TableRow(
              children: [
                for (int c = 1; c < cols; c++)
                  _headerCell(widget.horizontalTitles[c], widget.headerXStyle,
                      height: widget.headerHeight),
              ],
            ),
          ],
        );

    // ── BR（右侧表体）
    Table buildBR() => Table(
          border: TableBorder(
            right: BorderSide(color: widget.borderColor, width: bw),
            bottom: BorderSide(color: widget.borderColor, width: bw),
            horizontalInside: BorderSide(color: widget.borderColor, width: bw),
            verticalInside: BorderSide(color: widget.borderColor, width: bw),
          ),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: rightColWidths,
          children: [
            for (int r = 0; r < rows; r++)
              TableRow(
                children: [
                  for (int c = 0; c < dataCols; c++)
                    _bodyCell(normalized[r][c], widget.cellStyle, modes[c],
                        height: widget.rowHeight),
                ],
              ),
          ],
        );

    // ── BL（左侧表体）
    Table buildBLTable() => Table(
          border: TableBorder(
            left: BorderSide(color: widget.borderColor, width: bw),
            right: BorderSide(color: widget.borderColor, width: bw),
            bottom: BorderSide(color: widget.borderColor, width: bw),
            horizontalInside: BorderSide(color: widget.borderColor, width: bw),
            verticalInside:
                const BorderSide(color: Colors.transparent, width: 0),
          ),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          columnWidths: const {0: IntrinsicColumnWidth()},
          children: [
            for (int r = 0; r < rows; r++)
              TableRow(
                children: [
                  _bodyCell(
                    widget.verticalTitles[r],
                    widget.headerYStyle,
                    CellLayout.ellipsis,
                    width: widget.rowHeaderWidth,
                    height: widget.rowHeight,
                  ),
                ],
              ),
          ],
        );

    // ====== 关键：用 LayoutBuilder 取可用高度，计算“表体视口高度”并让左右一起滚 ======
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableHeight = constraints.maxHeight.isFinite
            ? constraints.maxHeight
            : fullBodyContentHeight + headerSlotHeight; // 兜底
        // 可用给“表体”滚动的视口高度
        final viewportBodyHeight = _px(
          (availableHeight - headerSlotHeight).clamp(0, fullBodyContentHeight),
        );
        // 整个组件的最终高度（表头 + 表体视口）
        final totalHeight = _px(headerSlotHeight + viewportBodyHeight);

        return SizedBox(
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
                    width: widget.rowHeaderWidth + bw,
                    child: SingleChildScrollView(
                      controller: _vLeft,
                      physics: const ClampingScrollPhysics(), // 无回弹
                      scrollDirection: Axis.vertical,
                      child: buildBLTable(),
                    ),
                  ),
                ],
              ),

              // 右列：横向滚动容器里含 TR + 可滚动 BR
              Flexible(
                child: SingleChildScrollView(
                  controller: _hRight,
                  physics: const ClampingScrollPhysics(), // 无回弹
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: headerSlotHeight, child: buildTR()),
                      SizedBox(
                        height: viewportBodyHeight,
                        child: SingleChildScrollView(
                          controller: _vRight,
                          physics: const ClampingScrollPhysics(), // 无回弹
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
      },
    );
  }
}
