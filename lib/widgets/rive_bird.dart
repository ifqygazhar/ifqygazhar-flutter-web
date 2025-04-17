import 'package:flutter/material.dart';
import 'package:ifqygazhar/core/style/colors.dart';
import 'package:ifqygazhar/core/widgets/card_border_neo.dart';
import 'package:ifqygazhar/core/widgets/text_neo.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';

class RiveBirbWidget extends StatefulWidget {
  final double width;
  final double height;
  final bool isMobile;

  const RiveBirbWidget({
    super.key,
    required this.width,
    required this.height,
    required this.isMobile,
  });

  @override
  State<RiveBirbWidget> createState() => _RiveBirbWidgetState();
}

class _RiveBirbWidgetState extends State<RiveBirbWidget> {
  Artboard? _artboard; // Jadikan nullable karena mungkin belum diload
  StateMachineController? _controller; // Jadikan nullable
  SMIBool? _dance;
  bool _isDancing = false;

  @override
  void initState() {
    super.initState();
    _loadRiveArtboard();
  }

  // Load Rive Artboard and StateMachine Controller
  Future<void> _loadRiveArtboard() async {
    try {
      final bytes = await rootBundle.load('assets/img/birb.riv');
      final file = RiveFile.import(bytes);
      final artboard = file.mainArtboard;
      final controller = StateMachineController.fromArtboard(artboard, 'birb');

      if (controller != null) {
        artboard.addController(controller);
        _dance = controller.findSMI('dance') as SMIBool?; // Casting ke SMIBool?
      }

      setState(() {
        _artboard = artboard;
        _controller = controller;
      });
    } catch (e) {
      print("Error loading Rive file: $e");
    }
  }

  void _toggleDance() {
    setState(() {
      _isDancing = !_isDancing;
      if (_dance != null) {
        _dance!.value = _isDancing;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: _toggleDance,
          child: CardBorderNeo(
            color: blueClr,
            child: SizedBox(
              width: widget.isMobile ? widget.width * 0.3 : widget.width * 0.15,
              height: widget.height * 0.356,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child:
                    _artboard != null
                        ? Rive(
                          artboard: _artboard!,
                        ) // Gunakan null check karena _artboard bisa null
                        : const SizedBox(), // Show a placeholder if artboard is not loaded
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 10,
          child: CardBorderNeo(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(widget.isMobile ? 0 : 4),
              child: TextNeo(text: "Click Me!"),
            ),
          ),
        ),
      ],
    );
  }
}
