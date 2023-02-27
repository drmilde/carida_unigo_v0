import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/sb/screens/buchungen/buchungen_screen.dart';

import '../../../services/controller/ug_state_controller.dart';
import '../chat/chat_screen.dart';
import '../einstellungen/einstellungen_screen.dart';
import '../hinzufuegen/hinzufuegen_screen.dart';
import '../suche/suche_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  UGStateController _controller = Get.find();
  int index = 2;

  final screens = [
    BuchungenScreen(),
    SuchenScreen(),
    HomeScreen(),
    HinzufuegenScreen(),
    ChatScreen(),
  ];

  final List<String> title = [
    'Buchungen',
    'Fahrt suchen',
    '',
    'Fahrt hinzufügen',
    'Nachrichten',
  ];
  //final String t = 'hallo';

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(
        Icons.directions_car,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.search,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.home,
        size: 50,
        color: Colors.white,
      ),
      Icon(
        Icons.add,
        size: 30,
        color: Colors.white,
      ),
      Icon(
        Icons.chat_bubble_outline,
        size: 30,
        color: Colors.white,
      ),
    ];
    return Scaffold(

      /*
      drawer: Drawer(),
      showDrawer: false,
      //appbar: AppBar(),
      showAppbar: false,
      fab: FloatingActionButton(
        onPressed: () {},
        child: Text("+"),
      ),
      showFab: false,
      //bottomNavigationBar: UnigoBottomNavigationsBar(),
      showBottonNavigationBar: true,

      backgroundColor: _controller.appConstants.dark_grey,
      image: "assets/images/background2.svg",

       */


      //extendBody: true,
      //extendBodyBehindAppBar: true,

      //backgroundColor: Color.fromARGB(255, 28, 31, 31),
      appBar: _buildAppBar(title[index], context, index),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Color.fromARGB(255, 28, 31, 31),
        index: index,
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
      body: screens[index],
    );
  }

  AppBar _buildAppBar(String title, BuildContext context, int index) {
    if (index == 2) {
      return AppBar(
        title: Text(
          title,
          style: GoogleFonts.inter(
            color: Color.fromARGB(255, 28, 31, 31),
            fontSize: 28,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Color.fromARGB(255, 28, 31, 31),
        ),
        actions: [
          IconButton(
            icon: Icon(
              size: 30,
              Icons.settings,
              color: Color.fromARGB(255, 28, 31, 31),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => EinstellungenScreen()));
            },
          ),
        ],
      );
    } else {
      return AppBar(
        title: Text(
          title,
          style: TextStyle(
            color: Color.fromARGB(255, 28, 31, 31),
            fontSize: 28,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Color.fromARGB(255, 28, 31, 31),
          onPressed: _controller.callbacks[index],
        ),
      );
    }
  }
}
