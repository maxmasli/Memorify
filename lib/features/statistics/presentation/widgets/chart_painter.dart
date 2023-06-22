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
        data.reduce((value, element) => value > element ? value : element);

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

    //draw text
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    const each = 4;
    final gap = maxY ~/ each;
    final countMarks = size.height ~/ gap;

    final marks = List.generate(countMarks, (index) => index);

    for (var i = 0; i < marks.length; i++) {
      final textSpan = TextSpan(text: (i * each).toString(), style: textStyle);
      final textPainter = TextPainter(
        text: textSpan,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: size.width);

      // final offset = Offset(
      //   (size.width - textPainter.width) / 2,
      //   (size.height - textPainter.height) / 2,
      // );
      //maxY / 5 = gap
      //size.height / gap = count
      final offset = Offset(
        0,
        size.height - (i * gap) - 26,
      );

      textPainter.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
