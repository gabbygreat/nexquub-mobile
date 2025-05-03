import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nexquub/utils/utils.dart';

abstract class ILocalStorage {
  UserResponse? userInfo;
  Future<void> initialise();
  Future<void> saveToken(Token value);
  Future<Token?> getToken();
  Future<bool> unsetFirstTime();
  bool getOpenedBefore();
  bool getUseAsGuest();
  Future<bool> setUseAsGuest(bool value);
  bool? isDarkMode();
  Future<bool> setThemeMode({required bool? value});
  Future<bool> setLocale({required String? value});
  String? getLocale();
  Future<void> saveUser({required LoginDataResponse value});
  Future<void> unSaveUser();
  Future<bool> hasLocalData();
  Future<UserResponse?> getUser();
  void updateUser({String? username, String? profilePicture});
}

class LocalStorage implements ILocalStorage {
  late SharedPreferences _prefs;
  late FlutterSecureStorage _storage;

  @override
  UserResponse? userInfo;

  final String _token = 'token_';
  final String _asGuest = '_asGuest_';
  final String _user = 'user_';
  final String _firstTime = 'firstTime_';
  final String _darkMode = 'darkMode_option';
  final String _locale = 'locale_language';

  @override
  Future<void> initialise() async {
    AndroidOptions getAndroidOptions() =>
        const AndroidOptions(encryptedSharedPreferences: true);
    _storage = FlutterSecureStorage(aOptions: getAndroidOptions());
    _prefs = await SharedPreferences.getInstance();
    await getUser();
  }

  @override
  bool getUseAsGuest() {
    return _prefs.getBool(_asGuest) ?? false;
  }

  @override
  void updateUser({String? username, String? profilePicture}) async {
    final authService = locator<AuthService>();
    final newUser = authService.user;
    authService.user = newUser;
    userInfo = newUser;
    final token = await getToken();
    if (userInfo == null || token == null) return;
    final data = LoginDataResponse(user: userInfo!, token: token);
    await saveUser(value: data);
  }

  @override
  Future<bool> setUseAsGuest(bool value) async {
    await unSaveUser();
    return await _prefs.setBool(_asGuest, value);
  }

  @override
  Future<void> saveToken(Token value) async {
    locator<AuthService>().token = value;
    await _storage.write(key: _token, value: jsonEncode(value.toJson()));
  }

  @override
  Future<Token?> getToken() async {
    final token = await _storage.read(key: _token);
    if (token == null) return null;
    return Token.fromJson(jsonDecode(token));
  }

  @override
  Future<bool> unsetFirstTime() async {
    return _prefs.setBool(_firstTime, true);
  }

  @override
  bool getOpenedBefore() {
    return _prefs.getBool(_firstTime) ?? false;
  }

  @override
  bool? isDarkMode() {
    return _prefs.getBool(_darkMode);
  }

  @override
  Future<bool> setThemeMode({required bool? value}) async {
    if (value == null) {
      return _prefs.remove(_darkMode);
    } else {
      return _prefs.setBool(_darkMode, value);
    }
  }

  @override
  Future<bool> setLocale({required String? value}) async {
    if (value == null) {
      return _prefs.remove(_locale);
    }
    return _prefs.setString(_locale, value);
  }

  @override
  String? getLocale() {
    return _prefs.getString(_locale);
  }

  @override
  Future<void> unSaveUser() async {
    locator<AuthService>().logout();
    userInfo = null;
    await _storage.delete(key: _user);
    await _storage.delete(key: _token);
  }

  @override
  Future<void> saveUser({required LoginDataResponse value}) async {
    final user = value;
    userInfo = user.user;
    await saveToken(value.token);
    await _prefs.remove(_asGuest);
    final authService = locator<AuthService>();
    authService.user = value.user;
    authService.token = value.token;
    await _storage.write(key: _user, value: jsonEncode(value));
  }

  @override
  Future<UserResponse?> getUser() async {
    if (await hasLocalData()) {
      try {
        final user = await _storage.read(key: _user);
        final decodedUserInfo = jsonDecode(user!);
        final loginResponse = UserResponse.fromJson(decodedUserInfo);
        userInfo = loginResponse;
        return userInfo;
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  @override
  Future<bool> hasLocalData() async {
    return _storage.containsKey(key: _user);
  }
}
