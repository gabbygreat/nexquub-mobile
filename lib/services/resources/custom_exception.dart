class CustomException implements Exception {
  CustomException(
    this.message, {
    this.type,
  });
  final String message;
  final dynamic type;

  @override
  String toString() {
    return message;
  }
}
