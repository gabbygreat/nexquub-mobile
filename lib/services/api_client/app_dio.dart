import 'package:dio/dio.dart' show Headers;
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:nexquub/utils/utils.dart';

class AppDio with DioMixin implements Dio {
  AppDio._() {
    options = BaseOptions(
      baseUrl: const String.fromEnvironment(
        AppConstant.baseUrl,
      ),
      contentType: Headers.jsonContentType,
      connectTimeout: const Duration(seconds: 50),
      sendTimeout: const Duration(seconds: 50),
      receiveTimeout: const Duration(seconds: 50),
    );

    interceptors.addAll(
      [
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          enabled: kDebugMode,
          logPrint: (message) => kLog(message),
        ),
        RequestInterceptor(),
      ],
    );

    httpClientAdapter = IOHttpClientAdapter();
  }

  static Dio getInstance() => AppDio._();
}
