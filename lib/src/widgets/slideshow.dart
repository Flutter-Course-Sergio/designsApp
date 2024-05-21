import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsUp;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  const Slideshow(
      {super.key,
      required this.slides,
      this.dotsUp = false,
      this.primaryColor = Colors.blue,
      this.secondaryColor = Colors.grey,
      this.primaryBullet = 12,
      this.secondaryBullet = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (context) {
            Provider.of<_SlideshowModel>(context)._primaryColor = primaryColor;
            Provider.of<_SlideshowModel>(context)._secondaryColor =
                secondaryColor;
            Provider.of<_SlideshowModel>(context)._primaryBullet =
                primaryBullet;
            Provider.of<_SlideshowModel>(context)._secondaryBullet =
                secondaryBullet;

            return _SlideshowStructure(dotsUp: dotsUp, slides: slides);
          },
        )),
      ),
    );
  }
}

class _SlideshowStructure extends StatelessWidget {
  const _SlideshowStructure({
    required this.dotsUp,
    required this.slides,
  });

  final bool dotsUp;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (dotsUp) _Dots(slides.length),
        Expanded(child: _Slides(slides)),
        if (!dotsUp) _Dots(slides.length),
      ],
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
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
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

  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(totalSlides, (index) => _Dot(index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final ssModel = Provider.of<_SlideshowModel>(context);
    double size;
    Color color;

    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      size = ssModel.primaryBullet;
      color = ssModel.primaryColor;
    } else {
      size = ssModel.secondaryBullet;
      color = ssModel.secondaryColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: size,
      height: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.blue;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12;
  double _secondaryBullet = 12;

  double get currentPage => _currentPage;
  Color get primaryColor => _primaryColor;
  Color get secondaryColor => _secondaryColor;
  double get primaryBullet => _primaryBullet;
  double get secondaryBullet => _secondaryBullet;

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }

  set primaryColor(Color primary) {
    _primaryColor = primary;
    notifyListeners();
  }

  set secondaryColor(Color secondary) {
    _secondaryColor = secondary;
    notifyListeners();
  }

  set primaryBullet(double size) {
    _primaryBullet = size;
    notifyListeners();
  }

  set secondaryBullet(double size) {
    _secondaryBullet = size;
    notifyListeners();
  }
}
