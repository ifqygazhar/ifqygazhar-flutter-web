import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifqygazhar/core/style/colors.dart';

class TextNeo extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;

  const TextNeo({
    super.key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: true,
      style: GoogleFonts.rubik(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? blackClr,
      ),
    );
  }
}
