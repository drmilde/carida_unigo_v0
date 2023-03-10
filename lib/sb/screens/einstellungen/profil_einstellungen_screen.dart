import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/sb/screens/einstellungen/einstellungen_screen.dart';
import 'package:projects/sb/screens/suche/map_suche_screen.dart';
import 'package:projects/sb/screens/welcome/start_screen.dart';
import 'package:projects/screens/widgets/custom_round_button.dart';
import 'package:projects/screens/widgets/custom_select_position_button_widget.dart';
import 'package:projects/services/controller/ug_state_controller.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../screens/widgets/forms/form_text_field.dart';
import '../../../services/unigo_service.dart';
import '../home/main_screen.dart';

class ProfilEinstellungenScreen extends StatefulWidget {
  const ProfilEinstellungenScreen({Key? key}) : super(key: key);

  @override
  State<ProfilEinstellungenScreen> createState() =>
      _ProfilEinstellungenScreenState();
}

class _ProfilEinstellungenScreenState extends State<ProfilEinstellungenScreen>
    with TickerProviderStateMixin {
  UGStateController _controller = Get.find();
  UniGoService service = UniGoService();
  var formKey = GlobalKey<FormBuilderState>();

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
    'assets/avatars/avatar0270.png',
    'assets/avatars/avatar0271.png',
    'assets/avatars/avatar0272.png',
    'assets/avatars/avatar0273.png',
    'assets/avatars/avatar0274.png',
    'assets/avatars/avatar0275.png',
    'assets/avatars/avatar0276.png',
    'assets/avatars/avatar0277.png',
    'assets/avatars/avatar0278.png',
    'assets/avatars/avatar0279.png',
    'assets/avatars/avatar0240.png',
    'assets/avatars/avatar0240.png',
    'assets/avatars/avatar0241.png',
    'assets/avatars/avatar0242.png',
    'assets/avatars/avatar0243.png',
    'assets/avatars/avatar0244.png',
    'assets/avatars/avatar0245.png',
    'assets/avatars/avatar0246.png',
    'assets/avatars/avatar0247.png',
    'assets/avatars/avatar0248.png',
    'assets/avatars/avatar0249.png',
    'assets/avatars/avatar0230.png',
  ];

  final List<String> cars = ['Opel Corsa', 'Audi A1', 'VW Polo', 'Ford Fiesta'];

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      //backgroundColor: Color.fromARGB(255, 28, 31, 31),
      appBar: _buildAppBar('Profil Einstellungen', context),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Padding(
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          //color: Colors.yellow,
                          child: Column(
                            children: [
                              Container(
                                //width: double.infinity,
                                child: TabBar(
                                  controller: _tabController,
                                  labelColor:
                                      _controller.appConstants.dark_grey,
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        "avatar",
                                        style: GoogleFonts.inter(
                                          color: _controller.appConstants.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "pets",
                                        style: GoogleFonts.inter(
                                          color: _controller.appConstants.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        "symbols",
                                        style: GoogleFonts.inter(
                                          color: _controller.appConstants.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                width: double.maxFinite,
                                height: 100,
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          _avatar(
                                              images[0],
                                              _controller
                                                  .appConstants.turquoise),
                                          _avatar(images[1],
                                              _controller.appConstants.white),
                                          _avatar(images[2],
                                              _controller.appConstants.white),
                                          _avatar(images[3],
                                              _controller.appConstants.white),
                                          _avatar(images[4],
                                              _controller.appConstants.white),
                                          _avatar(images[5],
                                              _controller.appConstants.white),
                                          _avatar(images[6],
                                              _controller.appConstants.white),
                                          _avatar(images[7],
                                              _controller.appConstants.white),
                                          _avatar(images[8],
                                              _controller.appConstants.white),
                                          _avatar(images[9],
                                              _controller.appConstants.white),
                                          _avatar(images[10],
                                              _controller.appConstants.white),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          _avatar(
                                              images[11],
                                              _controller
                                                  .appConstants.turquoise),
                                          _avatar(images[12],
                                              _controller.appConstants.white),
                                          _avatar(images[13],
                                              _controller.appConstants.white),
                                          _avatar(images[14],
                                              _controller.appConstants.white),
                                          _avatar(images[15],
                                              _controller.appConstants.white),
                                          _avatar(images[16],
                                              _controller.appConstants.white),
                                          _avatar(images[17],
                                              _controller.appConstants.white),
                                          _avatar(images[18],
                                              _controller.appConstants.white),
                                          _avatar(images[19],
                                              _controller.appConstants.white),
                                          _avatar(images[20],
                                              _controller.appConstants.white),
                                          _avatar(images[21],
                                              _controller.appConstants.white),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          _avatar(
                                              images[22],
                                              _controller
                                                  .appConstants.turquoise),
                                          _avatar(images[23],
                                              _controller.appConstants.white),
                                          _avatar(images[24],
                                              _controller.appConstants.white),
                                          _avatar(images[25],
                                              _controller.appConstants.white),
                                          _avatar(images[26],
                                              _controller.appConstants.white),
                                          _avatar(images[27],
                                              _controller.appConstants.white),
                                          _avatar(images[28],
                                              _controller.appConstants.white),
                                          _avatar(images[29],
                                              _controller.appConstants.white),
                                          _avatar(images[30],
                                              _controller.appConstants.white),
                                          _avatar(images[31],
                                              _controller.appConstants.white),
                                          _avatar(images[32],
                                              _controller.appConstants.white),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //const SizedBox(height: 8),
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          //color: Colors.yellow,
                          child: FormBuilder(
                            key: formKey,
                            // enabled: false,
                            onChanged: () {
                              formKey.currentState!.save();
                            },
                            autovalidateMode: AutovalidateMode.disabled,
                            skipDisabled: true,
                            child: Column(
                              children: [
                                const SizedBox(height: 8),
                                CustomFormTextField(
                                  formKey: formKey,
                                  name: "username",
                                  labelText: "Username",
                                  value: "",
                                  showBorder: true,
                                ),
                                const SizedBox(height: 16),
                                /*Container(
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
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),*/
                                CustomFormTextField(
                                  formKey: formKey,
                                  name: "ueber_mich",
                                  labelText: "??ber mich",
                                  value: "",
                                  showBorder: true,
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  width: 300,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CustomFormTextField(
                                          formKey: formKey,
                                          name: "heimatort",
                                          labelText: "Heimatort",
                                          value: "",
                                          showBorder: true,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      CustomSelectPositionButton(),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 16),
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
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 5, 10, 5),
                                        padding:
                                            EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        decoration: BoxDecoration(
                                          color: _controller.appConstants.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 4,
                                              blurRadius: 7,
                                              offset: Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(Icons.add),
                                          ],
                                        ),
                                      ),
                                      _fahrzeug(cars[0]),
                                      _fahrzeug(cars[1]),
                                      _fahrzeug(cars[2]),
                                      _fahrzeug(cars[3]),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),
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
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 24),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      _gender('weiblich'),
                                      _gender('m??nnlich'),
                                      _gender('divers'),
                                      _gender('keine Angabe'),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
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
            /*SizedBox(
              height: 24,
            ),*/
          ],
        ),
      ),
    );
  }

  Container _fahrzeug(String car) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
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
      child: Row(
        children: [
          Icon(Icons.directions_car),
          Text(car),
        ],
      ),
    );
  }

  Container _gender(String gender) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
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
      child: Text(gender),
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
          Navigator.of(context).pop();
        },
      ),
      actions: [],
    );
  }
}
