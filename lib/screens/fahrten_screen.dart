import 'package:flutter/material.dart';
import 'package:projects/screens/widgets/custom_app_bar_widget.dart';

import 'widgets/svg_dynamic_scaffold_widget.dart';
import 'widgets/unigo_bottom_navigation_bar.dart';

class FahrtenScreen extends StatelessWidget {
  const FahrtenScreen({Key? key}) : super(key: key);

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomAppBar(title: "Fahrten"),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
