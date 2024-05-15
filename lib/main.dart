import 'package:designs_app/src/pages/headers_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HeadersPage(),
      title: 'Designs App',
      debugShowCheckedModeBanner: false,
    );
  }
}