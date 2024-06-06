import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('GlobalKey Demo')),
        body: const GlobalKeyDemo(),
      ),
    );
  }
}

class GlobalKeyDemo extends StatefulWidget {
  const GlobalKeyDemo({super.key});

  @override
  _GlobalKeyDemoState createState() => _GlobalKeyDemoState();
}

class _GlobalKeyDemoState extends State<GlobalKeyDemo> {
  // 类似于Future。GlobalKey这个大类型里面包裹的是FormState这样的小的具体的类型。
  // 和iOS的key不同（iOS需要手动创建全剧唯一的static字符串），存取铆定这个字符串
  // Flutter创建这个全局的Key类似，只不过不一定是字符串类型，你也不需要管他具体是什么
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  void _changeTextFieldText() {
    // Change the text in the TextField using the controller
    _controller.text = 'Updated Text';
  }

  void _validateAndSave() {
    // 使用这个名为_formKey的GlobalKey
    if (_formKey.currentState!.validate()) {
      debugPrint('Form is valid');
    } else {
      debugPrint('Form is invalid');
    }
  }

  void _resetForm() {
    // 使用这个名为_formKey的GlobalKey
    _formKey.currentState!.reset();
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            // 创建完了以后，铆定UI。没有设定就是原始的super.key
            key: _formKey,
            child: TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter Text',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _changeTextFieldText,
                child: const Text('Change Text'),
              ),
              ElevatedButton(
                onPressed: _validateAndSave,
                child: const Text('Validate'),
              ),
              ElevatedButton(
                onPressed: _resetForm,
                child: const Text('Reset'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
