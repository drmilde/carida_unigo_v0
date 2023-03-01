import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/services/extensions/unigo_service_angebot_extension.dart';

import '../../../services/controller/ug_state_controller.dart';
import '../../../services/model/angebot.dart';
import '../../../services/unigo_service.dart';

class BuchungenScreen extends StatefulWidget {
  const BuchungenScreen({Key? key}) : super(key: key);

  @override
  _BuchungenScreenState createState() => _BuchungenScreenState();
}

class _BuchungenScreenState extends State<BuchungenScreen> {
  UGStateController _controller = Get.find();
  UniGoService service = UniGoService();
  List<Angebot> fahrten = [];

  bool istFahrer = true;

  // Load the list data from server
  Future<bool> _loadFahrten() async {
    fahrten = await service.getAngebotList();

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      Text(
                        "Fahren",
                        style: GoogleFonts.inter(
                          color: _controller.appConstants.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      Icon(Icons.directions_car),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  height: 48,
                ),
                Tab(
                  child: Row(
                    children: [
                      Text(
                        "Mitfahren",
                        style: GoogleFonts.inter(
                          color: _controller.appConstants.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      Icon(Icons.thumb_up_off_alt_rounded),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  height: 48,
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _fahren(),
                  _fahren(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _fahren() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Obx(
            () {
              int _change = _controller.somethingChanged.value;
              return FutureBuilder<bool>(
                future: _loadFahrten(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return _buildListView(snapshot);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return CircularProgressIndicator();
                },
              );
            },
          ),
          /*SizedBox(
              height: 16,
            ),*/
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildListView(AsyncSnapshot<bool> snapshot) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: ListView.builder(
          itemCount: fahrten.length,
          itemBuilder: (context, index) {
            final fahrt = fahrten[index];
            return _buchungen(
              fahrt.startort,
              fahrt.zielort,
              fahrt.uhrzeit,
              _controller.appConstants.dark_grey,
              istFahrer
                  ? Icon(
                      Icons.directions_car,
                      color: _controller.appConstants.turquoise,
                    )
                  : Icon(
                      Icons.thumb_up,
                      color: _controller.appConstants.light_green,
                    ),
              Icon(Icons.delete),
            );
          },
        ),
      ),
    );
  }

  Widget _buchungen(
    String start,
    String ziel,
    String uhrzeit,
    Color color,
    Icon icon,
    Icon delete,
  ) {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                    SizedBox(height: 8),
                    Icon(Icons.arrow_downward),
                    SizedBox(height: 8),
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
                ),
              ],
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
      ),
    );
  }
}
