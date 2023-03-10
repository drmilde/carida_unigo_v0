import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projects/screens/widgets/custom_round_button.dart';
import 'package:projects/services/controller/ug_state_controller.dart';
import '../../../services/unigo_service.dart';

class HomeScreen extends StatefulWidget {

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UGStateController _controller = Get.find();
  UniGoService service = UniGoService();
  //var formKey = GlobalKey<FormBuilderState>();
  List<Color> colors = [
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

  final String image = 'assets/avatars/avatar0280.png';
  @override
  void initState() {
    // TODO: implement initState
    colors = [
      _controller.appConstants.light_grey,
      _controller.appConstants.turquoise,
      _controller.appConstants.light_green,
      _controller.appConstants.dark_grey,
      _controller.appConstants.white,
    ];
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      //backgroundColor: Colors.red,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _profilePicture(image),
                  _spacerSmall(),
                  _name(),
                  _spacerSmall(),
                  _ratingBar(),
                  _spacerLarge(),
                  _statistics(),
                  _spacerSmall(),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(16),
                    //margin: EdgeInsets.fromLTRB(20, 10, 20, 20),
                    decoration: BoxDecoration(
                      color: colors[4],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    //color: Colors.yellow,
                    child: Column(children: [
                      _spacerLarge(),
                      /*Container(
                        //margin: EdgeInsets.fromLTRB(20, 40, 20, 20),
                        child: Text(
                          'Deine nächste Fahrt:',
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                      _spacerSmall(),*/
                      _naechsteFahrt(fahrtDaten[0],fahrtDaten[1],fahrtDaten[2]),
                      //_buchungenButton(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),

    );
  }

  Container _statistics() {
    return Container(
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
            );
  }

  Widget _spacerLarge() {
    return SizedBox(
              height: 32,
            );
  }
  Widget _spacerSmall() {
    return SizedBox(
              height: 16,
            );
  }

  Container _buchungenButton() {
    return Container(
      height: 60,
      width: double.infinity,
      //margin: EdgeInsets.fromLTRB(60, 40, 60, 140),
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
      //margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: RatingBar.builder(
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        ignoreGestures: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: colors[1],
        ),
        onRatingUpdate: (rating) {
          //print(rating);
        },
      ),
    );
  }

  Container _name() {
    return Container(
      //margin: EdgeInsets.fromLTRB(25, 15, 25, 10),
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
      //margin: EdgeInsets.fromLTRB(25, 10, 25, 30),
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
      //margin: EdgeInsets.fromLTRB(25, 90, 25, 0),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: colors[0],
        borderRadius: BorderRadius.circular(80),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(80),
          //padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
          child:
              Image.asset(image, fit: BoxFit.contain),
        ),
      ),
    );
  }

  Container _naechsteFahrt(String start, String ziel, String time) {
    return Container(
      //color: Colors.red,
      //margin: EdgeInsets.fromLTRB(25, 0, 25, 120),
      //padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      width: double.infinity,
      child: Column(
        children: [
          _displayFahrtInfo(start, ziel),
          _spacerSmall(),
          Container(
            //margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Text(
              time,
              style: TextStyle(fontSize: 18),
            ),
          ),
          _spacerLarge(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 0),
            child: CustomRoundButton(
              text: "losfahren",
              textColor: _controller.appConstants.white,
              color: _controller.appConstants.turquoise,
              callback: () {
                /*Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AnmeldenScreen()));*/
              },
            ),
          ),
          _spacerLarge(),
        ],
      ),
    );
  }

  Row _displayFahrtInfo(String start, String ziel) {
    return Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: 60,
                      color: colors[3],
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
                      color: colors[3],
                    ),
                    Text(ziel),
                  ],
                ),
              ),
            ),
          ],
        );
  }
}
