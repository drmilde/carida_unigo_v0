import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/sb/widgets/buchungen/angebot_card_widget.dart';
import 'package:projects/sb/widgets/buchungen/date_select_widget.dart';
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
            SizedBox(height:8),
            Container(width: 350, child: DateSelectWidget()),
            TabBar(
              labelColor: Colors.black,
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      Text(
                        "Selber fahren",
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
            return AngebotCardWidget(
              angebot: fahrt,
              onDelete: () async {
                bool result = await service.deleteAngebotById(id: fahrt.id);
                _controller.change();
              },
              onDetail: () {},
              arrowColor: _controller.appConstants.dark_grey,
              icon: istFahrer
                  ? Icon(
                      Icons.directions_car,
                      color: _controller.appConstants.turquoise,
                    )
                  : Icon(
                      Icons.thumb_up,
                      color: _controller.appConstants.light_green,
                    ),
              delete: Icon(Icons.delete),
            );
          },
        ),
      ),
    );
  }
}
