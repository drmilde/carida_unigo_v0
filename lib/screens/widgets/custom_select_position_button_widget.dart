import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sb/screens/suche/map_suche_screen.dart';
import '../../services/controller/ug_state_controller.dart';

class CustomSelectPositionButton extends StatelessWidget {
  UGStateController _controller = Get.find();

  CustomSelectPositionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MapSucheScreen(),
        ));
      },
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: _controller.appConstants.turquoise,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Icon(
          Icons.location_on_outlined,
          color: _controller.appConstants.white,
          size: 24,
        ),
      ),
    );
  }
}
