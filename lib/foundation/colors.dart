import 'package:nexquub/utils/utils.dart';

Map<Color, Color> match = {};

Map<LinearGradient, LinearGradient> matchGradient = {};

extension AdaptiveColor on Color {
  Color of(BuildContext context, {Color? blackColor}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (!match.containsKey(this) && blackColor == null) {
      return Colors.red;
    }
    assert(match[this] != null || blackColor != null,
        'There is no active match for $this');
    return isDark ? (blackColor ?? match[this]!) : this;
  }
}

extension AdaptiveGradient on LinearGradient {
  LinearGradient of(BuildContext context, {LinearGradient? blackGradient}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    assert(matchGradient[this] != null, 'There is no active match for $this');
    return isDark ? (blackGradient ?? matchGradient[this]!) : this;
  }
}

class PakeColors {
  PakeColors._();

  // -> Material Colors
  static const MaterialColor _neutralDark = MaterialColor(
    0xFF333440,
    <int, Color>{
      50: Color(0xFF333440),
      100: Color(0xFF434454),
      200: Color(0xFF57576D),
      300: Color(0xFF6F708B),
      400: Color(0xFF7A7B99),
      500: Color(0xFF9595AD),
      600: Color(0xFFC2C2D0),
      700: Color(0xFFD6D6DF),
      800: Color(0xFFE7E7E7),
    },
  );

  // Neutral Dark
  static Color get neutralDark50 => _neutralDark[50]!;
  static Color get neutralDark100 => _neutralDark[100]!;
  static Color get neutralDark200 => _neutralDark[200]!;
  static Color get neutralDark300 => _neutralDark[300]!;
  static Color get neutralDark400 => _neutralDark[400]!;
  static Color get neutralDark500 => _neutralDark[500]!;
  static Color get neutralDark600 => _neutralDark[600]!;
  static Color get neutralDark700 => _neutralDark[700]!;
  static Color get neutralDark800 => _neutralDark[800]!;

  static const MaterialColor _neutralLight = MaterialColor(
    0xFFF2F2F5,
    <int, Color>{
      50: Color(0xFFF2F2F5),
      100: Color(0xFFD6D6DF),
      200: Color(0xFFC2C2D0),
      300: Color(0xFF9595AD),
      400: Color(0xFF7A7B99),
      500: Color(0xFF6F708B),
      600: Color(0xFF57576D),
      700: Color(0xFF434454),
      800: Color(0xFF333440),
    },
  );

  // Neutral Light
  static Color get neutralLight50 => _neutralLight[50]!;
  static Color get neutralLight100 => _neutralLight[100]!;
  static Color get neutralLight200 => _neutralLight[200]!;
  static Color get neutralLight300 => _neutralLight[300]!;
  static Color get neutralLight400 => _neutralLight[400]!;
  static Color get neutralLight500 => _neutralLight[500]!;
  static Color get neutralLight600 => _neutralLight[600]!;
  static Color get neutralLight700 => _neutralLight[700]!;
  static Color get neutralLight800 => _neutralLight[800]!;

  static const MaterialColor _primaryDark = MaterialColor(
    0xFF00060F,
    <int, Color>{
      100: Color(0xFF00060F),
      200: Color(0xFF001636),
      300: Color(0xFF00255D),
      400: Color(0xFF002D71),
      500: Color(0xFF003D98),
      600: Color(0xFF5D9EFF),
      700: Color(0xFF98C1FF),
      800: Color(0xFFE6F0FF),
      900: Color(0xFFF1F7FF),
    },
  );

  // Primary Dark
  static Color get primaryDark100 => _primaryDark[100]!;
  static Color get primaryDark200 => _primaryDark[200]!;
  static Color get primaryDark300 => _primaryDark[300]!;
  static Color get primaryDark400 => _primaryDark[400]!;
  static Color get primaryDark500 => _primaryDark[500]!;
  static Color get primaryDark600 => _primaryDark[600]!;
  static Color get primaryDark700 => _primaryDark[700]!;
  static Color get primaryDark800 => _primaryDark[800]!;
  static Color get primaryDark900 => _primaryDark[900]!;

  static const MaterialColor _primaryLight = MaterialColor(
    0xFFF1F7FF,
    <int, Color>{
      100: Color(0xFFF1F7FF),
      200: Color(0xFFE6F0FF),
      300: Color(0xFF98C1FF),
      400: Color(0xFF5D9EFF),
      500: Color(0xFF003D98),
      600: Color(0xFF002D71),
      700: Color(0xFF00255D),
      800: Color(0xFF001636),
      900: Color(0xFF00060F),
    },
  );

  // Primary Light
  static Color get primaryLight100 => _primaryLight[100]!;
  static Color get primaryLight200 => _primaryLight[200]!;
  static Color get primaryLight300 => _primaryLight[300]!;
  static Color get primaryLight400 => _primaryLight[400]!;
  static Color get primaryLight500 => _primaryLight[500]!;
  static Color get primaryLight600 => _primaryLight[600]!;
  static Color get primaryLight700 => _primaryLight[700]!;
  static Color get primaryLight800 => _primaryLight[800]!;
  static Color get primaryLight900 => _primaryLight[900]!;

  static const MaterialColor _red = MaterialColor(
    0xFFF9EDED,
    <int, Color>{
      50: Color(0xFFF9EDED),
      100: Color(0xFFEEC6C6),
      200: Color(0xFFE5ABAB),
      400: Color(0xFFD26D6D),
      500: Color(0xFFD61D1D),
      900: Color(0xFF541E1E),
    },
  );

  // Red
  static Color get red50 => _red[50]!;
  static Color get red100 => _red[100]!;
  static Color get red200 => _red[200]!;
  static Color get red400 => _red[400]!;
  static Color get red500 => _red[500]!;
  static Color get red900 => _red[900]!;

  static const MaterialColor _green = MaterialColor(
    0xFFE8F9EA,
    <int, Color>{
      50: Color(0xFFE8F9EA),
      100: Color(0xFFB6ECBD),
      200: Color(0xFF93E39D),
      500: Color(0xFF14C229),
      600: Color(0xFF12B125),
      900: Color(0xFF085111),
    },
  );

  // Green
  static Color get green50 => _green[50]!;
  static Color get green100 => _green[100]!;
  static Color get green200 => _green[200]!;
  static Color get green500 => _green[500]!;
  static Color get green600 => _green[600]!;
  static Color get green900 => _green[900]!;

  static const MaterialColor _warning = MaterialColor(
    0xFFFBF7E7,
    <int, Color>{
      50: Color(0xFFFBF7E7),
      100: Color(0xFFF4E6B5),
      200: Color(0xFFEEDA91),
      300: Color(0xFFE7C95E),
      400: Color(0xFFE2BF3F),
      500: Color(0xFFDBAF0F),
      600: Color(0xFFDBAF0F),
      700: Color(0xFF9B7C0B),
      800: Color(0xFF786008),
      900: Color(0xFF5C4A06),
    },
  );

  // Warning
  static Color get warning50 => _warning[50]!;
  static Color get warning100 => _warning[100]!;
  static Color get warning200 => _warning[200]!;
  static Color get warning300 => _warning[300]!;
  static Color get warning400 => _warning[400]!;
  static Color get warning500 => _warning[500]!;
  static Color get warning600 => _warning[600]!;
  static Color get warning700 => _warning[700]!;
  static Color get warning800 => _warning[800]!;
  static Color get warning900 => _warning[900]!;

  ///////////// -> Fixed Colors
  static Color get bgLight => Color(0xFFFAFAFA);
  static Color get bnbBg => Color(0xFF030F21);

  /////////// -> Gradient Colors
  static const LinearGradient bgNight = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF001C43),
      Color(0xFF00060F),
    ],
    stops: [0, 1],
  );
  static const LinearGradient linear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF003D98),
      Color(0xFF9F159F),
    ],
    stops: [0, 1],
  );
}
