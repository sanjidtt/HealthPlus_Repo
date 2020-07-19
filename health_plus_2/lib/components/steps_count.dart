import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pedometer/pedometer.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../constants.dart';

class StepsCount extends StatefulWidget {
  static String id = 'steps_count';

  @override
  _StepsCountState createState() => _StepsCountState();
}

class _StepsCountState extends State<StepsCount> {
  Pedometer _pedometer;
  StreamSubscription<int> _subscription;
  Box<int> stepsBox = Hive.box('steps');
  int todaySteps;

  @override
  void initState() {
    super.initState();
    startListening();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.redAccent,
          child: Center(
            child: SleekCircularSlider(
              min: 0.0,
              max: maxValue,
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
                  progressBarColor: Color(0XFFBB66CC),
                  trackColor: Color(0XFFF2F2F2),
                ),
                infoProperties: InfoProperties(
                  modifier: percentageModifier2,
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
    });
    stepsBox.put(todayDayNo, todaySteps);
    return todaySteps; // this is your daily steps value.
  }

  void stopListening() {
    _subscription.cancel();
  }

  String percentageModifier2(double value) {
    value = todaySteps.toDouble();
    final roundedValue = value.ceil().toInt().toString();
    return '$roundedValue';
  }
}
