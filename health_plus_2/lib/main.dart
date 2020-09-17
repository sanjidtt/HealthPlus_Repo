import 'package:flutter/material.dart';
import 'package:health_plus_2/screens/dashboard_screen.dart';
import 'package:health_plus_2/screens/database_screen.dart';
import 'package:health_plus_2/screens/diet_addfood_screen.dart';
import 'package:health_plus_2/screens/diet_camera.dart';
import 'package:health_plus_2/screens/diet_fooddetail_screen.dart';
import 'package:health_plus_2/screens/diet_screen.dart';
import 'package:health_plus_2/screens/login_screen.dart';
import 'package:health_plus_2/screens/registration_2_screen.dart';
import 'package:health_plus_2/screens/registration_screen.dart';
import 'package:health_plus_2/screens/splash_screen.dart';
import 'package:health_plus_2/screens/steps_screen_2.dart';
import 'package:health_plus_2/water_screens/water_screen_main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:syncfusion_flutter_core/core.dart';

import 'bmi_screens/bmi_screen_main.dart';
import 'components/steps_count.dart';

void main() async {
  SyncfusionLicense.registerLicense(
      'NT8mJyc2IWhiZH1nfWN9Z2NoYmF8YGJ8ampqanNiYmlmamlmanMDHmggMj05OjcnMiYgOjUTND4yOj99MDw+');
  await Hive.initFlutter();
  await Hive.openBox<int>('steps');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: DietCamera.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        DashboardScreen.id: (context) => DashboardScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        RegistrationScreen2.id: (context) => RegistrationScreen2(),
        StepsCount.id: (context) => StepsCount(),
        StepsScreen2.id: (context) => StepsScreen2(),
        DietScreen.id: (context) => DietScreen(),
        DietCamera.id: (context) => DietCamera(),
        DietAddFoodScreen.id: (context) => DietAddFoodScreen(),
        DietFoodDetailScreen.id: (context) => DietFoodDetailScreen(),
        DatabaseScreen.id: (context) => DatabaseScreen(),
        WaterScreenMain.id: (context) => WaterScreenMain(),
        BmiScreenMain.id: (context) => BmiScreenMain(),

        //StepsScreenNew.id: (context) => StepsScreenNew(),
      },
    );
  }
}
