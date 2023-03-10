import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SVGLogoWidget extends StatelessWidget {
  double width = 1969.9943;
  double ar = 1969.9943/394.70999;

  SVGLogoWidget(
      {required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: width / ar,
        child: SvgPicture.asset(
          "assets/logo_unigo.svg",
          fit: BoxFit.contain,
        ));
  }
}
