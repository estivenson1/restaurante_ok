import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:restaurante_ok/models/entities/post_entity.dart';
import 'package:restaurante_ok/models/response/Response.dart';
import 'package:restaurante_ok/models/response/especialidad_response.dart';

import 'setup_parameters.dart';


class ApiService{

  static Future<Response> getPost() async {
    var url = Uri.parse(SetupParameters.apiUrl);
    var response = await http.get(
      url,
      headers: {
        'content-type' : 'application/json',
        'accept' : 'application/json',
      },
    );

    var body = response.body;
    if (response.statusCode >= 400) {
      return Response(isSuccess: false, message: body);
    }

    var decodedJson = jsonDecode(body);
    return Response(isSuccess: true, result: PostEntity.fromJson(decodedJson));
  }

  static Future<Response> getEspecialidad() async {
    //var url = Uri.parse('https://wsc.fabricasoftware.co/api/especialidad');
    var url = Uri.parse('${SetupParameters.baseUrl}${SetupParameters.especialidad}');
    var response = await http.get(
      url,
      headers: {
        'content-type' : 'application/json',
        'accept' : 'application/json',
      },
    );

    var body = response.body;
    if (response.statusCode >= 400) {
      return Response(isSuccess: false, message: body);
    }

    var decodedJson = jsonDecode(body);
    print('${decodedJson}**********************************************************');

    var especialidadResponse = EspecialidadResponse.fromJson(decodedJson);
    print('${especialidadResponse.datos!.nombre}*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

    return Response(isSuccess: true, result: EspecialidadResponse.fromJson(decodedJson));
  }



}