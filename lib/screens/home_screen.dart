import 'package:flutter/material.dart';
import 'package:restaurante_ok/Helpers/Services/api_service.dart';
import 'package:restaurante_ok/Helpers/components/rounded_button.dart';
import 'package:restaurante_ok/models/entities/categorias_entity.dart';
import 'package:restaurante_ok/models/response/categorias_response.dart';
import 'package:restaurante_ok/models/response/response.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id= 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late List<CategoriasEntity> _categorias;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<CategoriasResponse>  _buildBody(BuildContext context) {
    return FutureBuilder<CategoriasResponse>(
      future:  _getCategorias(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            print('Lista  ${snapshot.data!.respuesta}');
            return _getListView(context);
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }
    );
  }

  _getListView(BuildContext context ) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: _categorias.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              children: <Widget> [
                Image.network(_categorias[index].urlImagen!, height: 200,),
                Text('Nombre: ${_categorias[index].nombre}'),
                Text('Descripción: ${_categorias[index].descripcion}'),

              ],
            ),
          );
        }
    );
  }

  Future<CategoriasResponse>  _getCategorias() async {

    var resp = await ApiService.getCategorias();

    var categorias =(resp.result as CategoriasResponse).datos;
    this._categorias=categorias!;
    return (resp.result as CategoriasResponse);
  }

}

