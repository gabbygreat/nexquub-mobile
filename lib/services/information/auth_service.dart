import 'package:nexquub/utils/utils.dart';

abstract class AuthService {
  Future<void> initialise();
  UserResponse? get user;
  late FlutterSignal<UserResponse?> userSignal;
  set user(UserResponse? value);

  Token? get token;
  set token(Token? value);

  bool get isLoggedIn;

  void logout();
}

class AuthServiceImpl implements AuthService {
  Token? _token;
  UserResponse? _user;

  final storage = locator<ILocalStorage>();

  @override
  late FlutterSignal<UserResponse?> userSignal;

  @override
  Future<void> initialise() async {
    userSignal = signal(user);
    _token = await storage.getToken();
  }

  @override
  UserResponse? get user {
    try {
      _user = storage.userInfo;
      return _user;
    } catch (_) {
      return null;
    }
  }

  @override
  set user(UserResponse? value) {
    _user = value;
    userSignal.set(_user);
  }

  @override
  Token? get token {
    return _token;
  }

  @override
  set token(Token? value) {
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
