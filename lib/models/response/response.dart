
class Response {
  final bool isSuccess;
  final String message;
  final dynamic result;

  Response({required this.isSuccess, this.message = '', this.result});
}