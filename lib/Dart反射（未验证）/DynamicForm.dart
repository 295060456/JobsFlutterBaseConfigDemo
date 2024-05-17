import 'package:flutter/material.dart';
import 'dart:convert';

class DynamicForm extends StatefulWidget {
  final String jsonString;

  const DynamicForm({super.key, required this.jsonString});

  @override
  _DynamicFormState createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  late Map<String, dynamic> jsonMap;
  final Map<String, TextEditingController> controllers = {};

  @override
  void initState() {
    super.initState();
    jsonMap = jsonDecode(widget.jsonString);
    jsonMap.forEach((key, value) {
      controllers[key] = TextEditingController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...jsonMap.keys.map((key) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: controllers[key],
                  decoration: InputDecoration(
                    labelText: key,
                  ),
                ),
              );
            }),
            ElevatedButton(
              onPressed: () {
                jsonMap.forEach((key, value) {
                  print('$key: ${controllers[key]?.text}');
                });
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}