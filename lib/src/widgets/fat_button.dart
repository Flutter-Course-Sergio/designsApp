import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FatButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color1;
  final Color color2;
  final Color textColor;
  final Function() onPress;

  const FatButton(
      {super.key,
      required this.icon,
      required this.text,
      this.color1 = const Color(0xff6989f5),
      this.color2 = const Color(0xff906ef5),
      this.textColor = Colors.white,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _FatButtonBackground(icon, color1, color2),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 140,
            width: 40,
          ),
          FaIcon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(text, style: TextStyle(color: textColor, fontSize: 18)),
          ),
          const FaIcon(
            FontAwesomeIcons.chevronRight,
            color: Colors.white,
          ),
          const SizedBox(width: 40),
        ],
      )
    ]);
  }
}

class _FatButtonBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;

  const _FatButtonBackground(this.icon, this.color1, this.color2);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(4, 6),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(colors: [color1, color2])),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
                right: -20,
                top: -20,
                child: FaIcon(
                  icon,
                  size: 150,
                  color: Colors.white.withOpacity(0.2),
                ))
          ],
        ),
      ),
    );
  }
}
