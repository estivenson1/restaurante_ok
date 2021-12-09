class CategoriasEntity {
  int? id;
  String? nombre;
  String? descripcion;
  String? urlImagen;

  CategoriasEntity({this.id, this.nombre, this.descripcion, this.urlImagen});

  CategoriasEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    urlImagen = json['url_imagen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['descripcion'] = this.descripcion;
    data['url_imagen'] = this.urlImagen;
    return data;
  }
}