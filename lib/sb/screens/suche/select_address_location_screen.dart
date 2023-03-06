import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class SelectAddressLocationSceen extends StatefulWidget {
  static const String route = 'latlng_screen_point_test_page';

  const SelectAddressLocationSceen({Key? key}) : super(key: key);

  @override
  State createState() {
    return _SelectAddressLocationSceenState();
  }
}

class _SelectAddressLocationSceenState extends State<SelectAddressLocationSceen> {
  late final MapController _mapController;

  CustomPoint _textPos = const CustomPoint(10.0, 10.0);

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  void onMapEvent(MapEvent mapEvent) {
    if (mapEvent is! MapEventMove && mapEvent is! MapEventRotate) {
      // do not flood console with move and rotate events
      debugPrint(mapEvent.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wähle Startpunkt')),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                //onMapEvent: onMapEvent,
                onTap: (tapPos, latLng) {
                  print (latLng);
                  final pt1 = _mapController.latLngToScreenPoint(latLng);
                  _textPos = CustomPoint(pt1!.x, pt1.y);
                  setState(() {});
                },
                center: LatLng(50.5723, 9.680624),
                zoom: 14,
                rotation: 0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                ),
              ],
            ),
          ),
          Positioned(
            left: _textPos.x.toDouble(),
            top: _textPos.y.toDouble(),
            width: 20,
            height: 20,
            //child: const FlutterLogo())
            child: Icon(Icons.person_pin_circle_outlined),
          )
        ],
      ),
    );
  }
}
