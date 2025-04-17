import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ifqygazhar/core/style/colors.dart';
import 'package:ifqygazhar/desktop/desktop_mode_screen.dart';
import 'package:ifqygazhar/mobile/mobile_mode_screen.dart';
import 'package:rive/rive.dart' as rive;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await rive.RiveFile.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ifqygazhar portfolio website',
      debugShowCheckedModeBanner: false,
      home: const MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryClr,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            final width = constraint.maxWidth;
            final height = constraint.maxHeight;

            log("height $height x width $width");

            if (width > 600) {
              return DesktopModeScreen(width: width, height: height);
            } else {
              return MobileModeScreen(width: width, height: height);
            }
          },
        ),
      ),
    );
  }
}
