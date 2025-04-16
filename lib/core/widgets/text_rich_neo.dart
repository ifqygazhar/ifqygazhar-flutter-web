import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextRichNeo extends StatelessWidget {
  final List<TextSpan> children;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  const TextRichNeo({
    super.key,
    required this.children,
    this.fontSize = 14,
    this.fontWeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: children,
        style: GoogleFonts.rubik(
          fontSize: fontSize,
          fontWeight: fontWeight ?? FontWeight.w500,
        ),
      ),
      textAlign: textAlign,
      softWrap: true,
    );
  }
}
