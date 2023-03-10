import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projects/sb/screens/einstellungen/einstellungen_screen.dart';

import '../../../screens/widgets/custom_round_button.dart';
import '../../../services/controller/ug_state_controller.dart';
import '../welcome/start_screen.dart';

class MitteilungenScreen extends StatefulWidget {
  const MitteilungenScreen({Key? key}) : super(key: key);

  @override
  State<MitteilungenScreen> createState() => _MitteilungenScreenState();
}

class Box {
  String label1;
  String label2;
  bool status;

  Box(this.label1, this.label2, this.status);
}

class _MitteilungenScreenState extends State<MitteilungenScreen> {
  UGStateController _controller = Get.find();
  List<Box> boxen = [];

  List<String> label = ['Chats', 'System', 'News', 'Allgemein'];

  @override
  void initState() {
    boxen = [
      Box("Mitteilungen", 'Ton', false),
      Box("Mitteilungen", 'Ton', false),
      Box("Mitteilungen", 'Ton', false),
      Box("Vorschau anzeigen", 'Hinweisstil', false),
    ];
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('Mitteilungen', context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              //height: 100,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: boxen.length + 1,
                  itemBuilder: (context, index) {
                    if (index < boxen.length) {
                      return Column(
                        children: [
                          Text(
                            label[index],
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          _mitteilung(boxen[index]),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: CustomRoundButton(
                            width: 350,
                            callback: () {},
                            text: 'Einstellungen zurücksetzen',
                            textColor: _controller.appConstants.white,
                            color: Colors.red),
                      );
                    }
                  },
                ),
              ),
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
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EinstellungenScreen()));
        },
      ),
      actions: [],
    );
  }

  Widget _mitteilung(Box box) {
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
            Container(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Text(
                        box.label1,
                        style: TextStyle(
                          fontSize: 15,
                          //fontWeight: FontWeight.bold,
                        ),
                        //textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: FlutterSwitch(
                        width: 100.0,
                        height: 35.0,
                        valueFontSize: 17.0,
                        activeTextFontWeight: FontWeight.normal,
                        inactiveTextFontWeight: FontWeight.normal,
                        toggleSize: 23.0,
                        value: box.status,
                        borderRadius: 20.0,
                        padding: 8.0,
                        showOnOff: true,
                        onToggle: (val) {
                          setState(() {
                            box.status = val;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            _buildShadowLine(),
            SizedBox(
              height: 16,
            ),
            Container(
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Text(
                        box.label2,
                        style: TextStyle(
                          fontSize: 15,
                          //fontWeight: FontWeight.bold,
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
}
