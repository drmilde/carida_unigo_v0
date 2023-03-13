import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/screens/widgets/avatar_widget.dart';
import 'package:projects/services/controller/ug_state_controller.dart';
import 'package:projects/services/model/angebot.dart';
import 'package:projects/services/model/angebot_extension.dart';

class AngebotCardWidget extends StatelessWidget {
  UGStateController _controller = Get.find();

  late Angebot? angebot;
  late Color? arrowColor;
  late Icon? icon;
  late Icon? delete;
  VoidCallback onDetail;
  VoidCallback onDelete;

  AngebotCardWidget(
      {this.angebot,
      this.arrowColor,
      this.icon,
      this.delete,
      required this.onDelete,
      required this.onDetail,
      Key? key})
      : super(key: key) {
    this.angebot = angebot ?? Angebot.empty(datum: DateTime.now());
    this.arrowColor = arrowColor ?? _controller.appConstants.turquoise;
    this.icon = icon ?? Icon(Icons.drive_eta);
    this.delete = delete ?? Icon(Icons.delete);
    // TODO: implement AngebotCardWidget
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: _controller.appConstants.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 4,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        //color: Colors.yellow,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AvatarWidget(
                    radius: 24,
                    index: 1,
                  ),
                  Text("Name"),
                  Text("Bewertung")
                ],
              ),
              SizedBox(height: 16),
              _buildFirstRow(),
              //_buildDeleteRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                angebot!.startort,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                //textAlign: TextAlign.left,
              ),
            ),
            SizedBox(height: 8),
            Icon(Icons.arrow_downward),
            SizedBox(height: 8),
            Container(
              child: Text(
                angebot!.zielort,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ID: ${angebot!.id}"),
              Text(
                  "Datum: ${angebot!.datum.day}.${angebot!.datum.month}.${angebot!.datum.year}"),
              Text("Plätze: ${angebot!.freiplaetze}"),
              Text("Abahrt: ${angebot!.getUhrzeitNormalized()}"),
              Text("Profil: ${angebot!.hasprofile}"),
              Text("Position: ${angebot!.latitude}:${angebot!.longitude}"),
              Text("Distanz: ${angebot!.distanz}"),
            ],
          ),
        ),
        Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: onDetail,
              child: Container(
                child: Icon(
                  Icons.keyboard_arrow_right,
                  size: 50,
                  color: arrowColor,
                ),
              ),
            ),
            GestureDetector(
              onTap: onDelete,
              child: Container(
                child: delete,
              ),
            )
          ],
        ),
      ],
    );
  }
}
