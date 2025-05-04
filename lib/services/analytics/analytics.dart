import 'package:nexquub/utils/utils.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

abstract class AnalyticsService {
  // Method to set user identifier
  void setUserIdentifier({required UserResponse user});

  // Method to get an analytics observer
  NavigatorObserver get observer;
}

class FirebaseAnalyticsImpl implements AnalyticsService {
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  void setUserIdentifier({required UserResponse user}) {
    _setUserIdentifier(user: user);
  }

  @override
  NavigatorObserver get observer {
    return FirebaseAnalyticsObserver(analytics: _analytics);
  }

  static String _nonAlphaNumeric(String value) {
    // Ensure there are no non-alphanumeric characters
    return value.replaceAll(RegExp('[^a-zA-Z0-9_]'), '');
  }

  static void _setUserIdentifier({required UserResponse user}) {
    _analytics.setUserProperty(
      name: user.id,
      value: _nonAlphaNumeric(user.email),
    );
  }
}
