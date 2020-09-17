import 'package:flutter/material.dart';
import 'package:health_plus_2/screens/diet_camera.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../constants.dart';

class DietUpperCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 30,
            child: Container(),
          ),
          Expanded(
            flex: 320,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    blurRadius: 1.8,
                    //spreadRadius: 3.0,
                  ),
                ],
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.white,
              ),
              //color: Colors.white,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 22,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 122,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 22,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 132,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: (MediaQuery.of(context).size.width) *
                                    (33 / 95),
                                height: (MediaQuery.of(context).size.height) *
                                    (31 / 665),
                                //margin: EdgeInsets.fromLTRB(0, 20, 0, 40),
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, DietCamera.id);
                                    print('Camera');
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      'Camera',
                                      style: TextStyle(
                                        color: Colors.green,
                                        letterSpacing: 1.5,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.green,
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                              Container(
                                width: (MediaQuery.of(context).size.width) *
                                    (33 / 95),
                                height: (MediaQuery.of(context).size.height) *
                                    (31 / 665),
                                //margin: EdgeInsets.fromLTRB(0, 20, 0, 40),
                                child: FlatButton(
                                  onPressed: () {
                                    //Navigator.pushNamed(context, DashboardScreen.id);
                                    print('Graph');
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      'Graph',
                                      style: TextStyle(
                                        color: Colors.green,
                                        letterSpacing: 1.5,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      color: Colors.green,
                                      width: 2,
                                      style: BorderStyle.solid,
                                    ),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 22,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 122,
                          child: Center(
                            child: SleekCircularSlider(
                              min: 0.0,
                              max: 7000.0,
                              initialValue: todaySteps.toDouble(),
                              appearance: CircularSliderAppearance(
                                angleRange: 360.0,
                                startAngle: 90,
                                customWidths: CustomSliderWidths(
                                  progressBarWidth: 7.0,
                                  trackWidth: 2.5,
                                  handlerSize: 3.0,
                                ),
                                customColors: CustomSliderColors(
                                  progressBarColors: [
                                    Color(0XFF6D8DE8),
                                    Color(0XFF4348D8),
                                  ],
                                  trackColor: Color(0XFFF2F2F2),
                                ),
                                infoProperties: InfoProperties(
                                  modifier: percentageModifierDiet,
                                  bottomLabelText: 'KCal',
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
                        Expanded(
                          flex: 22,
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 44,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex: 22,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('Carbs'),
                              LinearPercentIndicator(
                                width: (MediaQuery.of(context).size.width) *
                                    (3 / 19),
                                lineHeight: 5.0,
                                percent: 0.8,
                                backgroundColor: Color(0XFFECF1FA),
                                progressColor: Color(0XFF92A6E9),
                              ),
                              Text(
                                '12g left',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 48,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('Protein'),
                              LinearPercentIndicator(
                                width: (MediaQuery.of(context).size.width) *
                                    (3 / 19),
                                lineHeight: 5.0,
                                percent: 0.8,
                                backgroundColor: Color(0XFFF7E6EB),
                                progressColor: Color(0XFFE15D86),
                              ),
                              Text(
                                '12g left',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 48,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('Fat'),
                              LinearPercentIndicator(
                                width: (MediaQuery.of(context).size.width) *
                                    (3 / 19),
                                lineHeight: 5.0,
                                percent: 0.8,
                                backgroundColor: Color(0XFFF8F2D2),
                                progressColor: Color(0XFFEFC35E),
                              ),
                              Text(
                                '12g left',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 22,
                          child: Container(),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 18,
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 30,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
