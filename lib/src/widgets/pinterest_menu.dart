import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function() onPressed;
  final IconData icon;

  PinterestButton({required this.onPressed, required this.icon});
}

class PinterestMenu extends StatelessWidget {
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final bool show;

  final List<PinterestButton> items = [
    PinterestButton(onPressed: () => print('Pie chart'), icon: Icons.pie_chart),
    PinterestButton(onPressed: () => print('Search'), icon: Icons.search),
    PinterestButton(
        onPressed: () => print('Notifications'), icon: Icons.notifications),
    PinterestButton(
        onPressed: () => print('User'), icon: Icons.supervised_user_circle),
  ];

  PinterestMenu(
      {super.key,
      this.show = true,
      this.backgroundColor = Colors.white,
      this.activeColor = Colors.black,
      this.inactiveColor = Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => _MenuModel(),
        child: Builder(builder: (context) {
          Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
          Provider.of<_MenuModel>(context).activeColor = activeColor;
          Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;

          return AnimatedOpacity(
            opacity: (show) ? 1 : 0,
            duration: const Duration(milliseconds: 250),
            child: _PinterestMenuBackground(
              child: _MenuItems(items),
            ),
          );
        }));
  }
}

class _PinterestMenuBackground extends StatelessWidget {
  final Widget child;

  const _PinterestMenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    final colors = Provider.of<_MenuModel>(context);

    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: colors.backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38,
                offset: Offset(10, 10),
                blurRadius: 10,
                spreadRadius: -5)
          ]),
      child: child,
    );
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
            (index) => _PinterestMenuButton(index, menuItems[index])));
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final selectedItem = Provider.of<_MenuModel>(context).selectedItem;
    final colors = Provider.of<_MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).itemSelected = index;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: (selectedItem == index) ? 30 : 25,
        color:
            (selectedItem == index) ? colors.activeColor : colors.inactiveColor,
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _selectedItem = 0;
  Color backgroundColor = Colors.white;
  Color activeColor = Colors.black;
  Color inactiveColor = Colors.blueGrey;

  int get selectedItem => _selectedItem;

  set itemSelected(int index) {
    _selectedItem = index;
    notifyListeners();
  }
}
