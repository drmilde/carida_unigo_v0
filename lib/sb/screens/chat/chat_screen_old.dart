import 'package:flutter/material.dart';
import 'package:projects/services/controller/ug_state_controller.dart';
import 'package:get/get.dart';

class ChatScreenOld extends StatefulWidget {
  const ChatScreenOld({Key? key}) : super(key: key);

  @override
  State<ChatScreenOld> createState() => _ChatScreenOldState();
}

class _ChatScreenOldState extends State<ChatScreenOld> {
  UGStateController _controller = Get.find();

  final List<String> images = [
    'assets/avatars/avatar0281.png',
    'assets/avatars/avatar0282.png',
    'assets/avatars/avatar0283.png',
    'assets/avatars/avatar0284.png',
    'assets/avatars/avatar0285.png',
    'assets/avatars/avatar0286.png',
    'assets/avatars/avatar0287.png',
    'assets/avatars/avatar0288.png',
    'assets/avatars/avatar0289.png'
  ];
  final List<String> names = [
    'Laura',
    'Mara',
    'Paul',
    'Max',
    'Markus',
    'Lina',
    'Lukas',
    'Annika',
    'Tim',
    'Systen'
  ];
  final List<String> descriptions = [
    'Hallo ich interessiere mich für ihr Angebot',
    'Sie haben eine Mail bekommen, bitte...'
  ];

  int topBar = 1;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          //color: Colors.grey,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              topBar = topBar * -1;
                            });
                          },
                          child: Container(
                            child: Text('Chats', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity/2,
                          height: 2,
                          color: topBar == 1? _controller.appConstants.turquoise : _controller.appConstants.dark_grey,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              topBar = topBar * -1;
                            });
                          },
                          child: Container(
                            child: Text('System', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: double.infinity/2,
                          height: 2,
                          color: topBar == 1? _controller.appConstants.dark_grey : _controller.appConstants.turquoise,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              topBar == 1?
              Column(
                children: [
                  _chat(names[0], descriptions[0], images[0]),
                  _chat(names[1], descriptions[0],images[1]),
                  _chat(names[2], descriptions[0], images[2]),
                  _chat(names[3], descriptions[0], images[3]),
                  _chat(names[4], descriptions[0], images[4]),
                  _chat(names[5], descriptions[0], images[5]),
                  _chat(names[6], descriptions[0], images[6]),
                  _chat(names[7], descriptions[0], images[7]),
                  _chat(names[8], descriptions[0], images[8]),
                ],
              )
              : Column(
                children: [
                  _system(names[9], descriptions[1]),
                  _system(names[9], descriptions[1]),
                  _system(names[9], descriptions[1]),
                  _system(names[9], descriptions[1]),
                ],
        ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chat(
      String name,
      String nachricht,
      String image,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        //padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                        child:
                        Image.asset(image, fit: BoxFit.contain),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            //textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height:8),
                        Container(
                          child: Text(
                            nachricht,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _system(
      String name,
      String nachricht,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: _controller.appConstants.white,
                        borderRadius: BorderRadius.circular(80),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 4,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Icon(Icons.notifications),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            //textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(height:8),
                        Container(
                          child: Text(
                            nachricht,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

