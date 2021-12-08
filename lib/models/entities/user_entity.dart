class UserEntity {
  String? nombre;
  String? correo;
  String? contrasena;
  String? ciudad;

  UserEntity({this.nombre, this.correo, this.contrasena, this.ciudad});

  UserEntity.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    correo = json['correo'];
    contrasena = json['contrasena'];
    ciudad = json['ciudad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre'] = this.nombre;
    data['correo'] = this.correo;
    data['contrasena'] = this.contrasena;
    data['ciudad'] = this.ciudad;
    return data;
  }
}
