import 'package:nexquub/utils/utils.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

abstract class AnalyticsService {
  // Method to set user identifier
  void setUserIdentifier({
    required String email,
    String? username,
  });

  // Method to get an analytics observer
  NavigatorObserver get observer;
}

class FirebaseAnalyticsImpl implements AnalyticsService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  void setUserIdentifier({
    required String email,
    String? username,
  }) {
    _setUserIdentifier(
      email: email,
      username: username,
    );
  }

  @override
  NavigatorObserver get observer {
    return FirebaseAnalyticsObserver(analytics: _analytics);
  }

  static void _setUserIdentifier({
    required String email,
    String? username,
  }) {
    // Ensure there are no non-alphanumeric characters
    final nonAlphaNumericName = username?.replaceAll(
      RegExp('[^a-zA-Z0-9_]'),
      '',
    );
    _analytics.setUserProperty(
      name: nonAlphaNumericName ?? email,
      value: email,
    );
  }
}
