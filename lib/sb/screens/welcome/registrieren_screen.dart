import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

import '../../../screens/widgets/custom_round_button.dart';
import '../../../screens/widgets/svg_dynamic_scaffold_widget.dart';
import '../../../screens/widgets/unigo_bottom_navigation_bar.dart';
import 'registrieren_two_screen.dart';

class RegistrierenScreen extends StatefulWidget {
  const RegistrierenScreen({Key? key}) : super(key: key);

  @override
  State<RegistrierenScreen> createState() => _RegistrierenScreenState();
}

class _RegistrierenScreenState extends State<RegistrierenScreen> {
  UGStateController _controller = Get.find();
  final _formKey = GlobalKey<FormState>();
  List<Color> colors = [];

  @override
  void initState() {
    // TODO: implement initState
    colors = [
      _controller.appConstants.light_grey,
      _controller.appConstants.turquoise,
      _controller.appConstants.light_green,
      _controller.appConstants.dark_grey,
      _controller.appConstants.white,
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SVGDynamicScaffoldWidget(
      drawer: Drawer(),
      showDrawer: false,
      appbar: AppBar(),
      showAppbar: false,
      fab: FloatingActionButton(
        onPressed: () {},
        child: Text("+"),
      ),
      showFab: false,
      bottomNavigationBar: UnigoBottomNavigationsBar(),
      showBottonNavigationBar: false,

      backgroundColor: _controller.appConstants.dark_grey,
      image: "assets/images/background2.svg",
      //color: colors[3],
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.yellow,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //color: Colors.red,
                margin: EdgeInsets.fromLTRB(20, 80, 0, 20),
                child: Text(
                  'Registrieren',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Container(
                width: double.infinity,
                //color: Colors.pink,
                child: Form(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(30, 0, 150, 0),
                        width: double.infinity,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 40, 0, 5),
                              width: double.infinity,
                              child: Material(
                                elevation: 2.0,
                                shadowColor: Colors.grey,
                                child: TextFormField(
                                  style: TextStyle(color: colors[3]),
                                  keyboardType: TextInputType.name,
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    labelText: 'Username',
                                    border: UnderlineInputBorder(),
                                    //filled: true,
                                    //fillColor: colors[0],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
                              width: double.infinity,
                              child: Material(
                                elevation: 2.0,
                                shadowColor: Colors.grey,
                                child: TextFormField(
                                  style: TextStyle(color: colors[3]),
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: 'E-Mail Adresse',
                                    border: UnderlineInputBorder(),
                                    //filled: true,
                                    //fillColor: colors[0],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                              width: double.infinity,
                              child: Material(
                                elevation: 2.0,
                                shadowColor: Colors.grey,
                                child: TextFormField(
                                  style: TextStyle(color: colors[3]),
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    labelText: 'Passwort',
                                    border: UnderlineInputBorder(),
                                    //filled: true,
                                    //fillColor: colors[0],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
                              width: double.infinity,
                              child: Material(
                                elevation: 2.0,
                                shadowColor: Colors.grey,
                                child: TextFormField(
                                  style: TextStyle(color: colors[3]),
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                    labelText: 'Passwort wiederholen',
                                    border: UnderlineInputBorder(),
                                    //filled: true,
                                    //fillColor: colors[0],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        //color:Colors.blue,
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(60, 200, 60, 20),
                        child: CustomRoundButton(
                          text: "Weiter",
                          textColor: _controller.appConstants.white,
                          color: _controller.appConstants.turquoise,
                          callback: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegistrierenTwoScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
