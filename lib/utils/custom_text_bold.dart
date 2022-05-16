import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class custom_text_bold extends StatelessWidget {
  final String text;
  final Color color;
  final double size;

  const custom_text_bold(
      {Key? key, required this.text, required this.color, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
