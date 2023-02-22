import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HinzufuegenScreen extends StatefulWidget {
  const HinzufuegenScreen({Key? key}) : super(key: key);

  @override
  State<HinzufuegenScreen> createState() => _HinzufuegenScreenState();
}

class _HinzufuegenScreenState extends State<HinzufuegenScreen> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
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
                  Container(

                  ),
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
      child: Form(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 140, 30, 10),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Material(
                elevation: 2.0,
                shadowColor: Colors.grey,
                child: TextFormField(
                  style: TextStyle(color: colors[3]),
                  keyboardType: TextInputType.streetAddress,
                  autocorrect: false,
                  decoration: InputDecoration(
                    labelText: 'Standort',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: colors[4],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Material(
                elevation: 2.0,
                shadowColor: Colors.grey,
                child: TextFormField(
                  style: TextStyle(color: colors[3]),
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    labelText: 'Ziel',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: colors[4],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Material(
                elevation: 2.0,
                shadowColor: Colors.grey,
                child: TextFormField(
                  style: TextStyle(color: colors[3]),
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    labelText: 'Ziel',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: colors[4],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Material(
                      elevation: 2.0,
                      shadowColor: Colors.grey,
                      child: TextFormField(
                        style: TextStyle(color: colors[3]),
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          labelText: 'Datum',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: colors[4],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: Material(
                      elevation: 2.0,
                      shadowColor: Colors.grey,
                      child: TextFormField(
                        style: TextStyle(color: colors[3]),
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          labelText: 'Uhrzeit',
                          border: InputBorder.none,
                          filled: true,
                          fillColor: colors[4],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(color: Colors.white)),
                onPressed: () {
                  // Wenn alle Validatoren der Felder des Formulars gültig sind.
                  if (_formKey.currentState!.validate()) {
                    print(
                        "Formular ist gültig und kann verarbeitet werden");
                  } else {
                    print("Formular ist nicht gültig");
                  }
                },
                child: Text('Speichern'),
              ),
            ],
          ),
        ),
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
}
