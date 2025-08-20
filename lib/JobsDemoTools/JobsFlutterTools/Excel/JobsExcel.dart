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
                columnModes: const [
                  CellLayout.fitToLongest,
                  CellLayout.ellipsis,
                  CellLayout.wrap,
                  CellLayout.shrink,
                ],
                // 自适应：父更宽时把多余宽度塞到最后一列从而右侧顶齐
                expandToMaxWidth: true,
                // fillColumn: 1, // 想把多余宽度给第2列就打开

                wrapMaxLines: 2,
                // 尺寸
                rowHeaderWidth: 140,
                headerHeight: 44,
                rowHeight: 48,
                borderWidth: 1,
                borderColor: const Color(0xFFE5E6EB),
                borderRadius: 10,
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
enum CellLayout { shrink, ellipsis, fitToLongest, wrap }

/// ================================== 冻结首列（列宽以表头为准 + 四种表体风格） ==================================
class JobsExcel extends StatefulWidget {
  final List<String> horizontalTitles; // [0] = 左上角标题
  final List<String> verticalTitles; // 左列行头
  final List<List<String>> rowsData; // 每行长度 = horizontal.length - 1

  final List<CellLayout>? columnModes;
  final int wrapMaxLines;

  final TableSectionStyle headerXStyle;
  final TableSectionStyle headerYStyle;
  final TableSectionStyle cellStyle;

  final Color borderColor;
  final double borderWidth;
  final double borderRadius;

  final String placeholder;
  final double rowHeaderWidth;
  final double headerHeight;
  final double rowHeight;

  final double minColWidth;
  final double? maxColWidth;

  // 自适应铺满相关
  final bool expandToMaxWidth; // 父给更宽时是否铺满
  final int? fillColumn; // 多余宽度分配到哪一列（null=最后一列）

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
    this.borderRadius = 0,
    this.placeholder = '-',
    this.rowHeaderWidth = 120,
    this.headerHeight = 44,
    this.rowHeight = 44,
    this.minColWidth = 56,
    this.maxColWidth,
    this.expandToMaxWidth = true,
    this.fillColumn,
  }) : assert(horizontalTitles.length >= 1);

  @override
  State<JobsExcel> createState() => _JobsExcelState();
}

class _JobsExcelState extends State<JobsExcel> {
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
      if (widget.maxColWidth != null && w > widget.maxColWidth!) {
        w = widget.maxColWidth!;
      }
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

    final headerSlotHeight = _px(widget.headerHeight);

    // ✅ 修正：表体总高度
    final fullBodyContentHeight = _px(rows * widget.rowHeight);

    // 先按内容计算右侧列宽
    final rightColWidths = _computeRightColumnWidths(normalized, modes);

    // ── TL：内部缝合线：右+下
    Widget buildTL() => Container(
          decoration: BoxDecoration(
            border: Border(
              top: const BorderSide(color: Colors.transparent, width: 0),
              left: const BorderSide(color: Colors.transparent, width: 0),
              right: BorderSide(color: widget.borderColor, width: bw),
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

    // ── TR：仅下边框 + 纵向内部线
    Table buildTR() => Table(
          border: TableBorder(
            top: const BorderSide(color: Colors.transparent, width: 0),
            right: const BorderSide(color: Colors.transparent, width: 0),
            left: const BorderSide(color: Colors.transparent, width: 0),
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

    // ── BR：只画内部网格线
    Table buildBR() => Table(
          border: TableBorder(
            top: const BorderSide(color: Colors.transparent, width: 0),
            right: const BorderSide(color: Colors.transparent, width: 0),
            left: const BorderSide(color: Colors.transparent, width: 0),
            bottom: const BorderSide(color: Colors.transparent, width: 0),
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

    // ── BL：仅右边框 + 水平内部线
    Table buildBLTable() => Table(
          border: TableBorder(
            top: const BorderSide(color: Colors.transparent, width: 0),
            left: const BorderSide(color: Colors.transparent, width: 0),
            right: BorderSide(color: widget.borderColor, width: bw),
            bottom: const BorderSide(color: Colors.transparent, width: 0),
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
                  _bodyCell(widget.verticalTitles[r], widget.headerYStyle,
                      CellLayout.ellipsis,
                      width: widget.rowHeaderWidth, height: widget.rowHeight),
                ],
              ),
          ],
        );

    return LayoutBuilder(
      builder: (context, constraints) {
        // ====== 自适应铺满：把多余宽度分配给某一列（默认最后一列） ======
        double _sumRight(Map<int, TableColumnWidth> m) {
          double sum = 0;
          m.forEach((_, v) {
            if (v is FixedColumnWidth) sum += v.value;
          });
          return sum;
        }

        // 父级可给右侧数据区的最大宽度 = 总宽 - 左列宽 - 中缝线宽
        final double availableForRight =
            constraints.maxWidth - (widget.rowHeaderWidth + widget.borderWidth);

        final double currentRight = _sumRight(rightColWidths);

        if (widget.expandToMaxWidth &&
            availableForRight.isFinite &&
            availableForRight > currentRight) {
          final extra = availableForRight - currentRight;
          if (extra > 0 && (cols - 1) > 0) {
            final dataCols = cols - 1;
            final targetCol =
                (widget.fillColumn ?? (dataCols - 1)).clamp(0, dataCols - 1);
            final cur = (rightColWidths[targetCol] as FixedColumnWidth).value;
            rightColWidths[targetCol] = FixedColumnWidth(cur + extra);
          }
        }
        // ============================================

        final availableHeight = constraints.maxHeight.isFinite
            ? constraints.maxHeight
            : fullBodyContentHeight + headerSlotHeight;
        final viewportBodyHeight = _px(
          (availableHeight - headerSlotHeight).clamp(0, fullBodyContentHeight),
        );
        final totalHeight = _px(headerSlotHeight + viewportBodyHeight);

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
                    width: widget.rowHeaderWidth + widget.borderWidth,
                    child: SingleChildScrollView(
                      controller: _vLeft,
                      physics: const ClampingScrollPhysics(),
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

        // ✅ 外圈圆角边框放到最上层绘制（保证右侧边线可见）
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
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );
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
