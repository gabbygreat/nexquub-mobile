import 'package:nexquub/utils/utils.dart';

abstract class AuthService {
  Future<void> initialise();
  String? get user;
  late FlutterSignal<String?> userSignal;
  set user(String? value);

  String? get token;
  set token(String? value);

  bool get isLoggedIn;

  void logout();
}

class AuthServiceImpl implements AuthService {
  String? _token;
  String? _user;

  final storage = locator<ILocalStorage>();

  @override
  late FlutterSignal<String?> userSignal;

  @override
  Future<void> initialise() async {
    userSignal = signal(user);
    _token = await storage.getToken();
  }

  @override
  String? get user {
    try {
      _user = storage.userInfo;
      return _user;
    } catch (_) {
      return null;
    }
  }

  @override
  set user(String? value) {
    _user = value;
    userSignal.set(_user);
  }

  @override
  String? get token {
    return _token;
  }

  @override
  set token(String? value) {
    _token = value;
  }

  @override
  bool get isLoggedIn {
    return user != null && token != null;
  }

  @override
  void logout() {
    _user = null;
    _token = null;
  }
}
