import 'package:flutter/material.dart';

class CustomBottomNavBarPainter extends CustomPainter {
  final Color backgroundColor;

  CustomBottomNavBarPainter({super.repaint, required this.backgroundColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.cubicTo(
      size.width / 2,
      0,
      size.width / 2,
      size.height,
      size.width / 2,
      0,
    );

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
