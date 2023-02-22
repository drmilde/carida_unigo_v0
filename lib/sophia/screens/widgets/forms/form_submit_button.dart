import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

import '../custom_round_button.dart';

class CustomFormSubmitButton extends StatelessWidget {
  UGStateController _controller = Get.find();
  var formKey = GlobalKey<FormBuilderState>();
  String text = "Submit";
  VoidCallback callback;

  CustomFormSubmitButton({
    required this.formKey,
    required this.callback,
    this.text = "Submit",
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SubmitButton(text: text, callback: callback);
  }

  Widget _SubmitButton(
      {String text = "Submit", required VoidCallback callback}) {
    return CustomRoundButton(
      text: text,
      textColor: _controller.appConstants.white,
      callback: () {
        if (formKey.currentState?.saveAndValidate() ?? false) {
          callback();
        } else {
          // TODO handle Form error
        }
      },
    );
  }
}
