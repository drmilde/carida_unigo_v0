import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:positioned_tap_detector_2/positioned_tap_detector_2.dart';
import 'package:projects/screens/widgets/custom_round_button.dart';
import 'package:projects/services/osrm/model/ortschaften.dart';

import '../../../screens/prototyp_dummies/maps/nominatim.dart';
import '../../../screens/prototyp_dummies/maps/remote_services.dart';

class ClickToAddMarkerScreen extends StatefulWidget {
  const ClickToAddMarkerScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ClickToAddMarkerScreenState();
  }
}

class ClickToAddMarkerScreenState extends State<ClickToAddMarkerScreen> {
  Ortschaften ortschaften = Ortschaften();
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
      appBar: AppBar(title: const Text("Wähle Startpunkt")),
      //drawer: buildDrawer(context, TapToAddPage.route),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: 100,
              child: ListView.builder(
                itemCount: ortschaften.ortschaften.length,
                itemBuilder: (context, index) {
                  String startort = ortschaften.ortschaften[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () async {
                        List<Nominatim> liste =
                            await RemoteServices.fetchCoordinates(startort);
                        if (liste.isNotEmpty) {
                          print(liste[0].lat);
                          print(liste[0].lon);

                          double lat =
                              double.tryParse(liste[0].lat!) ?? P3.latitude;
                          double lng =
                              double.tryParse(liste[0].lon!) ?? P3.longitude;

                          _processLatLang(LatLng(lat, lng));
                          _mapController.move(LatLng(lat, lng), zoom);
                        }
                      },
                      child: Text(
                        "${startort}",
                      ),
                    ),
                  );
                },
              ),
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
            Container(
                height: 40,
                color: Colors.yellow,
                child: CustomRoundButton(
                  text: "harvest",
                  callback: () {
                    harvest();
                  },
                )),
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

  void harvest() {
    int index = 2278;
    String startort = ortschaften.ortschaften[index];
    final periodicTimer =
        Timer.periodic(const Duration(seconds: 15), (timer) async {

      startort = ortschaften.ortschaften[index];
      List<Nominatim> liste = await RemoteServices.fetchCoordinates(startort);
      if (liste.isNotEmpty) {
        double lat = double.tryParse(liste[0].lat!) ?? P3.latitude;
        double lng = double.tryParse(liste[0].lon!) ?? P3.longitude;

        print("${index} ${startort}: ${lat}, ${lng}");

        _mapController.move(LatLng(lat, lng), zoom);
      }
      index++;
      if (index >= ortschaften.ortschaften.length) {
        timer.cancel();
      }
    });
  }
}
