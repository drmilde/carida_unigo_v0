import 'package:flutter/material.dart';
import 'package:projects/services/controller/ug_state_controller.dart';
import 'package:projects/services/extensions/unigo_service_nutzer_extension.dart';
import 'package:projects/services/extensions/unigo_service_profil_extension.dart';
import 'package:projects/services/persistence/user_config.dart';
import 'package:projects/services/unigo_service.dart';

import '../../../screens/widgets/custom_round_button.dart';
import '../../../screens/widgets/svg_dynamic_scaffold_widget.dart';
import '../../../screens/widgets/svg_logo_widget.dart';
import '../../../screens/widgets/unigo_bottom_navigation_bar.dart';
import '../../../services/model/nutzer.dart';
import '../../../services/model/profil.dart';
import 'registrieren_screen.dart';

class AnonymesRegistrierenScreen extends StatelessWidget {
  UGStateController _controller = UGStateController();
  UniGoService service = UniGoService();

  AnonymesRegistrierenScreen({Key? key}) : super(key: key);

  Future<bool> _loadData() async {
    // TODO load relevant data
    // TODO create User and store id, profilID und UUID

    bool result = true;

    // Anlegen des Profils und speichern der profil_id
    Profil profil = Profil.empty(
      id: 0,
      vorname: "vorname",
      beschreibung: "beschreibung",
      bewertung: "bewertung",
      fahrzeug: "fahrzeug",
      kmgefahren: 0,
      raucher: "nein",
      tier: "nein",
    );

    Profil profil_answer = await service.createProfilById(
      id: 0,
      data: profil,
    );

    // Falls Profil erfolgreich angelegt wurde, dann Nutzer anlegen
    if (profil_answer.id != 0) {
      Nutzer nutzer = Nutzer(
        id: 0,
        vorname: "anonym",
        nachname: "anonym",
        email: "mail@anonymus.de",
        geburtsdatum: "01-01-1970",
        passwort: "unbekannt",
        uuid: "",
        hasprofile: [profil_answer.id],
      );

      Nutzer nutzer_answer =
          await service.createNutzerById(id: 0, data: nutzer);

      if (nutzer_answer.id != 0) {
        print("Profil ID: ${profil_answer.id}");
        print("Nutzer ID: ${nutzer_answer.id}");
        print("Nutzer UUID: ${nutzer_answer.uuid}");

        User user = User(
          vorname: "",
          nachname: "",
          email: "",
          fdnummer: "",
          geburtsdatum: "",
          passwort: "",
          profilId: profil_answer.id,
          id: nutzer_answer.id,
          uuid: nutzer_answer.uuid,
        );

        Profile profile = Profile(
          profilId: profil_answer.id,
          uuid: nutzer_answer.uuid,
          displayName: "",
          tier: false,
          rauchen: false,
          bewertung: 0.0,
          fahrzeug: ["fahrzeug"],
          kmgefahren: 0,
          punktegesammelt: 0,
        );

        UserConfig config = UserConfig(
          version: "v1",
          user: user,
          profile: profile,
        );

        _controller.userConfig = config;
        result = await _controller.persistenceManager
            .saveStore(_controller.userConfig);

        print ("UserConfig created and persisted: ${result}");
      }
    }
    return result;
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
          return CircularProgressIndicator();
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
        SizedBox(height: 130),
        CustomRoundButton(
          text: "Profil bearbeiten",
          textColor: _controller.appConstants.white,
          color: _controller.appConstants.turquoise,
          callback: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => RegistrierenScreen(),
              ),
            );
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
