import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifqygazhar/core/style/colors.dart';
import 'package:ifqygazhar/core/widgets/button_neo.dart';
import 'package:ifqygazhar/core/widgets/card_border_neo.dart';
import 'package:ifqygazhar/core/widgets/text_neo.dart';
import 'package:ifqygazhar/core/widgets/text_rich_neo.dart';

class BuildProfile extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;

  const BuildProfile({
    super.key,
    required this.width,
    required this.height,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate font sizes based on device type
    double fontSize1, fontSize2;
    double imageWidth, imageHeight;
    double contentHeight;
    EdgeInsets textPadding;

    if (isMobile) {
      fontSize1 = width < 415 ? width * 0.04 : width * 0.02;
      fontSize2 = width < 415 ? width * 0.024 : width * 0.01;
      imageWidth = width * 0.3;
      imageHeight = height * 0.2;
      contentHeight = height * 0.2;
      textPadding = const EdgeInsets.only(left: 8, top: 8);
    } else {
      fontSize1 = width * 0.016;
      fontSize2 = width * 0.011;
      imageWidth = width * 0.158;
      imageHeight = height * 0.32;
      contentHeight = height * 0.32;
      textPadding = const EdgeInsets.all(8);
    }

    return ButtonNeo(
      borderSize: 4,
      color: greenClr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardBorderNeo(
            width: imageWidth,
            height: imageHeight,
            color: whiteClr,
            padding: const EdgeInsets.all(0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset('assets/img/profile.jpeg', fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: CardBorderNeo(
              color: whiteClr,
              padding: textPadding,
              height: contentHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  TextRichNeo(
                    children: [
                      TextSpan(
                        text: 'Hi, My name is ',
                        style: GoogleFonts.rubik(
                          fontSize: fontSize1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'Ifqy Gifha Azhar 👋',
                        style: GoogleFonts.rubik(
                          fontSize: fontSize1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TextNeo(
                    text: "Im software developer specialy in",
                    fontSize: fontSize2,
                  ),
                  TextRichNeo(
                    children: [
                      TextSpan(
                        text: 'Mobile Development project with ',
                        style: GoogleFonts.rubik(
                          fontSize: fontSize2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: '1+ year experience',
                        style: GoogleFonts.rubik(
                          fontSize: fontSize2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TextNeo(
                    text: "Im using flutter and kotlin for mobile development",
                    fontSize: fontSize2,
                  ),
                  TextNeo(
                    text: "project, but for most used is flutter.",
                    fontSize: fontSize2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
