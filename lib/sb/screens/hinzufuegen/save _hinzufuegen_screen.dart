import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../screens/widgets/forms/form_submit_button.dart';
import '../../../screens/widgets/forms/form_text_field.dart';
import '../../../screens/widgets/svg_dynamic_scaffold_widget.dart';
import '../../../screens/widgets/svg_logo_widget.dart';
import '../../../screens/widgets/unigo_bottom_navigation_bar.dart';
import '../../../services/controller/ug_state_controller.dart';

class SaveHinzufuegenScreen extends StatelessWidget {
  UGStateController _controller = Get.find();
  var formKey = GlobalKey<FormBuilderState>();

  SaveHinzufuegenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SVGDynamicScaffoldWidget(
      drawer: Drawer(),
      showDrawer: false,
      appBar: AppBar(),
      showAppbar: false,
      fab: FloatingActionButton(
        onPressed: () {},
        child: Text("+"),
      ),
      showFab: false,
      bottomNavigationBar: UnigoBottomNavigationsBar(),
      showBottonNavigationBar: false,
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 100),
        SVGLogoWidget(
          width: 250,
        ),
        SizedBox(height: 100),
        Text(
          "Registrieren",
          style: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 40),
        _buildForm(context),
      ],
    );
  }
  Widget _buildForm(BuildContext context) {
    return FormBuilder(
      key: formKey,
      // enabled: false,
      onChanged: () {
        formKey.currentState!.save();
      },
      autovalidateMode: AutovalidateMode.disabled,
      skipDisabled: true,
      child: Column(
        children: <Widget>[
          CustomFormTextField(
            formKey: formKey,
            name: "standort",
            labelText: "Standort",
          ),
          const SizedBox(height: 16),
          CustomFormTextField(
            formKey: formKey,
            name: "ziel",
            labelText: "Ziel",
          ),
          const SizedBox(height: 16),
          CustomFormTextField(
            formKey: formKey,
            name: "ziel1",
            labelText: "Ziel1",
          ),
          const SizedBox(height: 16),
          CustomFormTextField(
            formKey: formKey,
            name: "datum",
            labelText: "Passwort wiederholen",
          ),
          const SizedBox(height: 16),
          CustomFormTextField(
            formKey: formKey,
            name: "zeit",
            labelText: "Uhrzeit",
          ),
          SizedBox(height: 60),
          CustomFormSubmitButton(
            formKey: formKey,
            text: "Speichern",
            callback: () async {
              String standort = formKey.currentState!.value['standort'];
              String ziel = formKey.currentState!.value['ziel'];
              String ziel1 = formKey.currentState!.value['ziel1'];
              String email = formKey.currentState!.value['email'];
              String datum = formKey.currentState!.value['datum'];
              String zeit = formKey.currentState!.value['zeit'];

              // TODO es wurde etwas verdatändert
              _controller.change();
            },
          ),
          Container(),
        ],
      ),
    );
  }
}
