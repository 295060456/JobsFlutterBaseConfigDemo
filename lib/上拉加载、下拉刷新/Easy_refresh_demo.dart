import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyRefresh Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _itemCount = 20;
  bool _hasMore = true;
  final EasyRefreshController _controller = EasyRefreshController();

  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _itemCount = 20;
      _hasMore = true;
    });
    _controller.finishRefresh();
    _controller.resetFooter();
  }

  Future<void> _onLoad() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _itemCount += 10;
      if (_itemCount >= 50) {
        _hasMore = false;
      }
    });
    if (_hasMore) {
      _controller.finishLoad(IndicatorResult.success);
    } else {
      _controller.finishLoad(IndicatorResult.noMore);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EasyRefresh Demo'),
      ),
      body: EasyRefresh(
        controller: _controller,
        onRefresh: _onRefresh,
        onLoad: _onLoad,
        header: const MaterialHeader(),
        footer: const MaterialFooter(),
        child: ListView.builder(
          itemCount: _itemCount,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item $index'),
            );
          },
        ),
      ),
    );
  }
}
