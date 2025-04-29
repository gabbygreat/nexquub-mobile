import 'package:nexquub/utils/utils.dart';

class GoRouterNavigationService implements NavigationService {
  GoRouterNavigationService() {
    _router = routes;
  }
  late GoRouter _router;

  @override
  void goNamed(
    String route, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return _router.goNamed(
      route,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  @override
  void pop<T extends Object?>([T? result]) {
    return _router.pop();
  }

  @override
  Future<T?> pushNamed<T extends Object?>(
    String route, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return _router.pushNamed(
      route,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  @override
  Future<T?> pushReplacementNamed<T extends Object?>(
    String route, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, dynamic> queryParameters = const <String, dynamic>{},
    Object? extra,
  }) {
    return _router.pushReplacementNamed(
      route,
      extra: extra,
      pathParameters: pathParameters,
      queryParameters: queryParameters,
    );
  }

  @override
  bool canPop() {
    return _router.canPop();
  }
}
