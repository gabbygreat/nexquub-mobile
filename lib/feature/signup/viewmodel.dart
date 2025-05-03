import 'package:nexquub/utils/utils.dart';

class AuthViewModel extends BaseViewModel {
  final service = locator<UserApiService>();
  late ValueNotifier<bool> isLoading;
  late final NavigationService navigationService;

  AuthViewModel({required super.context}) {
    isLoading = ValueNotifier(false);
    navigationService = locator<NavigationService>();
  }

  void otherLogin(SourceType type) async {
    isLoading.value = true;
    await service.otherLogin(source: type);
    isLoading.value = false;
  }

  void useAsGuest() async {
    await locator<ILocalStorage>().setUseAsGuest(true);
    navigationService.goNamed(HomeScreen.name);
  }

  void dispose() {
    isLoading.dispose();
  }
}

class BaseViewModel {
  final BuildContext context;

  BaseViewModel({required this.context});

  void proceedIfMounted<T>({
    required T? response,
    required void Function(T) callback,
    required void Function() resetCallback,
  }) {
    if (!context.mounted) return;
    resetCallback.call();
    if (response == null) return;
    callback.call(response);
  }
}

class SignupViewModel extends AuthViewModel {
  SignupViewModel({required super.context}) {
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
    focusNodes = List.generate(4, (_) => FocusNode());
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
  late List<FocusNode> focusNodes;

  void signUp() async {
    isLoading.value = true;
    final response = await service.signup(
      payload: SignupPayload(
        email: emailController.text,
        password: passwordController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
      ),
    );
    proceedIfMounted(
      response: response,
      resetCallback: () {
        isLoading.value = false;
      },
      callback: (res) async {
        await navigationService.pushNamed(
          VerifyOTPScreen.name,
          extra: res.data.toJson(),
        );
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
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordStrength.dispose();
    super.dispose();
  }
}
