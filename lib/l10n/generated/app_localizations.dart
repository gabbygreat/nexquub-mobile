import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('ko'),
    Locale('nl'),
    Locale('pt')
  ];

  /// Project name
  ///
  /// In en, this message translates to:
  /// **'NexQuub'**
  String get nexquub;

  /// Message displayed when no projects are found.
  ///
  /// In en, this message translates to:
  /// **'Ooops.. you don\'t have any project yet'**
  String get ooopsYouDontHave;

  /// Option to use the system's default settings.
  ///
  /// In en, this message translates to:
  /// **'System default'**
  String get systemDefault;

  /// Label for language settings.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Option for English language.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Message displayed when an unexpected error occurs.
  ///
  /// In en, this message translates to:
  /// **'Oops! An unexpected error occurred.'**
  String get oopsUnexpectedError;

  /// Error details message displayed in debug mode.
  ///
  /// In en, this message translates to:
  /// **'Details: {errorDetails}'**
  String details(String errorDetails);

  /// Label for password creation fields.
  ///
  /// In en, this message translates to:
  /// **'Incomplete length of characters'**
  String get incompleteLength;

  /// Label for error
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// Label for internet
  ///
  /// In en, this message translates to:
  /// **'Check your internet connection and try again'**
  String get checkYourInternetConnection;

  /// Label for long request
  ///
  /// In en, this message translates to:
  /// **'Request took too long'**
  String get requestTookTooLong;

  /// Label for cancelled request
  ///
  /// In en, this message translates to:
  /// **'Request was cancelled'**
  String get requestWasCancelled;

  /// Label for unexpected request
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred'**
  String get anUnxepectedErrorOccurred;

  /// Email validation
  ///
  /// In en, this message translates to:
  /// **'Email address must be valid'**
  String get emailAddressMustBeValid;

  /// Password validation
  ///
  /// In en, this message translates to:
  /// **'Please, enter your password'**
  String get pleaseEnterAPassword;

  /// Button label to navigate back.
  ///
  /// In en, this message translates to:
  /// **'Go Back'**
  String get goBack;

  /// No description provided for @passwordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Password mismatch'**
  String get passwordMismatch;

  /// The name of the English language in English
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// The name of the German language in English
  ///
  /// In en, this message translates to:
  /// **'German'**
  String get languageGerman;

  /// The name of the Spanish language in English
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get languageSpanish;

  /// The name of the French language in English
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get languageFrench;

  /// The name of the Korean language in English
  ///
  /// In en, this message translates to:
  /// **'Korean'**
  String get languageKorean;

  /// The name of the Dutch language in English
  ///
  /// In en, this message translates to:
  /// **'Dutch'**
  String get languageDutch;

  /// The name of the Portuguese language in English
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get languagePortuguese;

  /// No description provided for @okay.
  ///
  /// In en, this message translates to:
  /// **'Okay'**
  String get okay;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @onlyCharactersLength.
  ///
  /// In en, this message translates to:
  /// **'Only {length} characters are required\''**
  String onlyCharactersLength(int length);

  /// No description provided for @title1.
  ///
  /// In en, this message translates to:
  /// **'Input Anything. Understand Everything'**
  String get title1;

  /// No description provided for @description1.
  ///
  /// In en, this message translates to:
  /// **'From voice, text, scanned text, files even to images, Nexquub’s AI decodes and summarizes your content at the speed of thought.'**
  String get description1;

  /// No description provided for @title2.
  ///
  /// In en, this message translates to:
  /// **'Summarize YouTube and Local Videos Instantly'**
  String get title2;

  /// No description provided for @description2.
  ///
  /// In en, this message translates to:
  /// **'Paste YouTube link or upload a video file—our system turns them into text, and gives you a clear, quick summary without watching the whole thing.'**
  String get description2;

  /// No description provided for @title3.
  ///
  /// In en, this message translates to:
  /// **'Your AI Powered Assistant'**
  String get title3;

  /// No description provided for @description3.
  ///
  /// In en, this message translates to:
  /// **'Chat with our smart AI to extract insights from PDFs, videos, images, and more. Ask questions, request summaries, and get key information instantly'**
  String get description3;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'es', 'fr', 'ko', 'nl', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'fr': return AppLocalizationsFr();
    case 'ko': return AppLocalizationsKo();
    case 'nl': return AppLocalizationsNl();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
