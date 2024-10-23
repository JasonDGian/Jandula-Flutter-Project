import 'package:flutter/material.dart';
import 'package:reaktor_test_front/screens/issue_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: const IssueScreen(),
    );
  }
}
