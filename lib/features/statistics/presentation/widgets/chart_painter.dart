import 'package:flutter/material.dart';
import 'package:memorify/core/styles/colors.dart';

class ChartPainter extends CustomPainter {
  ChartPainter(this.data);

  final List<double> data;

  @override
  void paint(Canvas canvas, Size size) {
    const minX = 0.0;
    final maxX = data.length.toDouble() - 1;
    final minY =
        data.reduce((value, element) => value < element ? value : element);
    final maxY =
        data.reduce((value, element) => value > element ? value : element) + 2;

    final scaleX = size.width / (maxX - minX);
    final scaleY = size.height / (maxY - minY);

    final linePaint = Paint()
      ..color = AppColors.darkPink
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final path = Path()..moveTo(0, size.height - (data[0] - minY) * scaleY);

    for (var i = 1; i < data.length; i++) {
      final x = i.toDouble() * scaleX;
      final y = size.height - (data[i] - minY) * scaleY;
      path.lineTo(x, y);
    }

    canvas.drawPath(path, linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
