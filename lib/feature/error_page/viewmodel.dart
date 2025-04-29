import 'package:nexquub/utils/utils.dart';

class UserFacingErrorViewModel {
  void close() {
    final navigationService = locator<NavigationService>();
    if (navigationService.canPop()) {
      navigationService.pop();
      return;
    }
    // final authService = locator<AuthService>();
    // if (authService.isLoggedIn) {
    //   navigationService.goNamed(HomeScreen.name);
    // } else {
    //   navigationService.goNamed(LoginScreen.name);
    // }
  }
}
