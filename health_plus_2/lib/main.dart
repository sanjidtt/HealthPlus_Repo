import 'package:flutter/material.dart';
import 'package:health_plus_2/screens/dashboard_screen.dart';
import 'package:health_plus_2/screens/diet_screen.dart';
import 'package:health_plus_2/screens/login_screen.dart';
import 'package:health_plus_2/screens/registration_screen.dart';
import 'package:health_plus_2/screens/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'components/steps_count.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      title: 'FLUTTER DEMO',
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        DashboardScreen.id: (context) => DashboardScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        StepsCount.id: (context) => StepsCount(),
        DietScreen.id: (context) => DietScreen(),

        //StepsScreenNew.id: (context) => StepsScreenNew(),
      },
    );
  }
}
