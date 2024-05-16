import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final percentage;

  const RadialProgress({super.key, required this.percentage});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: double.infinity,
        child: CustomPaint(
          painter: _RadialProgressPainter(widget.percentage),
        ));
  }
}

class _RadialProgressPainter extends CustomPainter {
  double percentage;
  _RadialProgressPainter(this.percentage);

  @override
  void paint(Canvas canvas, Size size) {
    final paintCircle = Paint()
      ..strokeWidth = 4
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paintCircle);

    final paintArc = Paint()
      ..strokeWidth = 8
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
