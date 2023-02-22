import 'package:flutter/material.dart';
import 'package:projects/screens/widgets/custom_app_bar_widget.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

import '../widgets/custom_dialog_widget.dart';

class FahrtenPage extends StatelessWidget {
  UGStateController _controller = UGStateController();

  FahrtenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAppBar(title: "Fahrten"),
          Expanded(
            child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
              return ListTile(
                title: Text("Fahrt ${index}"),
                leading: Icon(Icons.car_rental_outlined),
                tileColor: _controller.appConstants.primary_color,
              );
            }),
          ),
        ],
      ),
    );
  }
}
