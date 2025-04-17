import 'package:flutter/material.dart';
import 'package:ifqygazhar/core/style/colors.dart';

class ButtonNeo extends StatefulWidget {
  final Color color;
  final BorderRadius? borderRadius;
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderSize;
  final double? width;
  final double? height;
  final Color? borderColor;
  final bool isMouse;
  final double shadowBottomPosition;
  final double shadowRightPosition;

  const ButtonNeo({
    super.key,
    required this.color,
    this.borderRadius,
    required this.child,
    this.onTap,
    this.padding,
    this.margin,
    this.borderSize,
    this.width,
    this.height,
    this.borderColor,
    this.isMouse = true,
    this.shadowBottomPosition = -8,
    this.shadowRightPosition = -5,
  });

  @override
  State<ButtonNeo> createState() => _ButtonNeoState();
}

class _ButtonNeoState extends State<ButtonNeo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
    widget.onTap?.call();
  }

  void _handleTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter:
          widget.isMouse
              ? (_) {
                setState(() {
                  _isPressed = true;
                });
                _controller.reverse();
              }
              : null,
      onExit:
          widget.isMouse
              ? (_) {
                setState(() {
                  _isPressed = false;
                });
                _controller.reverse();
              }
              : null,
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Shadow
            Positioned(
              top: 5,
              left: 4,
              right: widget.shadowRightPosition,
              bottom: widget.shadowBottomPosition,
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  color: shadowClr,
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
                ),
              ),
            ),
            // Button
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: widget.width,
              height: widget.height,
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(
                _isPressed ? 4 : 0,
                _isPressed ? 4 : 0,
                0,
              ),
              padding: widget.padding ?? const EdgeInsets.all(8),
              margin: widget.margin ?? const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: widget.color,
                border: Border.all(
                  color: widget.borderColor ?? secondaryClr,
                  width: widget.borderSize ?? 3,
                ),
                borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
              ),
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}
