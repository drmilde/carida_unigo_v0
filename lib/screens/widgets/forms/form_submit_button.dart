import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

import '../custom_round_button.dart';

class CustomFormSubmitButton extends StatelessWidget {
  UGStateController _controller = Get.find();
  var formKey = GlobalKey<FormBuilderState>();
  String text = "Submit";
  Color? color;
  Color? textColor;
  VoidCallback callback;
  bool showShadow = false;
  bool isDense = false;

  CustomFormSubmitButton({
    required this.formKey,
    required this.callback,
    this.text = "Submit",
    this.color,
    this.textColor,
    this.showShadow = false,
    this.isDense = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _SubmitButton(text: text, callback: callback);
  }

  Widget _SubmitButton(
      {String text = "Submit", required VoidCallback callback}) {
    return CustomRoundButton(
      isDense: isDense,
      height: 48,
      text: text,
      textColor: textColor,
      color: color,
      showShadow: showShadow,
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
