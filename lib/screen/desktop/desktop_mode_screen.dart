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

class DesktopLayout extends StatelessWidget {
  final double width;
  final double height;
  final bool isMobile;

  const DesktopLayout({
    super.key,
    required this.width,
    required this.height,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  BuildProfile(width: width, height: height, isMobile: false),
                  const SizedBox(height: 22),
                  const BuildSkill(isMobile: false),
                  const SizedBox(height: 22),
                  BuildExperience(
                    width: width,
                    height: height,
                    isMobile: false,
                    context: context,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  BuildSocialAccount(
                    height: height,
                    width: width,
                    isMobile: false,
                  ),
                  const SizedBox(height: 22),
                  BuildFlutterMap(height: height),
                  const SizedBox(height: 12),
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
                                isMobile: false,
                              ),
                        );
                      },
                      child: Center(child: TextNeo(text: "Open my project")),
                    ),
                  ),
                  const SizedBox(height: 22),
                  BuildLastCard(width: width, height: height, isMobile: false),
                ],
              ),
            ),
            const SizedBox(width: 8),
          ],
        );
      },
    );
  }
}
