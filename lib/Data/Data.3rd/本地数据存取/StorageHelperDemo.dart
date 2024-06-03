import 'package:flutter/material.dart';
import 'user_info.dart';
import 'storage.dart'; // 包含存取扩展方法

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserInfoStorage.loadFromPreferences();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('UserInfo & Storage Demo')),
        body: const UserInfoDemo(),
      ),
    );
  }
}

class UserInfoDemo extends StatefulWidget {
  const UserInfoDemo({super.key});

  @override
  _UserInfoDemoState createState() => _UserInfoDemoState();
}

class _UserInfoDemoState extends State<UserInfoDemo> {
  late UserInfo _userInfo;
  DateTime? loadedDate;
  double? loadedNumber;
  String? loadedText;
  bool? loadedBoolean;
  int? loadedAge;
  int? loadedHeight;

  @override
  void initState() {
    super.initState();
    _userInfo = UserInfo();
    _loadAdditionalData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Name: ${_userInfo.name}'),
          Text('Age: ${_userInfo.age}'),
          const SizedBox(height: 20),
          Text('Loaded Date: $loadedDate'),
          Text('Loaded Number: $loadedNumber'),
          Text('Loaded Text: $loadedText'),
          Text('Loaded Boolean: $loadedBoolean'),
          Text('Loaded Age: $loadedAge'),
          Text('Loaded Height: $loadedHeight'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _updateUserInfo,
            child: const Text('更新用户信息'),
          ),
          ElevatedButton(
            onPressed: _saveAdditionalData,
            child: const Text('保存其他数据'),
          ),
          ElevatedButton(
            onPressed: _loadAdditionalData,
            child: const Text('加载其他数据'),
          ),
          // ElevatedButton(
          //   onPressed: _deleteAdditionalData,
          //   child: const Text('删除其他数据'),
          // ),
        ],
      ),
    );
  }

  void _updateUserInfo() async {
    _userInfo.name = '隔壁老王';
    _userInfo.age = 25;
    await _userInfo.saveToPreferences();
    setState(() {});
  }

  void _saveAdditionalData() async {
    DateTime now = DateTime.now();
    double number = 123456.789;
    String text = "hello";
    bool boolean = true;
    int age = 30;
    int height = 175;

    await now.save('currentDateTime');
    await number.save('numberValue');
    await text.save('textValue');
    await boolean.save('booleanValue');
    await age.save('ageValue');
    await height.save('heightValue');
  }

  void _loadAdditionalData() async {
    loadedDate = await DateTimeStorage.load('currentDateTime');
    loadedNumber = await DoubleStorage.load('numberValue');
    loadedText = await StringStorage.load('textValue');
    loadedBoolean = await BoolStorage.load('booleanValue');
    loadedAge = await IntStorage.load('ageValue');
    loadedHeight = await IntStorage.load('heightValue');
    setState(() {});
  }

  // void _deleteAdditionalData() async {
  //   await DateTimeStorage.delete('currentDateTime');
  //   await DoubleStorage.delete('numberValue');
  //   await StringStorage.delete('textValue');
  //   await BoolStorage.delete('booleanValue');
  //   await IntStorage.delete('ageValue');
  //   await IntStorage.delete('heightValue');
  //   setState(() {
  //     loadedDate = null;
  //     loadedNumber = null;
  //     loadedText = null;
  //     loadedBoolean = null;
  //     loadedAge = null;
  //     loadedHeight = null;
  //   });
  // }
}
