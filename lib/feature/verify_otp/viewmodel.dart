import 'package:nexquub/utils/utils.dart';

class VerifyOTPViewModel extends BaseViewModel {
  VerifyOTPViewModel({required super.context, required this.response}) {
    service = locator<UserApiService>();
    pinController = TextEditingController();
    isLoading = ValueNotifier(false);
    isExpired = ValueNotifier(false);

    passwordValidation = ContentFormValidation(
      message: 'Please, enter a password',
    );
    focusNodes = List.generate(1, (_) => FocusNode());
  }

  late ContentFormValidation passwordValidation;
  late TextEditingController pinController;
  late ValueNotifier<bool> isLoading;
  late ValueNotifier<bool> isExpired;
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
            await showSuccessFullModal(
              context,
              text: 'You are all set',
              description:
                  'Welcome to the future of intelligent reading. Your personalized AI-powered assistant is ready to go.',
              onProceed: () async {
                navigation.goNamed(HomeScreen.name);
              },
            );
            break;
          case OTPVerificationType.forgotPassword:
            final data = response.updateVerificationCode(
              code: pinController.text,
            );
            await navigation.pushReplacementNamed(
              ResetPasswordScreen.name,
              extra: data.toJson(),
            );
            break;
        }
      },
    );
  }

  void updateIsExpired(bool value) {
    isExpired.value = value;
  }

  void dispose() {
    for (var e in focusNodes) {
      e.dispose();
    }
    pinController.dispose();
    isExpired.dispose();
    isLoading.dispose();
  }
}
