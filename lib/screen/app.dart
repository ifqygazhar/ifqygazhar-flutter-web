import 'package:flutter/material.dart';
import 'package:ifqygazhar/screen/desktop/desktop_mode_screen.dart';
import 'package:ifqygazhar/screen/mobile/mobile_mode_screen.dart';

class App extends StatelessWidget {
  final double width;
  final double height;
  const App({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = width < 600;

    if (isMobile) {
      return MobileLayout(width: width, height: height, isMobile: isMobile);
    } else {
      return DesktopLayout(width: width, height: height, isMobile: isMobile);
    }
  }
}
