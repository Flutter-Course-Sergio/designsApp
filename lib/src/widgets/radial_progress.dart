import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;

  const RadialProgress(
      {super.key,
      required this.percentage,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double newPercentage = 0.0;

  @override
  void initState() {
    newPercentage = widget.percentage;

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);

    final diffAnimate = widget.percentage - newPercentage;
    newPercentage = widget.percentage;

    return AnimatedBuilder(
        animation: controller,
        builder: (BuildContext context, Widget? child) {
          return Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: _RadialProgressPainter(
                    percentage: ((widget.percentage - diffAnimate) +
                        (diffAnimate * controller.value)),
                    primaryColor: widget.primaryColor,
                    secondaryColor: widget.secondaryColor),
              ));
        });
  }
}

class _RadialProgressPainter extends CustomPainter {
  final double percentage;
  final Color primaryColor;
  final Color secondaryColor;

  _RadialProgressPainter(
      {required this.percentage,
      required this.primaryColor,
      required this.secondaryColor});

  @override
  void paint(Canvas canvas, Size size) {
    final paintCircle = Paint()
      ..strokeWidth = 4
      ..color = secondaryColor
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radius, paintCircle);

    final paintArc = Paint()
      ..strokeWidth = 8
      ..color = primaryColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
