// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get nexquub => 'NexQuub';

  @override
  String get ooopsYouDontHave => 'Ooops.. Sie haben noch kein Projekt';

  @override
  String get systemDefault => 'Systemstandard';

  @override
  String get language => 'Sprache';

  @override
  String get english => 'Englisch';

  @override
  String get oopsUnexpectedError => 'Oops! Ein unerwarteter Fehler ist aufgetreten.';

  @override
  String details(String errorDetails) {
    return 'Details: $errorDetails';
  }

  @override
  String get incompleteLength => 'Unvollständige Zeichenlänge';

  @override
  String get somethingWentWrong => 'Etwas ist schief gelaufen';

  @override
  String get checkYourInternetConnection => 'Überprüfen Sie Ihre Internetverbindung und versuchen Sie es erneut';

  @override
  String get requestTookTooLong => 'Die Anfrage hat zu lange gedauert';

  @override
  String get requestWasCancelled => 'Die Anfrage wurde abgebrochen';

  @override
  String get anUnxepectedErrorOccurred => 'Ein unerwarteter Fehler ist aufgetreten';

  @override
  String get emailAddressMustBeValid => 'Die E-Mail-Adresse muss gültig sein';

  @override
  String get pleaseEnterAPassword => 'Bitte geben Sie Ihr Passwort ein';

  @override
  String get goBack => 'Zurück';

  @override
  String get passwordMismatch => 'Passwort stimmt nicht überein';

  @override
  String get languageEnglish => 'Englisch';

  @override
  String get languageGerman => 'Deutsch';

  @override
  String get languageSpanish => 'Spanisch';

  @override
  String get languageFrench => 'Französisch';

  @override
  String get languageKorean => 'Koreanisch';

  @override
  String get languageDutch => 'Niederländisch';

  @override
  String get languagePortuguese => 'Portugiesisch';

  @override
  String get okay => 'Okay';

  @override
  String get cancel => 'Abbrechen';

  @override
  String onlyCharactersLength(int length) {
    return 'Nur $length Zeichen sind erforderlich';
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
