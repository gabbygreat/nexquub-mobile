// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get nexquub => 'NexQuub';

  @override
  String get ooopsYouDontHave => 'Ooops.. você ainda não tem nenhum projeto';

  @override
  String get systemDefault => 'Padrão do sistema';

  @override
  String get language => 'Idioma';

  @override
  String get english => 'Inglês';

  @override
  String get oopsUnexpectedError => 'Ops! Ocorreu um erro inesperado.';

  @override
  String details(String errorDetails) {
    return 'Detalhes: $errorDetails';
  }

  @override
  String get incompleteLength => 'Comprimento de caracteres incompleto';

  @override
  String get somethingWentWrong => 'Algo deu errado';

  @override
  String get checkYourInternetConnection => 'Verifique sua conexão com a internet e tente novamente';

  @override
  String get requestTookTooLong => 'A solicitação demorou muito';

  @override
  String get requestWasCancelled => 'A solicitação foi cancelada';

  @override
  String get anUnxepectedErrorOccurred => 'Ocorreu um erro inesperado';

  @override
  String get emailAddressMustBeValid => 'O endereço de e-mail deve ser válido';

  @override
  String get pleaseEnterAPassword => 'Por favor, insira sua senha';

  @override
  String get goBack => 'Voltar';

  @override
  String get passwordMismatch => 'As senhas não coincidem';

  @override
  String get languageEnglish => 'Inglês';

  @override
  String get languageGerman => 'Alemão';

  @override
  String get languageSpanish => 'Espanhol';

  @override
  String get languageFrench => 'Francês';

  @override
  String get languageKorean => 'Coreano';

  @override
  String get languageDutch => 'Holandês';

  @override
  String get languagePortuguese => 'Português';

  @override
  String get okay => 'Ok';

  @override
  String get cancel => 'Cancelar';

  @override
  String onlyCharactersLength(int length) {
    return 'Apenas $length caracteres são necessários';
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
