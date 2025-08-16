import 'package:flutter/material.dart';
import 'package:flutter_custom_paint_sample/custom_painters/line_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomPaint(
              painter: LinePainter(color: Colors.red),
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: Center(child: Text("Hello, I am on the line")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
