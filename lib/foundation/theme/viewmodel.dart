import 'package:nexquub/utils/utils.dart';

class ThemeViewModel {
  ThemeViewModel() {
    storage = locator<ILocalStorage>();
    isDarkMode = signal(storage.isDarkMode());
  }

  late final ILocalStorage storage;
  late final Signal<bool?> isDarkMode;

  Future<void> toggleTheme({bool? isDark}) async {
    isDarkMode.value = isDark;
    await storage.setThemeMode(value: isDark);
  }
}
