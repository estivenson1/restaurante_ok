import 'dart:convert';

class EspecialidadEntity {
  EspecialidadEntity({
    this.nombre,
    this.descripcion,
    this.precio,
    this.urlFoto,
  });

  String? nombre;
  String? descripcion;
  int? precio;
  String? urlFoto;

  factory EspecialidadEntity.fromJson(String str) => EspecialidadEntity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EspecialidadEntity.fromMap(Map<String, dynamic> json) => EspecialidadEntity(
    nombre: json["nombre"],
    descripcion: json["descripcion"],
    precio: json["precio"],
    urlFoto: json["url_foto"],
  );

  Map<String, dynamic> toMap() => {
    "nombre": nombre,
    "descripcion": descripcion,
    "precio": precio,
    "url_foto": urlFoto,
  };
}