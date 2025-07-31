import 'package:flutter/material.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsNotification/JobsNotification/JobsNotification.dart';

class JobsNotificationDemoPageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page B - UI监听')),
      body: Center(
        child: JobsNotification.listen('msg', (data) {
          return Text(
            'Page B 接收到：$data',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          );
        }),
      ),
    );
  }
}
