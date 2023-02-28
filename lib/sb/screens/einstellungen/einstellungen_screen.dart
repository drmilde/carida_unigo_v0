import 'package:flutter/material.dart';
import 'package:projects/sb/screens/welcome/start_screen.dart';
import 'package:projects/screens/widgets/custom_round_button.dart';
import 'package:projects/services/controller/ug_state_controller.dart';
import 'package:get/get.dart';

import '../home/main_screen.dart';

class EinstellungenScreen extends StatefulWidget {
  const EinstellungenScreen({Key? key}) : super(key: key);

  @override
  State<EinstellungenScreen> createState() => _EinstellungenScreenState();
}

class _EinstellungenScreenState extends State<EinstellungenScreen> {
  UGStateController _controller = Get.find();

  final String image = 'assets/avatars/avatar0280.png';
  final String name = 'Tinkerbell';

  final List<String> titel = [
    'Bewertung',
    'Punkte',
    'Mitteilungen',
    'Standort',
    'Datenschutz',
    'Impressum',
  ];

  final List<Icon> icons =[
    Icon(Icons.star),
    Icon(Icons.thumb_up),
    Icon(Icons.notifications),
    Icon(Icons.location_pin),
    Icon(Icons.lock),
    Icon(Icons.warning),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      //backgroundColor: Color.fromARGB(255, 28, 31, 31),
      appBar: _buildAppBar('Einstellungen', context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                _profil(),
                _einstellungen(titel[0], titel[1], icons[0], icons[1]),
                _einstellungen(titel[2], titel[3], icons[2], icons[3]),
                _einstellungen(titel[4], titel[5], icons[4], icons[5]),
                SizedBox(
                  height: 16,
                ),
                CustomRoundButton(
                  callback: (){
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => StartScreen()));
                  },
                  text: 'Abmelden',
                  textColor: _controller.appConstants.white,
                  color: _controller.appConstants.turquoise,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding _einstellungen(String titel1, String titel2, Icon icon1, Icon icon2) {
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
                            child: icon1,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Text(
                                titel1,
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
                              child: Icon(Icons.keyboard_arrow_right, size: 50,),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
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
                      Row(
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
                            child: icon2,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              child: Text(
                                titel2,
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
                              child: Icon(Icons.keyboard_arrow_right, size: 50,),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
  }

  Padding _profil() {
    return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MainScreen()));
        },
      ),
      actions: [],
    );
  }
}
