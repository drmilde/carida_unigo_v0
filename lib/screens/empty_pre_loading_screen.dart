import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/sb/screens/onboarding/unigo_introduction_screen.dart';
import 'package:projects/screens/widgets/carida_logo_widget.dart';
import 'package:projects/screens/widgets/custom_round_button.dart';
import 'package:projects/screens/widgets/hsfulda_logo_widget.dart';
import 'package:projects/services/unigo_service.dart';

import '../../services/controller/ug_state_controller.dart';
import '../sb/screens/home/main_screen.dart';
import 'widgets/svg_dynamic_scaffold_widget.dart';
import 'widgets/svg_logo_widget.dart';
import 'widgets/unigo_bottom_navigation_bar.dart';

class EmptyPreLoadingScreen extends StatelessWidget {
  UGStateController _controller = Get.put(UGStateController());
  UniGoService service = UniGoService();

  EmptyPreLoadingScreen({Key? key}) : super(key: key);

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
      body: _buildContent(context),
    );
  }

  Widget _buildContent(
    BuildContext context,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 130),
        SVGLogoWidget(
          width: 250,
        ),
        SizedBox(height: 32),
        CaridaLogoWidget(width: 250),
        SizedBox(height: 16),
        HSFuldaLogoWidget(width: 300),
        Expanded(
          child: Container(
            width: 200,
            //height: 100,
          ),
        ),
        CustomRoundButton(
          text: "Los geht\'s",
          textColor: _controller.appConstants.white,
          color: _controller.appConstants.turquoise,
          callback: () {
            /*
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));

               */
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UniGoIntroductionScreen()));
          },
        ),
        SizedBox(
          height: 16,
        ),
        CustomRoundButton(
          text: "Direkt zur App",
          textColor: _controller.appConstants.white,
          color: _controller.appConstants.turquoise,
          callback: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MainScreen()));
          },
        ),
        Expanded(
          child: Container(
            width: 100,
            //height: 100,
          ),
        ),
        Container(
          height: 72,
          child: Center(child: Text("app data loaded")),
        ),
      ],
    );
  }
}
