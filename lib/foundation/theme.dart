import 'package:nexquub/utils/utils.dart';

class AppTheme {
  AppTheme._init();
  static final AppTheme instance = AppTheme._init();

  final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: false,
    scaffoldBackgroundColor: PakeColors.darkBlue,
    // fontFamily: FontFamily.mulish,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0,
    ),
  );

  final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: false,
    scaffoldBackgroundColor: const Color(0xFFF2F1F3),
    // fontFamily: FontFamily.mulish,
    appBarTheme: AppBarTheme(
      color: Color(0xFFF2F1F3),
      elevation: 0,
    ),
  );
}
