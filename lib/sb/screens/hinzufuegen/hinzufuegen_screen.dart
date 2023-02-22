import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

import '../../../screens/widgets/forms/form_submit_button.dart';
import '../../../screens/widgets/forms/form_text_field.dart';

class HinzufuegenScreen extends StatefulWidget {
  const HinzufuegenScreen({Key? key}) : super(key: key);

  @override
  State<HinzufuegenScreen> createState() => _HinzufuegenScreenState();
}

class _HinzufuegenScreenState extends State<HinzufuegenScreen> {
  UGStateController _controller = Get.find();

  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  var formKey = GlobalKey<FormBuilderState>();

  final List<Color> colors = [
    Color.fromARGB(255, 202, 211, 211),
    Color.fromARGB(255, 0, 173, 167),
    Color.fromARGB(255, 139, 208, 106),
    Color.fromARGB(255, 28, 31, 31),
    Color.fromARGB(255, 255, 255, 255),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              //color: Colors.green,
              ),
          child: SingleChildScrollView(
            child: Container(
              //color: Colors.red,
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Container(),
                  _fahrtHinzufuegen(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _fahrtHinzufuegen() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: colors[0],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      //child: _oldForm(),
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          _buildForm(context),
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
        children: <Widget>[
          CustomFormTextField(
            formKey: formKey,
            name: "standort",
            labelText: "Standort",
          ),
          const SizedBox(height: 16),
          CustomFormTextField(
            formKey: formKey,
            name: "ziel",
            labelText: "Ziel",
          ),
          const SizedBox(height: 16),
          CustomFormTextField(
            formKey: formKey,
            name: "ziel1",
            labelText: "Ziel1",
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
                ),
                CustomFormTextField(
                  formKey: formKey,
                  width: 140,
                  name: "zeit",
                  labelText: "Uhrzeit",
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          CustomFormSubmitButton(
            formKey: formKey,
            text: "Speichern",
            callback: () async {
              String standort = formKey.currentState!.value['standort'];
              String ziel = formKey.currentState!.value['ziel'];
              String ziel1 = formKey.currentState!.value['ziel1'];
              String email = formKey.currentState!.value['email'];
              String datum = formKey.currentState!.value['datum'];
              String zeit = formKey.currentState!.value['zeit'];

              // TODO es wurde etwas verdatändert
              _controller.change();
            },
          ),
          SizedBox(height: 40),
          Container(),
        ],
      ),
    );
  }
}
