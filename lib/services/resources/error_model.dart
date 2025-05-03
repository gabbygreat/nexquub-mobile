enum DialogErrorType { noInternet, cancelledError, auth, error, unauthorized }

class ErrorModel<T> {
  ErrorModel({
    required this.type,
    required this.message,
    this.statusCode,
    this.data,
  });
  String message;
  int? statusCode;
  DialogErrorType type;
  T? data;
}
