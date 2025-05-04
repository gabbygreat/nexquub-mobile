import 'dart:io';

import 'package:nexquub/utils/utils.dart';

class RequestInterceptor implements Interceptor {
  @override
  void onError(DioException error, ErrorInterceptorHandler handler) async {
    return handler.next(error);
  }

  @override
  void onRequest(
    RequestOptions requestOptions,
    RequestInterceptorHandler handler,
  ) async {
    ILocalStorage storage = locator<ILocalStorage>();
    Token? mainToken = await storage.getToken();
    if (mainToken != null) {
      String type = mainToken.token.capitalize;
      String token = mainToken.token;
      requestOptions.headers[HttpHeaders.authorizationHeader] = '$type $token';
    }
    return handler.next(requestOptions);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}
