// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//Widgets
class SquareHeader extends StatelessWidget {
  const SquareHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: const Color(0xff615aab),
    );
  }
}

class CircularHeader extends StatelessWidget {
  const CircularHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
          color: Color(0xff615aab),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(70),
              bottomRight: Radius.circular(70))),
    );
  }
}

class DiagonalHeader extends StatelessWidget {
  const DiagonalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _DiagonalHeaderPainter(),
      ),
    );
  }
}

class TrianguleHeader extends StatelessWidget {
  const TrianguleHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _TrianguleHeaderPainter(),
      ),
    );
  }
}

class SharpHeader extends StatelessWidget {
  const SharpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _SharpHeaderPainter(),
      ),
    );
  }
}

class CurveHeader extends StatelessWidget {
  const CurveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _CurveHeaderPainter(),
      ),
    );
  }
}

class WaveHeader extends StatelessWidget {
  const WaveHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _WaveHeaderPainter(),
      ),
    );
  }
}

class WaveHeaderGradient extends StatelessWidget {
  const WaveHeaderGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _WaveHeaderGradientPainter(),
      ),
    );
  }
}

// Painters
class _DiagonalHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Props
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    // Drawing
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _TrianguleHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Props
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2;

    final path = Path();

    // Drawing
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _SharpHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Props
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    // Drawing
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _CurveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Props
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    // Drawing
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _WaveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    // Props
    paint.color = const Color(0xff615aab);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    // Drawing
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _WaveHeaderGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: const Offset(0, 55), radius: 180);

    const Gradient gradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Color(0xff6d05e8),
          Color(0xffc012ff),
          Color(0xff6d05fa),
        ],
        stops: [
          0.0,
          0.5,
          1.0
        ]);

    final paint = Paint()..shader = gradient.createShader(rect);

    // Props
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    // Drawing
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,
        size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// Emergency header
class IconHeader extends StatelessWidget {
  const IconHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final Color textColor = Colors.white.withOpacity(0.7);

    return Stack(children: [
      const _IconHeaderBackground(),
      Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            FontAwesomeIcons.plus,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          )),
      Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Text(
              'Haz solicitado',
              style: TextStyle(fontSize: 20, color: textColor),
            ),
            const SizedBox(height: 20),
            Text(
              'Asistencia Médica',
              style: TextStyle(
                  fontSize: 25, color: textColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const FaIcon(FontAwesomeIcons.plus, size: 80, color: Colors.white)
          ],
        ),
      )
    ]);
  }
}

class _IconHeaderBackground extends StatelessWidget {
  const _IconHeaderBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.center,
              colors: [
                Color(0xff526bf6),
                Color(0xff67acf2),
              ])),
    );
  }
}
