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
        appBar: AppBar(
          title: const Text('Custom Overlay Demo'),
        ),
        body: const Center(
          child: CustomOverlayDemo(),
        ),
      ),
    );
  }
}

class CustomOverlayDemo extends StatefulWidget {
  const CustomOverlayDemo({super.key});

  @override
  _CustomOverlayDemoState createState() => _CustomOverlayDemoState();
}

class _CustomOverlayDemoState extends State<CustomOverlayDemo> {
  OverlayEntry? _overlayEntry;

  OverlayEntry _createOverlayEntry(ThemeData theme) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: 100,
        left: MediaQuery.of(context).size.width / 4,
        width: MediaQuery.of(context).size.width / 2,
        child: Material(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'This is a custom overlay',
                  style: theme.textTheme.headlineLarge,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    _overlayEntry?.remove();
                    _overlayEntry = null;
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showOverlay(BuildContext context) {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }

    ThemeData customTheme = ThemeData(
      scaffoldBackgroundColor: Colors.blueAccent,
      textTheme: const TextTheme(
        headlineLarge: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );

    _overlayEntry = _createOverlayEntry(customTheme);
    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showOverlay(context),
      child: const Text('Show Custom Overlay'),
    );
  }
}
