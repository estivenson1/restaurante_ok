import 'package:flutter/material.dart';
import 'package:restaurante_ok/Helpers/components/rounded_button.dart';
import 'package:restaurante_ok/screens/login_screen.dart';

class RegisterOrLoginScreen extends StatefulWidget {
  static const String id= 'register_or_login_screen';
  const RegisterOrLoginScreen({Key? key}) : super(key: key);

  @override
  _RegisterOrLoginScreenState createState() => _RegisterOrLoginScreenState();
}

class _RegisterOrLoginScreenState extends State<RegisterOrLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          RoundedButton(title: 'Iniciar sesión', colour: Colors.lightBlueAccent, onPressed: (){Navigator.pushNamed(context, LoginScreen.id);}),
          RoundedButton(title: 'Registrarse', colour: Colors.lightBlueAccent, onPressed: (){Navigator.pushNamed(context, LoginScreen.id);})
        ],
      ),
    ),
    );
  }
}
