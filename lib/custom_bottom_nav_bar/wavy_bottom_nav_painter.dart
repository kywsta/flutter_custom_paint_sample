// Custom painter specifically for the bottom nav bar background
import 'package:flutter/material.dart';

class WavyBottomNavPainter extends CustomPainter {
  final int numberOfCurves;
  final Color backgroundColor;
  final double amplitude;
  final bool startWithUp;

  WavyBottomNavPainter({
    required this.numberOfCurves,
    this.backgroundColor = Colors.white,
    this.amplitude = 20.0,
    this.startWithUp = true,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;

    final path = Path();

    // Calculate wave parameters
    final double curveWidth = size.width / numberOfCurves;
    final double waveHeight = amplitude;

    // Start from top-left, but offset by wave height
    path.moveTo(0, waveHeight);

    // Create the wave at the top
    for (int i = 0; i < numberOfCurves; i++) {
      final double startX = i * curveWidth;
      final double endX = (i + 1) * curveWidth;
      final double midX = startX + curveWidth / 2;

      bool isUpCurve;
      if (startWithUp) {
        isUpCurve = i % 2 == 0;
      } else {
        isUpCurve = i % 2 == 1;
      }

      final double controlY = isUpCurve ? 0 : waveHeight * 2;

      path.quadraticBezierTo(midX, controlY, endX, waveHeight);
    }

    // Complete the rectangle for the nav bar
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
