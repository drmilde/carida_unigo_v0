import 'package:flutter/material.dart';

import '../home/main_screen.dart';

class EinstellungenScreen extends StatelessWidget {
  const EinstellungenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      //backgroundColor: Color.fromARGB(255, 28, 31, 31),
      appBar: _buildAppBar('Einstellungen', context),
    );
  }

  AppBar _buildAppBar(String title, BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Color.fromARGB(255, 28, 31, 31),
          fontSize: 28,
        ),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: BackButton(
        color: Color.fromARGB(255, 28, 31, 31),
            onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainScreen()));
        },
      ),
      actions: [
      ],
    );
  }
}
