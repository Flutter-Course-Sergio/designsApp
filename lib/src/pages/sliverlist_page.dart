import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class SliverlistPage extends StatelessWidget {
  const SliverlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        _MainScroll(),
        Positioned(bottom: -10, right: 0, child: _BigFloatingButton()),
      ],
    ));
  }
}

class _BigFloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    final buttonStyle = ElevatedButton.styleFrom(
        fixedSize: Size(size.width * 0.7, 80),
        elevation: 0,
        backgroundColor: (appTheme.darkTheme)
            ? appTheme.currentTheme.colorScheme.secondary
            : const Color(0xffed6762),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(50))));

    final textStyle = TextStyle(
        color: (appTheme.darkTheme)
            ? appTheme.currentTheme.colorScheme.onSecondary
            : Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        letterSpacing: 2);

    return ButtonTheme(
        child: ElevatedButton(
      style: buttonStyle,
      onPressed: () {},
      child: Text('CREATE NEW LIST', style: textStyle),
    ));
  }
}

class _MainScroll extends StatelessWidget {
  final items = [
    const _TodoItem(text: 'Orange', color: Color(0xffF08F66)),
    const _TodoItem(text: 'Family', color: Color(0xffF2A38A)),
    const _TodoItem(text: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _TodoItem(text: 'Books', color: Color(0xffFCEBAF)),
    const _TodoItem(text: 'Orange', color: Color(0xffF08F66)),
    const _TodoItem(text: 'Family', color: Color(0xffF2A38A)),
    const _TodoItem(text: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _TodoItem(text: 'Books', color: Color(0xffFCEBAF)),
    const _TodoItem(text: 'Orange', color: Color(0xffF08F66)),
    const _TodoItem(text: 'Family', color: Color(0xffF2A38A)),
    const _TodoItem(text: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _TodoItem(text: 'Books', color: Color(0xffFCEBAF)),
    const _TodoItem(text: 'Orange', color: Color(0xffF08F66)),
    const _TodoItem(text: 'Family', color: Color(0xffF2A38A)),
    const _TodoItem(text: 'Subscriptions', color: Color(0xffF7CDD5)),
    const _TodoItem(text: 'Books', color: Color(0xffFCEBAF)),
  ];

  _MainScroll();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                minHeight: 200,
                maxHeight: 220,
                child: Container(
                    alignment: Alignment.centerLeft,
                    color: appTheme.currentTheme.scaffoldBackgroundColor,
                    child: const _Title()))),
        SliverList(
            delegate: SliverChildListDelegate([
          ...items,
          const SizedBox(
            height: 60,
          )
        ]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'New',
            style: TextStyle(
                color: (appTheme.darkTheme)
                    ? appTheme.currentTheme.colorScheme.primary
                    : const Color(0xff532128),
                fontSize: 50),
          ),
        ),
        Stack(
          children: [
            const SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                decoration: BoxDecoration(
                    color: (appTheme.darkTheme)
                        ? appTheme.currentTheme.colorScheme.secondary
                        : const Color(0xfff7cdd5)),
              ),
            ),
            Text(
              'List',
              style: TextStyle(
                  color: (appTheme.darkTheme)
                      ? appTheme.currentTheme.colorScheme.tertiary
                      : const Color(0xffd93a30),
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}

class _TodoItem extends StatelessWidget {
  final String text;
  final Color color;

  const _TodoItem({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(30),
      height: 130,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: (appTheme.darkTheme)
              ? appTheme.currentTheme.colorScheme.tertiary
              : color,
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }
}
