import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Introtextwidget extends StatelessWidget {
  final String myText;

  const Introtextwidget({
    super.key,
    required this.myText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      myText,
      style: GoogleFonts.lato(
          fontSize: 20,
          color: const Color.fromARGB(255, 29, 72, 106),
          fontWeight: FontWeight.w400
      ),
    );
  }
}
