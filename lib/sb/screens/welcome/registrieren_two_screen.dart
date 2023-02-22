import 'package:carpool_unigo/screens/home/main_screen.dart';
import 'package:carpool_unigo/widgets/svg_scaffold_widget.dart';
import 'package:flutter/material.dart';

class RegistrierenTwoScreen extends StatefulWidget {
  const RegistrierenTwoScreen({Key? key}) : super(key: key);

  @override
  State<RegistrierenTwoScreen> createState() => _RegistrierenTwoScreenState();
}

class _RegistrierenTwoScreenState extends State<RegistrierenTwoScreen> {
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
    return SvgScaffoldWidget(
      image: "assets/images/background2.svg",
      color: colors[3],
      child: SingleChildScrollView(
        child: Container(
          //color: Colors.yellow,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //color: Colors.red,
                margin: EdgeInsets.fromLTRB(20, 80, 0, 20),
                child: Text(
                  'Registrieren',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Container(
                width: double.infinity,
                //color: Colors.pink,
                child: Form(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 0, 150, 0),
                        width: double.infinity,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 40, 0, 5),
                              width: double.infinity,
                              child: Material(
                                elevation: 2.0,
                                shadowColor: Colors.grey,
                                child: TextFormField(
                                  style: TextStyle(color: colors[3]),
                                  keyboardType: TextInputType.name,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    labelText: 'Vorname',
                                    border: UnderlineInputBorder(),
                                    //filled: true,
                                    //fillColor: colors[0],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                              width: double.infinity,
                              child: Material(
                                elevation: 2.0,
                                shadowColor: Colors.grey,
                                child: TextFormField(
                                  style: TextStyle(color: colors[3]),
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    labelText: 'Nachname',
                                    border: UnderlineInputBorder(),
                                    //filled: true,
                                    //fillColor: colors[0],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              width: double.infinity,
                              child: Material(
                                elevation: 2.0,
                                shadowColor: Colors.grey,
                                child: TextFormField(
                                  style: TextStyle(color: colors[3]),
                                  keyboardType: TextInputType.streetAddress,
                                  decoration: InputDecoration(
                                    labelText: 'Adresse',
                                    border: UnderlineInputBorder(),
                                    //filled: true,
                                    //fillColor: colors[0],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 5, 5, 10),
                                    width: double.infinity,
                                    child: Material(
                                      elevation: 2.0,
                                      shadowColor: Colors.grey,
                                      child: TextFormField(
                                        style: TextStyle(color: colors[3]),
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'PLZ',
                                          border: UnderlineInputBorder(),
                                          //filled: true,
                                          //fillColor: colors[0],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(5, 5, 0, 10),
                                    width: double.infinity,
                                    child: Material(
                                      elevation: 2.0,
                                      shadowColor: Colors.grey,
                                      child: TextFormField(
                                        style: TextStyle(color: colors[3]),
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          labelText: 'Stadt',
                                          border: UnderlineInputBorder(),
                                          //filled: true,
                                          //fillColor: colors[0],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //color:Colors.blue,
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(60, 200, 60, 20),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => MainScreen()),
                            );
                          },
                          child: Text(
                            'Registrieren',
                            style: TextStyle(
                              color: colors[4],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
