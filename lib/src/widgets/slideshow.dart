import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/slider_model.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsUp;
  final Color primaryColor;
  final Color secondaryColor;

  const Slideshow(
      {super.key,
      required this.slides,
      this.dotsUp = false,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: SafeArea(
        child: Center(
            child: Column(
          children: [
            if (dotsUp) _Dots(slides.length, primaryColor, secondaryColor),
            Expanded(child: _Slides(slides)),
            if (!dotsUp) _Dots(slides.length, primaryColor, secondaryColor),
          ],
        )),
      ),
    );
  }
}

class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
        controller: pageViewController,
        children: widget.slides.map((slide) => _Slide(slide)).toList());
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(30),
        child: slide);
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;
  final Color primaryColor;
  final Color secondaryColor;

  const _Dots(this.totalSlides, this.primaryColor, this.secondaryColor);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            totalSlides, (index) => _Dot(index, primaryColor, secondaryColor)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color primaryColor;
  final Color secondaryColor;

  const _Dot(this.index, this.primaryColor, this.secondaryColor);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
              ? primaryColor
              : secondaryColor,
          shape: BoxShape.circle),
    );
  }
}
