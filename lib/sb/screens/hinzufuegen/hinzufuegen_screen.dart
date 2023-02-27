import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:projects/services/controller/ug_state_controller.dart';
import 'package:projects/services/extensions/unigo_service_angebot_extension.dart';

import '../../../screens/widgets/forms/form_submit_button.dart';
import '../../../screens/widgets/forms/form_text_field.dart';
import '../../../services/model/angebot.dart';
import '../../../services/unigo_service.dart';

class HinzufuegenScreen extends StatefulWidget {
  const HinzufuegenScreen({Key? key}) : super(key: key);

  @override
  State<HinzufuegenScreen> createState() => _HinzufuegenScreenState();
}

class _HinzufuegenScreenState extends State<HinzufuegenScreen> {
  UGStateController _controller = Get.find();
  UniGoService service = UniGoService();
  var formKey = GlobalKey<FormBuilderState>();

  List<Color> colors = [];

  @override
  void initState() {
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
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: _controller.appConstants.white,
          ),
          child: SingleChildScrollView(
            child: Container(
              constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height ),
              //color: Colors.red,
              //alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _praeferenzen(),
                  _fahrzeug(),
                  _fahrtHinzufuegen(),
                  //SizedBox(height: 80,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding _praeferenzen() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 130, 0, 10),
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
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
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
                        child: Icon(Icons.smoking_rooms),
                      ),
                      Container(
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
                        child: Icon(Icons.volume_up),
                      ),
                      Container(
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
                        child: Icon(Icons.pets),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _fahrzeug() {
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
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
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
                            Text('Opel Corsa'),
                          ],
                        ),
                      ),
                      Container(
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
                            Icon(Icons.add),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _fahrtHinzufuegen() {
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
            margin: EdgeInsets.fromLTRB(10, 20, 10, 100),
            //color: Colors.blue,
            child: _buildForm(context),
          ),
        ],
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
          ),
          const SizedBox(height: 16),
          CustomFormTextField(
            formKey: formKey,
            name: "ziel",
            labelText: "Ziel",
            value: "Hochschule Fulda",
          ),
          const SizedBox(height: 16),
          CustomFormTextField(
            formKey: formKey,
            name: "freiplaetze",
            labelText: "Freiplätze",
            value: "2",
          ),
          const SizedBox(height: 16),
          Container(
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFormTextField(
                  formKey: formKey,
                  width: 140,
                  name: "datum",
                  labelText: "Datum",
                  value: "2023-02-22",
                ),
                CustomFormTextField(
                    formKey: formKey,
                    width: 140,
                    name: "zeit",
                    labelText: "Uhrzeit",
                    value: "12:30:42"
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          CustomFormSubmitButton(
            formKey: formKey,
            text: "Hinzugügen",
            textColor: _controller.appConstants.white,
            color: _controller.appConstants.turquoise,
            callback: () async {
              String standort = formKey.currentState!.value['standort'];
              String ziel = formKey.currentState!.value['ziel'];
              String freiplaetze = formKey.currentState!.value['freiplaetze'];
              String datum = formKey.currentState!.value['datum'];
              String zeit = formKey.currentState!.value['zeit'];

              Angebot angebot = Angebot(
                id: 0,
                datum: DateTime.parse("${datum}"),
                uhrzeit: "${zeit}",
                freiplaetze: 0,
                startort: "${standort}",
                zielort: "${ziel}",
                hasprofile: [],
              );

              print (angebot);

              bool result =
              await service.createAngebotById(id: 0, data: angebot);

              print(result);

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
