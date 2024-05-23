import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../pages/slideshow_page.dart';
import '../pages/emergency_page.dart';
import '../pages/headers_page.dart';
import '../pages/animations_page.dart';
import '../pages/circular_graphics_page.dart';
import '../pages/pinteres_page.dart';
import '../pages/sliverlist_page.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'Slideshow', const SlideshowPage()),
  _Route(FontAwesomeIcons.truckMedical, 'Emergency', const EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Headers', const HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarryBox, 'Animated Square',
      const AnimationsPage()),
  _Route(
      FontAwesomeIcons.circleNotch, 'Graphics', const CircularGraphicsPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', const PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', const SliverlistPage()),
];

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}
