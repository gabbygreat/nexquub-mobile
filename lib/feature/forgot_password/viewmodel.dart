import 'package:nexquub/utils/utils.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  ForgotPasswordViewModel({required super.context}) {
    emailController = TextEditingController();
    isLoading = ValueNotifier(false);
    navigationService = locator<NavigationService>();
    emailValidation = EmailFormValidation();
        focusNodes = List.generate(1, (_) => FocusNode());

  }

  late TextEditingController emailController;
  late EmailFormValidation emailValidation;
  late ValueNotifier<bool> isLoading;
  late UserApiService service = locator<UserApiService>();
  late NavigationService navigationService;
    late List<FocusNode> focusNodes;


  void forgotPassword() async {
    isLoading.value = true;
    final response = await service.forgotPassword(
      payload: EmailPayload(email: emailController.text),
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

  void dispose() {
    for (var e in focusNodes) {
      e.dispose();
    }
    emailController.dispose();
    isLoading.dispose();
  }
}
