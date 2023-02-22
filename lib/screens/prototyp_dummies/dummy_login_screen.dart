import 'package:flutter/material.dart';

import '../widgets/custom_round_button.dart';
import '../widgets/svg_dynamic_scaffold_widget.dart';
import '../widgets/svg_logo_widget.dart';
import '../widgets/unigo_bottom_navigation_bar.dart';

class DummyLoginScreen extends StatelessWidget {
  const DummyLoginScreen({Key? key}) : super(key: key);

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SVGLogoWidget(width: 250,),
            SizedBox(height: 200),
            CustomRoundButton(
              text: "Anmelden",
              callback: () {},
              width: 150,
            ),
          ],
        ),
      ),
    );
  }
}
