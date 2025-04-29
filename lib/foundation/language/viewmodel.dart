import 'dart:io';

import 'package:nexquub/utils/utils.dart';

class LanguageViewModel {
  LanguageViewModel() {
    locale = signal(syncLocale);
  }
  late ILocalStorage iStorage;
  late Signal<Locale?> locale;
  bool hasLanguage = false;

  Locale? get syncLocale {
    iStorage = locator<ILocalStorage>();
    final storage = iStorage.getLocale();
    try {
      final deviceLocale = Platform.localeName;
      final defaultLocal = deviceLocale.split('_').first;
      if (AppLocalizations.supportedLocales
          .map((e) => e.languageCode)
          .contains(defaultLocal)) {
        hasLanguage = true;
      } else {
        hasLanguage = false;
      }
    } catch (_) {}
    if (storage == null) {
      return null;
    } else {
      return Locale(storage);
    }
  }

  Map<String?, String> localeMap(BuildContext context) {
    final l10n = context.l10n;
    return {
      null: l10n.systemDefault,
      'en': l10n.languageEnglish,
      'de': l10n.languageGerman,
      'es': l10n.languageSpanish,
      'fr': l10n.languageFrench,
      'ko': l10n.languageKorean,
      'nl': l10n.languageDutch,
      'pt': l10n.languagePortuguese,
    };
  }

  // Set Language localazation
  Future<void> setLocale(Locale? newLocale) async {
    syncLocale;
    locale.value = newLocale;
    await iStorage.setLocale(value: newLocale?.languageCode);
  }
}
