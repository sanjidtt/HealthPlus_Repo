import 'package:flutter/material.dart';

class StepsScreen2 extends StatefulWidget {
  static String id = 'steps_screen_2';

  @override
  _StepsScreen2State createState() => _StepsScreen2State();
}

class _StepsScreen2State extends State<StepsScreen2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.redAccent,
        ),
      ),
    );
  }
}
