import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _stringController = TextEditingController();
  final TextEditingController _intController = TextEditingController();
  final TextEditingController _doubleController = TextEditingController();
  final TextEditingController _boolController = TextEditingController();
  final TextEditingController _dateTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadStoredData();
  }

  Future<void> _loadStoredData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? userInfoString = prefs.getString('userInfo');
    if (userInfoString != null) {
      Map<String, dynamic> userInfoMap = jsonDecode(userInfoString);
      _nameController.text = userInfoMap['name'];
      _ageController.text = userInfoMap['age'].toString();
    }

    _stringController.text = prefs.getString('stringValue') ?? '';
    _intController.text = (prefs.getInt('intValue') ?? '').toString();
    _doubleController.text = (prefs.getDouble('doubleValue') ?? '').toString();
    _boolController.text = (prefs.getBool('boolValue') ?? '').toString();
    _dateTimeController.text = prefs.getString('dateTimeValue') ?? '';
  }

  Future<void> _saveString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('stringValue', _stringController.text);
  }

  Future<void> _saveInt() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('intValue', int.parse(_intController.text));
  }

  Future<void> _saveDouble() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('doubleValue', double.parse(_doubleController.text));
  }

  Future<void> _saveBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('boolValue', _boolController.text.toLowerCase() == 'true');
  }

  Future<void> _saveDateTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('dateTimeValue', _dateTimeController.text);
  }

  Future<void> _saveUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userInfo = jsonEncode({
      'name': _nameController.text,
      'age': int.parse(_ageController.text),
    });
    await prefs.setString('userInfo', userInfo);
  }

  Future<void> _resetAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _nameController.clear();
    _ageController.clear();
    _stringController.clear();
    _intController.clear();
    _doubleController.clear();
    _boolController.clear();
    _dateTimeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storage Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTextField('Name', _nameController, _saveUserInfo),
            _buildTextField('Age', _ageController, _saveUserInfo),
            _buildTextField('String Value', _stringController, _saveString),
            _buildTextField('Integer Value', _intController, _saveInt),
            _buildTextField('Double Value', _doubleController, _saveDouble),
            _buildTextField('Boolean Value', _boolController, _saveBool),
            _buildTextField('Date Time Value', _dateTimeController, _saveDateTime),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetAll,
              child: const Text('Reset All'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, Future<void> Function() saveFunction) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: saveFunction,
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
