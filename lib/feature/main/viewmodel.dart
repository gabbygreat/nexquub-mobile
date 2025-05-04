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
    analytic.setUserIdentifier(user: user);
    crashlytic.setUserIdentifier(user: user);
  }

  void change(int index) {
    shell.goBranch(index);
  }

  void dispose() {}
}
