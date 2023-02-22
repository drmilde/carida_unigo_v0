import 'package:flutter/material.dart';
import 'package:projects/screens/chat/chat_screen.dart';

import '../../services/osrm/model/osrm.dart';
import '../../services/osrm/model/osrm_service_provider.dart';
import '../profil_screen.dart';
import '../prototyp_dummies/dummy_login_screen.dart';
import '../prototyp_dummies/osrm/dummy_osrm_screen.dart';
import '../widgets/custom_round_button.dart';
import '../widgets/custom_dialog_widget.dart';

class ChatPage extends StatelessWidget {

  ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Chat"),
          SizedBox(height: 16),
          CustomRoundButton(
            text: "Zum Chat",
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(),
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
