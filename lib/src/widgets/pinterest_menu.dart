import 'package:flutter/material.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButton> items = [
    PinterestButton(onPressed: () => print('Pie chart'), icon: Icons.pie_chart),
    PinterestButton(onPressed: () => print('Search'), icon: Icons.search),
    PinterestButton(
        onPressed: () => print('Notifications'), icon: Icons.notifications),
    PinterestButton(
        onPressed: () => print('User'), icon: Icons.supervised_user_circle),
  ];

  PinterestMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Container( child: Text('Hola mundo')));
  }
}
