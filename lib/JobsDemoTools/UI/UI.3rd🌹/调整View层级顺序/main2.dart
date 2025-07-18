import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: const PageA(),
    routes: {
      '/pageA': (context) => const PageA(),
      '/pageB': (context) => const PageB(),
      '/pageC': (context) => const PageC(),
    },
  ));
}

// PageA
class PageA extends StatelessWidget {
  const PageA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page A')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/pageB');
          },
          child: const Text('Go to Page B'),
        ),
      ),
    );
  }
}

// PageB
class PageB extends StatelessWidget {
  const PageB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page B')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/pageC');
          },
          child: const Text('Go to Page C'),
        ),
      ),
    );
  }
}

// PageC
class PageC extends StatelessWidget {
  const PageC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page C')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 将 PageA 置于顶层，并关闭所有其他页面
            Navigator.pushNamedAndRemoveUntil(context, '/pageA', (route) => route.isFirst);
          },
          child: const Text('Go back to Page A'),
        ),
      ),
    );
  }
}
