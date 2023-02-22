import 'package:flutter/material.dart';
import 'package:projects/screens/widgets/dashboard_widget.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

import '../../services/osrm/model/osrm.dart';
import '../../services/osrm/model/osrm_service_provider.dart';
import '../profil_screen.dart';
import '../prototyp_dummies/dummy_login_screen.dart';
import '../prototyp_dummies/osrm/dummy_osrm_screen.dart';
import '../widgets/custom_round_button.dart';
import '../widgets/custom_dialog_widget.dart';

class HomePage extends StatelessWidget {
  UGStateController _controller = UGStateController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Dashboard(),
          SizedBox(height: 100),
          CustomRoundButton(
            text: "Fahrt suchen",
            callback: () async {
              Osrm answer = await OSRMServiceProvider.getRoute(
                coordString: "9.41188,50.63475;9.68522,50.56611",
                objectFromJson: osrmFromJson,
              );
              answer.printRoutes();
            },
            width: 250,
          ),
          SizedBox(height: 16),
          CustomRoundButton(
            text: "Fahrt hinzufügen",
            color: _controller.appConstants.primary_color,
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OsrmListScreen()),
              );
            },
            width: 250,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
