import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
// dependencies:
//   flutter:
//     sdk: flutter
//   dio: 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HttpMethodsDemo(),
    );
  }
}

class HttpMethodsDemo extends StatelessWidget {
  final Dio _dio = Dio();

  HttpMethodsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('HTTP Methods Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _getRequest,
              child: const Text('GET Request'),
            ),
            ElevatedButton(
              onPressed: _postRequest,
              child: const Text('POST Request'),
            ),
            ElevatedButton(
              onPressed: _putRequest,
              child: const Text('PUT Request'),
            ),
            ElevatedButton(
              onPressed: _deleteRequest,
              child: const Text('DELETE Request'),
            ),
            ElevatedButton(
              onPressed: _patchRequest,
              child: const Text('PATCH Request'),
            ),
          ],
        ),
      ),
    );
  }

  void _getRequest() async {
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/posts/1');
      debugPrint('GET Response: ${response.data}');
    } catch (e) {
      debugPrint('GET Error: $e');
    }
  }

  void _postRequest() async {
    try {
      final response = await _dio.post('https://jsonplaceholder.typicode.com/posts',
        data: {
          'title': 'foo',
         'body': 'bar', 
         'userId': 1
         },
      );
      debugPrint('POST Response: ${response.data}');
    } catch (e) {
      debugPrint('POST Error: $e');
    }
  }

  void _putRequest() async {
    try {
      final response = await _dio.put('https://jsonplaceholder.typicode.com/posts/1',
        data: {'id': 1, 'title': 'foo', 'body': 'bar', 'userId': 1},
      );
      debugPrint('PUT Response: ${response.data}');
    } catch (e) {
      debugPrint('PUT Error: $e');
    }
  }

  void _deleteRequest() async {
    try {
      final response = await _dio.delete('https://jsonplaceholder.typicode.com/posts/1');
      debugPrint('DELETE Response: ${response.data}');
    } catch (e) {
      debugPrint('DELETE Error: $e');
    }
  }

  void _patchRequest() async {
    try {
      final response = await _dio.patch('https://jsonplaceholder.typicode.com/posts/1',
        data: {'title': 'foo patched'},
      );
      debugPrint('PATCH Response: ${response.data}');
    } catch (e) {
      debugPrint('PATCH Error: $e');
    }
  }
}