import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/screens/widgets/custom_popup_widget.dart';
import 'package:projects/services/controller/ug_state_controller.dart';
import 'package:projects/services/extensions/unigo_service_angebot_extension.dart';

import '../../../screens/widgets/forms/form_date_field.dart';
import '../../../screens/widgets/forms/form_submit_button.dart';
import '../../../screens/widgets/forms/form_text_field.dart';
import '../../../screens/widgets/forms/form_time_field.dart';
import '../../../services/model/angebot.dart';
import '../../../services/unigo_service.dart';

class HinzufuegenScreen extends StatefulWidget {
  const HinzufuegenScreen({Key? key}) : super(key: key);

  @override
  State<HinzufuegenScreen> createState() => _HinzufuegenScreenState();
}

class _HinzufuegenScreenState extends State<HinzufuegenScreen> with TickerProviderStateMixin{
  UGStateController _controller = Get.find();
  UniGoService service = UniGoService();
  var formKey = GlobalKey<FormBuilderState>();

  late CustomPopUp dialog;

  final List<Icon> icons = [
    Icon(Icons.smoking_rooms),
    Icon(Icons.volume_up),
    Icon(Icons.pets),
    Icon(Icons.directions_car)
  ];

  final List<String> cars = ['Opel Corsa', 'Ford Fiesta', 'Audi A1'];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 16,
          ),
          _angaben('Präferenzen', 'Fahrzeuge'),
          SizedBox(
            height: 16,
          ),
          Container(
            //width: double.infinity,
            child: TabBar(
              controller: _tabController,
              labelColor: _controller.appConstants.dark_grey,
              tabs: [
                Tab(
                  child: Text(
                    "einmalig",
                    style: GoogleFonts.inter(
                      color: _controller.appConstants.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "wöchentlich",
                    style: GoogleFonts.inter(
                      color: _controller.appConstants.black,
                      fontSize: 14,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Entwürfe",
                    style: GoogleFonts.inter(
                      color: _controller.appConstants.black,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 375,
            child: TabBarView(
              controller: _tabController,
              children: [
                _fahrtHinzufuegen(),
                _fahrtHinzufuegen(),
                Container(
                  height: 30,
                  width: 30,
                  color: Colors.yellow,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }

  Padding _angaben(String titel1, String titel2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        //margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
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
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: Text(
                        'Präferenzen',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        //textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      //margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _praeferenz(icons[0]),
                          _praeferenz(icons[1]),
                          _praeferenz(icons[2]),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              height: 2,
              width: double.infinity,
              decoration: BoxDecoration(
                color: _controller.appConstants.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      child: Text(
                        'Fahrzeuge',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        //textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      //margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                      width: double.infinity,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _car(cars[0]),
                            _car(cars[1]),
                            _car(cars[2]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _car(String car) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
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
      child: Row(
        children: [
          Icon(Icons.directions_car),
          Text(car),
        ],
      ),
    );
  }

  Container _praeferenz(Icon icon) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
        color: _controller.appConstants.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: icon,
    );
  }

  Container _fahrtHinzufuegen() {
    return Container(
      margin: EdgeInsets.all(16),
      width: double.infinity,
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
      //child: _oldForm(),
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
        //color: Colors.blue,
        child: _buildForm(context),
      ),
    );
  }

  String? zahlValidator(value) {
    var zahl = int.tryParse(value.toString()) ?? 0;
    if (zahl % 2 == 0) {
      return 'Es sind nur ungerade Zahlen erlaubt';
    }
    return null;
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
            name: "standort",
            labelText: "Standort",
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
                CustomFormTextField(
                  formKey: formKey,
                  width: 85,
                  name: "freiplaetze",
                  labelText: "Plätze",
                  value: "2",
                  showBorder: true,
                ),
                CustomFormDateField(
                  formKey: formKey,
                  width: 110,
                  name: "datum",
                  labelText: "Datum",
                  value: DateTime.now(),
                  showBorder: true,
                ),
                CustomFormTimeField(
                  formKey: formKey,
                  width: 85,
                  name: "zeit",
                  labelText: "Uhrzeit",
                  value: DateTime.now(),
                  showBorder: true,
                ),
              ],
            ),
          ),
          SizedBox(height: 24),

          CustomFormSubmitButton(
            formKey: formKey,
            text: "Hinzufügen",
            textColor: _controller.appConstants.white,
            color: _controller.appConstants.turquoise,
            showShadow: true,
            callback: () async {
              String standort = formKey.currentState!.value['standort'];
              String ziel = formKey.currentState!.value['ziel'];
              String freiplaetze = formKey.currentState!.value['freiplaetze'];
              DateTime datum = formKey.currentState!.value['datum'];
              DateTime zeit = formKey.currentState!.value['zeit'];

              print(standort);

              String zs = zeit.toString();
              zs = zs.substring(zs.indexOf(" ")).trim();

              Angebot angebot = Angebot(
                id: 0,
                datum: datum,
                uhrzeit: zs,
                freiplaetze: int.parse(freiplaetze),
                startort: "${standort}",
                zielort: "${ziel}",
                distanz: 0.0,
                latitude: 0.0,
                longitude: 0.0,
                hasprofile: [],
              );

              Angebot result =
              await service.createAngebotById(id: 0, data: angebot);


              print(result);

              if (result.id != 0) {
                dialog = CustomPopUp(
                  title: "Angebot hinzugefügt",
                  content: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Text(
                        "Ihr Angebot wurde erfolgreich hinzugefügt.",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  button1Text: "ok",
                );

                var _ = dialog.showCustomDialog(context);
              }

              // TODO es wurde etwas verdatändert
              _controller.change();
            },
          ),
          //SizedBox(height: 20),
        ],
      ),
    );
  }
}
