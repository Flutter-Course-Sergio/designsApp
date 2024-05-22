import 'package:flutter/material.dart';

import 'src/pages/sliverlist_page.dart';

//import 'src/pages/headers_page.dart';
//import 'src/pages/animations_page.dart';
//import 'src/challenges/square_animated_page.dart';
//import 'src/pages/circular_graphics_page.dart';
//import 'src/pages/slideshow_page.dart';
//import 'src/pages/pinteres_page.dart';
//import 'src/pages/emergency_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SliverlistPage(),
      title: 'Designs App',
      debugShowCheckedModeBanner: false,
    );
  }
}
