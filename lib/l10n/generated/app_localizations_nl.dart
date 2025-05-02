// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get nexquub => 'NexQuub';

  @override
  String get ooopsYouDontHave => 'Oeps.. je hebt nog geen project';

  @override
  String get systemDefault => 'Systeemstandaard';

  @override
  String get language => 'Taal';

  @override
  String get english => 'Engels';

  @override
  String get oopsUnexpectedError => 'Oeps! Er is een onverwachte fout opgetreden.';

  @override
  String details(String errorDetails) {
    return 'Details: $errorDetails';
  }

  @override
  String get incompleteLength => 'Onvolledige lengte van tekens';

  @override
  String get somethingWentWrong => 'Er is iets misgegaan';

  @override
  String get checkYourInternetConnection => 'Controleer je internetverbinding en probeer het opnieuw';

  @override
  String get requestTookTooLong => 'Het verzoek duurde te lang';

  @override
  String get requestWasCancelled => 'Het verzoek is geannuleerd';

  @override
  String get anUnxepectedErrorOccurred => 'Er is een onverwachte fout opgetreden';

  @override
  String get emailAddressMustBeValid => 'E-mailadres moet geldig zijn';

  @override
  String get pleaseEnterAPassword => 'Voer je wachtwoord in';

  @override
  String get goBack => 'Ga terug';

  @override
  String get passwordMismatch => 'Wachtwoorden komen niet overeen';

  @override
  String get languageEnglish => 'Engels';

  @override
  String get languageGerman => 'Duits';

  @override
  String get languageSpanish => 'Spaans';

  @override
  String get languageFrench => 'Frans';

  @override
  String get languageKorean => 'Koreaans';

  @override
  String get languageDutch => 'Nederlands';

  @override
  String get languagePortuguese => 'Portugees';

  @override
  String get okay => 'Oké';

  @override
  String get cancel => 'Annuleren';

  @override
  String onlyCharactersLength(int length) {
    return 'Alleen $length tekens zijn vereist';
  }

  @override
  String get title1 => 'Input Anything. Understand Everything';

  @override
  String get description1 => 'From voice, text, scanned text, files even to images, Nexquub’s AI decodes and summarizes your content at the speed of thought.';

  @override
  String get title2 => 'Summarize YouTube and Local Videos Instantly';

  @override
  String get description2 => 'Paste YouTube link or upload a video file—our system turns them into text, and gives you a clear, quick summary without watching the whole thing.';

  @override
  String get title3 => 'Your AI Powered Assistant';

  @override
  String get description3 => 'Chat with our smart AI to extract insights from PDFs, videos, images, and more. Ask questions, request summaries, and get key information instantly';
}
