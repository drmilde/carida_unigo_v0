import 'package:flutter/material.dart';

import '../buche_hs_fulda_widget.dart';
import 'ortsnamen_textfield_widget.dart';

class OrtsnamenBuchenWidget extends StatefulWidget {
  const OrtsnamenBuchenWidget({Key? key}) : super(key: key);

  @override
  State<OrtsnamenBuchenWidget> createState() => _OrtsnamenBuchenWidgetState();
}

class _OrtsnamenBuchenWidgetState extends State<OrtsnamenBuchenWidget> {
  bool isHinfahrt = true;

  @override
  Widget build(BuildContext context) {
    return _buildNewForm(context);
  }

  Widget _buildNewForm(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: 16),
        isHinfahrt ? _ortsnameTextField() : _bucheLogo(),
        Container(
          child: Icon(Icons.arrow_forward_outlined),
        ),
        isHinfahrt ? _bucheLogo() : _ortsnameTextField(),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                isHinfahrt = !isHinfahrt;
              });
            },
            child: Container(
              child: Icon(Icons.sync_alt_outlined),
            ),
          ),
        ),
      ],
    );
  }

  Widget _bucheLogo() {
    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BucheHSFuldaWidget(
          width: 32,
        ),
      ),
    );
  }

  Container _ortsnameTextField() {
    return Container(
      width: 200,
      child: OrtsnamenAutoCompleteWidget(
        mapController: null,
        setMarker: (latlng) {},
      ),
    );
  }
}
