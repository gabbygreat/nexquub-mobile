part of 'button.dart';

enum PakeButtonSize { small, medium, large, big }

class PakeButtonBuilder {
  PakeButtonBuilder._({required this.size});

  PakeButtonBuilder.defaultValue() : this._(size: PakeButtonSize.medium);
  final PakeButtonSize size;

  PakeButtonBuilder copyWith({PakeButtonSize? size}) {
    return PakeButtonBuilder._(size: size ?? this.size);
  }
}

class PakeButtonAppearanceBuilder {
  PakeButtonAppearanceBuilder(this.builder);
  final PakeButtonBuilder builder;

  BasePakeButton border({
    required String text,
    required void Function()? onPressed,
    Key? key,
    bool disabled = false,
    bool expand = true,
    Widget? icon,
    Widget? secondaryIcon,
    Color borderColor = const Color(0xFF003D98),
    PakeButtonPosition buttonPosition = PakeButtonPosition.left,
    EdgeInsets? buttonPadding,
    double? radius,
  }) {
    return BasePakeButton.border(
      key: key,
      size: builder.size,
      text: text,
      onPressed: onPressed,
      disabled: disabled,
      icon: icon,
      secondaryIcon: secondaryIcon,
      buttonPosition: buttonPosition,
      borderColor: borderColor,
      expand: expand,
      buttonPadding: buttonPadding,
      radius: radius,
    );
  }

  BasePakeButton filled({
    required String text,
    required void Function()? onPressed,
    Key? key,
    bool disabled = false,
    bool expand = true,
    Color fillColor = const Color(0xFF003D98),
    Widget? icon,
    Widget? secondaryIcon,
    PakeButtonPosition buttonPosition = PakeButtonPosition.left,
  }) {
    return BasePakeButton.filled(
      key: key,
      size: builder.size,
      text: text,
      onPressed: onPressed,
      disabled: disabled,
      fillColor: fillColor,
      icon: icon,
      secondaryIcon: secondaryIcon,
      buttonPosition: buttonPosition,
      expand: expand,
    );
  }

  BasePakeButton check({
    required void Function()? onPressed,
    required void Function({bool isChecked}) onCheckChanged,
    Key? key,
    bool disabled = false,
    String? text,
    Color? fillColor,
    bool hasBorder = true,
    bool expand = true,
    bool isFilled = false,
    bool isCheck = true,
    EdgeInsets? buttonPadding,
  }) {
    return BasePakeButton.check(
      key: key,
      size: builder.size,
      onPressed: onPressed,
      disabled: disabled,
      fillColor: fillColor,
      text: text,
      isFilled: isFilled,
      hasBorder: hasBorder,
      isCheck: isCheck,
      onCheckChanged: onCheckChanged,
      expand: expand,
      buttonPadding: buttonPadding,
    );
  }

  BasePakeButton icon({
    required Widget icon,
    required void Function()? onPressed,
    Key? key,
    bool disabled = false,
    bool expand = false,
    Color? fillColor,
    bool hasBorder = false,
    bool isFilled = true,
  }) {
    return BasePakeButton.icon(
      size: builder.size,
      onPressed: onPressed,
      hasBorder: hasBorder,
      isFilled: isFilled,
      icon: icon,
      disabled: disabled,
      fillColor: fillColor,
      expand: expand,
    );
  }

  BasePakeButton text({
    required String text,
    required void Function()? onPressed,
    Key? key,
    bool disabled = false,
    bool expand = false,
    TextStyle? textStyle,
  }) {
    return BasePakeButton.textButton(
      text: text,
      size: builder.size,
      onPressed: onPressed,
      disabled: disabled,
      expand: expand,
      textStyle: textStyle,
    );
  }
}
