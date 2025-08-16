import 'package:flutter/material.dart';
class HeartPainter extends CustomPainter {
  final Color color;

  HeartPainter({super.repaint, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, size.height / 2); // Start at the center

    // Create the heart shape using various path methods
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.35,
      size.width / 2,
      size.height * 0.2,
    );
    path.arcToPoint(
      Offset(size.width * 0.25, size.height * 0.35),
      radius: Radius.circular(20.0),
      clockwise: false,
    );
    path.quadraticBezierTo(
      size.width / 2,
      size.height * 0.7,
      size.width * 0.75,
      size.height * 0.35,
    );
    path.close(); // Close the path to create a filled shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
