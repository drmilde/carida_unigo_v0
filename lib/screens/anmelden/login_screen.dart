import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/screens/anmelden/passwort_vergessen.dart';
import 'package:projects/screens/anmelden/registrieren_screen.dart';
import 'package:projects/screens/widgets/forms/form_submit_button.dart';
import 'package:projects/screens/widgets/forms/form_text_field.dart';

import '../../services/controller/ug_state_controller.dart';
import '../home_screen.dart';
import '../widgets/svg_dynamic_scaffold_widget.dart';
import '../widgets/svg_logo_widget.dart';
import '../widgets/unigo_bottom_navigation_bar.dart';

class LoginScreen extends StatelessWidget {
  UGStateController _controller = Get.find();
  var formKey = GlobalKey<FormBuilderState>();

  LoginScreen({Key? key}) : super(key: key);

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
          "Anmelden",
          style: GoogleFonts.inter(
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 80),
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
          const SizedBox(height: 16),
          CustomFormTextField(
            formKey: formKey,
            name: "email",
            labelText: "E-Mail",
          ),
          SizedBox(height: 32),
          CustomFormTextField(
            formKey: formKey,
            name: "password",
            labelText: "Passwort",
          ),
          SizedBox(height: 8),
          Container(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PasswortVergessenScreen()),
                  );
                },
                child: Text(
                  "Passwort vergessen?",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 80),
          CustomFormSubmitButton(
            formKey: formKey,
            text: "Anmelden",
            callback: () async {
              String email = formKey.currentState!.value['email'];
              String password = formKey.currentState!.value['password'];

              // TODO es wurde etwas verändert
              _controller.change();

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          SizedBox(height: 8),
          Container(
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistrierenScreen()),
                  );
                },
                child: Text(
                  "Registrieren",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
