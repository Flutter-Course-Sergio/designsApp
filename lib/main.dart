import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/models/layout_model.dart';
import 'src/pages/launcher_page.dart';
import 'src/pages/launcher_tablet_page.dart';
import 'src/theme/theme.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => LayoutModel(),
    child: ChangeNotifierProvider(
        create: (_) => ThemeChanger(2), child: const MainApp()),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: appTheme,
      home: OrientationBuilder(
        builder: (context, orientation) {
          final screenSize = MediaQuery.of(context).size;
          if (screenSize.width > 500) return const LauncherTabletPage();
          return const LauncherPage();
        },
      ),
      title: 'Designs App',
      debugShowCheckedModeBanner: false,
    );
  }
}
