import 'package:nexquub/utils/utils.dart';

class VerifyOTPViewModel extends BaseViewModel {
  VerifyOTPViewModel({required super.context, required this.response}) {
    service = locator<UserApiService>();
    pinController = TextEditingController();
    isLoading = ValueNotifier(false);

    passwordValidation = ContentFormValidation(
      message: 'Please, enter a password',
    );
    focusNodes = List.generate(1, (_) => FocusNode());
  }

  late ContentFormValidation passwordValidation;
  late TextEditingController pinController;
  late ValueNotifier<bool> isLoading;
  late final UserApiService service;
  final OTPExpiryResponse response;
  final navigation = locator<NavigationService>();
  late List<FocusNode> focusNodes;

  void login() async {
    isLoading.value = true;
    final reqResponse = await service.verifyEmail(
      payload: VerifyOTPPayload(
        email: response.email,
        type: response.type,
        verificationCode: pinController.text,
      ),
    );
    proceedIfMounted(
      response: reqResponse,
      resetCallback: () {
        isLoading.value = false;
      },
      callback: (res) async {
        switch (response.type) {
          case OTPVerificationType.accountCreation:
            // Go to celebration and to Home page
            break;
          case OTPVerificationType.forgotPassword:
            await navigation.pushReplacementNamed(
              ResetPasswordScreen.name,
              extra: response.toJson(),
            );
            break;
        }
      },
    );
  }

  void dispose() {
    for (var e in focusNodes) {
      e.dispose();
    }
    pinController.dispose();
    isLoading.dispose();
  }
}
