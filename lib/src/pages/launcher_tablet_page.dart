import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../models/layout_model.dart';
import '../routes/routes.dart';
import '../theme/theme.dart';

class LauncherTabletPage extends StatelessWidget {
  const LauncherTabletPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final layoutModel = Provider.of<LayoutModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Diseño en Flutter - Tablet'),
        ),
        drawer: const _MainMenu(),
        body: Row(
          children: [
            const SizedBox(
              width: 300,
              height: double.infinity,
              child: _OptionsList(),
            ),
            Container(
              width: 1,
              height: double.infinity,
              color: appTheme.colorScheme.onBackground,
            ),
            Expanded(child: layoutModel.currentPage)
          ],
        ));
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
                final layoutModel =
                    Provider.of<LayoutModel>(context, listen: false);
                layoutModel.currentPage = pageRoutes[index].page;
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

    return Drawer(
      child: Column(
        children: [
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: appTheme.currentTheme.colorScheme.onBackground,
                child: Text(
                  'SB',
                  style: TextStyle(
                      fontSize: 50,
                      color: appTheme.currentTheme.colorScheme.background),
                ),
              ),
            ),
          ),
          const Expanded(child: _OptionsList()),
          ListTile(
            leading: Icon(Icons.lightbulb_outline,
                color: appTheme.currentTheme.colorScheme.secondary),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
                value: appTheme.darkTheme,
                activeColor: appTheme.currentTheme.colorScheme.tertiary,
                onChanged: (value) => appTheme.darkTheme = value),
          ),
          ListTile(
            leading: Icon(Icons.add_to_home_screen,
                color: appTheme.currentTheme.colorScheme.secondary),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
                value: appTheme.customTheme,
                activeColor: appTheme.currentTheme.colorScheme.tertiary,
                onChanged: (value) => appTheme.customTheme = value),
          ),
        ],
      ),
    );
  }
}
