import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

import 'package:latlong2/latlong.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';
import 'package:projects/screens/widgets/suche/ortsnamen_textfield_widget.dart';

class MapSucheScreen extends StatefulWidget {
  const MapSucheScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MapSucheScreenState();
  }
}

class MapSucheScreenState extends State<MapSucheScreen> {
  LatLng P3 = LatLng(50.570037, 9.687154);
  double size = 160;
  late final _mapController;
  double zoom = 13;

  Marker homeMarker = Marker(
    width: 160,
    height: 160,
    point: LatLng(50.570037, 9.687154),
    builder: (ctx) => const Icon(
      Icons.person_pin_circle_outlined,
      color: Colors.black,
    ),
  );

  @override
  void initState() {
    _mapController = MapController();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("Wähle Startpunkt")),
      //drawer: buildDrawer(context, TapToAddPage.route),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            OrtsnamenAutoCompleteWidget(
              mapController: _mapController,
              setMarker: _processLatLang,
            ),
            SizedBox(
              height: 8.0,
            ),
            Flexible(
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(center: P3, zoom: 13, onTap: _handleTap),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  ),
                  MarkerLayer(markers: [homeMarker]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleTap(TapPosition tapPosition, LatLng latlng) {
    _processLatLang(latlng);
  }

  void _processLatLang(LatLng latlng) {
    print(latlng);

    homeMarker = Marker(
      width: size,
      height: size,
      point: latlng,
      builder: (ctx) => const Icon(
        Icons.person_pin_circle_outlined,
        color: Colors.black,
      ),
    );

    setState(() {});
  }

/* not allowed */
}
