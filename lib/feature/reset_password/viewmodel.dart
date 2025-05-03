import 'package:nexquub/utils/utils.dart';

class ResetPasswordViewModel extends AuthViewModel {
  ResetPasswordViewModel({required super.context, required this.response}) {
    passwordController = TextEditingController();
    isLoading = ValueNotifier(false);
    passwordValidation = ContentFormValidation(
      message: 'Please, enter a password',
    );
    passwordStrength = ValueNotifier(PasswordStrength.none);
        focusNodes = List.generate(1, (_) => FocusNode());

  }
  final OTPExpiryResponse response;
  late ContentFormValidation passwordValidation;
  late TextEditingController passwordController;
  late ValueNotifier<PasswordStrength> passwordStrength;
    late List<FocusNode> focusNodes;


  void resetNewPassword() async {
    isLoading.value = true;
    final reqResponse = await service.resetPassword(
      payload: ResetPasswordPayload(
        email: response.email,
        verificationCode: 'passwordController.text',
        newPassword: passwordController.text,
      ),
    );
    proceedIfMounted(
      response: reqResponse,
      resetCallback: () {
        isLoading.value = false;
      },
      callback: (res) {
        // Go to celebration and then Login screen
      },
    );
  }

  bool validateStrength(PasswordStrength strength) {
    return strength == PasswordStrength.good ||
        strength == PasswordStrength.strong;
  }

  void onPasswordStrengthChange(PasswordStrength strength) {
    passwordStrength.value = strength;
  }

  void goToLoginScreen() async {
    await navigationService.pushReplacementNamed(LoginScreen.name);
  }

  @override
  void dispose() {
    for (var e in focusNodes) {
      e.dispose();
    }
    passwordController.dispose();
    passwordStrength.dispose();
    super.dispose();
  }
}
