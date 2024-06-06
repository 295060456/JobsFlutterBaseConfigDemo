import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InAppWebView Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => const WebViewExample(),
              isScrollControlled: true,
            );
          },
          child: const Text('Open WebView'),
        ),
      ),
    );
  }
}

class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  InAppWebViewController? webViewController;
  bool canPopWebView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InAppWebView'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: PopScope(
        canPop: canPopWebView,// 决定是否允许返回操作
        onPopInvoked: (didPop) async {// 当返回操作被触发时调用
          if (webViewController != null && await webViewController!.canGoBack()) {
            webViewController!.goBack();
            setState(() {
              canPopWebView = true;
            });
          } else {
            setState(() {
              canPopWebView = false;
            });
          }
        },
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri.uri(Uri.parse("https://www.google.com"))),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          onLoadStart: (controller, url) {
            debugPrint("网页开始加载: $url");
          },
          onLoadStop: (controller, url) {
            debugPrint("网页加载结束: $url");
          },
        ),
      ),
    );
  }
}
