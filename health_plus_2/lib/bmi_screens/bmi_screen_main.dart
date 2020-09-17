import 'package:flutter/material.dart';

import 'bmi_screen_input.dart';

class BmiScreenMain extends StatefulWidget {
  static String id = 'bmi_screen_main';
  @override
  _BmiScreenMainState createState() => _BmiScreenMainState();
}

class _BmiScreenMainState extends State<BmiScreenMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFFCCCCCC),
          textTheme: TextTheme(body1: TextStyle(color: Colors.white))),
      home: InputPage(),
    );
  }
}
