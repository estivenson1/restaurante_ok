import 'package:flutter/material.dart';
import 'package:restaurante_ok/screens/home_screen.dart';
import 'package:restaurante_ok/screens/login_screen.dart';
import 'package:restaurante_ok/screens/register_or_login_screen.dart';
import 'package:restaurante_ok/screens/splash_specialty_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: SplashSpecialtyScreen.id,
      routes: {
        SplashSpecialtyScreen.id: (context) => SplashSpecialtyScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        RegisterOrLoginScreen.id: (context) => RegisterOrLoginScreen(),
      },

    );
  }
}