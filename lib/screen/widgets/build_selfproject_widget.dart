import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ifqygazhar/core/style/colors.dart';
import 'package:ifqygazhar/core/widgets/button_neo.dart';
import 'package:ifqygazhar/core/widgets/card_border_neo.dart';
import 'package:ifqygazhar/core/widgets/text_neo.dart';

class BuildSelfProject extends StatelessWidget {
  final bool isMobile;

  const BuildSelfProject({super.key, this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    return CardBorderNeo(
      color: whiteClr,
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder:
                    (context) => Dialog(
                      backgroundColor: Colors.transparent,
                      child: Image.asset(
                        'assets/img/banner.png',
                        fit: BoxFit.cover,
                      ),
                    ),
              );
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: SizedBox(
                height: 400, // Set fixed height to control image size
                width: double.infinity,
                child: Image.asset('assets/img/banner.png', fit: BoxFit.cover),
              ),
            ),
          ),
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
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: ButtonNeo(
                      shadowBottomPosition: -4,
                      shadowRightPosition: -4,
                      color: greenClr,
                      onTap: () {},
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icon/github.svg', width: 20),
                          const SizedBox(width: 4),
                          TextNeo(text: "Open Project", fontSize: 12),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: List.generate(4, (index) {
                  return CardBorderNeo(
                    color: blackClr,
                    borderColor: Colors.transparent,
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.only(right: 8),
                    child: SvgPicture.asset('assets/icon/flutter.svg'),
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 4),
          TextNeo(
            text:
                "lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptate, quibusdam",
          ),
        ],
      ),
    );
  }
}
