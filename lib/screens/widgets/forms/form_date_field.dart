import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

class CustomFormDateField extends StatelessWidget {
  UGStateController _controller = Get.find();
  var formKey = GlobalKey<FormBuilderState>();
  String name = "textFieldName";
  String labelText = "";
  DateTime value = DateTime.now();
  bool showBorder = false;

  double width = 300;

  CustomFormDateField(
      {required this.formKey,
        this.name = "textFieldName",
        this.labelText = "",
        required this.value,
        this.width = 300,
        this.showBorder = false,
        Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildFormDateField(name: name, labelText: labelText, value: value);
  }

  Widget _buildFormDateField({
    required String name,
    required String labelText,
    required DateTime value,
  }) {
    return Container(
      width: width,
      child: FormBuilderDateTimePicker (
        autovalidateMode: AutovalidateMode.disabled,
        name: name,
        inputType: InputType.date,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          hintText: labelText,
          labelText: labelText,
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.white,
          hoverColor: Colors.white,
          errorStyle: TextStyle(
            color: Colors.black,
            fontSize: 10,
          ),
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: showBorder
                ? BorderSide(
              width: 2,
              color: _controller.appConstants.turquoise,
            )
                : BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: showBorder
                ? BorderSide(
              width: 2,
            )
                : BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (val) {
          // TODO do something sensible here
        },
        initialValue: value,
        // valueTransformer: (text) => num.tryParse(text),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        // initialValue: '12',
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
