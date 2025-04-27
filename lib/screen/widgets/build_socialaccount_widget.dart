import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifqygazhar/core/style/colors.dart';
import 'package:ifqygazhar/core/utils/open_url.dart';
import 'package:ifqygazhar/core/widgets/button_neo.dart';
import 'package:ifqygazhar/core/widgets/card_border_neo.dart';

class BuildSocialAccount extends StatelessWidget {
  final double height;
  final double width;
  final bool isMobile;

  const BuildSocialAccount({
    super.key,
    required this.height,
    required this.width,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    final double cardWidth = isMobile ? width * 0.18 : width * 0.05;
    final double buttonHeight = isMobile ? height * 0.2 : height * 0.35;

    return Row(
      children: [
        Expanded(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: ButtonNeo(
              height: buttonHeight,
              width: double.infinity,
              borderColor: const Color(0xFF838485),
              color: const Color(0xFF24292E),
              onTap: () {
                windowOpen(
                  'https://github.com/ifqygazhar',
                  '_blank',
                  'noopener,noreferrer',
                );
              },
              child: Stack(
                children: [
                  CardBorderNeo(
                    width: cardWidth,
                    height: height * 0.08,
                    color: whiteClr,
                    child: SvgPicture.asset('assets/icon/github.svg'),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: ButtonNeo(
              height: buttonHeight,
              width: double.infinity,
              color: Color(0xFF0177B4),
              onTap: () {
                windowOpen(
                  'https://linkedin.com/in/ifqygazhar',
                  '_blank',
                  'noopener,noreferrer',
                );
              },
              child: Stack(
                children: [
                  CardBorderNeo(
                    width: cardWidth,
                    height: height * 0.08,
                    color: whiteClr,
                    child: SvgPicture.asset('assets/icon/linkedin.svg'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
