import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgScaffoldWidget extends StatelessWidget {
  Widget child;

  SvgScaffoldWidget({required this.child, required this.image, required this.color, Key? key}) : super(key: key);

  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      body: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child:SvgPicture.asset(
                image,
                fit: BoxFit.cover,
              )
          ),
          child
        ],
      ),
    );
  }
}
