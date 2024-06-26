import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';
import '../widgets/slideshow.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLarge;

    if (MediaQuery.of(context).size.height > 500) {
      isLarge = true;
    } else {
      isLarge = false;
    }

    final children = [
      const Expanded(child: MySlideshow()),
      const Expanded(child: MySlideshow()),
    ];

    return Scaffold(
        body: (isLarge) ? Column(children: children) : Row(children: children));
  }
}

class MySlideshow extends StatelessWidget {
  const MySlideshow({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final primaryThemeColor = appTheme.currentTheme.colorScheme.primary;
    final secondaryThemeColor = appTheme.currentTheme.colorScheme.secondary;

    return Slideshow(
      primaryColor: (appTheme.darkTheme)
          ? primaryThemeColor
          : Colors.greenAccent.shade400,
      secondaryColor: secondaryThemeColor,
      primaryBullet: 15,
      secondaryBullet: 12,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}
