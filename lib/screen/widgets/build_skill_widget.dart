import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifqygazhar/core/constant/list_skill.dart';
import 'package:ifqygazhar/core/style/colors.dart';
import 'package:ifqygazhar/core/widgets/button_neo.dart';
import 'package:ifqygazhar/core/widgets/card_border_neo.dart';

class BuildSkill extends StatelessWidget {
  final bool isMobile;

  const BuildSkill({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    final padding =
        isMobile
            ? const EdgeInsets.symmetric(horizontal: 4, vertical: 4)
            : const EdgeInsets.symmetric(horizontal: 10, vertical: 10);

    return ButtonNeo(
      width: double.infinity,
      color: greenClr,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(9, (index) {
            return CardBorderNeo(
              color: Colors.white,
              padding: padding,
              margin: EdgeInsets.only(left: index == 0 ? 8 : 0, right: 24),
              child: SvgPicture.asset(
                iconSkill[index],
                colorFilter:
                    index == 8
                        ? ColorFilter.mode(Colors.black, BlendMode.srcIn)
                        : null,
              ),
            );
          }),
        ),
      ),
    );
  }
}
