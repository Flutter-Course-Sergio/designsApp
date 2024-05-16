import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> {
  double percentage = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          percentage += 10;
          if (percentage > 100) percentage = 0;
          setState(() {});
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(5),
        width: 300,
        height: 300,
        child: CustomPaint(
          painter: _RadialProgress(percentage),
        ),
      )),
    );
  }
}

class _RadialProgress extends CustomPainter {
  double percentage;
  _RadialProgress(this.percentage);

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
