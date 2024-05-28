import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';
import '../widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {
  const PinterestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
          body: Stack(
        children: [const PinterestGrid(), _PinterestMenuLocation()],
      )),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final show = Provider.of<_MenuModel>(context).show;
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    if (width > 500) {
      width = width - 300;
    }

    return Positioned(
        bottom: 30,
        child: SizedBox(
            width: width,
            child: Row(
              children: [
                const Spacer(),
                PinterestMenu(
                  show: show,
                  backgroundColor: appTheme.scaffoldBackgroundColor,
                  activeColor: appTheme.colorScheme.primary,
                  inactiveColor: appTheme.colorScheme.onBackground,
                  items: [
                    PinterestButton(
                        onPressed: () => print('Pie chart'),
                        icon: Icons.pie_chart),
                    PinterestButton(
                        onPressed: () => print('Search'), icon: Icons.search),
                    PinterestButton(
                        onPressed: () => print('Notifications'),
                        icon: Icons.notifications),
                    PinterestButton(
                        onPressed: () => print('User'),
                        icon: Icons.supervised_user_circle),
                  ],
                ),
                const Spacer(),
              ],
            )));
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({
    super.key,
  });

  @override
  State<PinterestGrid> createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (index) => index);
  ScrollController controller = ScrollController();

  double lastScroll = 0;

  @override
  void initState() {
    controller.addListener(() {
      if (controller.offset > lastScroll && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).show = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).show = true;
      }

      lastScroll = controller.offset;
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int crossAxisCount;
    int crossAxisCellCount;
    double mainAxisCellCount;

    if (MediaQuery.of(context).size.width > 500) {
      crossAxisCount = 3;
      crossAxisCellCount = 1;
    } else {
      crossAxisCount = 4;
      crossAxisCellCount = 2;
    }

    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: crossAxisCount,
      itemCount: items.length,
      itemBuilder: (context, index) => _PinterestItem(index),
      staggeredTileBuilder: (index) {
        if (crossAxisCount == 4) {
          mainAxisCellCount = index.isEven ? 2 : 3;
        } else {
          mainAxisCellCount = index.isEven ? 1 : 2;
        }

        return StaggeredTile.count(crossAxisCellCount, mainAxisCellCount);
      },
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem(
    this.index,
  );

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: appTheme.currentTheme.colorScheme.primary,
          borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: CircleAvatar(
          backgroundColor: appTheme.currentTheme.colorScheme.onPrimary,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _show = true;
  bool get show => _show;

  set show(bool value) {
    _show = value;
    notifyListeners();
  }
}
