class LoginResponse {
  String? respuesta;
  String? nombre;
  int? idCliente;
  String? token;

  LoginResponse({this.respuesta, this.nombre, this.idCliente, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    respuesta = json['respuesta'];
    nombre = json['nombre'];
    idCliente = json['idCliente'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['respuesta'] = this.respuesta;
    data['nombre'] = this.nombre;
    data['idCliente'] = this.idCliente;
    data['token'] = this.token;
    return data;
  }
}
