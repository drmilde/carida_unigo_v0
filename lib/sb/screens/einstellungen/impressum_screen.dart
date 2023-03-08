import 'package:flutter/material.dart';
import 'package:projects/sb/screens/einstellungen/einstellungen_screen.dart';

class ImpressumScreen extends StatefulWidget {
  const ImpressumScreen({Key? key}) : super(key: key);

  @override
  State<ImpressumScreen> createState() => _ImpressumScreenState();
}

class _ImpressumScreenState extends State<ImpressumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('Impressum', context),
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
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => EinstellungenScreen()));
        },
      ),
      actions: [],
    );
  }
}
