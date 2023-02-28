import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/sb/screens/onboarding/unigo_introduction_screen.dart';
import 'package:projects/screens/widgets/custom_round_button.dart';

import '../../services/controller/ug_state_controller.dart';
import '../sb/screens/home/main_screen.dart';

import 'widgets/svg_dynamic_scaffold_widget.dart';
import 'widgets/svg_logo_widget.dart';
import 'widgets/unigo_bottom_navigation_bar.dart';

class PreLoadingScreen extends StatelessWidget {
  UGStateController _controller = Get.put(UGStateController());

  PreLoadingScreen({Key? key}) : super(key: key);

  Future<bool> _loadData() async {
    // TODO load relevant data
    return true;
  }

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
      body: FutureBuilder<bool>(
        future: _loadData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildContent(context, snapshot);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    AsyncSnapshot<bool> snapshot,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 130),
        SVGLogoWidget(
          width: 250,
        ),
        SizedBox(height: 300),
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
            /*
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginScreen()));

               */
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
