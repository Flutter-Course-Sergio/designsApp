import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/launcher_page.dart';
import 'src/theme/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => ThemeChanger(2), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: appTheme,
      home: const LauncherPage(),
      title: 'Designs App',
      debugShowCheckedModeBanner: false,
    );
  }
}
