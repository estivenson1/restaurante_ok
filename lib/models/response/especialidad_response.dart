import 'package:restaurante_ok/models/entities/especialidad_entity.dart';

class EspecialidadResponse {
  String? respuesta;
  EspecialidadEntity? datos;

  EspecialidadResponse({this.respuesta, this.datos});

  EspecialidadResponse.fromJson(Map<String, dynamic> json) {
    respuesta = json['respuesta'];
    datos = json['datos'] != null ? new EspecialidadEntity.fromJson(json['datos']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['respuesta'] = this.respuesta;
    if (this.datos != null) {
      data['datos'] = this.datos!.toJson();
    }
    return data;
  }
}


