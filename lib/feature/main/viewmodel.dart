import 'package:nexquub/utils/utils.dart';

class MainViewModel {
  late StatefulNavigationShell shell;

  MainViewModel(StatefulNavigationShell navShell) {
    shell = navShell;

    _initiateUserServices();
  }

  _initiateUserServices() {
    final analytic = locator<AnalyticsService>();
    final crashlytic = locator<CrashlyticsService>();

    final user = locator<AuthService>().user;
    if (user == null) return;
    analytic.setUserIdentifier(
      // id: user.id,
      email: user.email,
      // fullname: user.fullname,
    );
    crashlytic.setUserIdentifier(
      // id: user.id,
      email: user.email,
      // fullname: user.fullname,
    );
  }

  void change(int index) {
    shell.goBranch(index);
  }

  void dispose() {}
}
