import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

class CustomRoundButton extends StatelessWidget {
  UGStateController _controller = Get.find();
  VoidCallback callback;
  String text;
  double width = 220;
  double height = 55;
  Color? color;
  Color? textColor;

  CustomRoundButton(
      {required this.text,
      required this.callback,
      this.color = null,
      this.textColor,
      this.width = 220,
      this.height = 45,
      Key? key})
      : super(key: key) {
    color = color ?? _controller.appConstants.button_dark;
    textColor = textColor ?? _controller.appConstants.black;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(height / 5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
              color: textColor,
              //fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
