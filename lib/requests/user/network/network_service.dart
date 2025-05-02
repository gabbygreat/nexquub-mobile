import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nexquub/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

abstract class UserApiService extends NetworkBoundResources {
  UserApiService(this._client);

  final UserApiClient _client;

  Future<ApiMessageResponse?> signup({required SignupPayload payload});

  Future<ApiResponse<LoginDataResponse>?> login({
    required SigninPayload payload,
  });

  Future<ApiResponse<LoginDataResponse>?> otherLogin({
    required SourceType source,
  });

  Future<ApiResponse<LoginDataResponse>?> tokenLogin();

  Future<ApiResponse<OTPExpiryResponse>?> requestOTP({
    required EmailPayload payload,
  });

  Future<ApiResponse<OTPExpiryResponse>?> forgotPassword({
    required EmailPayload payload,
  });

  Future<ApiMessageResponse?> resetPassword({
    required ResetPasswordPayload payload,
  });

  Future<ApiResponse?> logout();

  Future<ApiMessageResponse?> deleteAccount();

  Future<ApiNullResponse<LoginDataResponse>?> verifyEmail({
    required VerifyOTPPayload payload,
  });
}

class DefaultUserApiService extends UserApiService {
  DefaultUserApiService(super.client);

  @override
  Future<ApiMessageResponse?> signup({required SignupPayload payload}) async {
    // final pushToken = await FirebaseMessaging.instance.getToken();
    // payload = payload.updatePushToken(pushToken: pushToken);
    return networkBoundNullableResponse(
      fromRemote: _client.signup(payload: payload),
      onRemoteDataFetched: (response) async {
        // final storage = locator<ILocalStorage>();
        // await storage.setTempEmail(response.data.email);
        // await storage.setTokenLifeTime(response.data.tokenLifetime);
      },
    );
  }

  @override
  Future<ApiResponse<LoginDataResponse>?> login({
    required SigninPayload payload,
  }) async {
    final pushToken = await FirebaseMessaging.instance.getToken();
    payload = payload.updatePushToken(pushToken: pushToken);
    return networkBoundNullableResponse(
      fromRemote: _client.login(payload: payload),
      onRemoteDataFetched: (response) async {
        // final storage = locator<ILocalStorage>();
        // await storage.saveUser(value: response.data);
      },
    );
  }

  @override
  Future<ApiResponse<LoginDataResponse>?> otherLogin({
    required SourceType source,
  }) async {
    try {
      final accessToken = await switch (source) {
        SourceType.apple => _getAppleAccessToken(),
        SourceType.google => _getGoogleAccessToken(),
        SourceType.facebook => Future.value('Hello'),
      };
      if (accessToken == null) return null;
      return _otherLogin(
        payload: OtherLoginPayload(
          type: SourceType.google,
          accessToken: accessToken,
        ),
      );
    } catch (_) {
      return null;
    }
  }

  Future<String?> _getAppleAccessToken() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    final accessToken = credential.identityToken;
    if (accessToken == null) return null;
    return null;
  }

  Future<String?> _getGoogleAccessToken() async {
    final googleSignin = GoogleSignIn(
      clientId:
          Platform.isIOS
              ? const String.fromEnvironment(AppConstant.appleGID)
              : null,
    );
    await googleSignin.signOut();
    final account = await googleSignin.signIn();
    if (account == null) return null;

    final googleAuth = await account.authentication;
    final accessToken = googleAuth.accessToken;
    if (accessToken == null) return null;
    return null;
  }

  Future<ApiResponse<LoginDataResponse>?> _otherLogin({
    required OtherLoginPayload payload,
  }) async {
    return networkBoundNullableResponse(
      fromRemote: _client.otherLogin(payload: payload),
      onRemoteDataFetched: (response) async {
        // final storage = locator<ILocalStorage>();
        // await storage.saveUser(value: response.data);
      },
    );
  }

  @override
  Future<ApiResponse<LoginDataResponse>?> tokenLogin() async {
    return networkBoundNullableResponse(
      fromRemote: _client.tokenLogin(),
      onRemoteDataFetched: (response) async {
        // final storage = locator<ILocalStorage>();
        // await storage.saveUser(value: response.data);
      },
    );
  }

  @override
  Future<ApiResponse<OTPExpiryResponse>?> requestOTP({
    required EmailPayload payload,
  }) async {
    return networkBoundNullableResponse(
      fromRemote: _client.requestOTP(payload: payload),
      onRemoteDataFetched: (response) async {
        // final storage = locator<ILocalStorage>();
        // await storage.saveUser(value: response.data);
      },
    );
  }

  @override
  Future<ApiResponse<OTPExpiryResponse>?> forgotPassword({
    required EmailPayload payload,
  }) async {
    return networkBoundNullableResponse(
      fromRemote: _client.forgotPassword(payload: payload),
      onRemoteDataFetched: (response) async {
        // final storage = locator<ILocalStorage>();
        // await storage.saveUser(value: response.data);
      },
    );
  }

  @override
  Future<ApiMessageResponse?> resetPassword({
    required ResetPasswordPayload payload,
  }) async {
    return networkBoundNullableResponse(
      fromRemote: _client.resetPassword(payload: payload),
      onRemoteDataFetched: (response) async {
        // final storage = locator<ILocalStorage>();
        // await storage.saveUser(value: response.data);
      },
    );
  }

  @override
  Future<ApiResponse?> logout() async {
    return networkBoundNullableResponse(
      fromRemote: _client.logout(),
      onRemoteDataFetched: (response) async {
        return locator<ILocalStorage>().unSaveUser();
      },
    );
  }

  @override
  Future<ApiMessageResponse?> deleteAccount() async {
    return networkBoundNullableResponse(
      fromRemote: _client.deleteAccount(),
      onRemoteDataFetched: (response) async {
        locator<ILocalStorage>().unSaveUser();
      },
    );
  }

  @override
  Future<ApiNullResponse<LoginDataResponse>?> verifyEmail({
    required VerifyOTPPayload payload,
  }) async {
    return networkBoundNullableResponse(
      fromRemote: _client.verifyOTP(payload: payload),
    );
  }
}
