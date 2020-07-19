import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 1),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: Color(0XFF6C38D9),
            //color: Colors.yellowAccent,
            height: 900,
          ),
          Align(
            alignment: Alignment(0, -0.5),
            child: Image.asset('images/logo.png'),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Text(
              'Health Plus',
              style: TextStyle(
                fontFamily: 'Lobster',
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
