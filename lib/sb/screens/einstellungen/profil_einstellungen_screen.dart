import 'package:flutter/material.dart';
import 'package:projects/sb/screens/einstellungen/einstellungen_screen.dart';
import 'package:projects/sb/screens/welcome/start_screen.dart';
import 'package:projects/screens/widgets/custom_round_button.dart';
import 'package:projects/services/controller/ug_state_controller.dart';
import 'package:get/get.dart';

import '../home/main_screen.dart';

class ProfilEinstellungenScreen extends StatefulWidget {
  const ProfilEinstellungenScreen({Key? key}) : super(key: key);

  @override
  State<ProfilEinstellungenScreen> createState() =>
      _ProfilEinstellungenScreenState();
}

class _ProfilEinstellungenScreenState extends State<ProfilEinstellungenScreen> {
  UGStateController _controller = Get.find();

  final String name = 'Tinkerbell';

  final List<String> images = [
    'assets/avatars/avatar0280.png',
    'assets/avatars/avatar0281.png',
    'assets/avatars/avatar0282.png',
    'assets/avatars/avatar0283.png',
    'assets/avatars/avatar0284.png',
    'assets/avatars/avatar0285.png',
    'assets/avatars/avatar0286.png',
    'assets/avatars/avatar0287.png',
    'assets/avatars/avatar0288.png',
    'assets/avatars/avatar0289.png',
    'assets/avatars/avatar0290.png',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      //backgroundColor: Color.fromARGB(255, 28, 31, 31),
      appBar: _buildAppBar('Profil Einstellungen', context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                _profilbild(),
                SizedBox(
                  height: 16,
                ),
                Padding(
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
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 2,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: _controller.appConstants.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 4,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                          ],
                        ),SizedBox(
                          height: 16,
                        ),
                        Container(
                          height: 2,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: _controller.appConstants.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 4,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),
                CustomRoundButton(
                  callback: () {},
                  text: 'Speichern',
                  textColor: _controller.appConstants.white,
                  color: _controller.appConstants.turquoise,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Padding _profilbild() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _avatar(images[0], _controller.appConstants.turquoise),
                  _avatar(images[1], _controller.appConstants.white),
                  _avatar(images[2], _controller.appConstants.white),
                  _avatar(images[3], _controller.appConstants.white),
                  _avatar(images[4], _controller.appConstants.white),
                  _avatar(images[5], _controller.appConstants.white),
                  _avatar(images[6], _controller.appConstants.white),
                  _avatar(images[7], _controller.appConstants.white),
                  _avatar(images[8], _controller.appConstants.white),
                  _avatar(images[9], _controller.appConstants.white),
                  _avatar(images[10], _controller.appConstants.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _avatar(String image, Color color) {
    return Container(
      width: 80,
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(80),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80),
        //padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: Image.asset(image, fit: BoxFit.contain),
      ),
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
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EinstellungenScreen()));
        },
      ),
      actions: [],
    );
  }
}
