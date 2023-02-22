import 'package:carpool_unigo/screens/home/main_screen.dart';
import 'package:carpool_unigo/screens/welcome/start_screen.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 0, 173, 167),
          ),
          ),
        textTheme: TextTheme(
        ),

      ),
      home: const StartScreen(),
    );
  }
}
