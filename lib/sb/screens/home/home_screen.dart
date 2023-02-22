import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Color> colors = [
    Color.fromARGB(255, 202, 211, 211),
    Color.fromARGB(255, 0, 173, 167),
    Color.fromARGB(255, 139, 208, 106),
    Color.fromARGB(255, 28, 31, 31),
    Color.fromARGB(255, 255, 255, 255),
  ];

  final List<String> erfolge = [
    '999',
    'KG CO2 gespart',
    '10273',
    'km gefahren',
    '125',
    'Punkte',
  ];

  final List<String> fahrtDaten = [
    'Lauterbach',
    'HS Fulda',
    '26.03.2023  08:30 Uhr',
  ];

  final String image = 'assets/images/profilbild.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              //color: Colors.green,
              ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _profilePicture(image),
                _name(),
                _ratingBar(),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: _erfolge(erfolge[0], erfolge[1]),
                      ),
                      Expanded(
                        flex: 1,
                        child: _erfolge(erfolge[2], erfolge[3]),
                      ),
                      Expanded(
                        flex: 1,
                        child: _erfolge(erfolge[4], erfolge[5]),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: colors[1],
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  child: Text(
                    'Deine nächste fahrt:',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Container(
                  width: double.infinity,
                  //margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                  decoration: BoxDecoration(
                    color: colors[0],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  //color: Colors.yellow,
                  child: Column(children: [
                    _naechsteFahrt(fahrtDaten[0],fahrtDaten[1],fahrtDaten[2]),
                    //_buchungenButton(),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _buchungenButton() {
    return Container(
      height: 60,
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(60, 40, 60, 140),
      decoration: BoxDecoration(
        color: colors[1],
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
      child: Center(
        child: Text(
          "Buchungen",
          style: TextStyle(
            color: colors[4],
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  Container _ratingBar() {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: RatingBar.builder(
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: colors[1],
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
    );
  }

  Container _name() {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 15, 25, 10),
      width: double.infinity,
      //color: Colors.pink,
      child: Text(
        'Tinkerbell',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 22,
        ),
      ),
    );
  }


  Container _erfolge(String oben, String unten) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 10, 25, 30),
      child: Column(
        children: [
          Text(
            oben,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            unten,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Container _profilePicture(String image) {
    return Container(
      margin: EdgeInsets.fromLTRB(25, 90, 25, 0),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: colors[0],
        borderRadius: BorderRadius.circular(80),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
          child:
              Image.asset(image, fit: BoxFit.contain),
        ),
      ),
    );
  }

  Container _naechsteFahrt(String start, String ziel, String time) {
    return Container(
      //color: Colors.red,
      margin: EdgeInsets.fromLTRB(25, 0, 25, 220),
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 60,
                        color: colors[2],
                      ),
                      Text(start),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Icon(
                    Icons.arrow_forward_outlined,
                    size: 60,
                    color: colors[3],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 60,
                        color: colors[2],
                      ),
                      Text(ziel),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Text(
              time,
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            //color:Colors.blue,
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(60, 10, 60, 20),
            child: ElevatedButton(
              onPressed: () {

              },
              child: Text(
                'Starten',
                style: TextStyle(
                  color: colors[4],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
