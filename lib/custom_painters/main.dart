import 'package:flutter/material.dart';
import 'package:flutter_custom_paint_sample/custom_painters/circle_painter.dart';
import 'package:flutter_custom_paint_sample/custom_painters/heart_painter.dart';
import 'package:flutter_custom_paint_sample/custom_painters/line_painter.dart';
import 'package:flutter_custom_paint_sample/custom_painters/rect_painter.dart';

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
        child: SingleChildScrollView(
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
              CustomPaint(
                painter: RectPainter(color: Colors.blue),
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Center(child: Text("Hello, I am in a rectangle")),
                ),
              ),
              CustomPaint(
                painter: CirclePainter(color: Colors.green),
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Center(child: Text("Hello, I am in a circle")),
                ),
              ),
              CustomPaint(
                painter: HeartPainter(color: Colors.purple),
                child: SizedBox(
                  height: 300,
                  width: 300,
                  child: Center(child: Text("Hello, I am in a heart")),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
