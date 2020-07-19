import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../constants.dart';

class DietScreen extends StatefulWidget {
  static String id = 'diet_screen';

  @override
  _DietScreenState createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.redAccent,
          child: Center(
            child: SleekCircularSlider(
              min: 0.0,
              max: 7000.0,
              initialValue: 3500.0,
              appearance: CircularSliderAppearance(
                angleRange: 360.0,
                startAngle: 90,
                customWidths: CustomSliderWidths(
                  progressBarWidth: 7.0,
                  trackWidth: 2.5,
                  handlerSize: 3.0,
                ),
                customColors: CustomSliderColors(
                  progressBarColor: Color(0XFFBB66CC),
                  trackColor: Color(0XFFF2F2F2),
                ),
                infoProperties: InfoProperties(
                  modifier: percentageModifier,
                  bottomLabelText: 'Steps',
                  bottomLabelStyle: TextStyle(
                    color: Color(0XFFC1C4C7),
                  ),
                  mainLabelStyle: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
