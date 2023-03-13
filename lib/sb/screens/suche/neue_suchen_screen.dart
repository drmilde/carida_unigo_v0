import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:projects/sb/widgets/buchungen/angebot_card_widget.dart';
import 'package:projects/screens/widgets/buche_hs_fulda_widget.dart';
import 'package:projects/services/controller/ug_state_controller.dart';
import 'package:projects/services/extensions/unigo_service_angebot_extension.dart';

import '../../../screens/widgets/custom_popup_widget.dart';
import '../../../screens/widgets/forms/form_date_field.dart';
import '../../../screens/widgets/forms/form_submit_button.dart';
import '../../../screens/widgets/forms/form_text_field.dart';
import '../../../screens/widgets/forms/form_time_field.dart';
import '../../../screens/widgets/suche/ortsnamen_textfield_widget.dart';
import '../../../services/model/angebot.dart';
import '../../../services/unigo_service.dart';
import '../maps/nominatim.dart';
import '../maps/remote_services.dart';

class NeueSuchenScreen extends StatefulWidget {
  const NeueSuchenScreen({Key? key}) : super(key: key);

  @override
  State<NeueSuchenScreen> createState() => _NeueSuchenScreenState();
}

class _NeueSuchenScreenState extends State<NeueSuchenScreen> {
  UGStateController _controller = Get.find();
  UniGoService service = UniGoService();
  List<Angebot> fahrten = [];
  bool istFahrer = true;
  bool isHinfahrt = true;

  String search = "";

  // Load the list data from server
  Future<bool> _loadFahrten({String search = ""}) async {
    print(search);
    fahrten = await service.searchAngebotList(
      searchparams: {"search": search},
    );
    print(fahrten.length);
    return true;
  }

  var formKey = GlobalKey<FormBuilderState>();
  late final _mapController;

  LatLng hsfulda = new LatLng(50.5650744, 9.685991642142039);
  late double lat = hsfulda.latitude;
  late double lng = hsfulda.longitude;
  double zoom = 17;

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: _controller.appConstants.white,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            _fahrtSuchen(),
            Expanded(
              child: Obx(
                () {
                  int _change = _controller.somethingChanged.value;
                  return _showList(context);
                },
              ),
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

  Widget _fahrtSuchen() {
    return Container(
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
              padding: const EdgeInsets.only(top: 16.0, bottom: 8),
              //child: _buildForm(context),
              child: _buildNewForm(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewForm(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: 16),
        isHinfahrt ? _ortsnameTextField() : _bucheLogo(),
        Container(
          child: Icon(Icons.arrow_forward_outlined),
        ),
        isHinfahrt ? _bucheLogo() : _ortsnameTextField(),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isHinfahrt = !isHinfahrt;
              });
            },
            child: Container(
              child: Icon(Icons.sync_alt_outlined),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bucheLogo() {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BucheHSFuldaWidget(
          width: 32,
        ),
      ),
    );
  }

  Container _ortsnameTextField() {
    return Container(
      width: 200,
      child: OrtsnamenAutoCompleteWidget(
        mapController: null,
        setMarker: (latlng) {},
      ),
    );
  }

  /// Hier die Liste der Angebote

  Widget _zeigeAngebote() {
    return Column(
      children: [
        SizedBox(height: 8),
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
            return AngebotCardWidget(
              angebot: fahrt,
              onDelete: () {},
              onDetail: () {},
              arrowColor: _controller.appConstants.dark_grey,
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

  Widget _buildCardLayout(
      String start, String ziel, String uhrzeit, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        //margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
        //padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
      ),
    );
  }
}
