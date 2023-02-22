import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/screens/widgets/avatar_widget.dart';
import 'package:projects/screens/widgets/custom_app_bar_widget.dart';

import '../../services/controller/ug_state_controller.dart';
import '../widgets/forms/form_text_field.dart';
import '../widgets/svg_dynamic_scaffold_widget.dart';
import '../widgets/unigo_bottom_navigation_bar.dart';

class ChatScreen extends StatelessWidget {
  UGStateController _controller = Get.find();
  var formKey = GlobalKey<FormBuilderState>();

  ChatScreen({Key? key}) : super(key: key);

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
        CustomAppBar(
          title: "Max Mustermann",
          trailing: AvatarWidget(
            radius: 24,
            index: _controller.myAvatar.value,
          ),
        ),
        Expanded(
          child: Container(
            color: _controller.appConstants.white,
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: ((index % 3) == 2)
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 300,
                        //height: 70,
                        decoration: BoxDecoration(
                            color: _controller.appConstants.primary_color,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                              bottomRight: ((index % 3) == 2)
                                  ? Radius.circular(15)
                                  : Radius.circular(0),
                              bottomLeft: ((index % 3) == 2)
                                  ? Radius.circular(0)
                                  : Radius.circular(15),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Eine Nachricht kommt an."
                            " Sie ist etwas länger und besteht aus"
                            " mehreren Sätzen.",
                            style: GoogleFonts.inter(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          color: _controller.appConstants.primary_color,
          child: Row(
            children: [
              Icon(Icons.add_box_outlined),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16,
                  ),
                  child: CustomFormTextField(
                    formKey: GlobalKey<FormBuilderState>(),
                    name: "eingabe",
                    labelText: "",
                    value: "",
                  ),
                ),
              ),
              Icon(Icons.camera_alt_outlined),
              Icon(Icons.mic_outlined),
            ],
          ),
        ),
      ],
    );
  }
}
