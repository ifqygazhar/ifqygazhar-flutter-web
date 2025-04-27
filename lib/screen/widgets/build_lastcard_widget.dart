import 'package:flutter/material.dart';
import 'package:ifqygazhar/core/style/colors.dart';
import 'package:ifqygazhar/core/utils/open_url.dart';
import 'package:ifqygazhar/core/widgets/button_neo.dart';
import 'package:ifqygazhar/core/widgets/card_border_neo.dart';
import 'package:ifqygazhar/core/widgets/rive_bird.dart';
import 'package:ifqygazhar/core/widgets/text_neo.dart';

class BuildLastCard extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;

  const BuildLastCard({
    super.key,
    required this.width,
    required this.height,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final emailFontSize = isMobile ? width * 0.026 : null;
    final cvFontSize = isMobile ? width * 0.028 : null;
    final footerFontSize = isMobile ? height * 0.011 : height * 0.018;
    final double buttonHeight = isMobile ? height * 0.25 : height * 0.34;

    return ButtonNeo(
      height: buttonHeight,
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RiveBirbWidget(width: width, height: height, isMobile: isMobile),
          const SizedBox(width: 8),
          Expanded(
            child: CardBorderNeo(
              color: redClr,
              child: Column(
                spacing: 4,
                children: [
                  Row(
                    children: [
                      CardBorderNeo(
                        color: Colors.white,
                        child: Icon(Icons.email_sharp, color: secondaryClr),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: CardBorderNeo(
                          color: Colors.white,
                          child: TextNeo(
                            text: "ifqygazhar@gmail.com",
                            fontSize: emailFontSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CardBorderNeo(
                        color: Colors.white,
                        child: Icon(
                          Icons.collections_bookmark,
                          color: secondaryClr,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            windowOpen(
                              'https://drive.google.com/file/d/1y_er4lrQvT-8j0OaP3z_rWk5eBYChv6h/view?usp=drive_link',
                              '_blank',
                              'noopener,noreferrer',
                            );
                          },
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: CardBorderNeo(
                              width: double.infinity,
                              color: greenClr,
                              child: TextNeo(
                                text: "CV Download Here",
                                fontSize: cvFontSize,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  isMobile ? SizedBox(height: height * 0.01) : const Spacer(),
                  Expanded(
                    child: CardBorderNeo(
                      color: Colors.white,
                      child: Center(
                        child: TextNeo(
                          text: "Made With 💙 by Ifqy Gifha Azhar",
                          fontSize: footerFontSize,
                        ),
                      ),
                    ),
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
