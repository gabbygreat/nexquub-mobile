import 'package:nexquub/utils/utils.dart';

Map<Color, Color> match = {
  PakeColors.coolGray90: PakeColors.coolGray10,
  PakeColors.coolGray40: PakeColors.coolGray10,
  //
  PakeColors.coolGray80: PakeColors.coolGray20,
  PakeColors.coolGray100: PakeColors.coolGray30,
  PakeColors.coolGray70: PakeColors.coolGray10,
  PakeColors.coolGray50: PakeColors.coolGray10,
  PakeColors.coolGray60: PakeColors.coolGray30,
  PakeColors.coolGray10: PakeColors.coolGray10,
  PakeColors.pureWhite: PakeColors.coolGray90,
};

Map<LinearGradient, LinearGradient> matchGradient = {
  PakeColors.linear: PakeColors.lightModeBackground,
  PakeColors.lightModeBackground: PakeColors.linear,
};

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
  // Primary Colors
  static const MaterialColor _coolGray = MaterialColor(
    0xFF4d6fff,
    <int, Color>{
      100: Color(0xFF121619),
      90: Color(0xFF21272A),
      80: Color(0xFF343A3F),
      70: Color(0xFF4D5358),
      60: Color(0xFF697077),
      50: Color(0xFF878D96),
      40: Color(0xFFA2A9B0),
      30: Color(0xFFC1C7CD),
      20: Color(0xFFDDE1E6),
      10: Color(0xFFF2F4F8),
    },
  );

  static Color get coolGray10 => _coolGray[10]!;
  static Color get coolGray20 => _coolGray[20]!;
  static Color get coolGray30 => _coolGray[30]!;
  static Color get coolGray40 => _coolGray[40]!;
  static Color get coolGray50 => _coolGray[50]!;
  static Color get coolGray60 => _coolGray[60]!;
  static Color get coolGray70 => _coolGray[70]!;
  static Color get coolGray80 => _coolGray[80]!;
  static Color get coolGray90 => _coolGray[90]!;
  static Color get coolGray100 => _coolGray[100]!;

  // Secondary Colors
  static const MaterialColor _orange = MaterialColor(
    0xFFff66b2,
    <int, Color>{
      100: Color(0xFF231000),
      90: Color(0xFF3E1A00),
      80: Color(0xFF5E2900),
      70: Color(0xFF8A3800),
      60: Color(0xFFBA4E00),
      50: Color(0xFFEB6200),
      40: Color(0xFFFF832B),
      30: Color(0xFFFFB784),
      20: Color(0xFFFFD9BE),
      10: Color(0xFFFFF2E8),
    },
  );

  static Color get orange10 => _orange[10]!;
  static Color get orange20 => _orange[20]!;
  static Color get orange30 => _orange[30]!;
  static Color get orange40 => _orange[40]!;
  static Color get orange50 => _orange[50]!;
  static Color get orange60 => _orange[60]!;
  static Color get orange70 => _orange[70]!;
  static Color get orange80 => _orange[80]!;
  static Color get orange90 => _orange[90]!;
  static Color get orange100 => _orange[100]!;

  // Tertiary Colors
  static const MaterialColor _blue = MaterialColor(
    0xFF9f9aeb,
    <int, Color>{
      100: Color(0xFF001141),
      90: Color(0xFF001A5F),
      80: Color(0xFF00288B),
      70: Color(0xFF0043CE),
      60: Color(0xFF0F62FE),
      50: Color(0xFF4589FF),
      40: Color(0xFF78A9FF),
      30: Color(0xFFA6C8FF),
      20: Color(0xFFD0E2FF),
      10: Color(0xFFEDF5FF),
    },
  );

  static Color get blue10 => _blue[10]!;
  static Color get blue20 => _blue[20]!;
  static Color get blue30 => _blue[30]!;
  static Color get blue40 => _blue[40]!;
  static Color get blue50 => _blue[50]!;
  static Color get blue60 => _blue[60]!;
  static Color get blue70 => _blue[70]!;
  static Color get blue80 => _blue[80]!;
  static Color get blue90 => _blue[90]!;
  static Color get blue100 => _blue[100]!;

  // Error Colors
  static const MaterialColor _red = MaterialColor(
    0xFFf8d0d0,
    <int, Color>{
      100: Color(0xFF2A0608),
      90: Color(0xFF520408),
      80: Color(0xFF750E13),
      70: Color(0xFFA2191F),
      60: Color(0xFFDA1E28),
      50: Color(0xFFFA4D56),
      40: Color(0xFFFF8389),
      30: Color(0xFFFFB3B8),
      20: Color(0xFFFFD7D9),
      10: Color(0xFFFFF1F1),
    },
  );

  static Color get red10 => _red[10]!;
  static Color get red20 => _red[20]!;
  static Color get red30 => _red[30]!;
  static Color get red40 => _red[40]!;
  static Color get red50 => _red[50]!;
  static Color get red60 => _red[60]!;
  static Color get red70 => _red[70]!;
  static Color get red80 => _red[80]!;
  static Color get red90 => _red[90]!;
  static Color get red100 => _red[100]!;

  static Color get whiteLinearForWhiteMode =>
      Color(0xFFCCCCCC).withValues(alpha: 0.7);
  static Color get darkBlue => Color(0xFF26314D);
  static Color get pureWhite => Color(0xFFFFFFFF);
  static Color get black => Colors.black;
  static Color get primary => Color(0xFF4169E1);
  static Color get blurbackground => Color(0xFF1E1E1E).withValues(alpha: 0.65);

  // Linear
  static const LinearGradient darkModeBackground = LinearGradient(
    colors: [
      Color(0xFF001141),
      Color(0xFF121619),
      Color(0xFF121619),
    ],
    stops: [0, 0.68, 0.8],
  );
  static const LinearGradient lightModeBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFFFFFFF),
      Color(0xFFE0E0E0),
    ],
    stops: [0, 1],
  );
  static const LinearGradient linear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF001141),
      Color(0xFF121619),
      Color(0xFF121619),
    ],
    stops: [0, 0.68, 0.8],
  );
  static const LinearGradient whiteLinear = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFF4F4F4),
      Color(0xFFFFFFFF),
    ],
    stops: [0, 1],
  );
}
