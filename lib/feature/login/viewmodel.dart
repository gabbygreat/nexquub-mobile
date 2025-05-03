import 'package:nexquub/utils/utils.dart';

class LoginViewModel extends AuthViewModel {
  LoginViewModel({required super.context}) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    isLoading = ValueNotifier(false);

    passwordValidation = ContentFormValidation(
      message: 'Please, enter a password',
    );
    emailValidation = EmailFormValidation();
    focusNodes = List.generate(2, (_) => FocusNode());
  }

  late TextEditingController emailController;
  late EmailFormValidation emailValidation;
  late ContentFormValidation passwordValidation;
  late TextEditingController passwordController;
  late List<FocusNode> focusNodes;

  void login() async {
    isLoading.value = true;
    final response = await service.login(
      payload: SigninPayload(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    proceedIfMounted(
      response: response,
      resetCallback: () {
        isLoading.value = false;
      },
      callback: (res) {
        navigationService.goNamed(HomeScreen.name);
      },
    );
  }

  void goToSignupScreen() async {
    await navigationService.pushReplacementNamed(SignupScreen.name);
  }

  void goToForgotPassword() async {
    await navigationService.pushReplacementNamed(ForgotPasswordScreen.name);
  }

  @override
  void dispose() {
    for (var e in focusNodes) {
      e.dispose();
    }
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
