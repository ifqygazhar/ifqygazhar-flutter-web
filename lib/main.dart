import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ifqygazhar/core/style/colors.dart';
import 'package:ifqygazhar/screen/app.dart';
import 'package:rive/rive.dart' as rive;
import 'package:seo/seo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await rive.RiveFile.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SeoController(
      enabled: true,
      tree: WidgetTree(context: context),
      child: MaterialApp(
        title: 'ifqygazhar | flutter developer',
        debugShowCheckedModeBanner: false,
        home: Seo.head(
          tags: [
            MetaTag(
              name: 'title',
              content: 'Ifqy Gifha Azhar | Flutter Developer Portfolio',
            ),
            MetaTag(
              name: 'description',
              content:
                  'Portfolio website of Ifqy Gifha Azhar - A passionate Flutter Developer specializing in mobile development. View my projects, skills and experience.',
            ),
            MetaTag(
              name: 'keywords',
              content:
                  'flutter developer, mobile app development ifqy gifha azhar, portfolio, software engineer',
            ),
            MetaTag(name: 'author', content: 'Ifqy Gifha Azhar'),
            MetaTag(name: 'robots', content: 'index, follow'),
            MetaTag(
              name: 'title',
              content: 'Ifqy Gifha Azhar | Flutter Developer Portfolio',
            ),
            MetaTag(
              name: 'description',
              content:
                  'Portfolio website of Ifqy Gifha Azhar - A passionate Flutter Developer specializing in mobile development.',
            ),
            MetaTag(name: 'type', content: 'website'),
          ],
          child: const MyHome(),
        ),
      ),
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

            return App(width: width, height: height);
          },
        ),
      ),
    );
  }
}
