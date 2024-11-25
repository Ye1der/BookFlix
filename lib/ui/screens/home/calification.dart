import 'package:flutter/material.dart';
import 'dart:math';

class CircularRatingPainter extends CustomPainter {
  final double rating;
  final Color backgroundColor;
  final Color fillColor;

  CircularRatingPainter({
    required this.rating,
    required this.backgroundColor,
    required this.fillColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2);

    // Fondo
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Borde que representa el rating
    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    double sweepAngle = 2 * pi * (rating / 100);
    final rect = Rect.fromCircle(center: center, radius: radius);

    canvas.drawArc(rect, -pi / 2, sweepAngle, false, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class MovieRatingWidget extends StatelessWidget {
  final double rating;

  const MovieRatingWidget({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
      Container(
        height: 73,
        width: 73,
        decoration: BoxDecoration(
          color: const Color(0xFF081C22),
          borderRadius: BorderRadius.circular(50)
        ),
      ),
      CustomPaint(
        size: const Size(200, 200), // Aumenta el tamaño aquí
        painter: CircularRatingPainter(
          rating: rating,
          backgroundColor: const Color(0xFF403C0F),
          fillColor: const Color(0xFFD2D531),
        ),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            height: 60,
            width: 60,
            child: Text(
              "${rating.toInt()}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, color: Colors.white), // Ajustar el tamaño de texto
            )
          )
        ),
      )
    ]);
  }
}
