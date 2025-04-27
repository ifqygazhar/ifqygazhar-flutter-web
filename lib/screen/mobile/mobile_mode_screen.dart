import 'package:flutter/material.dart';
import 'package:ifqygazhar/core/style/colors.dart';
import 'package:ifqygazhar/core/widgets/button_neo.dart';
import 'package:ifqygazhar/core/widgets/text_neo.dart';
import 'package:ifqygazhar/screen/widgets/build_blurpopup_widget.dart';
import 'package:ifqygazhar/screen/widgets/build_experience_widget.dart';
import 'package:ifqygazhar/screen/widgets/build_fluttermap_widget.dart';
import 'package:ifqygazhar/screen/widgets/build_lastcard_widget.dart';
import 'package:ifqygazhar/screen/widgets/build_profile_widget.dart';
import 'package:ifqygazhar/screen/widgets/build_skill_widget.dart';
import 'package:ifqygazhar/screen/widgets/build_socialaccount_widget.dart';

class MobileLayout extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;

  const MobileLayout({
    super.key,
    required this.width,
    required this.height,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildProfile(width: width, height: height, isMobile: true),
            const SizedBox(height: 18),
            BuildSkill(isMobile: true),
            const SizedBox(height: 18),
            BuildExperience(
              width: width,
              height: height,
              isMobile: true,
              context: context,
            ),
            const SizedBox(height: 18),
            BuildSocialAccount(height: height, width: width, isMobile: true),
            const SizedBox(height: 18),
            BuildFlutterMap(height: height),
            const SizedBox(height: 18),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: ButtonNeo(
                color: greenClr,
                onTap: () {
                  showDialog(
                    context: context,
                    barrierColor: Colors.black38,
                    builder:
                        (context) => BlurPopUpWidget(
                          isExperience: false,
                          width: width,
                          height: height,
                          isMobile: true,
                        ),
                  );
                },
                child: Center(child: TextNeo(text: "Open my project")),
              ),
            ),
            const SizedBox(height: 18),
            BuildLastCard(width: width, height: height, isMobile: true),
          ],
        );
      },
    );
  }
}
