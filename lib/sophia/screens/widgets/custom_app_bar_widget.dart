import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

class CustomAppBar extends StatelessWidget {
  UGStateController _controller = Get.find();
  String title;
  Widget? trailing;

  CustomAppBar({required this.title, this.trailing = null, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(Icons.arrow_back_rounded, size: 32),
            SizedBox(
              width: 24,
              height: 1,
            ),
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: _controller.appConstants.headerFontsSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            (trailing != null) ? trailing! : Container()
          ],
        ),
      ),
    );
  }
}
