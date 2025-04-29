import 'package:nexquub/utils/utils.dart';

final GoRouter routes = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: OnboardingScreen.path,
  observers: [
    locator<AnalyticsService>().observer,
  ],
  routes: [
    GoRoute(
      path: OnboardingScreen.path,
      name: OnboardingScreen.name,
      builder: (context, state) {
        return const OnboardingScreen();
      },
    ),
  ],
);
