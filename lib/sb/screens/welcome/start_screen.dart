import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/sb/screens/welcome/anonymes_registrieren_screen.dart';
import 'package:projects/screens/widgets/carida_logo_widget.dart';
import 'package:projects/screens/widgets/custom_round_button.dart';
import 'package:projects/screens/widgets/hsfulda_logo_widget.dart';
import 'package:projects/screens/widgets/svg_dynamic_scaffold_widget.dart';
import 'package:projects/screens/widgets/svg_logo_widget.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

import '../../../screens/widgets/unigo_bottom_navigation_bar.dart';
import 'anmelden_screen.dart';
import 'registrieren_screen.dart';

class StartScreen extends StatelessWidget {
  UGStateController _controller = Get.find();
  bool isRegistered = true;

  StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SVGDynamicScaffoldWidget(
      drawer: Drawer(),
      showDrawer: false,
      appBar: AppBar(),
      showAppbar: false,
      fab: FloatingActionButton(
        onPressed: () {},
        child: Text("+"),
      ),
      showFab: false,
      bottomNavigationBar: UnigoBottomNavigationsBar(),
      showBottonNavigationBar: false,

      //image: "assets/images/background.svg",
      image: "assets/carida_background.svg",
      backgroundColor: _controller.appConstants.dark_grey,
      // Todo Hintergrundfarbe im DynamaicSVGScaffold festlegen
      //color: Color.fromARGB(255, 28, 31, 31),
      body: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height/2.25,
          ),
          SVGLogoWidget(width: 150),
          CaridaLogoWidget(width: 150),
          HSFuldaLogoWidget(width: 150),
          Expanded(
            child: Container(
              width: double.infinity,
            ),
          ),
          isRegistered
              ? Container(
                  width: 300,
                  child: CustomRoundButton(
                    text: "Anmelden",
                    textColor: _controller.appConstants.black,
                    color: _controller.appConstants.light_grey,
                    callback: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnmeldenScreen()));
                    },
                  ),
                )
              : Container(
                  width: 300,
                  child: CustomRoundButton(
                    text: "Registrieren",
                    textColor: _controller.appConstants.dark_grey,
                    color: _controller.appConstants.light_grey,
                    callback: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AnonymesRegistrierenScreen()));
                    },
                  ),
                ),
          SizedBox(
            height: 24,
          ),
          Container(
            width: double.infinity,
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
    );
  }
}
