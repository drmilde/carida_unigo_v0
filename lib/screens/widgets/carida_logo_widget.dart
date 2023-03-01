import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CaridaLogoWidget extends StatelessWidget {
  double width = 647;
  double ar = 647 / 341;

  CaridaLogoWidget({required this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: width / ar,
        child: SvgPicture.asset(
          "assets/carida_for_campus.svg",
          fit: BoxFit.contain,
        ));
  }
}
