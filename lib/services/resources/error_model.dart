enum DialogErrorType {
  noInternet,
  cancelledError,
  auth,
  error;
}

class ErrorModel {
  ErrorModel({
    required this.type,
    required this.message,
    this.statusCode,
  });
  String message;
  int? statusCode;
  DialogErrorType type;
}
