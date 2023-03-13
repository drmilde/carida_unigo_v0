import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BucheHSFuldaWidget extends StatelessWidget {
  double width = 20.123;
  double ar = 1.0;

  BucheHSFuldaWidget({required this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: width / ar,
        child: SvgPicture.asset(
          "assets/buche_hs_fulda.svg",
          fit: BoxFit.contain,
        ));
  }
}
