// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get nexquub => 'NexQuub';

  @override
  String get ooopsYouDontHave => 'Ooops.. aún no tienes ningún proyecto';

  @override
  String get systemDefault => 'Configuración predeterminada del sistema';

  @override
  String get language => 'Idioma';

  @override
  String get english => 'Inglés';

  @override
  String get oopsUnexpectedError => '¡Ups! Ocurrió un error inesperado.';

  @override
  String details(String errorDetails) {
    return 'Detalles: $errorDetails';
  }

  @override
  String get incompleteLength => 'Longitud de caracteres incompleta';

  @override
  String get somethingWentWrong => 'Algo salió mal';

  @override
  String get checkYourInternetConnection => 'Verifica tu conexión a internet e inténtalo de nuevo';

  @override
  String get requestTookTooLong => 'La solicitud tardó demasiado';

  @override
  String get requestWasCancelled => 'La solicitud fue cancelada';

  @override
  String get anUnxepectedErrorOccurred => 'Ocurrió un error inesperado';

  @override
  String get emailAddressMustBeValid => 'La dirección de correo electrónico debe ser válida';

  @override
  String get pleaseEnterAPassword => 'Por favor, ingresa tu contraseña';

  @override
  String get goBack => 'Regresar';

  @override
  String get passwordMismatch => 'Las contraseñas no coinciden';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get languageGerman => 'Alemán';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languageFrench => 'Francés';

  @override
  String get languageKorean => 'Coreano';

  @override
  String get languageDutch => 'Holandés';

  @override
  String get languagePortuguese => 'Portugués';

  @override
  String get okay => 'Aceptar';

  @override
  String get cancel => 'Cancelar';

  @override
  String onlyCharactersLength(int length) {
    return 'Solo se requieren $length caracteres';
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
