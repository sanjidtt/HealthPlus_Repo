import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_plus_2/bmi_screens/bmi_screen_main.dart';
import 'package:health_plus_2/components/bmi_tab.dart';
import 'package:health_plus_2/components/calorie_tab.dart';
import 'package:health_plus_2/components/diet_tab.dart';
import 'package:health_plus_2/components/sleep_tab.dart';
import 'package:health_plus_2/components/steps_tab.dart';
import 'package:health_plus_2/components/water_tab.dart';
import 'package:health_plus_2/screens/diet_screen.dart';
import 'package:health_plus_2/screens/steps_screen_2.dart';
import 'package:health_plus_2/water_screens/water_screen_main.dart';
import 'package:hive/hive.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pedometer/pedometer.dart';

import '../constants.dart';

class DashboardScreen extends StatefulWidget {
  static String id = 'dashboard_screen';
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Pedometer _pedometer;
  StreamSubscription<int> _subscription;
  Box<int> stepsBox = Hive.box('steps');

  @override
  void initState() {
    super.initState();
    startListening();
  }

  Widget build(BuildContext context) {
    return Scaffold(
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
                                Navigator.pushNamed(context, StepsScreen2.id);
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
                                stepsVarTab: todaySteps,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 30,
                            child: SizedBox(),
                          ),
                          Expanded(
                            flex: 135,
                            child: SleepTab(
                              textHeading: "Sleep",
                              iconLogo: Icon(
                                FontAwesomeIcons.moon,
                                size: 24.0,
                                color: Colors.black,
                              ),
                              backgroundCol: Color(0XFFFAFAFA),
                              stepsVarTab: 3200,
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
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, DietScreen.id);
                              },
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, WaterScreenMain.id);
                                },
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
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, BmiScreenMain.id);
                              },
                              child: BmiTab(
                                textHeading: "BMI",
                                iconLogo: Icon(
                                  FontAwesomeIcons.calculator,
                                  size: 24.0,
                                  color: Colors.white,
                                ),
                                backgroundCol: Color(0XFF4C5065),
                                stepsVarTab: 2000,
                              ),
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
    );
  }

  @override
  void dispose() {
    stopListening();
    super.dispose();
  }

  void startListening() {
    _pedometer = Pedometer();
    _subscription = _pedometer.pedometerStream.listen(
      getTodaySteps,
      onError: _onError,
      onDone: _onDone,
      cancelOnError: true,
    );
  }

  void _onDone() => print("Finished pedometer tracking");
  void _onError(error) => print("Flutter Pedometer Error: $error");

  Future<int> getTodaySteps(int value) async {
    print(value);
    int savedStepsCountKey = 999999;
    int savedStepsCount = stepsBox.get(savedStepsCountKey, defaultValue: 0);

    int todayDayNo = Jiffy(DateTime.now()).dayOfYear;
    if (value < savedStepsCount) {
      // Upon device reboot, pedometer resets. When this happens, the saved counter must be reset as well.
      savedStepsCount = 0;
      // persist this value using a package of your choice here
      stepsBox.put(savedStepsCountKey, savedStepsCount);
    }

    // load the last day saved using a package of your choice here
    int lastDaySavedKey = 888888;
    int lastDaySaved = stepsBox.get(lastDaySavedKey, defaultValue: 0);

    // When the day changes, reset the daily steps count
    // and Update the last day saved as the day changes.
    if (lastDaySaved < todayDayNo) {
      lastDaySaved = todayDayNo;
      savedStepsCount = value;

      stepsBox
        ..put(lastDaySavedKey, lastDaySaved)
        ..put(savedStepsCountKey, savedStepsCount);
    }

    setState(() {
      todaySteps = value - savedStepsCount;

      if (todaySteps > maxValue) {
        todaySteps = maxValue.toInt();
      }

      addStepMethod(stepID, stepDate, todaySteps.toString());
    });
    stepsBox.put(todayDayNo, todaySteps);
    return todaySteps; // this is your daily steps value.
  }

  void stopListening() {
    _subscription.cancel();
  }

  /*String percentageModifier2(double value) {
    value = todaySteps.toDouble();
    final roundedValue = value.ceil().toInt().toString();
    return '$roundedValue';
  }*/

}
