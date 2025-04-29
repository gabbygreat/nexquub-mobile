import 'package:nexquub/utils/utils.dart';

extension TypoColor on TextStyle {
  TextStyle get underline {
    return copyWith(
      decoration: TextDecoration.underline,
      decorationColor: color,
    );
  }

  TextStyle get italics {
    return copyWith(
      fontStyle: FontStyle.italic,
    );
  }

  // Cool Gray Colors
  TextStyle get coolGray10 => copyWith(color: PakeColors.coolGray10);
  TextStyle get coolGray20 => copyWith(color: PakeColors.coolGray20);
  TextStyle get coolGray30 => copyWith(color: PakeColors.coolGray30);
  TextStyle get coolGray40 => copyWith(color: PakeColors.coolGray40);
  TextStyle get coolGray50 => copyWith(color: PakeColors.coolGray50);
  TextStyle get coolGray60 => copyWith(color: PakeColors.coolGray60);
  TextStyle get coolGray70 => copyWith(color: PakeColors.coolGray70);
  TextStyle get coolGray80 => copyWith(color: PakeColors.coolGray80);
  TextStyle get coolGray90 => copyWith(color: PakeColors.coolGray90);
  TextStyle get coolGray100 => copyWith(color: PakeColors.coolGray100);

  // Orange Colors
  TextStyle get orange10 => copyWith(color: PakeColors.orange10);
  TextStyle get orange20 => copyWith(color: PakeColors.orange20);
  TextStyle get orange30 => copyWith(color: PakeColors.orange30);
  TextStyle get orange40 => copyWith(color: PakeColors.orange40);
  TextStyle get orange50 => copyWith(color: PakeColors.orange50);
  TextStyle get orange60 => copyWith(color: PakeColors.orange60);
  TextStyle get orange70 => copyWith(color: PakeColors.orange70);
  TextStyle get orange80 => copyWith(color: PakeColors.orange80);
  TextStyle get orange90 => copyWith(color: PakeColors.orange90);
  TextStyle get orange100 => copyWith(color: PakeColors.orange100);

  // Blue Colors
  TextStyle get blue10 => copyWith(color: PakeColors.blue10);
  TextStyle get blue20 => copyWith(color: PakeColors.blue20);
  TextStyle get blue30 => copyWith(color: PakeColors.blue30);
  TextStyle get blue40 => copyWith(color: PakeColors.blue40);
  TextStyle get blue50 => copyWith(color: PakeColors.blue50);
  TextStyle get blue60 => copyWith(color: PakeColors.blue60);
  TextStyle get blue70 => copyWith(color: PakeColors.blue70);
  TextStyle get blue80 => copyWith(color: PakeColors.blue80);
  TextStyle get blue90 => copyWith(color: PakeColors.blue90);
  TextStyle get blue100 => copyWith(color: PakeColors.blue100);

  // Red Colors
  TextStyle get red10 => copyWith(color: PakeColors.red10);
  TextStyle get red20 => copyWith(color: PakeColors.red20);
  TextStyle get red30 => copyWith(color: PakeColors.red30);
  TextStyle get red40 => copyWith(color: PakeColors.red40);
  TextStyle get red50 => copyWith(color: PakeColors.red50);
  TextStyle get red60 => copyWith(color: PakeColors.red60);
  TextStyle get red70 => copyWith(color: PakeColors.red70);
  TextStyle get red80 => copyWith(color: PakeColors.red80);
  TextStyle get red90 => copyWith(color: PakeColors.red90);
  TextStyle get red100 => copyWith(color: PakeColors.red100);

  // Additional Colors
  TextStyle get whiteLinearForWhiteMode =>
      copyWith(color: PakeColors.whiteLinearForWhiteMode);
  TextStyle get darkBlue => copyWith(color: PakeColors.darkBlue);
  TextStyle get blurBackground => copyWith(color: PakeColors.blurbackground);
  TextStyle get pureWhite => copyWith(color: PakeColors.pureWhite);
  TextStyle get primary => copyWith(color: PakeColors.primary);

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
