import 'package:restaurante_ok/models/entities/categorias_entity.dart';

class CategoriasResponse {
  String? respuesta;
  List<CategoriasEntity>? datos;

  CategoriasResponse({this.respuesta, this.datos});

  CategoriasResponse.fromJson(Map<String, dynamic> json) {
    respuesta = json['respuesta'];
    if (json['datos'] != null) {
      datos = <CategoriasEntity>[];
      json['datos'].forEach((v) {
        datos!.add(new CategoriasEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['respuesta'] = this.respuesta;
    if (this.datos != null) {
      data['datos'] = this.datos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}