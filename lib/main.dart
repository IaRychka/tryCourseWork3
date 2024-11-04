import 'package:flutter/material.dart';
import 'main_screen.dart';

void main() {
  runApp(AstrologyApp());
}

class AstrologyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Astrology App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}
