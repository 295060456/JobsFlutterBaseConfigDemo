import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Storage.dart';
import 'user_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storage Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StorageDemo(),
    );
  }
}

class StorageDemo extends StatefulWidget {
  const StorageDemo({super.key});

  @override
  _StorageDemoState createState() => _StorageDemoState();
}

class _StorageDemoState extends State<StorageDemo> {
  final Storage _storage = Storage.instance;
  late final SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    _loadInitialValues();
  }

  Future<void> _loadInitialValues() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // Load data from SharedPreferences
      UserInfo userInfo = await StorageHelper.loadUserInfo();
      String key = prefs.getString('key') ?? '';
      String dateTimeString = prefs.getString('dateTime') ?? '';
      DateTime dateTime = dateTimeString.isNotEmpty
          ? DateTime.tryParse(dateTimeString) ?? DateTime.now()
          : DateTime.now();
      double doubleValue = prefs.getDouble('doubleValue') ?? 0.0;
      int intValue = prefs.getInt('intValue') ?? 0;
      bool boolValue = prefs.getBool('boolValue') ?? false;
      // Update state
      setState(() {
        _storage.userInfo = userInfo;
        _storage.key = key;
        _storage.dateTime = dateTime;
        _storage.doubleValue = doubleValue;
        _storage.intValue = intValue;
        _storage.boolValue = boolValue;
      });
    } catch (e) {
      debugPrint('Error loading initial values: $e');
    }
  }

  Future<void> _saveValues() async {
    await _storage.userInfo.save('userInfo');
    await _storage.key!.save('key');
    await _storage.dateTime!.save('dateTime');
    await _storage.doubleValue.save('doubleValue');
    await _storage.intValue.save('intValue');
    await _storage.boolValue.save('boolValue');
  }

  Future<void> _deleteValues() async {
    await _storage.userInfo.delete('userInfo');
    await _storage.key!.delete('key');
    await _storage.dateTime!.delete('dateTime');
    await _storage.doubleValue.delete('doubleValue');
    await _storage.intValue.delete('intValue');
    await _storage.boolValue.delete('boolValue');
    setState(() {
      _storage.userInfo = UserInfo();
      _storage.key = "";
      _storage.dateTime = DateTime.now();
      _storage.doubleValue = 0.0;
      _storage.intValue = 0;
      _storage.boolValue = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storage Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'User Info'),
              onChanged: (value) {
                _storage.userInfo = UserInfo.fromString(value);
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Key'),
              onChanged: (value) {
                _storage.key = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'DateTime'),
              onChanged: (value) {
                _storage.dateTime = DateTime.tryParse(value) ?? DateTime.now();
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Double Value'),
              onChanged: (value) {
                _storage.doubleValue = double.tryParse(value) ?? 0.0;
              },
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Int Value'),
              onChanged: (value) {
                _storage.intValue = int.tryParse(value) ?? 0;
              },
            ),
            SwitchListTile(
              title: const Text('Bool Value'),
              value: _storage.boolValue,
              onChanged: (value) {
                setState(() {
                  _storage.boolValue = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveValues,
              child: const Text('Save Values'),
            ),
            ElevatedButton(
              onPressed: _deleteValues,
              child: const Text('Delete Values'),
            ),
          ],
        ),
      ),
    );
  }
}

void storageUsageDemo() {
  // UserInfo 字段的使用
  Storage.instance.userInfo.setUserInfo(name: "汤山老王", age: 33);
  debugPrint(Storage.instance.userInfo.name);
  debugPrint(Storage.instance.userInfo.age.toString());

  // String 字段的使用
  Storage.instance.key = "newKey";
  debugPrint(Storage.instance.key);

  // DateTime 字段的使用
  Storage.instance.dateTime = DateTime(2023, 1, 1);
  debugPrint(Storage.instance.dateTime?.toIso8601String());

  // double 字段的使用
  Storage.instance.doubleValue = 1.23;
  debugPrint(Storage.instance.doubleValue.toString());

  // int 字段的使用
  Storage.instance.intValue = 42;
  debugPrint(Storage.instance.intValue.toString());

  // bool 字段的使用
  Storage.instance.boolValue = true;
  debugPrint(Storage.instance.boolValue.toString());
}