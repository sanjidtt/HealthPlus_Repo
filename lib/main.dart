import 'package:flutter/material.dart';
import 'package:watertwo/Start.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
            body1: TextStyle(color: Color(0xFFbbe7f5),),
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
