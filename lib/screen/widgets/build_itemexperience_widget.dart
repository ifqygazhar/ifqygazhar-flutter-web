import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifqygazhar/core/style/colors.dart';
import 'package:ifqygazhar/core/widgets/card_border_neo.dart';
import 'package:ifqygazhar/core/widgets/text_neo.dart';

class BuildItemExperience extends StatelessWidget {
  final bool isMobile;

  const BuildItemExperience({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return CardBorderNeo(
      color: whiteClr,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextNeo(
                    text: "Flutter Developer",
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  TextNeo(text: "Remote 2020 - 2021", fontSize: 12),
                ],
              ),
              const Spacer(),
              if (!isMobile)
                Row(
                  children: List.generate(4, (index) {
                    return CardBorderNeo(
                      color: whiteClr,
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(right: 8),
                      child: SvgPicture.asset('assets/icon/flutter.svg'),
                    );
                  }),
                ),
            ],
          ),
          const SizedBox(height: 8),
          TextNeo(
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.",
          ),
        ],
      ),
    );
  }
}
