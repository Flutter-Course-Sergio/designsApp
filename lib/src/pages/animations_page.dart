import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AnimatedSquare(),
      ),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({
    super.key,
  });

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));

    rotation = Tween(begin: 0.0, end: 2 * Math.pi).animate(controller);

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.rotate(
            angle: rotation.value, child: const _Rectangule());
      },
    );
  }
}

class _Rectangule extends StatelessWidget {
  const _Rectangule();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: const BoxDecoration(color: Colors.blue),
    );
  }
}
