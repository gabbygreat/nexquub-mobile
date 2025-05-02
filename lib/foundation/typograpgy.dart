import 'package:nexquub/utils/utils.dart';

extension StyleExt on int {
  TextStyle get regular {
    return TextStyle(fontSize: spMin, fontWeight: FontWeight.w400);
  }

  TextStyle get medium {
    return TextStyle(fontSize: spMin, fontWeight: FontWeight.w500);
  }

  TextStyle get semiBold {
    return TextStyle(fontSize: spMin, fontWeight: FontWeight.w600);
  }

  TextStyle get bold {
    return TextStyle(fontSize: spMin, fontWeight: FontWeight.w700);
  }

  TextStyle get extraBold {
    return TextStyle(fontSize: spMin, fontWeight: FontWeight.w800);
  }
}

extension TypoColor on TextStyle {
  TextStyle get underline {
    return copyWith(
      decoration: TextDecoration.underline,
      decorationColor: color,
    );
  }

  TextStyle get italics {
    return copyWith(fontStyle: FontStyle.italic);
  }

  TextStyle get plusJakartaSans {
    return copyWith(fontFamily: FontFamily.plusJakartaSans);
  }

  TextStyle get apfelGrotezk {
    return copyWith(fontFamily: FontFamily.apfelGrotezk);
  }

  // Neutral Dark
  TextStyle get neutralDark50 => copyWith(color: PakeColors.neutralDark50);
  TextStyle get neutralDark100 => copyWith(color: PakeColors.neutralDark100);
  TextStyle get neutralDark200 => copyWith(color: PakeColors.neutralDark200);
  TextStyle get neutralDark300 => copyWith(color: PakeColors.neutralDark300);
  TextStyle get neutralDark400 => copyWith(color: PakeColors.neutralDark400);
  TextStyle get neutralDark500 => copyWith(color: PakeColors.neutralDark500);
  TextStyle get neutralDark600 => copyWith(color: PakeColors.neutralDark600);
  TextStyle get neutralDark700 => copyWith(color: PakeColors.neutralDark700);
  TextStyle get neutralDark800 => copyWith(color: PakeColors.neutralDark800);

  // Neutral Light
  TextStyle get neutralLight50 => copyWith(color: PakeColors.neutralLight50);
  TextStyle get neutralLight100 => copyWith(color: PakeColors.neutralLight100);
  TextStyle get neutralLight200 => copyWith(color: PakeColors.neutralLight200);
  TextStyle get neutralLight300 => copyWith(color: PakeColors.neutralLight300);
  TextStyle get neutralLight400 => copyWith(color: PakeColors.neutralLight400);
  TextStyle get neutralLight500 => copyWith(color: PakeColors.neutralLight500);
  TextStyle get neutralLight600 => copyWith(color: PakeColors.neutralLight600);
  TextStyle get neutralLight700 => copyWith(color: PakeColors.neutralLight700);
  TextStyle get neutralLight800 => copyWith(color: PakeColors.neutralLight800);

  // Primary Dark
  TextStyle get primaryDark100 => copyWith(color: PakeColors.primaryDark100);
  TextStyle get primaryDark200 => copyWith(color: PakeColors.primaryDark200);
  TextStyle get primaryDark300 => copyWith(color: PakeColors.primaryDark300);
  TextStyle get primaryDark400 => copyWith(color: PakeColors.primaryDark400);
  TextStyle get primaryDark500 => copyWith(color: PakeColors.primaryDark500);
  TextStyle get primaryDark600 => copyWith(color: PakeColors.primaryDark600);
  TextStyle get primaryDark700 => copyWith(color: PakeColors.primaryDark700);
  TextStyle get primaryDark800 => copyWith(color: PakeColors.primaryDark800);
  TextStyle get primaryDark900 => copyWith(color: PakeColors.primaryDark900);

  // Primary Light
  TextStyle get primaryLight100 => copyWith(color: PakeColors.primaryLight100);
  TextStyle get primaryLight200 => copyWith(color: PakeColors.primaryLight200);
  TextStyle get primaryLight300 => copyWith(color: PakeColors.primaryLight300);
  TextStyle get primaryLight400 => copyWith(color: PakeColors.primaryLight400);
  TextStyle get primaryLight500 => copyWith(color: PakeColors.primaryLight500);
  TextStyle get primaryLight600 => copyWith(color: PakeColors.primaryLight600);
  TextStyle get primaryLight700 => copyWith(color: PakeColors.primaryLight700);
  TextStyle get primaryLight800 => copyWith(color: PakeColors.primaryLight800);
  TextStyle get primaryLight900 => copyWith(color: PakeColors.primaryLight900);

  // Red
  TextStyle get red50 => copyWith(color: PakeColors.red50);
  TextStyle get red100 => copyWith(color: PakeColors.red100);
  TextStyle get red200 => copyWith(color: PakeColors.red200);
  TextStyle get red400 => copyWith(color: PakeColors.red400);
  TextStyle get red500 => copyWith(color: PakeColors.red500);
  TextStyle get red900 => copyWith(color: PakeColors.red900);

  // Green
  TextStyle get green50 => copyWith(color: PakeColors.green50);
  TextStyle get green100 => copyWith(color: PakeColors.green100);
  TextStyle get green200 => copyWith(color: PakeColors.green200);
  TextStyle get green500 => copyWith(color: PakeColors.green500);
  TextStyle get green600 => copyWith(color: PakeColors.green600);
  TextStyle get green900 => copyWith(color: PakeColors.green900);

  // Warning
  TextStyle get warning50 => copyWith(color: PakeColors.warning50);
  TextStyle get warning100 => copyWith(color: PakeColors.warning100);
  TextStyle get warning200 => copyWith(color: PakeColors.warning200);
  TextStyle get warning300 => copyWith(color: PakeColors.warning300);
  TextStyle get warning400 => copyWith(color: PakeColors.warning400);
  TextStyle get warning500 => copyWith(color: PakeColors.warning500);
  TextStyle get warning600 => copyWith(color: PakeColors.warning600);
  TextStyle get warning700 => copyWith(color: PakeColors.warning700);
  TextStyle get warning800 => copyWith(color: PakeColors.warning800);
  TextStyle get warning900 => copyWith(color: PakeColors.warning900);

  // Fixed
  TextStyle get bgLight => copyWith(color: PakeColors.bgLight);
  TextStyle get bnbBg => copyWith(color: PakeColors.bnbBg);

  TextStyle of(BuildContext context, {Color? blackColor}) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    assert(color != null, 'You must include a color');
    if (!match.containsKey(color)) {
      return copyWith(color: Colors.red);
    }
    assert(match[color] != null, 'No matching color');
    return copyWith(color: isDark ? blackColor ?? match[color]! : color);
  }
}

class PakeTextStyle {
  static TextStyle get titleH1Bold {
    final size = 40;
    return TextStyle(
      fontSize: size.spMin,
      fontWeight: FontWeight.w700,
      // fontFamily: // fontFamily.mulish,
    );
  }

  static TextStyle get titleH2Medium {
    final size = 28;
    return TextStyle(
      fontSize: size.spMin,
      fontWeight: FontWeight.w600,
      // fontFamily: // fontFamily.mulish,
    );
  }

  static TextStyle get titleH4Medium {
    final size = 20;
    return TextStyle(
      fontSize: size.spMin,
      fontWeight: FontWeight.w500,
      // fontFamily: // fontFamily.mulish,
    );
  }

  static TextStyle get titleH3Bold {
    final size = 24;
    return TextStyle(
      fontSize: size.spMin,
      fontWeight: FontWeight.w700,
      // fontFamily: // fontFamily.mulish,
    );
  }

  static TextStyle get titleH24Medium {
    final size = 20;
    return TextStyle(
      fontSize: size.spMin,
      fontWeight: FontWeight.w500,
      // fontFamily: // fontFamily.mulish,
    );
  }

  static TextStyle get bodyText16 {
    final size = 16;
    return TextStyle(
      fontSize: size.spMin,
      fontWeight: FontWeight.w600,
      // fontFamily: // fontFamily.mulish,
    );
  }

  static TextStyle get bodyText14 {
    final size = 14;
    return TextStyle(
      fontSize: size.spMin,
      fontWeight: FontWeight.w400,
      // fontFamily: // fontFamily.mulish,
    );
  }

  static TextStyle get bodyText14Semibold {
    final size = 14;
    return TextStyle(
      fontSize: size.spMin,
      fontWeight: FontWeight.w700,
      // fontFamily: // fontFamily.mulish,
    );
  }

  static TextStyle get semibold10 {
    final size = 10;
    return TextStyle(
      fontSize: size.spMin,
      fontWeight: FontWeight.w700,
      // fontFamily: // fontFamily.mulish,
    );
  }

  static TextStyle get bodyText12 {
    final size = 12;
    return TextStyle(
      fontSize: size.spMin,
      fontWeight: FontWeight.w400,
      // fontFamily: // fontFamily.mulish,
    );
  }

  static TextStyle get bodyText8 {
    final size = 10;
    return TextStyle(
      fontSize: size.spMin,
      fontWeight: FontWeight.w400,
      // fontFamily: // fontFamily.mulish,
    );
  }

  static TextStyle get caption {
    final size = 14;
    return TextStyle(
      fontSize: size.spMin,
      fontWeight: FontWeight.w400,
      // fontFamily: // fontFamily.mulish,
    );
  }
}
