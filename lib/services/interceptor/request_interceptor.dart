import 'dart:io';

import 'package:nexquub/utils/utils.dart';

class RequestInterceptor implements Interceptor {
  @override
  void onError(DioException error, ErrorInterceptorHandler handler) async {
    // if (error.response?.statusCode == 401) {
    //   try {
    //     final authService = locator<AuthApiService>();
    //     await authService.refreshToken();
    //     RequestOptions options = error.requestOptions;
    //     final dio = locator<Dio>();
    //     final newResponse = await dio.fetch(options);
    //     return handler.resolve(newResponse);
    //   } catch (_) {
    //     return handler.reject(error);
    //   }
    // }
    return handler.next(error);
  }

  @override
  void onRequest(
    RequestOptions requestOptions,
    RequestInterceptorHandler handler,
  ) async {
    ILocalStorage storage = locator<ILocalStorage>();
    String? token = await storage.getToken();
    if (token != null) {
      requestOptions.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    return handler.next(requestOptions);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }
}
