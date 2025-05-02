import 'package:flutter/widgets.dart';

import 'generated/app_localizations.dart' show AppLocalizations;

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
