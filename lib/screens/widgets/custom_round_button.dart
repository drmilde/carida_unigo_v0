import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

class CustomRoundButton extends StatelessWidget {
  UGStateController _controller = Get.find();
  VoidCallback callback;
  String text;
  double width = 220;
  double height = 45;
  Color? color;
  Color? textColor;
  bool showShadow = false;
  bool isDense = false;

  CustomRoundButton(
      {required this.text,
      required this.callback,
      this.color = null,
      this.textColor,
      this.width = 220,
      this.height = 45,
      this.showShadow = false,
      this.isDense = false,
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
        height: isDense? 32: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(height / 5),
          boxShadow: showShadow
              ? [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.inter(
              color: textColor,
              //fontWeight: FontWeight.bold,
              fontSize: isDense? 16: 20,
            ),
          ),
        ),
      ),
    );
  }
}
