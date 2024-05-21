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
    return Center(
        child: Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100)),
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                offset: Offset(10, 10),
                blurRadius: 10,
                spreadRadius: -5)
          ]),
      child: _MenuItems(items),
    ));
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(menuItems.length,
            (index) => _PinterestMenuItem(index, menuItems[index])));
  }
}

class _PinterestMenuItem extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuItem(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(item.icon),
    );
  }
}
