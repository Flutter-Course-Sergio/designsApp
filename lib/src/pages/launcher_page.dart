import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../routes/routes.dart';
import '../theme/theme.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Diseño en Flutter'),
        ),
        drawer: const _MainMenu(),
        body: const _OptionsList());
  }
}

class _OptionsList extends StatelessWidget {
  const _OptionsList();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => Divider(
              color: appTheme.primaryColorLight,
            ),
        itemBuilder: (context, index) => ListTile(
              leading: FaIcon(pageRoutes[index].icon,
                  color: appTheme.colorScheme.secondary),
              title: Text(pageRoutes[index].title),
              trailing: Icon(
                Icons.chevron_right_rounded,
                color: appTheme.colorScheme.secondary,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pageRoutes[index].page,
                    ));
              },
            ),
        itemCount: pageRoutes.length);
  }
}

class _MainMenu extends StatelessWidget {
  const _MainMenu();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.colorScheme.secondary;

    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: accentColor,
                child: const Text(
                  'SB',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          const Expanded(child: _OptionsList()),
          ListTile(
            leading: Icon(Icons.lightbulb_outline, color: accentColor),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: accentColor,
                onChanged: (value) => appTheme.darkTheme = value),
          ),
          ListTile(
            leading: Icon(Icons.add_to_home_screen, color: accentColor),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
                value: appTheme.customTheme,
                activeColor: accentColor,
                onChanged: (value) => appTheme.customTheme = value),
          ),
        ],
      ),
    );
  }
}
