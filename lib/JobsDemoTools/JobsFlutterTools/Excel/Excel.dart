import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  final horizontal = ['', '回归首存返利', '流水倍数', '备注1', '备注2']; // index=0 为空，表示左上角占位
  final vertical = ['≥2000元', '≥10000元', '≥20000元', '≥50000元'];
  final data = [
    ['28元', '1'],
    ['88元', '1'],
    ['188元', '1'],
    ['388元', '1'],
  ];
  runApp(
    ScreenUtilInit(
      designSize: const Size(1125, 2436), // ← 设计稿尺寸
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Excel',
          home: Scaffold(
            appBar: AppBar(title: const Text('Excel')),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: ExcelLikeTable(
                  horizontalTitles: horizontal,
                  verticalTitles: vertical,
                  rowsData: data,
                  // 可选：自定义样式
                  headerXStyle: const TableSectionStyle(
                    bgColor: Color(0xFF00C2C7), // 顶部栏背景色
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
                  ),
                  cellStyle: const TableSectionStyle(
                    bgColor: Colors.white,
                    textColor: Colors.black87,
                    fontSize: 14,
                  ),
                  borderColor: Color(0xFFE5E6EB),
                  borderWidth: 1,
                  topLeftTitle: '回归首存金额', // 左上角标题
                  placeholder: '没有', // 不足内容的补位符
                ),
              ),
            ),
          ),
        );
      },
    ),
  );
}

/// ================================== 样式模型 ==================================
/// 统一承载“背景颜色、字体大小、字体颜色、粗细、内边距”
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

  TableSectionStyle copyWith({
    Color? bgColor,
    Color? textColor,
    double? fontSize,
    FontWeight? fontWeight,
    EdgeInsetsGeometry? padding,
  }) {
    return TableSectionStyle(
      bgColor: bgColor ?? this.bgColor,
      textColor: textColor ?? this.textColor,
      fontSize: fontSize ?? this.fontSize,
      fontWeight: fontWeight ?? this.fontWeight,
      padding: padding ?? this.padding,
    );
  }
}

/// ================================== 通用表格 ==================================
/// 使用约定：
/// - [horizontalTitles] 里包含列头，并且 index=0 为“行头占位/标题单元格”
///   例：['', '回归首存返利', '流水倍数']
/// - [rowsData] 的每一行长度应为 horizontalTitles.length - 1；
///   不足会用 [placeholder] 自动补齐，超出会被截断。
/// ================================== 通用表格（修正版：列宽按内容自适应 + 单行不换行） ==================================
class ExcelLikeTable extends StatelessWidget {
  final List<String> horizontalTitles; // 横向列头（含 index=0 行头占位）
  final List<String> verticalTitles; // 竖向行头
  final List<List<String>> rowsData; // 表体数据（每行对应 verticalTitles 的一行）

  // 样式
  final TableSectionStyle headerXStyle; // 顶部横向表头
  final TableSectionStyle headerYStyle; // 左侧竖向表头
  final TableSectionStyle cellStyle; // 中间单元格

  // 其它
  final Color borderColor;
  final double borderWidth;
  final String topLeftTitle; // 左上角单元格显示文字
  final String placeholder; // 数据补齐占位符

  /// 新增：行头最小宽度（避免被压扁）
  final double rowHeaderMinWidth;

  const ExcelLikeTable({
    super.key,
    required this.horizontalTitles,
    required this.verticalTitles,
    required this.rowsData,
    this.headerXStyle = const TableSectionStyle(
      bgColor: Color(0xFFD2D4DE),
      textColor: Colors.black87,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    this.headerYStyle = const TableSectionStyle(
      bgColor: Color(0xFFF6F7F9),
      textColor: Colors.black87,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    this.cellStyle = const TableSectionStyle(
      bgColor: Colors.white,
      textColor: Colors.black87,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    this.borderColor = const Color(0xFFE5E6EB),
    this.borderWidth = 1,
    this.topLeftTitle = '',
    this.placeholder = '-',
    this.rowHeaderMinWidth = 120, // 默认给行头 120 宽
  }) : assert(horizontalTitles.length >= 1,
            'horizontalTitles 至少包含 1 个元素（index=0 为行头占位）');

  // 基础单元格：强制单行不换行，避免竖排
  Widget _buildCell(String text, TableSectionStyle style,
      {TextAlign align = TextAlign.center}) {
    return Container(
      color: style.bgColor,
      padding: style.padding,
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: align,
        maxLines: 1, // 关键：单行
        softWrap: false, // 关键：不换行
        overflow: TextOverflow.visible,
        style: TextStyle(
          color: style.textColor,
          fontSize: style.fontSize,
          fontWeight: style.fontWeight,
          height: 1.2,
        ),
      ),
    );
  }

  // 将一行数据补齐/截断到指定长度
  List<String> _fitRow(List<String> row, int targetLen) {
    if (row.length == targetLen) return row;
    if (row.length > targetLen) return row.sublist(0, targetLen);
    final padded = List<String>.from(row);
    while (padded.length < targetLen) {
      padded.add(placeholder);
    }
    return padded;
  }

  @override
  Widget build(BuildContext context) {
    final dataCols = horizontalTitles.length - 1; // 表体列数（除去行头列）
    final rows = verticalTitles.length;

    // 行数保护：rowsData 与 verticalTitles 对齐（不足用空行补）
    final normalizedRowsData = <List<String>>[];
    for (int i = 0; i < rows; i++) {
      final row = i < rowsData.length ? rowsData[i] : const <String>[];
      normalizedRowsData.add(_fitRow(row, dataCols));
    }

    // 为每列指定列宽策略：第 0 列固定宽，其余走固有宽度
    final Map<int, TableColumnWidth> colWidths = {
      0: FixedColumnWidth(rowHeaderMinWidth),
    };
    for (int c = 1; c < horizontalTitles.length; c++) {
      colWidths[c] = const IntrinsicColumnWidth(); // 关键：按内容自适应
    }

    final table = Table(
      border: TableBorder.all(color: borderColor, width: borderWidth),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      defaultColumnWidth: const IntrinsicColumnWidth(), // 兜底也是固有宽度
      columnWidths: colWidths,
      children: [
        // 顶部表头行：左上角 + 横向表头（从 index=1 开始绘制）
        TableRow(
          children: [
            _buildCell(topLeftTitle, headerXStyle),
            for (int c = 1; c < horizontalTitles.length; c++)
              _buildCell(horizontalTitles[c], headerXStyle),
          ],
        ),
        // 数据行：行头 + 数据
        for (int r = 0; r < rows; r++)
          TableRow(
            children: [
              _buildCell(verticalTitles[r], headerYStyle,
                  align: TextAlign.center),
              for (int c = 0; c < dataCols; c++)
                _buildCell(normalizedRowsData[r][c], cellStyle,
                    align: TextAlign.center),
            ],
          ),
      ],
    );

    // 双向滚动：横向包一层，里面再垂直；再包一层 IntrinsicWidth 让表格按内容展开宽度
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: IntrinsicWidth(
          // 关键：让 Table 以内容宽度为准
          child: table,
        ),
      ),
    );
  }
}
