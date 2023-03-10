import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../services/controller/ug_state_controller.dart';
import '../../../services/osrm/model/ortsnamen_mapping.dart';

class OrtsnamenAutoCompleteWidget extends StatelessWidget {
  UGStateController _controller = Get.find();
  bool showBorder = true;
  String labelText = "Ortsname";
  MapController? mapController = MapController();
  Function(LatLng)? setMarker;

  OrtsnamenAutoCompleteWidget({this.mapController, this.setMarker, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Autocomplete<Mapping>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return lookupOrtsnamen
            .where((Mapping county) => county.searchName
                .contains(textEditingValue.text.toLowerCase().trim()))
            .toList();
      },
      displayStringForOption: (Mapping option) => option.name,
      fieldViewBuilder: (BuildContext context,
          TextEditingController fieldTextEditingController,
          FocusNode fieldFocusNode,
          VoidCallback onFieldSubmitted) {
        //return CustomFormTextField(formKey: formKey);
        return TextField(
          controller: fieldTextEditingController,
          focusNode: fieldFocusNode,
          style: const TextStyle(fontWeight: FontWeight.bold),
          onSubmitted: (entry) {
            print("Dieser Eintrag: ${entry}");
          },
          decoration: InputDecoration(
            //hintText: "Ortsname",
            labelText: labelText,
            filled: true,
            fillColor: Colors.white,
            focusColor: Colors.white,
            hoverColor: Colors.white,
            errorStyle: TextStyle(
              color: Colors.black,
              fontSize: 10,
            ),
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: showBorder
                  ? BorderSide(
                      width: 2,
                      color: _controller.appConstants.turquoise,
                    )
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: showBorder
                  ? BorderSide(
                      width: 2,
                    )
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      },
      onSelected: (Mapping selection) {
        print('Selected: ${selection.name}');
        mapController!.move(selection.latlng, 13);
        setMarker!(selection.latlng);
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<Mapping> onSelected,
          Iterable<Mapping> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 300,
                height: 300,
                color: _controller.appConstants.turquoise,
                child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: min(options.length, 100),
                  itemBuilder: (BuildContext context, int index) {
                    final Mapping option = options.elementAt(index);

                    return GestureDetector(
                      onTap: () {
                        onSelected(option);
                      },
                      child: ListTile(
                        title: Text(option.toString(),
                            style: const TextStyle(color: Colors.white)),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
