import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/screens/widgets/avatar_widget.dart';
import 'package:projects/screens/widgets/edit_pen_widget.dart';

import '../services/controller/ug_state_controller.dart';
import 'widgets/svg_dynamic_scaffold_widget.dart';
import 'widgets/custom_app_bar_widget.dart';
import 'widgets/unigo_bottom_navigation_bar.dart';

class ProfilScreen extends StatelessWidget {
  UGStateController _controller = Get.find();

  ProfilScreen({Key? key}) : super(key: key);

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildHeader(context),
          SizedBox(height: 16),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      //height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            title: "Profil",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Obx(
                () => Stack(
                  children: [
                    AvatarWidget(
                      index: _controller.myAvatar.value,
                      radius: 72,
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: EditPenWidget(
                        callback: () {
                          _controller.toggleEditAvatar();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 170,
                child: Text(
                  "Max Mustermann",
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Obx(
            () => _controller.editAvatar.value ? _selectAvatar() : Container(),
          ),
        ],
      ),
    );
  }

  Widget _selectAvatar() {
    return Container(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _controller.AvatarCount,
            itemBuilder: (contex, index) {
              return GestureDetector(
                onTap: () {
                  _controller.myAvatar.value = index;
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: AvatarWidget(
                    index: index,
                    radius: 24,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
