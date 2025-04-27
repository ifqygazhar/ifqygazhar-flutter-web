import 'package:flutter/material.dart';
import 'package:ifqygazhar/core/style/colors.dart';
import 'package:ifqygazhar/core/widgets/button_neo.dart';
import 'package:ifqygazhar/core/widgets/text_neo.dart';
import 'package:ifqygazhar/screen/widgets/build_blurpopup_widget.dart';
import 'package:ifqygazhar/screen/widgets/build_itemexperience_widget.dart';

class BuildExperience extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;
  final BuildContext context;

  const BuildExperience({
    super.key,
    required this.width,
    required this.height,
    required this.context,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonNeo(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return BuildItemExperience(isMobile: isMobile);
              },
            ),
          ),
          const SizedBox(height: 8),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: ButtonNeo(
              width: double.infinity,
              shadowBottomPosition: -5,
              isMouse: false,
              color: greenClr,
              onTap: () {
                showDialog(
                  context: context,
                  barrierColor: Colors.black38,
                  builder:
                      (context) => BlurPopUpWidget(
                        isExperience: true,
                        width: width,
                        height: height,
                        isMobile: isMobile,
                      ),
                );
              },
              child: Center(child: TextNeo(text: "Show More")),
            ),
          ),
        ],
      ),
    );
  }
}
