import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

class EditPenWidget extends StatelessWidget {
  UGStateController _controller = Get.find();

  VoidCallback callback;

  EditPenWidget({required this.callback, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: CircleAvatar(
        backgroundColor: _controller.appConstants.primary_color_dark,
        radius: 16,
        child: CircleAvatar(
          backgroundColor: _controller.appConstants.primary_color,
          radius: 14,
          child: Icon(
            Icons.edit_outlined,
            size: 20,
            color: _controller.appConstants.primary_color_dark,
          ),
        ),
      ),
    );
  }
}
