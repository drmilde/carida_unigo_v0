import 'package:flutter/material.dart';
import 'package:projects/sb/screens/einstellungen/allgemein_screen.dart';
import 'package:projects/sb/screens/einstellungen/datenschutz_screen.dart';
import 'package:projects/sb/screens/einstellungen/feedback_screen.dart';
import 'package:projects/sb/screens/einstellungen/hilfe_screen.dart';
import 'package:projects/sb/screens/einstellungen/impressum_screen.dart';
import 'package:projects/sb/screens/einstellungen/mitteilungen_screen.dart';
import 'package:projects/sb/screens/einstellungen/profil_einstellungen_screen.dart';
import 'package:projects/sb/screens/einstellungen/punkte_screen.dart';
import 'package:projects/sb/screens/welcome/start_screen.dart';
import 'package:projects/screens/widgets/custom_round_button.dart';
import 'package:projects/services/controller/ug_state_controller.dart';
import 'package:get/get.dart';

import '../home/main_screen.dart';
import 'bewertung_screen.dart';

class EinstellungenScreen extends StatefulWidget {
  const EinstellungenScreen({Key? key}) : super(key: key);

  @override
  State<EinstellungenScreen> createState() => _EinstellungenScreenState();
}

class Box {
  String titel1;
  Icon icon1;
  String titel2;
  Icon icon2;
  VoidCallback callback1;
  VoidCallback callback2;

  Box(this.titel1, this.icon1, this.titel2, this.icon2,
      {required this.callback1, required this.callback2});
}

class _EinstellungenScreenState extends State<EinstellungenScreen> {
  UGStateController _controller = Get.find();

  final String image = 'assets/avatars/avatar0280.png';
  final String name = 'Tinkerbell';

  List<Box> boxen = [];

  @override
  void initState() {
    boxen = [
      Box(
        "Bewertung",
        Icon(Icons.star),
        'Punkte',
        Icon(Icons.thumb_up),
        callback1: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => BewertungScreen()));
        },
        callback2: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => PunkteScreen()));
        },
      ),
      Box(
        'Mitteilungen',
        Icon(Icons.notifications),
        'Allgemein',
        Icon(Icons.settings),
        callback1: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MitteilungenScreen()));
        },
        callback2: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AllgemeinScreen()));
        },
      ),
      Box(
        'Datenschutz',
        Icon(Icons.lock),
        'Impressum',
        Icon(Icons.warning),
        callback1: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DatenschutzScreen()));
        },
        callback2: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ImpressumScreen()));
        },
      ),
      Box(
        'Hilfe',
        Icon(Icons.help),
        'Feedback',
        Icon(Icons.feedback),
        callback1: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HilfeScreen()));
        },
        callback2: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FeedbackScreen()));
        },
      ),
    ];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBody: true,
      //extendBodyBehindAppBar: true,
      //backgroundColor: Color.fromARGB(255, 28, 31, 31),
      appBar: _buildAppBar('Einstellungen', context),
      body: SafeArea(
        child: Column(
          children: [
            _profil(),
            Expanded(
              child: ListView.builder(
                itemCount: boxen.length + 1,
                itemBuilder: (context, index) {
                  if (index >= boxen.length) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: (CustomRoundButton(
                        width: 350,
                        callback: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StartScreen()));
                        },
                        text: 'Abmelden',
                        textColor: _controller.appConstants.white,
                        color: _controller.appConstants.turquoise,
                      )),
                    );
                  } else {
                    return (_einstellungen(boxen[index]));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _einstellungen(Box box) {
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
            GestureDetector(
              onTap: box.callback1,
              child: Container(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: _controller.appConstants.white,
                        borderRadius: BorderRadius.circular(80),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: box.icon1,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Text(
                          box.titel1,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          //textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            _buildShadowLine(),
            SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: box.callback2,
              child: Container(
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: _controller.appConstants.white,
                        borderRadius: BorderRadius.circular(80),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: box.icon2,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Text(
                          box.titel2,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          //textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Icon(
                          Icons.keyboard_arrow_right,
                          size: 50,
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
    );
  }

  Container _buildShadowLine() {
    return Container(
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
    );
  }

  Padding _profil() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProfilEinstellungenScreen()));
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      //padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                      child: Image.asset(image, fit: BoxFit.contain),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        //textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Icon(Icons.edit),
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

  AppBar _buildAppBar(String title, BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Color.fromARGB(255, 28, 31, 31),
          fontSize: 28,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: BackButton(
        color: Color.fromARGB(255, 28, 31, 31),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [],
    );
  }
}
