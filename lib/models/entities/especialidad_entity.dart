import 'dart:convert';

class EspecialidadEntity {
  String? nombre;
  String? descripcion;
  int? precio;
  String? urlFoto;

  EspecialidadEntity({this.nombre, this.descripcion, this.precio, this.urlFoto});

  EspecialidadEntity.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    precio = json['precio'];
    urlFoto = json['url_foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre'] = this.nombre;
    data['descripcion'] = this.descripcion;
    data['precio'] = this.precio;
    data['url_foto'] = this.urlFoto;
    return data;
  }
}