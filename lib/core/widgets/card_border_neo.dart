import 'package:flutter/material.dart';
import 'package:ifqygazhar/core/style/colors.dart';

class CardBorderNeo extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;
  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderSize;
  final Color? borderColor;

  const CardBorderNeo({
    super.key,
    this.width,
    this.height,
    required this.color,
    required this.child,
    this.borderRadius,
    this.padding,
    this.margin,
    this.borderSize,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(8),
      margin: margin ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: borderColor ?? secondaryClr,
          width: borderSize ?? 3,
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
