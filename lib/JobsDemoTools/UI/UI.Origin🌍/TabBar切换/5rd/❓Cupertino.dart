import 'package:flutter/cupertino.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsCupertinoRunner.dart';

void main() => runApp(
      const JobsCupertinoRunner(
        MyCupertinoTabPage(),
        title: 'Cupertino Tab 示例',
      ),
    );

class MyCupertinoTabPage extends StatefulWidget {
  const MyCupertinoTabPage({super.key});

  @override
  State<MyCupertinoTabPage> createState() => _MyCupertinoTabPageState();
}

class _MyCupertinoTabPageState extends State<MyCupertinoTabPage> {
  int _currentIndex = 0;

  final List<Widget> _tabs = const [
    Center(child: Text('首页')),
    Center(child: Text('搜索')),
    Center(child: Text('我的')),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: '首页'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: '搜索'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: '我的'),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (_) => _tabs[index],
        );
      },
    );
  }
}
