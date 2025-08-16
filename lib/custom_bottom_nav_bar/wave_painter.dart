import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  final int numberOfCurves;
  final Color waveColor;
  final double strokeWidth;
  final double amplitude;
  final bool startWithUp;

  WavePainter({
    required this.numberOfCurves,
    this.waveColor = Colors.blue,
    this.strokeWidth = 3.0,
    this.amplitude = 50.0,
    this.startWithUp = true,
  }) : assert(numberOfCurves >= 2, 'Number of curves must be at least 2');

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = waveColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();

    // Calculate wave parameters
    final double curveWidth = size.width / numberOfCurves;
    final double centerY = size.height / 2;

    // Start from the left edge
    path.moveTo(0, centerY);

    // Generate wave curves with alternating pattern
    // Can start with up or down, supports both odd and even curve counts
    for (int i = 0; i < numberOfCurves; i++) {
      final double startX = i * curveWidth;
      final double endX = (i + 1) * curveWidth;
      final double midX = startX + curveWidth / 2;

      // Determine curve direction based on startWithUp and alternating pattern
      bool isUpCurve;
      if (startWithUp) {
        isUpCurve = i % 2 == 0; // Start up: up-down-up-down...
      } else {
        isUpCurve = i % 2 == 1; // Start down: down-up-down-up...
      }

      final double controlY = isUpCurve
          ? centerY - amplitude
          : centerY + amplitude;

      // Create smooth quadratic bezier curve
      path.quadraticBezierTo(midX, controlY, endX, centerY);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    if (oldDelegate is WavePainter) {
      return oldDelegate.numberOfCurves != numberOfCurves ||
          oldDelegate.waveColor != waveColor ||
          oldDelegate.strokeWidth != strokeWidth ||
          oldDelegate.amplitude != amplitude ||
          oldDelegate.startWithUp != startWithUp;
    }
    return true;
  }
}