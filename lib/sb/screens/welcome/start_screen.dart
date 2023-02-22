import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/screens/widgets/custom_round_button.dart';
import 'package:projects/screens/widgets/svg_dynamic_scaffold_widget.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

import '../../../screens/widgets/unigo_bottom_navigation_bar.dart';
import 'anmelden_screen.dart';
import 'registrieren_screen.dart';

class StartScreen extends StatelessWidget {
  UGStateController _controller = Get.find();

  StartScreen({Key? key}) : super(key: key);

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

      image: "assets/images/background.svg",
      backgroundColor: _controller.appConstants.dark_grey,
      // Todo Hintergrundfarbe im DynamaicSVGScaffold festlegen
      //color: Color.fromARGB(255, 28, 31, 31),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(60, 660, 60, 5),
                child: CustomRoundButton(
                  text: "Anmelden",
                  textColor: _controller.appConstants.white,
                  color: _controller.appConstants.turquoise,
                  callback: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AnmeldenScreen()));
                  },
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(60, 10, 60, 10),
                child: CustomRoundButton(
                  text: "Registrieren",
                  textColor: _controller.appConstants.dark_grey,
                  color: _controller.appConstants.light_grey,
                  callback: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegistrierenScreen()));
                  },
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(100, 10, 100, 50),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa.',
                  style: TextStyle(
                    fontSize: 9,
                    color: Color.fromARGB(255, 202, 211, 211),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
