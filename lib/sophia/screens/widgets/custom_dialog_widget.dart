import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDialog {
  String title = "title";
  String text1 = "text1";
  String text2 = "text2";
  String button1Text = "button1";
  String button2Text = "button2";

  CustomDialog({
    required this.title,
    required this.text1,
    this.text2 = "text2",
    required this.button1Text,
    this.button2Text = "button2",
  });

  Future<int?> showCustomDialog(BuildContext context) async {
    return showDialog<int>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          titlePadding: EdgeInsets.only(top: 20),
          titleTextStyle: GoogleFonts.inter(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.normal,
          ),
          title: Container(
            width: double.infinity,
            child: Center(
              child: Text(
                this.title,
              ),
            ),
          ),
          contentPadding: EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: 200,
                  child: Text(
                    this.text1,
                    style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ),
                (this.text2.isNotEmpty) ? _displayText2(): Container(),
                SizedBox(height: 16),
                GestureDetector(
                  onTap: () {
                    Navigator.pop<int>(context, 1);
                  },
                  child: Container(
                    width: 122,
                    height: 31,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 194, 223, 222),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Text(
                      this.button1Text,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _displayText2() {
    return Column(
      children: [
        SizedBox(height: 32),
        Container(
          child: Text(
            this.text2,
            style: GoogleFonts.inter(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
