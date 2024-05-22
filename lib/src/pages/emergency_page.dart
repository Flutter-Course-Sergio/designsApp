import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/fat_button.dart';
import '../widgets/headers.dart';

class ItemButton {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;

  ItemButton(this.icon, this.text, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ItemButton> items = [
      ItemButton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemButton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemButton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemButton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
      ItemButton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemButton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemButton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemButton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
      ItemButton(FontAwesomeIcons.carBurst, 'Motor Accident',
          const Color(0xff6989F5), const Color(0xff906EF5)),
      ItemButton(FontAwesomeIcons.plus, 'Medical Emergency',
          const Color(0xff66A9F2), const Color(0xff536CF6)),
      ItemButton(FontAwesomeIcons.masksTheater, 'Theft / Harrasement',
          const Color(0xffF2D572), const Color(0xffE06AA3)),
      ItemButton(FontAwesomeIcons.personBiking, 'Awards',
          const Color(0xff317183), const Color(0xff46997D)),
    ];

    List<FatButton> itemMap = items
        .map((item) => FatButton(
            onPress: () => print('Click ${item.text}'),
            text: item.text,
            icon: item.icon,
            color1: item.color1,
            color2: item.color2))
        .toList();

    return Scaffold(
        body: Stack(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 200),
            child: ListView(
              children: [const SizedBox(height: 80), ...itemMap],
            )),
        const PageHeader()
      ],
    ));
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const IconHeader(
      icon: FontAwesomeIcons.plus,
      title: 'Haz solicitado',
      subtitle: 'Asistencia Médica',
      color1: Color(0xff526bf6),
      color2: Color(0xff67acf2),
    );
  }
}
