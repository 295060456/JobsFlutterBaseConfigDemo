import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsNotification/JobsSimplyNotification/JobsSimplyNotification.dart';

class JobsSimplyNotificationDemoPageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page C - 监听通知')),
      body: Center(
        child: JobsSimplyNotification.listen('hello', (data) {
          return Text(
            'Page C 收到：$data',
            style: TextStyle(fontSize: 18, color: Colors.green),
          );
        }),
      ),
    );
  }
}
