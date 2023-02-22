import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildEintrag("999 kg", "CO2 eingespart"),
          SizedBox(height: 32),
          _buildEintrag("125 ", "Punkte"),
          SizedBox(height: 32),
          _buildEintrag("130 km", "gefahren"),
        ],
      ),
    );
  }

  Widget _buildEintrag(String first, String second) {
    return Column(
      children: [
        Text(
          first,
          style: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(second,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }
}
