import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/剪切板复制/NativeClipboard.dart';
import 'dart:convert';

import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsMaterialRunner.dart'; // 公共测试器路径

void main() =>
    runApp(JobsMaterialRunner(HttpMethodsDemo(), title: 'HTTP Methods Demo'));

class HttpMethodsDemo extends StatefulWidget {
  const HttpMethodsDemo({super.key});

  @override
  State<HttpMethodsDemo> createState() => _HttpMethodsDemoState();
}

class _HttpMethodsDemoState extends State<HttpMethodsDemo> {
  final Dio _dio = Dio(BaseOptions(
    validateStatus: (status) => true,
    headers: {
      'User-Agent':
          'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 Mobile/15E148 Safari/604.1',
      'Accept': 'application/json,text/html',
      'Accept-Language': 'en-US,en;q=0.9',
      'Referer': 'https://reqres.in/',
      'Connection': 'keep-alive',
    },
  ));

  String _result = '👉 请选择一个请求方法';

  void _updateResult(String result) {
    setState(() {
      _result = result;
    });
  }

  String _formatJson(dynamic data) {
    try {
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(data);
    } catch (_) {
      return data.toString();
    }
  }

  Future<void> _getRequest() async {
    try {
      final response = await _dio.get('https://reqres.in/api/users/2');
      if (response.statusCode == 200) {
        _updateResult('✅ GET Success:\n${_formatJson(response.data)}');
      } else {
        _updateResult(
            '⚠️ GET Failed [${response.statusCode}]:\n${_formatJson(response.data)}');
      }
    } catch (e) {
      _updateResult('❌ GET Exception: $e');
    }
  }

  Future<void> _postRequest() async {
    try {
      final response = await _dio.post(
        'https://reqres.in/api/users',
        data: {'name': 'John', 'job': 'Developer'},
      );
      if (response.statusCode == 201) {
        _updateResult('✅ POST Success:\n${_formatJson(response.data)}');
      } else {
        _updateResult(
            '⚠️ POST Failed [${response.statusCode}]:\n${_formatJson(response.data)}');
      }
    } catch (e) {
      _updateResult('❌ POST Exception: $e');
    }
  }

  Future<void> _putRequest() async {
    try {
      final response = await _dio.put(
        'https://reqres.in/api/users/2',
        data: {'name': 'John', 'job': 'Manager'},
      );
      if (response.statusCode == 200) {
        _updateResult('✅ PUT Success:\n${_formatJson(response.data)}');
      } else {
        _updateResult(
            '⚠️ PUT Failed [${response.statusCode}]:\n${_formatJson(response.data)}');
      }
    } catch (e) {
      _updateResult('❌ PUT Exception: $e');
    }
  }

  Future<void> _deleteRequest() async {
    try {
      final response = await _dio.delete('https://reqres.in/api/users/2');
      if (response.statusCode == 204) {
        _updateResult('✅ DELETE Success (No Content)');
      } else {
        _updateResult(
            '⚠️ DELETE Failed [${response.statusCode}]:\n${_formatJson(response.data)}');
      }
    } catch (e) {
      _updateResult('❌ DELETE Exception: $e');
    }
  }

  Future<void> _patchRequest() async {
    try {
      final response = await _dio.patch(
        'https://reqres.in/api/users/2',
        data: {'job': 'Lead Developer'},
      );
      if (response.statusCode == 200) {
        _updateResult('✅ PATCH Success:\n${_formatJson(response.data)}');
      } else {
        _updateResult(
            '⚠️ PATCH Failed [${response.statusCode}]:\n${_formatJson(response.data)}');
      }
    } catch (e) {
      _updateResult('❌ PATCH Exception: $e');
    }
  }

  Widget buildButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              buildButton('GET', _getRequest),
              buildButton('POST', _postRequest),
              buildButton('PUT', _putRequest),
              buildButton('DELETE', _deleteRequest),
              buildButton('PATCH', _patchRequest),
            ],
          ),
          const SizedBox(height: 10),
          // ✅ 添加“复制全部”按钮
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {
                  NativeClipboard.setText(_result);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('✅ 已使用原生方式复制')),
                  );
                },
                icon: const Icon(Icons.copy, size: 16),
                label: const Text('复制全部'),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SelectableText(
                _result,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
