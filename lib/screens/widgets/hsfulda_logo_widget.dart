import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HSFuldaLogoWidget extends StatelessWidget {
  double width = 436.92;
  double ar = 436.92 / 98.496;

  HSFuldaLogoWidget({required this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: width / ar,
        child: SvgPicture.asset(
          "assets/logo_hochschule_fulda.svg",
          fit: BoxFit.contain,
        ));
  }
}
