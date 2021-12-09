import 'package:flutter/material.dart';
import 'package:restaurante_ok/Helpers/Services/api_service.dart';
import 'package:restaurante_ok/Helpers/components/rounded_button.dart';
import 'package:restaurante_ok/models/entities/especialidad_entity.dart';
import 'package:restaurante_ok/models/entities/post_entity.dart';
import 'package:restaurante_ok/models/response/Response.dart';
import 'package:restaurante_ok/models/response/especialidad_response.dart';
import 'package:restaurante_ok/screens/login_screen.dart';
import 'package:restaurante_ok/screens/register_or_login_screen.dart';


class SplashSpecialtyScreen extends StatelessWidget {
  static const String id= 'splash_specialty_screen';
  const SplashSpecialtyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        //appBar: AppBar(title: Text('Fetch Data Example'),  ),
        body: Center(
          child: FutureBuilder<Response>(
            future: ApiService.getEspecialidad(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _specialtyDishView(context, ((snapshot.data!.result) as EspecialidadResponse).datos!);//Text(((snapshot.data!.result) as EspecialidadResponse).respuesta! );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // Por defecto, muestra un loading spinner
              return _splashScreenView(context);
            },
          ),
        ),

    );
  }

  Widget _splashScreenView(BuildContext context) {
    return Stack(
      fit: StackFit.expand ,
      children: <Widget> [
        Container(
          decoration: const BoxDecoration(color: Color(0xffff3d00)),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 100.0,
                    child: Image.asset('assets/logo.png'),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget> [
                  CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                  ),
                ],
              ),
            ),
          ],
        )
        //child: lightMode ? Image.asset('assets/splash_screen_logo.png') : Image.asset('assets/splash_dark.png')),
      ],
    );
  }

  Widget _specialtyDishView(BuildContext context, EspecialidadEntity especialidad) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 60),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.orangeAccent, Colors.deepOrange])),
            child: Image.network(
              especialidad.urlFoto!,
              height: 200,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            'Nombre: ${especialidad.nombre!}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Descripcion: ${especialidad.descripcion!}',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          RoundedButton(title: 'Iniciar', colour: Colors.lightBlueAccent, onPressed: ()
          {
            Navigator.pushNamed(context, RegisterOrLoginScreen.id);
            //Navigator.push(context, new MaterialPageRoute(builder: (context) => new LoginScreen()));
          }
            ),

        ],
      ),

    );
  }
}


