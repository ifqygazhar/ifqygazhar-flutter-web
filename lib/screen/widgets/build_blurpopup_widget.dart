import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ifqygazhar/core/style/colors.dart';
import 'package:ifqygazhar/core/widgets/button_neo.dart';
import 'package:ifqygazhar/core/widgets/card_border_neo.dart';
import 'package:ifqygazhar/core/widgets/text_neo.dart';
import 'package:ifqygazhar/screen/widgets/build_itemexperience_widget.dart';
import 'package:ifqygazhar/screen/widgets/build_selfproject_widget.dart';

class BlurPopUpWidget extends StatelessWidget {
  final bool isExperience;
  final double width;
  final double height;
  final bool isMobile;

  const BlurPopUpWidget({
    super.key,
    this.isExperience = true,
    required this.width,
    required this.height,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: ButtonNeo(
          color: Colors.white,
          width: width * 0.8,
          height: height * 0.9,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextNeo(
                    text: isExperience ? "My Experience" : "Self Project",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: CardBorderNeo(
                        color: redClr,
                        child: Icon(Icons.close, color: whiteClr),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    if (isExperience) {
                      return BuildItemExperience(isMobile: isMobile);
                    } else {
                      return BuildSelfProject(isMobile: isMobile);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
