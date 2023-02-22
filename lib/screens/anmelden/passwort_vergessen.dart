import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/controller/ug_state_controller.dart';
import '../home_screen.dart';
import '../widgets/custom_dialog_widget.dart';
import '../widgets/forms/form_submit_button.dart';
import '../widgets/forms/form_text_field.dart';
import '../widgets/svg_dynamic_scaffold_widget.dart';
import '../widgets/svg_logo_widget.dart';
import '../widgets/unigo_bottom_navigation_bar.dart';

class PasswortVergessenScreen extends StatelessWidget {
  UGStateController _controller = Get.find();
  var formKey = GlobalKey<FormBuilderState>();

  CustomDialog dialog = CustomDialog(
    title: "Passwort vergessen?",
    text1: "Ein Link zum Zurücksetzen"
        " des Passworts wurde an Ihre E-Mail"
        " Adresse gesendet.",
    text2: "",
    button1Text: "Alles Klar",
  );

  PasswortVergessenScreen({Key? key}) : super(key: key);

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
          "Passwort\nvergessen",
          textAlign: TextAlign.center,
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
            name: "email",
            labelText: "E-Mail Adresse",
          ),
          SizedBox(height: 16),
          Container(
            width: 300,
            child: Text(
              "Geben Sie Ihre E-Mail Adresse ein, "
              "um Ihr Passwort zurückzusetzen.",
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(height: 40),
          CustomFormSubmitButton(
            formKey: formKey,
            text: "Senden",
            callback: () async {
              String email = formKey.currentState!.value['email'];

              // TODO es wurde etwas verändert
              _controller.change();

              int? answer = await dialog.showCustomDialog(context);

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
