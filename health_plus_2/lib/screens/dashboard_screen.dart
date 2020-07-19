import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_plus_2/components/calorie_tab.dart';
import 'package:health_plus_2/components/diet_tab.dart';
import 'package:health_plus_2/components/steps_count.dart';
import 'package:health_plus_2/components/steps_tab.dart';
import 'package:health_plus_2/components/water_tab.dart';
import 'package:health_plus_2/screens/diet_screen.dart';

class DashboardScreen extends StatefulWidget {
  static String id = 'dashboard_screen';
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0XFFF2F2F2),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 125,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 603,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 38,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 134,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 200,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, StepsCount.id);
                                  /*
                                  setState(
                                    () {
                                      stepcount += 1000;
                                    },
                                  );
                                  */
                                },
                                child: StepsTab(
                                  textHeading: "Steps",
                                  iconLogo: Icon(
                                    FontAwesomeIcons.running,
                                    size: 24.0,
                                    color: Colors.black,
                                  ),
                                  backgroundCol: Color(0XFFFAFAFA),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 30,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 135,
                              child: StepsTab(
                                textHeading: "Sleep",
                                iconLogo: Icon(
                                  FontAwesomeIcons.moon,
                                  size: 24.0,
                                  color: Colors.black,
                                ),
                                backgroundCol: Color(0XFFFAFAFA),
                              ),
                            ),
                            Expanded(
                              flex: 30,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 178,
                              child: CalorieTab(
                                textHeading: "Calorie",
                                iconLogo: Icon(
                                  FontAwesomeIcons.fire,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                                backgroundCol: Color(0XFFFF8355),
                              ),
                            ),
                            Expanded(
                              flex: 30,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 20,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 134,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 200,
                              child: WaterTab(
                                textHeading: "Water",
                                iconLogo: Icon(
                                  FontAwesomeIcons.glassWhiskey,
                                  size: 24.0,
                                  color: Colors.black,
                                ),
                                backgroundCol: Color(0XFFFAFAFA),
                              ),
                            ),
                            Expanded(
                              flex: 30,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 213,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, DietScreen.id);
                                  /*
                                  setState(
                                    () {
                                      stepcount += 1000;
                                    },
                                  );
                                  */
                                },
                                child: DietTab(
                                  textHeading: "Diet",
                                  iconLogo: Icon(
                                    FontAwesomeIcons.utensils,
                                    size: 24.0,
                                    color: Colors.black,
                                  ),
                                  backgroundCol: Color(0XFFFAFAFA),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 30,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 100,
                              child: StepsTab(
                                textHeading: "BMI",
                                iconLogo: Icon(
                                  FontAwesomeIcons.calculator,
                                  size: 24.0,
                                  color: Colors.black,
                                ),
                                backgroundCol: Color(0XFFFAFAFA),
                              ),
                            ),
                            Expanded(
                              flex: 30,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 38,
                        child: SizedBox(),
                      ),
                    ],
                  ),
                ),
//                Expanded(
//                  flex: 84,
//                  child: Container(
//                    color: Colors.blue,
//                  ),
//                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
