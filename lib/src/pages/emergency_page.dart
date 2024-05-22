import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/headers.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: IconHeader(
        icon: FontAwesomeIcons.plus,
        title: 'Haz solicitado',
        subtitle: 'Asistencia Médica',
        color1: Color(0xff526bf6),
        color2: Color(0xff67acf2),
      ),
    );
  }
}
