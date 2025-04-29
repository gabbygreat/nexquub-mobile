abstract class NavigationService {
  void goNamed(
    String name, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  });

  void pop<T extends Object?>([T? result]);

  Future<T?> pushNamed<T extends Object?>(
    String route, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  });

  Future<T?> pushReplacementNamed<T extends Object?>(
    String route, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  });

  bool canPop();
}
