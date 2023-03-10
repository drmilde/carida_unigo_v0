import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/sb/screens/onboarding/unigo_introduction_screen.dart';
import 'package:projects/sb/screens/suche/autocomplete_screen.dart';
import 'package:projects/sb/screens/suche/click_to_add_marker_screen.dart';
import 'package:projects/sb/screens/suche/map_suche_screen.dart';
import 'package:projects/sb/screens/suche/select_address_location_screen.dart';
import 'package:projects/sb/screens/welcome/start_screen.dart';
import 'package:projects/screens/widgets/carida_logo_widget.dart';
import 'package:projects/screens/widgets/custom_round_button.dart';
import 'package:projects/screens/widgets/hsfulda_logo_widget.dart';
import 'package:projects/services/extensions/unigo_service_nutzer_extension.dart';
import 'package:projects/services/extensions/unigo_service_profil_extension.dart';
import 'package:projects/services/persistence/user_config.dart';
import 'package:projects/services/unigo_service.dart';

import '../../services/controller/ug_state_controller.dart';
import '../sb/screens/home/main_screen.dart';
import '../services/model/nutzer.dart';
import '../services/model/profil.dart';
import 'widgets/svg_dynamic_scaffold_widget.dart';
import 'widgets/svg_logo_widget.dart';
import 'widgets/unigo_bottom_navigation_bar.dart';

class PreLoadingScreen extends StatelessWidget {
  UGStateController _controller = Get.put(UGStateController());
  UniGoService service = UniGoService();

  PreLoadingScreen({Key? key}) : super(key: key);

  Future<bool> _loadData() async {
    // TODO load relevant data

    // UserConfig aus dem lokalen Speicher laden und
    // im UGStateController speichern
    UserConfig _config = await _controller.persistenceManager.loadStore();
    _controller.userConfig = _config;

    print("UserConfig geladen. Status: ${_controller.userConfig.isValid()}");
    print("UserConfig UUID: ${_controller.userConfig.user.uuid}");
    print("UserConfig ID: ${_controller.userConfig.user.id}");
    print("UserConfig PROFIL_ID: ${_controller.userConfig.user.profilId}");

    // check, ob Nutzer und Profil auf dem Server exitieren ?
    // falls nein, wird die UserConfig zurückgesetzt
    // der Anwender muss sich neu registrieren, um eine
    // neue UUID, ID und Profil_ID zu erhalten
    try {
      Nutzer nutzer =
          await service.getNutzerById(id: _controller.userConfig.user.id);
      print("OK: Nutzer existiert auf dem Server");
    } on Exception catch (e) {
      // TODO
      print("FAIL: Nutzer auf dem Server nicht gefunden");
      _controller.userConfig = UserConfig.empty();
    }

    try {
      Profil profil =
          await service.getProfilById(id: _controller.userConfig.user.profilId);
      print("OK: Profil existiert auf dem Server");
    } on Exception catch (e) {
      // TODO
      print("FAIL: Profil auf dem Server nicht gefunden");
      _controller.userConfig = UserConfig.empty();
    }

    int numberLoaded = await _controller.angebotCache.reload();
    print("Anzahl Angebote: ${numberLoaded}");

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SVGDynamicScaffoldWidget(
      drawer: Drawer(),
      showDrawer: false,
      appBar: AppBar(),
      showAppbar: false,
      fab: FloatingActionButton(
        onPressed: () {},
        child: Text("+"),
      ),
      showFab: false,
      bottomNavigationBar: UnigoBottomNavigationsBar(),
      showBottonNavigationBar: false,
      body: FutureBuilder<bool>(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildContent(context, snapshot);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    AsyncSnapshot<bool> snapshot,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 130),
        SVGLogoWidget(
          width: 250,
        ),
        SizedBox(height: 32),
        CaridaLogoWidget(width: 250),
        SizedBox(height: 16),
        HSFuldaLogoWidget(width: 300),
        Expanded(
          child: Container(
            width: 200,
            //height: 100,
          ),
        ),
        CustomRoundButton(
          text: "Los geht\'s",
          textColor: _controller.appConstants.white,
          color: _controller.appConstants.turquoise,
          callback: () {
            /*
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));

               */
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UniGoIntroductionScreen()));
          },
        ),
        SizedBox(
          height: 16,
        ),
        CustomRoundButton(
          text: "Direkt zur App",
          textColor: _controller.appConstants.white,
          color: _controller.appConstants.turquoise,
          callback: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => StartScreen()));
          },
        ),
        SizedBox(
          height: 16,
        ),
        CustomRoundButton(
          text: "Wähle Startpunkt",
          textColor: _controller.appConstants.white,
          color: _controller.appConstants.turquoise,
          callback: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => MapSucheScreen()));
          },
        ),
        SizedBox(
          height: 16,
        ),
        CustomRoundButton(
          text: "Autocomplet test",
          textColor: _controller.appConstants.white,
          color: _controller.appConstants.turquoise,
          callback: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AutoCompleteDemo()));
          },
        ),
        Expanded(
          child: Container(
            width: 100,
            //height: 100,
          ),
        ),
        Container(
          height: 72,
          child: Center(child: Text("app data loaded")),
        ),
      ],
    );
  }
}
