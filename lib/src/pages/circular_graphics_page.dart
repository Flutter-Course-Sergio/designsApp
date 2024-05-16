import 'package:flutter/material.dart';

import '../widgets/radial_progress.dart';

class CircularGraphicsPage extends StatefulWidget {
  const CircularGraphicsPage({super.key});

  @override
  State<CircularGraphicsPage> createState() => _CircularGraphicsPageState();
}

class _CircularGraphicsPageState extends State<CircularGraphicsPage> {
  double percentage = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            percentage += 10;
            if (percentage > 100) percentage = 0;
          });
        },
        child: const Icon(Icons.refresh),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: RadialProgress(percentage: percentage),
        ),
      ),
    );
  }
}
