import 'package:flutter/material.dart';
import 'package:ifqygazhar/core/style/colors.dart';

class CardNeo extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;
  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderSize;

  const CardNeo({
    super.key,
    this.width,
    this.height,
    required this.color,
    required this.child,
    this.borderRadius,
    this.padding,
    this.margin,
    this.borderSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Shadow
        Positioned(
          top: 5,
          left: 4,
          right: -5,
          bottom: -5,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: shadowClr,
              borderRadius: borderRadius ?? BorderRadius.circular(8),
            ),
          ),
        ),
        // Card
        Container(
          width: width,
          height: height,
          padding: padding ?? const EdgeInsets.all(8),
          margin: margin ?? const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: secondaryClr, width: borderSize ?? 3),
            borderRadius: borderRadius ?? BorderRadius.circular(8),
          ),
          child: child,
        ),
      ],
    );
  }
}
