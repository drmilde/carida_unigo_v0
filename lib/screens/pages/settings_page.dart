import 'package:flutter/material.dart';

import '../profil_screen.dart';
import '../widgets/custom_round_button.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Settings"),
          SizedBox(height: 16),
          CustomRoundButton(
            text: "Zum Profil",
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfilScreen(),
                ),
              );
            },
            width: 150,
          ),
        ],
      ),
    );
  }
}
