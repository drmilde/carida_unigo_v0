import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

import '../../../screens/widgets/forms/form_submit_button.dart';
import '../../../screens/widgets/forms/form_text_field.dart';
import '../../../screens/widgets/svg_dynamic_scaffold_widget.dart';
import '../../../screens/widgets/unigo_bottom_navigation_bar.dart';
import '../../../services/unigo_service.dart';
import '../home/main_screen.dart';

class AnmeldenScreen extends StatefulWidget {
  const AnmeldenScreen({Key? key}) : super(key: key);

  @override
  State<AnmeldenScreen> createState() => _AnmeldenScreenState();
}

class _AnmeldenScreenState extends State<AnmeldenScreen> {
  UGStateController _controller = Get.find();
  UniGoService service = UniGoService();
  var formKey = GlobalKey<FormBuilderState>();

  List<Color> colors = [];

  @override
  void initState() {
    // TODO: implement initState
    colors = [
      _controller.appConstants.light_grey,
      _controller.appConstants.turquoise,
      _controller.appConstants.light_green,
      _controller.appConstants.dark_grey,
      _controller.appConstants.white,
    ];
    super.initState();
  }

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

      backgroundColor: _controller.appConstants.dark_grey,
      image: "assets/images/background2.svg",
      //color: colors[3],
      body: SingleChildScrollView(
        child: Container(
          //color: Colors.yellow,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                //color: Colors.red,
                margin: EdgeInsets.fromLTRB(20, 80, 0, 20),
                child: Text(
                  'Anmelden',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Container(
                width: double.infinity,
                //color: Colors.pink,
                child: Form(
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //_oldForm(),
                      SizedBox(height: 150),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: _buildForm(context),
                      ),
                      Container(
                        //color:Colors.blue,
                        width: double.infinity,
                        margin: EdgeInsets.fromLTRB(60, 130, 60, 20),
                        child: CustomFormSubmitButton(
                          formKey: formKey,
                          text: "Anmelden",
                          textColor: _controller.appConstants.white,
                          color: _controller.appConstants.turquoise,
                          callback: () async {
                            String email = formKey.currentState!.value['email'];
                            String passwort =
                                formKey.currentState!.value['passwort'];

                            // TODO es wurde etwas verändert
                            _controller.change();

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainScreen()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                //color: Colors.blue,
                child: SvgPicture.asset('assets/images/logo.svg', height: 50, width: 300,),
              ),
            ],
          ),
        ),
      ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomFormTextField(
            formKey: formKey,
            name: "email",
            labelText: "E-Mail Adresse",
            value: "mail@host.de",
            showBorder: true,
            width: 200,
          ),
          const SizedBox(height: 16),
          CustomFormTextField(
            formKey: formKey,
            name: "passwort",
            labelText: "Passwort",
            value: "vollgeheim",
            showBorder: true,
            width: 200,
          ),
          SizedBox(height: 40),
          Container(),
        ],
      ),
    );
  }
}
