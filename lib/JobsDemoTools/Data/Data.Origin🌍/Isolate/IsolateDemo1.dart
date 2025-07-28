import 'dart:isolate';
// 简单使用 Isolate.spawn
// Isolate 中的函数必须是顶级函数或静态方法（不能是闭包）。
// 主 isolate 发送消息给子 isolate 时，需要通过 SendPort 发送。
// 子 isolate 接收消息时，需要通过 ReceivePort 接收。
void main() async {
  final receivePort = ReceivePort(); // 接收端口
  await Isolate.spawn(computeHeavyTask, receivePort.sendPort);

  receivePort.listen((message) {
    print("👨‍💻 主线程收到计算结果：$message");
    receivePort.close();
  });
}

// 执行函数
void computeHeavyTask(SendPort sendPort) {
  int result = 0;
  for (int i = 0; i < 100000000; i++) {
    result += i;
  }
  sendPort.send(result); // 把结果发回主 isolate
}
