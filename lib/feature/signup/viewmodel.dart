import 'package:nexquub/utils/utils.dart';

class SignupViewModel {
  final BuildContext context;
  SignupViewModel({required this.context}) {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    isLoading = ValueNotifier(false);
    firstNameValidation = ContentFormValidation(
      message: 'Please, enter your first name',
    );
    lastNameValidation = ContentFormValidation(
      message: 'Please, enter your last name',
    );
    passwordValidation = ContentFormValidation(
      message: 'Please, enter a password',
    );
    emailValidation = EmailFormValidation();
    passwordStrength = ValueNotifier(PasswordStrength.none);
  }
  late TextEditingController firstNameController;
  late ContentFormValidation firstNameValidation;
  late TextEditingController lastNameController;
  late ContentFormValidation lastNameValidation;
  late TextEditingController emailController;
  late EmailFormValidation emailValidation;
  late ContentFormValidation passwordValidation;
  late TextEditingController passwordController;
  late ValueNotifier<PasswordStrength> passwordStrength;
  late ValueNotifier<bool> isLoading;
  final service = locator<UserApiService>();

  void signUp() async {
    isLoading.value = true;
    await service.signup(
      payload: SignupPayload(
        email: emailController.text,
        password: passwordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
      ),
    );
    isLoading.value = false;
  }

  bool validateStrength(PasswordStrength strength) {
    return strength == PasswordStrength.good ||
        strength == PasswordStrength.strong;
  }

  void onPasswordStrengthChange(PasswordStrength strength) {
    passwordStrength.value = strength;
  }

  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordStrength.dispose();
    isLoading.dispose();
  }
}
