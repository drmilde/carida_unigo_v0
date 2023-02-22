import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/services/controller/ug_state_controller.dart';

class AvatarWidget extends StatelessWidget {
  // Image by <a href="https://www.freepik.com/free-vector/avatars-cartoon-style_766799.htm">Freepik</a>
  // <a href="https://www.freepik.com/free-vector/people-wearing-accesories-avatar-collection_1176016.htm#query=avatar%20set&position=32&from_view=keyword">Image by kubanek</a> on Freepik
  // <a href="https://www.freepik.com/free-vector/miscellaneous-people-avatar-collection_1176018.htm#query=avatar%20set&position=36&from_view=keyword">Image by kubanek</a> on Freepik
  // <a href="https://www.freepik.com/free-vector/hipster-people-avatar-collection_1176017.htm#&position=22&from_view=author">Image by kubanek</a> on Freepik

  UGStateController _controller = Get.find();

  int index = 1;
  double radius = 100;

  AvatarWidget({this.index = 1, this.radius = 100, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String prefix = "0";
    if (index < 10) {
      prefix = "000";
    } else {
      if (index < 100) {
        prefix = "00";
      } else {
        prefix = "0";
      }
    }

    return CircleAvatar(
      radius: radius,
      backgroundColor: _controller.appConstants.secondary_color,
      child: CircleAvatar(
        radius: radius * 0.9,
        backgroundImage: AssetImage(
          "assets/avatars/avatar${prefix}${index % _controller.AvatarCount}.png",
        ),
        //child: _old(prefix),
      ),
    );
  }
}
