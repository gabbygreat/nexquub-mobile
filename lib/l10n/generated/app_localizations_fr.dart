// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get nexquub => 'NexQuub';

  @override
  String get ooopsYouDontHave => 'Oups.. vous n\'avez encore aucun projet';

  @override
  String get systemDefault => 'Paramètres par défaut du système';

  @override
  String get language => 'Langue';

  @override
  String get english => 'Anglais';

  @override
  String get oopsUnexpectedError => 'Oups ! Une erreur inattendue s\'est produite.';

  @override
  String details(String errorDetails) {
    return 'Détails : $errorDetails';
  }

  @override
  String get incompleteLength => 'Longueur de caractères incomplète';

  @override
  String get somethingWentWrong => 'Quelque chose s\'est mal passé';

  @override
  String get checkYourInternetConnection => 'Vérifiez votre connexion Internet et réessayez';

  @override
  String get requestTookTooLong => 'La requête a pris trop de temps';

  @override
  String get requestWasCancelled => 'La requête a été annulée';

  @override
  String get anUnxepectedErrorOccurred => 'Une erreur inattendue s\'est produite';

  @override
  String get emailAddressMustBeValid => 'L\'adresse e-mail doit être valide';

  @override
  String get pleaseEnterAPassword => 'Veuillez entrer votre mot de passe';

  @override
  String get goBack => 'Retour';

  @override
  String get passwordMismatch => 'Les mots de passe ne correspondent pas';

  @override
  String get languageEnglish => 'Anglais';

  @override
  String get languageGerman => 'Allemand';

  @override
  String get languageSpanish => 'Espagnol';

  @override
  String get languageFrench => 'Français';

  @override
  String get languageKorean => 'Coréen';

  @override
  String get languageDutch => 'Néerlandais';

  @override
  String get languagePortuguese => 'Portugais';

  @override
  String get okay => 'D\'accord';

  @override
  String get cancel => 'Annuler';

  @override
  String onlyCharactersLength(int length) {
    return 'Seulement $length caractères sont requis';
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
