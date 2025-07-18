// 📁 lib/main.dart
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:jobs_flutter_base_config/JobsDemoTools/JobsFlutterTools/JobsRunners/JobsMaterialRunner.dart'; // 公共测试器路径
import 'api_service.dart';

void main() =>
    runApp(const JobsMaterialRunner(HttpDemoPage(), title: 'HttpDemo'));

class HttpDemoPage extends StatefulWidget {
  const HttpDemoPage({super.key});
  final String sss = '';
  @override
  State<HttpDemoPage> createState() => _HttpDemoPageState();
}

class _HttpDemoPageState extends State<HttpDemoPage> {
  final TextEditingController _urlController =
      TextEditingController(text: 'https://jsonplaceholder.typicode.com/posts');
  final TextEditingController _bodyController = TextEditingController(
      text: '{"title": "hello", "body": "world", "userId": 1}');
  final TextEditingController _downloadFileNameController =
      TextEditingController(text: 'file.jpg');

  String _requestInfo = '';
  String _responseInfo = '';
  bool _expanded = true;

  Future<void> _sendRequest(String method) async {
    final url = _urlController.text.trim();
    final bodyText = _bodyController.text.trim();
    Uri uri;

    try {
      uri = Uri.parse(url);
    } catch (_) {
      setState(() {
        _responseInfo = '❌ 无效的 URL：$url';
      });
      return;
    }

    dynamic bodyObj;
    if (bodyText.isNotEmpty &&
        !['GET', 'DELETE', 'HEAD', 'OPTIONS'].contains(method)) {
      try {
        bodyObj = json.decode(bodyText);
      } catch (e) {
        setState(() {
          _responseInfo = '❌ 请求体 JSON 格式错误：$e';
        });
        return;
      }
    }

    setState(() {
      _requestInfo =
          '''📤 请求信息：\nURL: $url\n方法: $method\n请求体: ${bodyObj ?? '(无)'}''';
      _responseInfo = '⏳ 请求中...';
      _expanded = true;
    });

    try {
      final res = await ApiService.request(method, uri, body: bodyObj);
      setState(() {
        _responseInfo =
            '''📥 响应：\n状态码: ${res['statusCode']}\n耗时: ${res['durationMs']} ms\n\n响应头:\n${const JsonEncoder.withIndent('  ').convert(res['headers'])}\n\n响应体:\n${const JsonEncoder.withIndent('  ').convert(res['body'])}''';
      });
    } catch (e) {
      setState(() {
        _responseInfo = '❌ 请求失败: $e';
      });
    }
  }

  Future<void> _uploadFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      setState(() {
        _requestInfo = '📤 上传文件路径: ${file.path}';
        _responseInfo = '⏳ 上传中...';
        _expanded = true;
      });

      try {
        final res =
            await ApiService.uploadFile(_urlController.text.trim(), file);
        setState(() {
          _responseInfo = '✅ 上传成功: $res';
        });
      } catch (e) {
        setState(() {
          _responseInfo = '❌ 上传失败: $e';
        });
      }
    }
  }

  Future<void> _downloadFile() async {
    final fileName = _downloadFileNameController.text.trim();
    final url = _urlController.text.trim();

    setState(() {
      _requestInfo = '📥 下载文件地址: $url';
      _responseInfo = '⏳ 下载中...';
      _expanded = true;
    });

    try {
      final path = await ApiService.downloadFile(url, fileName);
      setState(() {
        _responseInfo = '✅ 下载成功，文件保存到: $path';
      });
    } catch (e) {
      setState(() {
        _responseInfo = '❌ 下载失败: $e';
      });
    }
  }

  Widget _buildButton(String label, String method) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => _sendRequest(method),
          style: ElevatedButton.styleFrom(minimumSize: const Size(0, 44)),
          child: Text(label),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        title: const Text('🧪 HTTP 全功能 Demo'),
        backgroundColor: Colors.blueGrey.shade700,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _urlController,
                decoration: const InputDecoration(
                  labelText: '请求地址',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _bodyController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: '请求体（JSON 格式，仅用于 POST/PUT/PATCH）',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  _buildButton('GET', 'GET'),
                  _buildButton('POST', 'POST'),
                  _buildButton('PUT', 'PUT'),
                  _buildButton('DELETE', 'DELETE'),
                  _buildButton('PATCH', 'PATCH'),
                  _buildButton('HEAD', 'HEAD'),
                  _buildButton('OPTIONS', 'OPTIONS'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _uploadFile,
                      icon: const Icon(Icons.upload_file),
                      label: const Text('上传文件'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: _downloadFile,
                      icon: const Icon(Icons.download),
                      label: const Text('下载文件'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _downloadFileNameController,
                decoration: const InputDecoration(
                  labelText: '下载文件名（如 file.jpg）',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              AnimatedCrossFade(
                crossFadeState: _expanded
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 300),
                firstChild: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SelectableText.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$_requestInfo\n\n',
                            style: const TextStyle(
                                fontFamily: 'monospace', color: Colors.black87),
                          ),
                          TextSpan(
                            text: _responseInfo,
                            style: const TextStyle(
                                fontFamily: 'monospace',
                                color: Colors.blueGrey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                secondChild: const SizedBox.shrink(),
              ),
              Center(
                child: TextButton(
                  onPressed: () => setState(() => _expanded = !_expanded),
                  child: Text(_expanded ? '⬆️ 收起响应信息' : '⬇️ 展开响应信息'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
