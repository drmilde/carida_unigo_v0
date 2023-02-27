import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projects/screens/pre_loading_screen.dart';

// Design in
// https://www.figma.com/file/KG73Ctua7GSmwbwu3uWXvG/Prototyp-1?node-id=0%3A1&t=qwvKkf7XLdVeYxtk-0
// https://www.figma.com/file/0FjcfC8V4czugJ7WvSbPNw/RIDA-APP

// Hier das Dokument zur Integrationsplanung
//
// https://hbx.fhhrz.net/getlink/fiMADdiYYFoyhRPchhwaZN/Integrationsplanung.docx

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
        primarySwatch: MaterialColor(0xFF00ADA7, <int, Color>{
          50: Color(0xFF00ADA7),
          100: Color(0xFF00ADA7),
          200: Color(0xFF00ADA7),
          300: Color(0xFF00ADA7),
          400: Color(0xFF00ADA7),
          500: Color(0xFF00ADA7),
          600: Color(0xFF00ADA7),
          700: Color(0xFF00ADA7),
          800: Color(0xFF00ADA7),
          900: Color(0xFF00ADA7),
        }),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('de', 'DE'),
      ],
      home: PreLoadingScreen(),
    );
  }
}
