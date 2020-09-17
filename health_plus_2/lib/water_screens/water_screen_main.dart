import 'package:flutter/material.dart';
import 'package:health_plus_2/water_screens/water_screen_start.dart';

class WaterScreenMain extends StatefulWidget {
  static String id = 'water_screen_main';
  @override
  _WaterScreenMainState createState() => _WaterScreenMainState();
}

class _WaterScreenMainState extends State<WaterScreenMain> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFbbe7f5),
        accentColor: Colors.blueAccent,
        brightness: Brightness.light,
        textTheme: TextTheme(
          body1: TextStyle(color: Color(0xFF22277A)),
        ),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            body1: TextStyle(
              color: Color(0xFFbbe7f5),
            ),
            //body2: TextStyle(color: Color(0xFFbbe7f5),),
          ),
        ),
        bottomAppBarColor: Color(0xFFbbe7f5),
        bottomAppBarTheme: BottomAppBarTheme(
          elevation: 0.1,
          color: Color(0xFFbbe7f5),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Start(),
    );
  }
}
