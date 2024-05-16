import 'package:flutter/material.dart';

//import 'package:designs_app/src/pages/headers_page.dart';
//import 'package:designs_app/src/pages/animations_page.dart';
import 'src/challenges/square_animated_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SquareAnimatedPage(),
      title: 'Designs App',
      debugShowCheckedModeBanner: false,
    );
  }
}
