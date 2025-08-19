import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/高仿@JXCategoryView/ActivityShareSubView@回归包赔.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/高仿@JXCategoryView/ActivityShareSubView@彩金免费领.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/高仿@JXCategoryView/ActivityShareSubView@超值存送礼.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/高仿@JXCategoryView/ActivityShareSubView@队长福利.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsMaterialRunner.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/Utils/Extensions/WidgetExtension/JobsWidgetExtension.dart';

void main() => runApp(const JobsMaterialRunner(JobsCategoryPage(),
    title: 'JXCategoryView 风格 Demo'));

class JobsCategoryPage extends StatefulWidget {
  const JobsCategoryPage({super.key});

  @override
  State<JobsCategoryPage> createState() => _JobsCategoryPageState();
}

class _JobsCategoryPageState extends State<JobsCategoryPage>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;

  final List<String> _tabs = const [
    '彩金免费领',
    '超值存送礼',
    '回归包赔',
    '队长福利',
  ];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topBar = Container(
      height: 48,
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0x11000000))),
      ),
      child: _AdaptiveTabBar(
        controller: _controller,
        tabsText: _tabs,
        tabChildBuilder: (i) => _ZoomTab(
          controller: _controller,
          index: i,
          text: _tabs[i],
          selectedColor: const Color.fromARGB(255, 7, 25, 219),
          unselectedColor: const Color(0xFF666666),
          maxScaleDelta: 0.12,
          minFontWeight: FontWeight.w500,
          maxFontWeight: FontWeight.w800,
          duration: const Duration(milliseconds: 160),
        ),
      ),
    );
    final body = ExtendedTabBarView(
      controller: _controller,
      children: [
        CategoryListPage_1(title: _tabs[0], index: 0).center(),
        CategoryListPage_2(title: _tabs[1], index: 1).center(),
        CategoryListPage_3(title: _tabs[2], index: 2).center(),
        CategoryListPage_4(title: _tabs[3], index: 3).center(),
      ],
    );

    return Column(
      children: [
        topBar,
        const SizedBox(height: 8),
        Expanded(child: body),
      ],
    );
  }
}

/// 自定义 Tab：根据与当前页的距离做「放大 + 加粗 + 颜色渐变」
class _ZoomTab extends StatelessWidget {
  final TabController controller;
  final int index;
  final String text;
  final Color selectedColor;
  final Color unselectedColor;
  final double maxScaleDelta; // 选中时在 1.0 基础上放大的比例
  final FontWeight minFontWeight;
  final FontWeight maxFontWeight;
  final Duration duration;

  const _ZoomTab({
    required this.controller,
    required this.index,
    required this.text,
    required this.selectedColor,
    required this.unselectedColor,
    this.maxScaleDelta = 0.12,
    this.minFontWeight = FontWeight.w500,
    this.maxFontWeight = FontWeight.w800,
    this.duration = const Duration(milliseconds: 160),
  });

  @override
  Widget build(BuildContext context) {
    final Listenable listenable = controller.animation ?? controller;

    return AnimatedBuilder(
      animation: listenable, // 监听 TabController 的动画/索引变化
      builder: (_, __) {
        double selectedness = 0.0;
        final animation = controller.animation;
        if (animation != null) {
          selectedness =
              (1.0 - (animation.value - index).abs()).clamp(0.0, 1.0);
        } else {
          selectedness = controller.index == index ? 1.0 : 0.0;
        }

        final scale =
            1.0 + maxScaleDelta * Curves.easeOut.transform(selectedness);

        // 字重插值
        final wMin = _fontWeightToNumeric(minFontWeight);
        final wMax = _fontWeightToNumeric(maxFontWeight);
        final wVal = (wMin + (wMax - wMin) * selectedness).round();
        final weight = _numericToFontWeight(wVal);

        // 颜色插值
        final color = Color.lerp(unselectedColor, selectedColor, selectedness)!;

        return AnimatedScale(
          duration: duration,
          scale: scale,
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            // 直接用 Text.style 控制，避免被 TabBar 的 DefaultTextStyle 盖掉
            style: TextStyle(
              fontSize: 14,
              fontWeight: weight,
              color: color,
            ),
          ),
        );
      },
    );
  }

  // FontWeight ↔ 数值映射（便于插值）
  int _fontWeightToNumeric(FontWeight w) {
    switch (w) {
      case FontWeight.w100:
        return 100;
      case FontWeight.w200:
        return 200;
      case FontWeight.w300:
        return 300;
      case FontWeight.w400:
        return 400;
      case FontWeight.w500:
        return 500;
      case FontWeight.w600:
        return 600;
      case FontWeight.w700:
        return 700;
      case FontWeight.w800:
        return 800;
      case FontWeight.w900:
        return 900;
      default:
        return 400;
    }
  }

  FontWeight _numericToFontWeight(int v) {
    if (v <= 100) return FontWeight.w100;
    if (v <= 200) return FontWeight.w200;
    if (v <= 300) return FontWeight.w300;
    if (v <= 400) return FontWeight.w400;
    if (v <= 500) return FontWeight.w500;
    if (v <= 600) return FontWeight.w600;
    if (v <= 700) return FontWeight.w700;
    if (v <= 800) return FontWeight.w800;
    return FontWeight.w900;
  }
}

// ========================= 核心：自适应 TabBar =========================
class _AdaptiveTabBar extends StatelessWidget {
  final TabController controller;
  final List<String> tabsText;
  final Widget Function(int i) tabChildBuilder; // 你的 _ZoomTab

  // 文字测量用的基础样式（用未选中态的样式即可）
  final double baseFontSize;
  final FontWeight baseFontWeight;

  const _AdaptiveTabBar({
    required this.controller,
    required this.tabsText,
    required this.tabChildBuilder,
    this.baseFontSize = 14,
    this.baseFontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, cons) {
      final maxW = cons.maxWidth;
      final n = tabsText.length;
      // 每个 tab 在“均分”模式下能分到的宽度
      final perW = maxW / n;

      // 测试：是否所有文本都能在 perW 内（大概测一下，避免均分时被过度截断）
      final fits =
          _allFitWithin(tabsText, perW, baseFontSize, baseFontWeight, ctx);

      // 能打满：非滚动 + 均分（首尾贴边）
      if (fits) {
        return TabBar(
          controller: controller,
          isScrollable: false,
          // 均分时 indicator 跟整个 tab 宽度
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(width: 3, color: Color(0xFF00BBD4)),
            insets: EdgeInsets.zero,
          ),
          labelPadding: EdgeInsets.zero, // 去掉额外 padding，让均分生效
          tabs: List.generate(n, (i) => Tab(child: tabChildBuilder(i))),
          onTap: (_) {},
        );
      }

      // 打不满：允许滚动（自然宽度）
      return TabBar(
        controller: controller,
        isScrollable: true,
        // 滚动模式下，用 label 宽度作为 indicator 宽度
        indicatorSize: TabBarIndicatorSize.label,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(width: 3, color: Color(0xFF00BBD4)),
          insets: EdgeInsets.zero,
        ),
        // 给一点左右内边距，避免文字贴边
        labelPadding: const EdgeInsets.symmetric(horizontal: 14),
        tabs: List.generate(n, (i) => Tab(child: tabChildBuilder(i))),
        onTap: (_) {},
      );
    });
  }

  bool _allFitWithin(
    List<String> labels,
    double perW,
    double fontSize,
    FontWeight weight,
    BuildContext ctx,
  ) {
    final textScale =
        MediaQuery.maybeOf(ctx)?.textScaler.textScaleFactor ?? 1.0;
    for (final s in labels) {
      final tp = TextPainter(
        text: TextSpan(
            text: s,
            style:
                TextStyle(fontSize: fontSize * textScale, fontWeight: weight)),
        textDirection: TextDirection.ltr,
        maxLines: 1,
        ellipsis: '…',
      )..layout();
      if (tp.width > perW) return false;
    }
    return true;
  }
}
