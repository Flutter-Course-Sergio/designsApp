import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/launcher_page.dart';
import 'src/theme/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ThemeChanger(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LauncherPage(),
      title: 'Designs App',
      debugShowCheckedModeBanner: false,
    );
  }
}
