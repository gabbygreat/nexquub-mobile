import 'package:nexquub/utils/utils.dart';

part 'button_widget.dart';

enum PakeButtonPosition { right, left, center, both }

abstract final class PakeButton {
  static BasePakeButton border({
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

  static BasePakeButton filled({
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

  static BasePakeButton check({
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

  static BasePakeButton icon({
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
      onPressed: onPressed,
      hasBorder: hasBorder,
      isFilled: isFilled,
      icon: icon,
      disabled: disabled,
      fillColor: fillColor,
      expand: expand,
    );
  }

  static BasePakeButton text({
    required String text,
    required void Function()? onPressed,
    bool disabled = false,
    TextStyle? style,
  }) => BasePakeButton.textButton(
    text: text,
    onPressed: onPressed,
    disabled: disabled,
    textStyle: style,
  );
}
