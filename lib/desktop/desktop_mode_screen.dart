import 'dart:js_interop' as js;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ifqygazhar/core/constant/list_skill.dart';
import 'package:ifqygazhar/core/style/colors.dart';
import 'package:ifqygazhar/core/widgets/button_neo.dart';
import 'package:ifqygazhar/core/widgets/card_border_neo.dart';
import 'package:ifqygazhar/core/widgets/text_neo.dart';
import 'package:ifqygazhar/core/widgets/text_rich_neo.dart';
import 'package:ifqygazhar/widgets/rive_bird.dart';
import 'package:latlong2/latlong.dart';

@js.JS('window.open')
external void windowOpen(String url, String target, String? features);

class DesktopModeScreen extends StatelessWidget {
  final double width;
  final double height;
  const DesktopModeScreen({
    super.key,
    required this.width,
    required this.height,
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
                  _buildProfile(width, height),
                  const SizedBox(height: 22),
                  _buildSkill(),
                  const SizedBox(height: 22),
                  _buildExperience(),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  _buildSocialAccount(height, width, context),
                  const SizedBox(height: 22),
                  _buildFlutterMap(height),
                  const SizedBox(height: 12),
                  ButtonNeo(
                    color: greenClr,
                    child: Center(child: TextNeo(text: "Open my project")),
                  ),
                  const SizedBox(height: 22),
                  ButtonNeo(
                    height: height * 0.34,
                    color: Colors.white,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RiveBirbWidget(width: width, height: height),
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
                                      child: Icon(
                                        Icons.email_sharp,
                                        color: secondaryClr,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    Expanded(
                                      child: CardBorderNeo(
                                        color: Colors.white,
                                        child: TextNeo(
                                          text: "ifqygazhar@gmail.com",
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
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                CardBorderNeo(
                                  width: double.infinity,
                                  color: Colors.white,
                                  child: Center(
                                    child: TextNeo(
                                      text: "Made With 💙 by Ifqy Gifha Azhar",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
          ],
        );
      },
    );
  }

  ButtonNeo _buildFlutterMap(double height) {
    return ButtonNeo(
      height: height * 0.2,
      width: double.infinity,
      padding: const EdgeInsets.all(0),
      borderSize: 4,
      color: whiteClr,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(-6.905977, 107.613144),
            initialZoom: 10,
          ),
          children: [
            TileLayer(
              urlTemplate:
                  'https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',
              userAgentPackageName: 'dev.fleaflicker.flutter.map',
            ),
            MarkerLayer(
              markers: [
                const Marker(
                  point: LatLng(-6.905977, 107.613144),
                  child: Icon(Icons.location_pin, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildSocialAccount(double height, double width, BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: ButtonNeo(
              height: height * 0.35,
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
                    width: width * 0.05,
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
              height: height * 0.35,
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
                    width: width * 0.05,
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

  ButtonNeo _buildExperience() {
    return ButtonNeo(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildItemExperience();
              },
            ),
          ),
          const SizedBox(height: 8),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: ButtonNeo(
              width: double.infinity,
              isMouse: false,
              color: greenClr,
              child: Center(child: TextNeo(text: "Show More")),
            ),
          ),
        ],
      ),
    );
  }

  CardBorderNeo _buildItemExperience() {
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
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: secondaryClr,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: SvgPicture.asset('assets/icon/flutter.svg'),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextNeo(
            text:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.",
          ),
        ],
      ),
    );
  }

  ButtonNeo _buildSkill() {
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
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              margin: EdgeInsets.only(left: index == 0 ? 8 : 0, right: 24),
              decoration: BoxDecoration(
                color: secondaryClr,
                borderRadius: BorderRadius.circular(4),
              ),
              child: SvgPicture.asset(iconSkill[index]),
            );
          }),
        ),
      ),
    );
  }

  ButtonNeo _buildProfile(double width, double height) {
    return ButtonNeo(
      borderSize: 4,
      color: greenClr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardBorderNeo(
            width: width * 0.165,
            height: height * 0.32,
            color: whiteClr,
            padding: const EdgeInsets.all(0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset('assets/img/profile.jpeg', fit: BoxFit.cover),
            ),
            // child: TextNeo(text: "Photo in here", fontSize: width * 0.016),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              TextRichNeo(
                children: [
                  TextSpan(
                    text: 'Hi, My name is ',
                    style: GoogleFonts.rubik(
                      fontSize: width * 0.016,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: 'Ifqy Gifha Azhar 👋',
                    style: GoogleFonts.rubik(
                      fontSize: width * 0.016,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              TextNeo(
                text: "Im software developer specialy in",
                fontSize: width * 0.011,
              ),
              TextRichNeo(
                children: [
                  TextSpan(
                    text: 'Mobile Development project with ',
                    style: GoogleFonts.rubik(
                      fontSize: width * 0.011,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: '1+ year experience',
                    style: GoogleFonts.rubik(
                      fontSize: width * 0.011,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              TextNeo(
                text: "Im using flutter and kotlin for mobile development",
                fontSize: width * 0.011,
              ),
              TextNeo(
                text: "project, but for most used is flutter.",
                fontSize: width * 0.011,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
