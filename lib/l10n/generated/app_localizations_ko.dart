// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get nexquub => 'NexQuub';

  @override
  String get ooopsYouDontHave => '이런.. 아직 프로젝트가 없습니다';

  @override
  String get systemDefault => '시스템 기본값';

  @override
  String get language => '언어';

  @override
  String get english => '영어';

  @override
  String get oopsUnexpectedError => '이런! 예기치 않은 오류가 발생했습니다.';

  @override
  String details(String errorDetails) {
    return '세부정보: $errorDetails';
  }

  @override
  String get incompleteLength => '문자 길이가 불완전합니다';

  @override
  String get somethingWentWrong => '문제가 발생했습니다';

  @override
  String get checkYourInternetConnection => '인터넷 연결을 확인하고 다시 시도하세요';

  @override
  String get requestTookTooLong => '요청 시간이 너무 오래 걸렸습니다';

  @override
  String get requestWasCancelled => '요청이 취소되었습니다';

  @override
  String get anUnxepectedErrorOccurred => '예기치 않은 오류가 발생했습니다';

  @override
  String get emailAddressMustBeValid => '유효한 이메일 주소를 입력하세요';

  @override
  String get pleaseEnterAPassword => '비밀번호를 입력하세요';

  @override
  String get goBack => '뒤로 가기';

  @override
  String get passwordMismatch => '비밀번호가 일치하지 않습니다';

  @override
  String get languageEnglish => '영어';

  @override
  String get languageGerman => '독일어';

  @override
  String get languageSpanish => '스페인어';

  @override
  String get languageFrench => '프랑스어';

  @override
  String get languageKorean => '한국어';

  @override
  String get languageDutch => '네덜란드어';

  @override
  String get languagePortuguese => '포르투갈어';

  @override
  String get okay => '확인';

  @override
  String get cancel => '취소';

  @override
  String onlyCharactersLength(int length) {
    return '문자는 $length자만 필요합니다';
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
