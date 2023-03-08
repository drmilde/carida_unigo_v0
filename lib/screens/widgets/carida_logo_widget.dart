import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CaridaLogoWidget extends StatelessWidget {
  double width = 646.28;
  double ar = 646.28 / 234.59;

  CaridaLogoWidget({required this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: width / ar,
        child: SvgPicture.asset(
          "assets/images/logo_caRida.svg",
          fit: BoxFit.contain,
        ));
  }
}
