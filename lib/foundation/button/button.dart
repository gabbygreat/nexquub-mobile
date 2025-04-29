import 'package:nexquub/utils/utils.dart';

part 'button_builder.dart';
part 'button_widget.dart';

enum PakeButtonPosition { right, left, center, both }

abstract final class PakeButton {
  static PakeButtonBuilder get _builder => PakeButtonBuilder.defaultValue();

  static PakeButtonAppearanceBuilder get secondaryButton44 =>
      PakeButtonAppearanceBuilder(
        _builder.copyWith(size: PakeButtonSize.large),
      );

  static BasePakeButton text({
    required String text,
    required void Function()? onPressed,
    PakeButtonSize size = PakeButtonSize.medium,
    bool disabled = false,
    TextStyle? style,
  }) =>
      BasePakeButton.textButton(
        text: text,
        size: size,
        onPressed: onPressed,
        disabled: disabled,
        textStyle: style,
      );
}
