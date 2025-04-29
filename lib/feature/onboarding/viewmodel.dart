import 'package:nexquub/utils/utils.dart';
part 'model.dart';

class OnboardingViewModel {
  OnboardingViewModel() {
    pageController = PageController();
    pageIndex = ValueNotifier(0);
    _unsetFirstTime();
  }
  late PageController pageController;
  late List<OnboardingContent> content;
  late ValueNotifier<int> pageIndex;
  // final NavigationService _navigationService = locator<NavigationService>();
  ILocalStorage storage = locator<ILocalStorage>();

  void onPageChanged(int index) {
    pageIndex.value = index;
  }

  void animateForward() {
    final index = pageController.page!.toInt();
    if (index < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    } else {
      // _navigationService.goNamed(SignupScreen.name);
    }
  }

  void goToLoginScreen() {
    // _navigationService.goNamed(LoginScreen.name);
  }

  Future<void> _unsetFirstTime() async {
    await storage.unsetFirstTime();
  }

  void dispose() {
    pageController.dispose();
  }
}
