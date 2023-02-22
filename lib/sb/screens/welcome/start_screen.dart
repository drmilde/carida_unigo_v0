import 'package:carpool_unigo/screens/welcome/anmelden_screen.dart';
import 'package:carpool_unigo/screens/welcome/registrieren_two_screen.dart';
import 'package:carpool_unigo/screens/welcome/registrieren_screen.dart';
import 'package:carpool_unigo/widgets/svg_scaffold_widget.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgScaffoldWidget(
      image: "assets/images/background.svg",
      color: Color.fromARGB(255, 28, 31, 31),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(60, 660, 60, 5),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AnmeldenScreen()));
                  },
                  child: Text(
                    'Anmelden',
                    style: TextStyle(
                      color:  Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(60, 10, 60, 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 202, 211, 211),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegistrierenScreen()));
                  },
                  child: Text(
                    'Registrieren',
                    style: TextStyle(
                      color: Color.fromARGB(255, 28, 31, 31),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(100, 10, 100, 50),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.',
                  style: TextStyle(
                    fontSize: 9,
                    color: Color.fromARGB(255, 202, 211, 211),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
