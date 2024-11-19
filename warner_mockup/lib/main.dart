import 'package:flutter/material.dart';
import 'package:warner_mockup/screens/beach_park_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BeachParkScreen()
    );
  }
}
