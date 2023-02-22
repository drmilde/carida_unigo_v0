import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projects/screens/pre_loading_screen.dart';

// Design in
// https://www.figma.com/file/KG73Ctua7GSmwbwu3uWXvG/Prototyp-1?node-id=0%3A1&t=qwvKkf7XLdVeYxtk-0
// https://www.figma.com/file/0FjcfC8V4czugJ7WvSbPNw/RIDA-APP

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
    // etc.
  };
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CaridaUniGoV0',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PreLoadingScreen(),
    );
  }
}
