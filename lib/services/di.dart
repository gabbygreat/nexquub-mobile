import 'package:get_it/get_it.dart';
import 'package:nexquub/utils/utils.dart';

final locator = GetIt.instance;

Future<void> setupDeps() async {
  locator
        ..registerSingleton<ContentPickerService>(FilePickerServiceImpl())
        ..registerSingleton<CrashlyticsService>(
          FirebaseCrashlyticsService(),
        )
        ..registerSingleton<AnalyticsService>(
          FirebaseAnalyticsImpl(),
        )
        ..registerSingletonAsync<ILocalStorage>(() async {
          final storage = LocalStorage();
          await storage.initialise();
          return storage;
        })
        ..registerSingletonAsync<AuthService>(
          () async {
            final auth = AuthServiceImpl();
            await auth.initialise();
            return auth;
          },
          dependsOn: [ILocalStorage],
        )
        // Register async dependencies
        ..registerSingletonAsync<Dio>(
          () async => AppDio.getInstance(),
          dependsOn: [ILocalStorage],
        )
        // Register Theme dependancy
        ..registerSingletonWithDependencies<ThemeViewModel>(
          ThemeViewModel.new,
          dependsOn: [ILocalStorage],
        )
        // Register Theme dependancy
        ..registerSingleton<NavigationService>(GoRouterNavigationService())
        // Register Locale
        ..registerSingletonWithDependencies<LanguageViewModel>(
          LanguageViewModel.new,
          dependsOn: [ILocalStorage],
        )
      // API SERVICE
      // ..registerSingletonAsync<UserApiService>(
      //   () async => DefaultUserApiService(UserApiClient(locator<Dio>())),
      //   dependsOn: [Dio],
      // )
      ;
  // END API SERVICE
  await locator.allReady();
}
