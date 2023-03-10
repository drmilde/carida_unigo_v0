import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/services/controller/ug_state_controller.dart';
import 'package:projects/services/osrm/model/ortsnamen_mapping.dart';

class AutoCompleteDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AutoCompleteDemoState();
}

class _AutoCompleteDemoState extends State<AutoCompleteDemo> {
  UGStateController _controller = Get.find();
  bool showBorder = true;
  String labelText = "Ortsname";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Ortsnamen'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Autocomplete<Mapping>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            return lookupOrtsnamen
                .where((Mapping county) => county.name
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase()))
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
          },
          optionsViewBuilder: (BuildContext context,
              AutocompleteOnSelected<Mapping> onSelected,
              Iterable<Mapping> options) {
            return Align(
              alignment: Alignment.topLeft,
              child: Material(
                child: Container(
                  width: 300,
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
            );
          },
        ),
      ),
    );
  }
}
