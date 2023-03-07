import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:projects/services/controller/ug_state_controller.dart';
import 'package:projects/services/extensions/unigo_service_angebot_extension.dart';

import '../../../screens/widgets/custom_popup_widget.dart';
import '../../../screens/widgets/forms/form_date_field.dart';
import '../../../screens/widgets/forms/form_submit_button.dart';
import '../../../screens/widgets/forms/form_text_field.dart';
import '../../../screens/widgets/forms/form_time_field.dart';
import '../../../services/model/angebot.dart';
import '../../../services/unigo_service.dart';
import '../maps/nominatim.dart';
import '../maps/remote_services.dart';

class SuchenScreen extends StatefulWidget {
  const SuchenScreen({Key? key}) : super(key: key);

  @override
  State<SuchenScreen> createState() => _SuchenScreenState();
}

class _SuchenScreenState extends State<SuchenScreen> {
  UGStateController _controller = Get.find();
  UniGoService service = UniGoService();
  List<Angebot> fahrten = [];
  bool istFahrer = true;

  String search = "";

  // Load the list data from server
  Future<bool> _loadFahrten({String search = ""}) async {
    print(search);
    fahrten = await service.searchAngebotList(
      searchparams: {"search": search},
    );
    print (fahrten.length);
    return true;
  }

  var formKey = GlobalKey<FormBuilderState>();
  late final _mapController;

  LatLng hsfulda = new LatLng(50.5650744, 9.685991642142039);
  late double lat = hsfulda.latitude;
  late double lng = hsfulda.longitude;
  double zoom = 17;

  bool showForm = true;

  List<Color> colors = [];

  @override
  void initState() {
    _mapController = MapController();
    colors = [
      _controller.appConstants.light_grey,
      _controller.appConstants.turquoise,
      _controller.appConstants.light_green,
      _controller.appConstants.dark_grey,
      _controller.appConstants.white,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: _controller.appConstants.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                child: _buildFlutterMap(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Obx(
              () {
                int _change = _controller.somethingChanged.value;
                return showForm ? _fahrtSuchen() : _showList(context);
              },
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _showList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: _zeigeAngebote(),
    );
  }

  Container _fahrtSuchen() {
    // TODO Schatten unten weg ???
    return Container(
      margin: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors[4],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      //child: _oldForm(),
      child: Column(
        children: [
          //SizedBox(height: 20,),
          Container(
            //color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: _buildForm(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return FormBuilder(
      key: formKey,
      // enabled: false,
      onChanged: () {
        formKey.currentState!.save();
      },
      autovalidateMode: AutovalidateMode.disabled,
      skipDisabled: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CustomFormTextField(
            formKey: formKey,
            name: "startort",
            labelText: "Startort",
            value: "Hünfeld",
            showBorder: true,
          ),
          const SizedBox(height: 16),
          CustomFormTextField(
            formKey: formKey,
            name: "ziel",
            labelText: "Ziel",
            value: "Hochschule Fulda",
            showBorder: true,
          ),
          const SizedBox(height: 16),
          Container(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFormDateField(
                  formKey: formKey,
                  width: 140,
                  name: "datum",
                  labelText: "Datum",
                  value: DateTime.now(),
                  showBorder: true,
                ),
                CustomFormTimeField(
                  formKey: formKey,
                  width: 140,
                  name: "zeit",
                  labelText: "Uhrzeit",
                  value: DateTime.now(),
                  showBorder: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          CustomFormSubmitButton(
            formKey: formKey,
            text: "Suchen",
            textColor: _controller.appConstants.white,
            color: _controller.appConstants.turquoise,
            showShadow: true,
            callback: () async {
              String startort = formKey.currentState!.value['startort'];
              String ziel = formKey.currentState!.value['ziel'];
              DateTime datum = formKey.currentState!.value['datum'];
              DateTime zeit = formKey.currentState!.value['zeit'];

              print(startort);
              if (formKey.currentState!.validate()) {
                List<Nominatim> liste =
                    await RemoteServices.fetchCoordinates(startort);
                if (liste.isNotEmpty) {
                  print(liste[0].lat);
                  print(liste[0].lon);

                  lat = double.tryParse(liste[0].lat!) ?? hsfulda.latitude;
                  lng = double.tryParse(liste[0].lon!) ?? hsfulda.longitude;

                  _mapController.move(LatLng(lat, lng), zoom);
                }

                FocusScope.of(context).unfocus();

                setState(() {
                  showForm = false;
                  search = startort;
                });

                // TODO es wurde etwas verändert
                _controller.change();
              }
            },
          ),
          //SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildFlutterMap() {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: hsfulda,
        zoom: 17,
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: 'OpenStreetMap contributors',
          onSourceTapped: () {},
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'dev.fleaflet.flutter_map.example',
        ),
        //MarkerLayer(markers: markers),
      ],
    );
  }

  /// Hier die Liste der Angebote

  Widget _zeigeAngebote() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          FutureBuilder<bool>(
            future: _loadFahrten(search: search),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildListView(snapshot);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
          /*SizedBox(
                height: 16,
              ),*/
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildListView(AsyncSnapshot<bool> snapshot) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: ListView.builder(
          itemCount: fahrten.length,
          itemBuilder: (context, index) {
            final fahrt = fahrten[index];
            return _angebotCard(
              fahrt.startort,
              fahrt.zielort,
              fahrt.uhrzeit,
              _controller.appConstants.dark_grey,
              istFahrer
                  ? Icon(
                      Icons.directions_car,
                      color: _controller.appConstants.turquoise,
                    )
                  : Icon(
                      Icons.thumb_up,
                      color: _controller.appConstants.light_green,
                    ),
              Icon(Icons.delete),
            );
          },
        ),
      ),
    );
  }

  Widget _angebotCard(
    String start,
    String ziel,
    String uhrzeit,
    Color color,
    Icon icon,
    Icon delete,
  ) {
    return GestureDetector(
      onTap: () async {
        CustomPopUp dialog = CustomPopUp(
          title: "Angebot",
          content: _buildCardLayout(start, ziel, uhrzeit, color),
          button1Text: "Anfragen",
        );

        int? answer = await dialog.showCustomDialog(context);
        // TODO hier in den chat hüpfen :)
      },
      child: _buildCardLayout(start, ziel, uhrzeit, color),
    );
  }

  Padding _buildCardLayout(
      String start, String ziel, String uhrzeit, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          color: _controller.appConstants.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        //color: Colors.yellow,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        start,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        //textAlign: TextAlign.left,
                      ),
                    ),
                    SizedBox(height: 8),
                    Icon(Icons.arrow_downward),
                    SizedBox(height: 8),
                    Container(
                      child: Text(
                        ziel,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Text(uhrzeit),
                ),
                Container(
                  //color: Colors.green,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    size: 50,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
