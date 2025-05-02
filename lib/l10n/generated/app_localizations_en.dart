// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get nexquub => 'NexQuub';

  @override
  String get ooopsYouDontHave => 'Ooops.. you don\'t have any project yet';

  @override
  String get systemDefault => 'System default';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get oopsUnexpectedError => 'Oops! An unexpected error occurred.';

  @override
  String details(String errorDetails) {
    return 'Details: $errorDetails';
  }

  @override
  String get incompleteLength => 'Incomplete length of characters';

  @override
  String get somethingWentWrong => 'Something went wrong';

  @override
  String get checkYourInternetConnection => 'Check your internet connection and try again';

  @override
  String get requestTookTooLong => 'Request took too long';

  @override
  String get requestWasCancelled => 'Request was cancelled';

  @override
  String get anUnxepectedErrorOccurred => 'An unexpected error occurred';

  @override
  String get emailAddressMustBeValid => 'Email address must be valid';

  @override
  String get pleaseEnterAPassword => 'Please, enter your password';

  @override
  String get goBack => 'Go Back';

  @override
  String get passwordMismatch => 'Password mismatch';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageGerman => 'German';

  @override
  String get languageSpanish => 'Spanish';

  @override
  String get languageFrench => 'French';

  @override
  String get languageKorean => 'Korean';

  @override
  String get languageDutch => 'Dutch';

  @override
  String get languagePortuguese => 'Portuguese';

  @override
  String get okay => 'Okay';

  @override
  String get cancel => 'Cancel';

  @override
  String onlyCharactersLength(int length) {
    return 'Only $length characters are required\'';
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
