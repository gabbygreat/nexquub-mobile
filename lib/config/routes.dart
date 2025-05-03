import 'package:nexquub/utils/utils.dart';

final GoRouter routes = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: OnboardingScreen.path,
  observers: [locator<AnalyticsService>().observer],
  // redirect: (context, state) {
  //   final storage = locator<ILocalStorage>();
  //   if (state.matchedLocation == OnboardingScreen.path) {
  //     if (storage.getOpenedBefore()) {
  //       final authService = locator<AuthService>();
  //       if (authService.isLoggedIn) {
  //         return HomeScreen.path;
  //       } else if (storage.getUseAsGuest()) {
  //         return HomeScreen.path;
  //       }
  //       return LoginScreen.path;
  //     }
  //   }
  //   return null;
  // },
  routes: [
    GoRoute(
      path: OnboardingScreen.path,
      name: OnboardingScreen.name,
      builder: (context, state) {
        return OnboardingScreen(key: state.pageKey);
      },
    ),
    GoRoute(
      path: SignupScreen.path,
      name: SignupScreen.name,
      builder: (context, state) {
        return SignupScreen(key: state.pageKey);
      },
    ),
    GoRoute(
      path: LoginScreen.path,
      name: LoginScreen.name,
      builder: (context, state) {
        return LoginScreen(key: state.pageKey);
      },
      routes: [
        GoRoute(
          path: ForgotPasswordScreen.path,
          name: ForgotPasswordScreen.name,
          builder: (context, state) {
            return ForgotPasswordScreen(key: state.pageKey);
          },
        ),
      ],
    ),
    GoRoute(
      path: VerifyOTPScreen.path,
      name: VerifyOTPScreen.name,
      builder: (context, state) {
        final OTPExpiryResponse response = OTPExpiryResponse.fromJson(
          state.extra! as Map<String, dynamic>,
        );
        return VerifyOTPScreen(key: state.pageKey, response: response);
      },
    ),
    GoRoute(
      path: ResetPasswordScreen.path,
      name: ResetPasswordScreen.name,
      builder: (context, state) {
        final OTPExpiryResponse response = OTPExpiryResponse.fromJson(
          state.extra! as Map<String, dynamic>,
        );
        return ResetPasswordScreen(key: state.pageKey, response: response);
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(key: state.pageKey, shell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: HomeScreen.path,
              name: HomeScreen.name,
              builder: (context, state) {
                return HomeScreen(key: state.pageKey);
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: LibraryScreen.path,
              name: LibraryScreen.name,
              builder: (context, state) {
                return LibraryScreen(key: state.pageKey);
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ChatScreen.path,
              name: ChatScreen.name,
              builder: (context, state) {
                return ChatScreen(key: state.pageKey);
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: SettingsScreen.path,
              name: SettingsScreen.name,
              builder: (context, state) {
                return SettingsScreen(key: state.pageKey);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
