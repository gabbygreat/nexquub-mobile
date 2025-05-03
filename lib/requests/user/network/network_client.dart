import 'package:retrofit/retrofit.dart';
import 'package:nexquub/utils/utils.dart';

part 'network_client.g.dart';

@RestApi()
abstract class UserApiClient {
  factory UserApiClient(
    Dio dio, {
    String baseUrl,
    ParseErrorLogger errorLogger,
  }) = _UserApiClient;

  @POST('api/user/register')
  Future<ApiResponse<OTPExpiryResponse>> signup({
    @Body() required SignupPayload payload,
  });

  @POST('api/user/login')
  Future<ApiResponse<LoginDataResponse>> login({
    @Body() required SigninPayload payload,
  });

  @POST('api/user/login-other-source')
  Future<ApiResponse<LoginDataResponse>> otherLogin({
    @Body() required OtherLoginPayload payload,
  });

  @POST('api/user/token-login')
  Future<ApiResponse<LoginDataResponse>> tokenLogin({
    @Body() String? messagingToken,
  });

  @POST('api/user/request-otp')
  Future<ApiResponse<OTPExpiryResponse>> requestOTP({
    @Body() required RequestOTPPayload payload,
  });

  @POST('api/user/verify-otp')
  Future<ApiNullResponse<LoginDataResponse>> verifyOTP({
    @Body() required VerifyOTPPayload payload,
  });

  @POST('api/user/forgot-password')
  Future<ApiResponse<OTPExpiryResponse>> forgotPassword({
    @Body() required EmailPayload payload,
  });

  @POST('api/user/reset-password')
  Future<ApiMessageResponse> resetPassword({
    @Body() required ResetPasswordPayload payload,
  });

  @GET('api/user/logout')
  Future<ApiMessageResponse> logout();

  @GET('api/user/delete')
  Future<ApiMessageResponse> deleteAccount();
}
