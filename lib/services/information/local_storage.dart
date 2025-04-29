import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nexquub/utils/utils.dart';

abstract class ILocalStorage {
  String? userInfo;
  Future<void> initialise();
  Future<void> saveToken(String value);
  Future<String?> getToken();
  Future<bool> unsetFirstTime();
  bool getOpenedBefore();
  String getTempEmail();
  Future<bool> setTempEmail(String email);
  bool getUseAsGuest();
  Future<bool> setUseAsGuest(bool value);
  bool? isDarkMode();
  Future<bool> setThemeMode({required bool? value});
  Future<bool> setLocale({required String? value});
  String? getLocale();
  Future<void> saveUser({required String value});
  Future<void> unSaveUser();
  Future<bool> hasLocalData();
  Future<String?> getUser();
  void updateUser({
    String? username,
    String? profilePicture,
  });
}

class LocalStorage implements ILocalStorage {
  late SharedPreferences _prefs;
  late FlutterSecureStorage _storage;

  @override
  String? userInfo;

  final String _token = 'token_';
  final String _asGuest = '_asGuest_';
  final String _scrollSpeed = '_scrollSpeed_';
  final String _videoQuality = '_videoQuality_';
  final String _mirrorHorizontally = '_mirrorHorizontally_';
  final String _backGroundTransparency = '_backGroundTransparency_';
  final String _mirrorVertically = '_mirrorVertically_';
  final String _textSize = '_textSize_';
  final String _lineHeight = '_lineHeight_';
  final String _countDownTimer = '_countDownTimer_';
  final String _bionicReading = '_bionicReading';
  final String _user = 'user_';
  final String _firstTime = 'firstTime_';
  final String _darkMode = 'darkMode_option';
  final String _locale = 'locale_language';
  final String _tempEmail = 'tempEmail';

  @override
  Future<void> initialise() async {
    _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
    _prefs = await SharedPreferences.getInstance();
    await getUser();
  }

  @override
  bool getUseAsGuest() {
    return _prefs.getBool(_asGuest) ?? false;
  }

  @override
  void updateUser({
    String? username,
    String? profilePicture,
  }) async {
    final authService = locator<AuthService>();
    final newUser = authService.user;
    authService.user = newUser;
    userInfo = newUser;
    final token = await getToken();
    if (userInfo == null || token == null) return;
    await saveUser(value: '');
  }

  @override
  Future<bool> setUseAsGuest(bool value) async {
    return await _prefs.setBool(_asGuest, value);
  }

  @override
  Future<void> saveToken(String value) async {
    locator<AuthService>().token = value;
    await _storage.write(key: _token, value: value);
  }

  @override
  Future<String?> getToken() async {
    return _storage.read(key: _token);
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
  String getTempEmail() {
    return _prefs.getString(_tempEmail) ?? '';
  }

  @override
  Future<bool> setTempEmail(String email) async {
    return _prefs.setString(_tempEmail, email);
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
    await _prefs.remove(_scrollSpeed);
    await _prefs.remove(_videoQuality);
    await _prefs.remove(_mirrorHorizontally);
    await _prefs.remove(_mirrorVertically);
    await _prefs.remove(_backGroundTransparency);
    await _prefs.remove(_textSize);
    await _prefs.remove(_lineHeight);
    await _prefs.remove(_countDownTimer);
    await _prefs.remove(_bionicReading);
    await _prefs.remove(_tempEmail);
  }

  @override
  Future<void> saveUser({required String value}) async {
    final user = value;
    userInfo = user;
    await saveToken(value);
    await _prefs.remove(_asGuest);
    final authService = locator<AuthService>();
    authService.user = value;
    authService.token = value;
    await _storage.write(key: _user, value: jsonEncode(value));
  }

  @override
  Future<String?> getUser() async {
    if (await hasLocalData()) {
      try {
        // final user = await _storage.read(key: _user);
        // final decodedUserInfo = jsonDecode(user!);
        userInfo = 'loginResponse';
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
