import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../routes/routes.dart';

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
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(
              color: Colors.blue,
            ),
        itemBuilder: (context, index) => ListTile(
              leading: FaIcon(pageRoutes[index].icon, color: Colors.blue),
              title: Text(pageRoutes[index].title),
              trailing: const Icon(
                Icons.chevron_right_rounded,
                color: Colors.blue,
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
    return Drawer(
      child: Column(
        children: [
          const SafeArea(
            child: SizedBox(
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text(
                  'SB',
                  style: TextStyle(fontSize: 50),
                ),
              ),
            ),
          ),
          const Expanded(child: _OptionsList()),
          ListTile(
            leading: const Icon(Icons.lightbulb_outline, color: Colors.blue),
            title: const Text('Dark Mode'),
            trailing: Switch.adaptive(
                value: true, activeColor: Colors.blue, onChanged: (value) {}),
          ),
          ListTile(
            leading: const Icon(Icons.add_to_home_screen, color: Colors.blue),
            title: const Text('Custom Theme'),
            trailing: Switch.adaptive(
                value: true, activeColor: Colors.blue, onChanged: (value) {}),
          ),
        ],
      ),
    );
  }
}
