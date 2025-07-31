import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsNotification/JobsNotification/JobsNotification.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/Utils/JobsCommonUtil.dart';

class JobsNotificationDemoPageC extends StatefulWidget {
  @override
  State<JobsNotificationDemoPageC> createState() => _PageCState();
}

class _PageCState extends State<JobsNotificationDemoPageC> {
  String _lastMessage = '尚未收到通知';

  @override
  void initState() {
    super.initState();

    // ✅ 注册逻辑监听
    JobsNotification.listenRaw("msg", (data) {
      JobsPrint("📥 PageC 收到逻辑通知：$data");

      setState(() {
        _lastMessage = data.toString();
      });

      Get.snackbar("通知", "PageC 收到消息：$data");
    });
  }

  @override
  void dispose() {
    JobsNotification.remove("msg");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page C - 逻辑监听')),
      body: Center(
        child: Text('最近收到：$_lastMessage'),
      ),
      // ✅ 浮动按钮：用于自己触发通知
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          JobsNotification.post("msg", "👋 PageC 自发通知");
        },
        child: Icon(Icons.send),
        tooltip: "发送测试通知",
      ),
    );
  }
}
