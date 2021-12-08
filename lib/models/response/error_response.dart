class ErrorResponse {
  String? respuesta;
  String? mensaje;

  ErrorResponse({this.respuesta, this.mensaje});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    respuesta = json['respuesta'];
    mensaje = json['mensaje'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['respuesta'] = this.respuesta;
    data['mensaje'] = this.mensaje;
    return data;
  }
}
