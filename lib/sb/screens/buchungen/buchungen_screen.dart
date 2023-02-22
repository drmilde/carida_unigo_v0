import 'package:flutter/material.dart';

class BuchungenScreen extends StatefulWidget {
  const BuchungenScreen({Key? key}) : super(key: key);

  @override
  State<BuchungenScreen> createState() => _BuchungenScreenState();
}

class _BuchungenScreenState extends State<BuchungenScreen> {
  final List<Color> colors = [
    Color.fromARGB(255, 202, 211, 211),
    Color.fromARGB(255, 0, 173, 167),
    Color.fromARGB(255, 139, 208, 106),
    Color.fromARGB(255, 28, 31, 31),
    Color.fromARGB(255, 255, 255, 255),
  ];

  final List<String> dates = [
    '23.03.2023',
    '02.04.2023',
    '07.04.2023',
  ];

  final List<Icon> icons = [
    Icon(Icons.thumb_up),
    Icon(Icons.directions_car),
    Icon(Icons.delete),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            //color: Colors.green,
            ),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(
                  height: 110,
                ),
            _tagBuchung(dates[0]),
            Container(
              margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Column(
                children: [
                  _buchungen('Großenlüder', 'HochschuleFulda', '08:00 Uhr',
                      colors[3], icons[0], icons[2]),
                  _buchungen('Künzell', 'HochschuleFulda', '09:00 Uhr',
                      colors[3], icons[1], icons[2]),
                ],
              ),
            ),
                _tagBuchung(dates[1]),
            Container(
              margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
              child: Column(
                children: [
                  _buchungen('Hochschule Fulda', 'Petersberg', '14:00 Uhr',
                      colors[3], icons[1], icons[2]),
                  _buchungen('Hofbieber', 'HochschuleFulda', '07:45 Uhr',
                      colors[3], icons[1], icons[2]),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Container _tagBuchung(String date) {
    return Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(30, 20, 20, 5),
                  child: Text(
                    date,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: 120,
                  height: 1,
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                  color: colors[1],
                ),
              ],
            ),
          );
  }

  Container _buchungen(String start, String ziel, String uhrzeit, Color color,
      Icon icon, Icon delete) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
      //color: Colors.yellow,
      child: Column(
        children: [
          Container(
            //color: Colors.blue,
            width: double.infinity,
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        start,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        //textAlign: TextAlign.left,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.arrow_downward),
                      ],
                    ),
                    Container(
                      child: Text(
                        ziel,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 0, 10),
                  child: Text(uhrzeit),
                ),
                Container(
                  //color: Colors.green,
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Icon(
                    Icons.keyboard_arrow_right,
                    size: 50,
                    color: color,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, 19, 0, 10),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: icon,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: delete,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
