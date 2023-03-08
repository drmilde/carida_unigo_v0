import 'package:flutter/material.dart';
import 'package:projects/sb/screens/einstellungen/einstellungen_screen.dart';

class MitteilungenScreen extends StatefulWidget {
  const MitteilungenScreen({Key? key}) : super(key: key);

  @override
  State<MitteilungenScreen> createState() => _MitteilungenScreenState();
}

class _MitteilungenScreenState extends State<MitteilungenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar('Mitteilungen', context),
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
