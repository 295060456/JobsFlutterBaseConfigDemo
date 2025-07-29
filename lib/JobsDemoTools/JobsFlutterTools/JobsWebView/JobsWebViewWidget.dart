import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsGetXRunner.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/Utils/JobsCommonUtil.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// --------------------------------------------------------------------------
/// 🧩 通用 WebView 组件封装：JobsUniversalWebView
///
/// ✅ 支持静态 HTML 或远程 URL 加载（二选一）
/// ✅ 支持内容动态高度监听（通过 body.scrollHeight）
/// ✅ 支持滚动监听（window.onscroll）
/// ✅ 支持 a 标签链接拦截（内部跳转）
/// ✅ 支持加载遮罩显示（showLoading）
/// ✅ 支持外部获取 WebViewController
///
/// 📌 注：不再依赖特定 HTML DOM 元素，如 #app，更通用稳定
/// --------------------------------------------------------------------------

// void main() => runApp(JobsGetRunner(
//     JobsWebViewWidget(
//       html: htmlContent(),
//       showLoading: true,
//       enableScrollListen: true,
//       interceptLinks: true,
//       onHeightChanged: (h) => JobsPrint('动态高度：$h'),
//       onScrollChanged: (top) => JobsPrint('滚动位置：$top'),
//       onInterceptLink: (href) => JobsPrint('被拦截的链接：$href'),
//     ),
//     title: 'JobsWebViewWidget'));

void main() => runApp(JobsGetRunner(
    JobsWebViewWidget(
      url: "https://flutter.dev",
      showLoading: true,
      onControllerCreated: (controller) async {
        final title = await controller.getTitle();
        JobsPrint("网页标题：$title");
      },
    ),
    title: 'JobsWebViewWidget'));

class JobsWebViewWidget extends StatefulWidget {
  final String? html;
  final String? url;
  final bool showLoading;
  final bool enableScrollListen;
  final bool interceptLinks;
  final Function(double height)? onHeightChanged;
  final Function(double scrollTop)? onScrollChanged;
  final Function(String interceptedUrl)? onInterceptLink;
  final Function(WebViewController controller)? onControllerCreated;

  const JobsWebViewWidget({
    super.key,
    this.html,
    this.url,
    this.showLoading = false,
    this.enableScrollListen = false,
    this.interceptLinks = false,
    this.onHeightChanged,
    this.onScrollChanged,
    this.onInterceptLink,
    this.onControllerCreated,
  });

  @override
  State<JobsWebViewWidget> createState() => _JobsUniversalWebViewState();
}

class _JobsUniversalWebViewState extends State<JobsWebViewWidget>
    with AutomaticKeepAliveClientMixin {
  late final WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('Print', onMessageReceived: (message) {
        final msg = message.message;

        if (msg.startsWith("intercept:")) {
          widget.onInterceptLink?.call(msg.replaceFirst("intercept:", ""));
        } else {
          final top = double.tryParse(msg);
          if (top != null) {
            widget.onScrollChanged?.call(top);
          }
        }
      })
      ..setBackgroundColor(Colors.transparent)
      ..setNavigationDelegate(NavigationDelegate(
        onPageFinished: (url) async {
          await Future.delayed(const Duration(milliseconds: 300));

          if (widget.html != null) {
            // 用 body.scrollHeight 获取内容高度
            try {
              final rawHeight =
                  await controller.runJavaScriptReturningResult('''
                (function() {
                  return document.body.scrollHeight.toString();
                })()
              ''');
              final cleaned = "$rawHeight".replaceAll(RegExp(r'[^0-9.]'), '');
              final height = double.tryParse(cleaned);
              if (height != null && height > 0) {
                widget.onHeightChanged?.call(height + 20);
              }
            } catch (e) {
              debugPrint('⚠️ 获取页面高度失败：$e');
            }
          }

          // 滚动监听注入
          if (widget.enableScrollListen) {
            controller.runJavaScript('''
              window.onscroll = function() {
                var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
                Print.postMessage(scrollTop.toString());
              };
            ''');
          }

          // 链接拦截注入
          if (widget.interceptLinks) {
            controller.runJavaScript('''
              document.addEventListener('click', function(e) {
                var target = e.target;
                while (target && target.tagName !== 'A') {
                  target = target.parentElement;
                }
                if (target && target.tagName === 'A' && target.href) {
                  if (!target.href.startsWith("http")) {
                    e.preventDefault();
                    Print.postMessage("intercept:" + target.href);
                  }
                }
              }, false);
            ''');
          }

          if (widget.showLoading) {
            setState(() => isLoading = false);
          }
        },
      ));

    widget.onControllerCreated?.call(controller);

    if (widget.html != null) {
      controller.loadHtmlString(_wrapHtml(widget.html!));
    } else if (widget.url != null) {
      controller.loadRequest(Uri.parse(widget.url!));
    }
  }

  String _wrapHtml(String body) {
    final screenHeight = Get.context?.mediaQuerySize.height ?? 1000;
    return '''
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <style>
      * { margin: 0; padding: 0; }
      html, body {
        width: 100% !important;
        height: auto !important;
        overflow: auto !important;
        -webkit-user-select: none;
        user-select: none;
      }
      img {
        max-width: 100% !important;
        height: auto !important;
        max-height: ${screenHeight}px !important;
      }
      table {
        width: 100% !important;
        border-collapse: collapse !important;
      }
      table td, table th {
        border: 1px solid #000 !important;
        text-align: center;
        vertical-align: middle;
        padding: 4px;
      }
    </style>
  </head>
  <body>
    $body
  </body>
</html>
''';
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        WebViewWidget(controller: controller),
        if (widget.showLoading && isLoading)
          const Positioned.fill(
            child: ColoredBox(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
