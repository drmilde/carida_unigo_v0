/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projects/sb/screens/einstellungen/einstellungen_screen.dart';

import '../../../services/controller/ug_state_controller.dart';

class PunkteScreen extends StatefulWidget {
  const PunkteScreen({Key? key}) : super(key: key);

  @override
  State<PunkteScreen> createState() => _PunkteScreenState();
}

class Box {
  String label;

  Box(this.label);
}

class _PunkteScreenState extends State<PunkteScreen> {
  UGStateController _controller = Get.find();
  List<Box> boxen = [];
  @override
  void initState() {
    boxen = [
      Box(
        "Gutschein"
      ),
    ];
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('Punkte', context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              //height: 100,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    if (index == 3) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          width: double.infinity,
                          height: 250,
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
                                offset:
                                Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (index > 0 && index < 5) {
                      return Column(
                        children: [
                          Text(
                            labelRating[index - 1],
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          _ratingBar(),
                          SizedBox(
                            height: 8,
                          ),
                        ],
                      );
                    } else {
                      return _bewertung(boxen[index-5]);
                    }
                  },
                ),
              ),
            ),

            /*Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.amber,
                child:
                    Center(child: Text("Bewertungs Statistik (letzer Monat?)")),
              ),
            ),*/
          ],
        ),
      ),

      /*Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: double.infinity,
                color: Colors.amber,
                child:
                Center(child: Text("Punkte Statistik (letzer Monat?)")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 48,
                width: double.infinity,
                color: Colors.amber,
                child: Center(
                  child:
                  Text("aktueller Punktestand"),
                ),
              ),
            ),
            Container(
              height: 100,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          //height: 48,
                          width: 150,
                          color: Colors.orange,
                          child: Center(
                            child: Text("Gutschein"),
                          ),
                        ),
                      );
                    },
                ),
              ),
            ),
          ],
        ),
      ),*/
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
              .push(MaterialPageRoute(builder: (context) => EinstellungenScreen()));
        },
      ),
      actions: [],
    );
  }
}
*/