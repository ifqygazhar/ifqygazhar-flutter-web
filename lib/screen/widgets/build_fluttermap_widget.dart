import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:ifqygazhar/core/style/colors.dart';
import 'package:ifqygazhar/core/widgets/button_neo.dart';
import 'package:latlong2/latlong.dart';

class BuildFlutterMap extends StatelessWidget {
  final double height;

  const BuildFlutterMap({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
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
}
