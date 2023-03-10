import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:projects/sb/screens/einstellungen/charts/bar_chart_widget.dart';
import 'package:projects/sb/screens/einstellungen/einstellungen_screen.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../services/controller/ug_state_controller.dart';

class BewertungScreen extends StatefulWidget {
  const BewertungScreen({Key? key}) : super(key: key);

  @override
  State<BewertungScreen> createState() => _BewertungScreenState();
}

class Box {
  String label1;
  String label2;

  Box(this.label1, this.label2);
}

class _BewertungScreenState extends State<BewertungScreen> {
  UGStateController _controller = Get.find();
  List<Box> boxen = [];

  final List<String> labelRating = [
    'Durchschnitt',
    'Freundlich',
    'Pünktlich',
    'Gesprächig'
  ];
  final List<double> ratings = [3, 4.0, 3.0, 2.0];

  bool status1 = false;
  bool status2 = false;

  @override
  void initState() {
    boxen = [
      Box(
        "Ich möchte bewertet werden",
        'Die Bewertung soll angezeigt werden',
      ),
    ];
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('Bewertung', context),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              //height: 100,
              child: Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          width: double.infinity,
                          height: 350,
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
                          child: BarChartWidget(werte: [1, 2, 3, 4, 5, 4, 3]),
                        ),
                      );
                      //return _buildBoxPlot();
                    } else if (index == 1) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Container(
                          width: double.infinity,
                          height: 350,
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
                          child: Column(
                            children: [
                              Text(
                                labelRating[0],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              _ratingBar(ratings[0]),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                labelRating[1],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              _ratingBar(ratings[1]),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                labelRating[2],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              _ratingBar(ratings[2]),
                              SizedBox(
                                height: 24,
                              ),
                              Text(
                                labelRating[3],
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              _ratingBar(ratings[3]),
                            ],
                          ),
                        ),
                      );

                      /*Column(
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
                      );*/
                    } else {
                      return _bewertung(boxen[index - 2]);
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
    );
  }

  Widget _buildBoxPlot() {
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
              offset: Offset(0, 3), // changes position of shadow
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
          Navigator.of(context).pop();
        },
      ),
      actions: [],
    );
  }

  Container _ratingBar(double rating) {
    return Container(
      //margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: RatingBar.builder(
        initialRating: rating,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        ignoreGestures: true,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: _controller.appConstants.turquoise,
        ),
        onRatingUpdate: (rating) {
          //print(rating);
        },
      ),
    );
  }

  Widget _bewertung(Box box) {
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
                        activeTextFontWeight: FontWeight.bold,
                        inactiveTextFontWeight: FontWeight.bold,
                        toggleSize: 23.0,
                        value: status1,
                        borderRadius: 20.0,
                        padding: 8.0,
                        showOnOff: true,
                        activeColor: _controller.appConstants.turquoise,
                        onToggle: (val) {
                          setState(() {
                            status1 = val;
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
                      child: FlutterSwitch(
                        width: 100.0,
                        height: 35.0,
                        valueFontSize: 17.0,
                        activeTextFontWeight: FontWeight.normal,
                        inactiveTextFontWeight: FontWeight.normal,
                        toggleSize: 23.0,
                        value: status2,
                        borderRadius: 20.0,
                        padding: 8.0,
                        showOnOff: true,
                        activeColor: _controller.appConstants.turquoise,
                        onToggle: (val) {
                          setState(() {
                            status2 = val;
                          });
                        },
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
