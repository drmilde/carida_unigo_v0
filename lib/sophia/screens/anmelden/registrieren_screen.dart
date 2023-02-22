import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/controller/ug_state_controller.dart';
import '../home_screen.dart';
import '../widgets/forms/form_submit_button.dart';
import '../widgets/forms/form_text_field.dart';
import '../widgets/svg_dynamic_scaffold_widget.dart';
import '../widgets/svg_logo_widget.dart';
import '../widgets/unigo_bottom_navigation_bar.dart';

class RegistrierenScreen extends StatelessWidget {
  UGStateController _controller = Get.find();
  var formKey = GlobalKey<FormBuilderState>();



  RegistrierenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SVGDynamicScaffoldWidget(
      drawer: Drawer(),
      showDrawer: false,
      appbar: AppBar(),
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
            name: "benutzername",
            labelText: "Benutzername",
          ),
          const SizedBox(height: 16),
          CustomFormTextField(
            formKey: formKey,
            name: "email",
            labelText: "E-Mail Adresse",
          ),
          const SizedBox(height: 16),
          CustomFormTextField(
            formKey: formKey,
            name: "password",
            labelText: "Passwort",
          ),
          const SizedBox(height: 16),
          CustomFormTextField(
            formKey: formKey,
            name: "password_repeat",
            labelText: "Passwort wiederholen",
          ),
          SizedBox(height: 60),
          CustomFormSubmitButton(
            formKey: formKey,
            text: "Registrieren",
            callback: () async {
              String benutzername = formKey.currentState!.value['benutzername'];
              String email = formKey.currentState!.value['email'];
              String password = formKey.currentState!.value['password'];
              String password_repeat =
                  formKey.currentState!.value['password_repeat'];

              // TODO es wurde etwas verändert
              _controller.change();

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          Container(),
        ],
      ),
    );
  }
}
