import 'package:nexquub/utils/utils.dart';

class NexQuubApp extends StatefulWidget {
  const NexQuubApp({super.key});

  @override
  State<NexQuubApp> createState() => _NexQuubAppState();
}

class _NexQuubAppState extends State<NexQuubApp> with WidgetsBindingObserver {
  final themeViewModel = locator<ThemeViewModel>();
  final languageViewModel = locator<LanguageViewModel>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    languageViewModel.locale.set(languageViewModel.syncLocale);
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        themeViewModel.isDarkMode.watch(context) ??
        MediaQuery.platformBrightnessOf(context) == Brightness.dark;
    final locale = languageViewModel.locale.watch(context);
    final hasLanguage = languageViewModel.hasLanguage;

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, _) {
        return MaterialApp.router(
          theme: AppTheme.instance.lightTheme,
          darkTheme: AppTheme.instance.darkTheme,
          locale: locale == null && !hasLanguage ? Locale('en') : locale,
          title: AppConstant.nexquub,
          scrollBehavior: MyBehavior(),
          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: routes,
        );
      },
    );
  }
}
