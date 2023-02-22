import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/screens/pages/chat_page.dart';
import 'package:projects/screens/pages/fahrten_page.dart';
import 'package:projects/screens/pages/home_page.dart';
import 'package:projects/screens/pages/settings_page.dart';
import 'package:projects/screens/profil_screen.dart';
import 'package:projects/screens/widgets/custom_dialog_widget.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

import '../../services/osrm/model/osrm.dart';
import '../../services/osrm/model/osrm_service_provider.dart';
import 'prototyp_dummies/dummy_login_screen.dart';
import 'prototyp_dummies/osrm/dummy_osrm_screen.dart';
import 'widgets/custom_round_button.dart';
import 'widgets/svg_dynamic_scaffold_widget.dart';
import 'widgets/unigo_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  UGStateController _controller = Get.find();

  List<Widget> pages = [
    HomePage(),
    FahrtenPage(),
    ChatPage(),
    SettingsPage(),
  ];

  HomeScreen({Key? key}) : super(key: key);

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
      showBottonNavigationBar: true,
      body: Obx(
        () => pages[_controller.selectedPage.value],
      ),
    );
  }
}
