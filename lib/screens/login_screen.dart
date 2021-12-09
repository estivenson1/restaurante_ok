import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:restaurante_ok/Helpers/Services/api_service.dart';
import 'package:restaurante_ok/Helpers/components/loader_component.dart';
import 'package:restaurante_ok/Helpers/components/rounded_button.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id= 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email='';
  String _emailError='';
  bool _emailShowError= false;

  String _password ='';
  String _passwordError ='';
  bool _passwordShowError = false;

  bool _rememberme=true;
  bool _passwordShow=false;

  bool _showLoader= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget> [
              Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget> [
                 _showEmail(),
                 _showPassword(),
                 _showRememberme(),
                 _showButtons(),
               ],
             ),
           ],
          ),
          _showLoader ? LoaderComponent(text: 'Por favor espere...',) : Container(),
        ],
      ),
    );
  }

  Widget _showEmail() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Ingresa tu email...',
          labelText: 'Email',
          errorText: _emailShowError ? _emailError : null ,
          prefixIcon: Icon(Icons.alternate_email),
          suffixIcon: Icon(Icons.email),
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onChanged: (value){
          _email = value;
        },
      ),
    );
  }

  Widget _showPassword() {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: TextField(
        obscureText: !_passwordShow,
        decoration: InputDecoration(
          hintText: 'Ingresa tu contraseña...',
          labelText: 'Contraseña',
          errorText: _passwordShowError ? _passwordError : null ,
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: _passwordShow ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
            onPressed: () {
              setState(() {
                _passwordShow= !_passwordShow;
              });
        },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onChanged: (value){
          _password = value;
          print(_password);
        },
      ),
    );
  }

  Widget _showRememberme() {
    return CheckboxListTile(
      title: Text('Recordar su correo y contraseña'),
      value: _rememberme,
      onChanged: (value) {
        setState(() {
          _rememberme = value!;
        });

      },
    );
  }

  Widget _showButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        ElevatedButton(
            child: Text('Iniciar sesión') ,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states){
                    return Colors.orange;
                  }
              )
            ),
            onPressed: () => _login() ),
      ],
    );
  }

  Future<void> _login() async {
    setState(() {
      _passwordShow = false;
    });

    if(!_validateFields()){
      return;
    }

    setState(() {
      _showLoader = true;
    });

    var response = await ApiService.login(_email, _password);

    setState(() {
      _showLoader = false;
    });
    //var respCategoria = await ApiService.getCategorias();
    //print('XXXXXXXXXXXXXXXXX ${respCategoria!.isSuccess}');
    if(response.isSuccess) {
      Navigator.pushNamed(context, HomeScreen.id);
    }

  }

  bool _validateFields() {
    bool hasErrors=true;

    if(_email.isEmpty){
      hasErrors= false;
      _emailShowError=true;
      _emailError='Debes ingresar tu email';
    }else if(!EmailValidator.validate(_email)){
      hasErrors= false;
      _emailShowError=true;
      _emailError='Debes ingresar un email valido';
    }
    else{
      _emailShowError=false;
    }

    if(_password.isEmpty){
      hasErrors= false;
      _passwordShowError=true;
      _passwordError='Debes ingresar tu contraseña';
    }else if(_password.length < 4){
      hasErrors= false;
      _passwordShowError=true;
      _passwordError='Debes ingresar una contraseña de al menos 4 carácteres';
    }
    else{
      _passwordShowError=false;
    }

    setState(() { });
   return hasErrors;
  }
}
