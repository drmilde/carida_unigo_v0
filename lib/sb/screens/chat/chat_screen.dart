import 'package:flutter/material.dart';
import 'package:projects/services/controller/ug_state_controller.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  UGStateController _controller = Get.find();

  final List<String> images = [
    'assets/avatars/avatar0280.png',
    'assets/avatars/avatar0281.png',
    'assets/avatars/avatar0282.png',
    'assets/avatars/avatar0283.png',
    'assets/avatars/avatar0284.png',
    'assets/avatars/avatar0285.png'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
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
                          Container(
                            child: Text('Chats', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: double.infinity/2,
                            height: 2,
                            color: _controller.appConstants.turquoise,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            child: Text('System', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: double.infinity/2,
                            height: 2,
                            color: _controller.appConstants.dark_grey,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                _chat('Laura', 'Hallo ich interessiere mich für ihr Angebot', images[0]),
                _chat('Mara', 'Hallo ich interessiere mich für ihr Angebot',images[1]),
                _chat('Paul', 'Hallo ich interessiere mich für ihr Angebot', images[2]),
                _chat('Steffi', 'Hallo ich interessiere mich für ihr Angebot', images[3]),
                _chat('Lars', 'Hallo ich interessiere mich für ihr Angebot', images[4]),
                _chat('Simon', 'Hallo ich interessiere mich für ihr Angebot', images[5]),
              ],
            ),
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
}

