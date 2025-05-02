import 'package:nexquub/utils/utils.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/retrofit.dart';

abstract class CrashlyticsService extends ParseErrorLogger {
  void init();
  void setUserIdentifier({String? username, required String email});
  bool logErrors(Object error, StackTrace stack);
  void logFlutterError(FlutterErrorDetails flutterErrorDetails);
}

class FirebaseCrashlyticsService implements CrashlyticsService {
  final FirebaseCrashlytics _crashlytics = FirebaseCrashlytics.instance;

  FirebaseCrashlyticsService() {
    init();
  }

  @override
  void init() {
    // FlutterError.onError = logFlutterError;
    // PlatformDispatcher.instance.onError = logError;
  }

  @override
  void setUserIdentifier({String? username, required String email}) {
    _crashlytics
      ..setUserIdentifier(email)
      ..setCustomKey('User name', username ?? email);
  }

  @override
  bool logErrors(Object error, StackTrace stack) {
    kLog('[ERROR LOG] onAsyncError $error');
    if (!kDebugMode) _crashlytics.recordError(error, stack, fatal: true);
    return true;
  }

  @override
  void logFlutterError(FlutterErrorDetails flutterErrorDetails) {
    kLog('[ERROR LOG] onError ${flutterErrorDetails.exception}');
    if (!kDebugMode) _crashlytics.recordFlutterError(flutterErrorDetails);
  }

  @override
  void logError(Object error, StackTrace stackTrace, RequestOptions options) {
    kLog('[REQUEST ERROR] $error');
    if (!kDebugMode) {
      _crashlytics.recordFlutterError(
        FlutterErrorDetails(exception: error, stack: stackTrace),
      );
    }
  }
}
