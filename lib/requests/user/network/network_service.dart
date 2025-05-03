import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:nexquub/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

abstract class UserApiService extends NetworkBoundResources {
  UserApiService(this._client);

  final UserApiClient _client;

  Future<ApiResponse<OTPExpiryResponse>?> signup({
    required SignupPayload payload,
  });

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

  Future<String?> getMessagingToken() async {
    return await FirebaseMessaging.instance.getToken();
  }

  @override
  Future<ApiResponse<OTPExpiryResponse>?> signup({
    required SignupPayload payload,
  }) async {
    final messagingToken = await getMessagingToken();
    payload = payload.updatePushToken(messagingToken: messagingToken);
    return networkBoundNullableResponse(
      fromRemote: _client.signup(payload: payload),
    );
  }

  @override
  Future<ApiResponse<LoginDataResponse>?> login({
    required SigninPayload payload,
  }) async {
    final messagingToken = await getMessagingToken();
    payload = payload.updatePushToken(messagingToken: messagingToken);
    return networkBoundNullableResponse(
      fromRemote: _client.login(payload: payload),
      onRemoteDataFetched: (response) async {
        final storage = locator<ILocalStorage>();
        await storage.saveUser(value: response.data);
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
        SourceType.facebook => _getFacebookAccessToken(),
      };
      if (accessToken == null) return null;
      final messagingToken = await getMessagingToken();
      return _otherLogin(
        payload: OtherLoginPayload(
          type: SourceType.google,
          accessToken: accessToken,
          messagingToken: messagingToken,
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
      scopes: ['email', 'profile'],
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

  Future<String?> _getFacebookAccessToken() async {
    final result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final accessToken = result.accessToken?.tokenString;
      return accessToken;
    } else {
      return null;
    }
  }

  Future<ApiResponse<LoginDataResponse>?> _otherLogin({
    required OtherLoginPayload payload,
  }) async {
    return networkBoundNullableResponse(
      fromRemote: _client.otherLogin(payload: payload),
      onRemoteDataFetched: (response) async {
        final storage = locator<ILocalStorage>();
        await storage.saveUser(value: response.data);
      },
    );
  }

  @override
  Future<ApiResponse<LoginDataResponse>?> tokenLogin() async {
    final messagingToken = await getMessagingToken();
    return networkBoundNullableResponse(
      fromRemote: _client.tokenLogin(messagingToken: messagingToken),
      onRemoteDataFetched: (response) async {
        final storage = locator<ILocalStorage>();
        await storage.saveUser(value: response.data);
      },
    );
  }

  @override
  Future<ApiResponse<OTPExpiryResponse>?> requestOTP({
    required EmailPayload payload,
  }) async {
    return networkBoundNullableResponse(
      fromRemote: _client.requestOTP(payload: payload),
    );
  }

  @override
  Future<ApiResponse<OTPExpiryResponse>?> forgotPassword({
    required EmailPayload payload,
  }) async {
    return networkBoundNullableResponse(
      fromRemote: _client.forgotPassword(payload: payload),
    );
  }

  @override
  Future<ApiMessageResponse?> resetPassword({
    required ResetPasswordPayload payload,
  }) async {
    return networkBoundNullableResponse(
      fromRemote: _client.resetPassword(payload: payload),
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
