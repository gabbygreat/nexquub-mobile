import 'dart:io';

import 'package:nexquub/utils/utils.dart';

class ApiFormatter {
  static ErrorModel format(
    Object error, {
    StackTrace? trace,
    DialogErrorType? errorType,
  }) {
    kLog('$error');
    kLog('$trace');
    final context = routes.routerDelegate.navigatorKey.currentContext!;
    final l10n = context.l10n;

    if (error is DioException) {
      kLog('${error.response}');
      final statusCode = error.response?.statusCode;
      if (error.type == DioExceptionType.badResponse) {
        if (error.response != null && error.response?.data is Map) {
          if ((error.response?.data as Map).containsKey('errors')) {
            if ((error.response?.data as Map)['errors'] is List) {
              final errorList =
                  ((error.response?.data as Map)['errors'] as List);
              if (errorList.isNotEmpty) {
                final message = errorList.first;
                if (message is Map) {
                  final key = (message).containsKey('message');
                  if (key) {
                    final value = message['message'];
                    return ErrorModel(
                      message: '$value',
                      type: DialogErrorType.auth,
                      statusCode: statusCode,
                    );
                  }
                }
              }
            }
          }
          final err = ErrorResponse.fromJson(
            error.response?.data,
          );
          if (error.response?.statusCode == 403) {
            return ErrorModel(
              message: err.message ?? l10n.somethingWentWrong,
              type: DialogErrorType.auth,
              statusCode: statusCode,
            );
          }
          return ErrorModel(
            message: err.message ?? l10n.somethingWentWrong,
            type: DialogErrorType.error,
            statusCode: statusCode,
          );
        }
      }
      if (error.type == DioExceptionType.connectionError) {
        return ErrorModel(
          message: l10n.checkYourInternetConnection,
          type: DialogErrorType.noInternet,
          statusCode: statusCode,
        );
      } else if (error.type == DioExceptionType.connectionTimeout ||
          error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        return ErrorModel(
          message: l10n.requestTookTooLong,
          type: DialogErrorType.error,
          statusCode: statusCode,
        );
      } else if (error.type == DioExceptionType.cancel) {
        return ErrorModel(
          message: l10n.requestWasCancelled,
          type: DialogErrorType.cancelledError,
          statusCode: statusCode,
        );
      } else {
        return ErrorModel(
          message: l10n.anUnxepectedErrorOccurred,
          type: DialogErrorType.error,
          statusCode: statusCode,
        );
      }
    } else if (error is FirebaseException) {
      return ErrorModel(
        message: error.message ?? l10n.somethingWentWrong,
        type: DialogErrorType.noInternet,
      );
    } else if (error is CustomException) {
      return ErrorModel(
        type: errorType ?? DialogErrorType.error,
        message: error.message,
      );
    } else if (error is PathNotFoundException) {
      return ErrorModel(
        type: errorType ?? DialogErrorType.error,
        message: error.message,
      );
    }
    return ErrorModel(
      message: l10n.somethingWentWrong,
      type: DialogErrorType.error,
    );
  }
}
