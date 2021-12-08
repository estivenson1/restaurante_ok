import 'package:flutter/material.dart';
import 'package:restaurante_ok/Helpers/components/rounded_button.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id= 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:  RoundedButton(title: 'Home Iniciar', colour: Colors.lightBlueAccent, onPressed: (){Navigator.pushNamed(context, LoginScreen.id);}),
    );
  }
}
