part of 'button.dart';

class BasePakeButton extends StatefulWidget with _$PakeButtonStyle {
  const BasePakeButton({
    required this.onPressed,
    required this.hasBorder,
    required this.isFilled,
    required this.expand,
    super.key,
    this.size = PakeButtonSize.medium,
    this.text,
    this.radius,
    this.disabled = false,
    this.fillColor,
    this.icon,
    this.secondaryIcon,
    this.isCheck,
    this.borderColor,
    this.buttonPadding,
    this.buttonPosition,
    this.onCheckChanged,
    this.myTextStyle,
    this.isText = false,
  });

  const BasePakeButton.border({
    required String text,
    required void Function()? onPressed,
    required bool disabled,
    required PakeButtonPosition buttonPosition,
    Key? key,
    PakeButtonSize size = PakeButtonSize.medium,
    bool expand = false,
    Widget? icon,
    Widget? secondaryIcon,
    Color? borderColor,
    double? radius,
    EdgeInsets? buttonPadding,
  }) : this(
          key: key,
          size: size,
          text: text,
          onPressed: onPressed,
          disabled: disabled,
          hasBorder: true,
          isFilled: false,
          icon: icon,
          secondaryIcon: secondaryIcon,
          buttonPosition: buttonPosition,
          borderColor: borderColor,
          expand: expand,
          buttonPadding: buttonPadding,
          radius: radius,
        );

  const BasePakeButton.filled({
    required String text,
    required void Function()? onPressed,
    required bool disabled,
    required PakeButtonPosition buttonPosition,
    Key? key,
    PakeButtonSize size = PakeButtonSize.medium,
    bool expand = false,
    Color? fillColor,
    Widget? icon,
    Widget? secondaryIcon,
  }) : this(
          key: key,
          size: size,
          text: text,
          onPressed: onPressed,
          disabled: disabled,
          hasBorder: false,
          isFilled: true,
          fillColor: fillColor,
          icon: icon,
          secondaryIcon: secondaryIcon,
          buttonPosition: buttonPosition,
          expand: expand,
        );

  const BasePakeButton.check({
    required void Function()? onPressed,
    required bool disabled,
    required bool hasBorder,
    required bool isFilled,
    required bool isCheck,
    required void Function({bool isChecked}) onCheckChanged,
    Key? key,
    PakeButtonSize size = PakeButtonSize.medium,
    bool expand = false,
    Color? fillColor,
    String? text,
    EdgeInsets? buttonPadding,
  }) : this(
          key: key,
          size: size,
          onPressed: onPressed,
          disabled: disabled,
          hasBorder: hasBorder,
          isFilled: isFilled,
          text: text,
          fillColor: fillColor,
          buttonPosition: PakeButtonPosition.left,
          isCheck: isCheck,
          onCheckChanged: onCheckChanged,
          expand: expand,
          buttonPadding: buttonPadding,
        );

  const BasePakeButton.icon({
    required PakeButtonSize size,
    required void Function()? onPressed,
    required bool disabled,
    required Widget icon,
    Key? key,
    bool expand = false,
    Color? fillColor,
    bool hasBorder = false,
    bool isFilled = true,
    EdgeInsets? buttonPadding,
  }) : this(
          key: key,
          size: size,
          onPressed: onPressed,
          disabled: disabled,
          hasBorder: hasBorder,
          isFilled: isFilled,
          fillColor: fillColor,
          icon: icon,
          buttonPosition: PakeButtonPosition.left,
          expand: expand,
          buttonPadding: buttonPadding ??
              const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
        );

  const BasePakeButton.textButton({
    required PakeButtonSize size,
    required void Function()? onPressed,
    required bool disabled,
    required String text,
    Key? key,
    bool expand = false,
    TextStyle? textStyle,
  }) : this(
          key: key,
          size: size,
          onPressed: onPressed,
          disabled: disabled,
          hasBorder: false,
          isFilled: false,
          expand: expand,
          myTextStyle: textStyle,
          text: text,
          isText: true,
        );

  @override
  final PakeButtonSize size;
  final String? text;
  final void Function()? onPressed;
  final bool disabled;
  final bool hasBorder;
  final bool? isCheck;
  final bool isFilled;
  final bool expand;
  final Color? fillColor;
  final Color? borderColor;
  final Widget? icon;
  final Widget? secondaryIcon;
  final TextStyle? myTextStyle;
  final PakeButtonPosition? buttonPosition;
  final EdgeInsets? buttonPadding;
  final bool isText;
  final double? radius;
  final void Function({bool isChecked})? onCheckChanged;

  @override
  State<BasePakeButton> createState() => _BasePakeButtonState();
}

class _BasePakeButtonState extends State<BasePakeButton> {
  bool isChecked = false;
  late bool isFilled;
  late bool disabled;

  @override
  void initState() {
    super.initState();
    isFilled = widget.isFilled;
    if (widget.isCheck != null) {
      isChecked = widget.isCheck!;
    }
    disabled = widget.disabled;
  }

  Widget get iconWidget {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if ([PakeButtonPosition.right, PakeButtonPosition.both]
                .contains(widget.buttonPosition) &&
            widget.text != null)
          const SizedBox(
            width: 10,
          ),
        SizedBox(
          child: widget.icon,
        ),
        if ([PakeButtonPosition.left, PakeButtonPosition.both]
                .contains(widget.buttonPosition) &&
            widget.text != null)
          const SizedBox(
            width: 10,
          ),
      ],
    );
  }

  Widget get secondaryIconWidget {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if ([PakeButtonPosition.right, PakeButtonPosition.both]
            .contains(widget.buttonPosition))
          const SizedBox(
            width: 10,
          ),
        SizedBox(
          child: widget.secondaryIcon,
        ),
        if ([PakeButtonPosition.left, PakeButtonPosition.both]
            .contains(widget.buttonPosition))
          const SizedBox(
            width: 10,
          ),
      ],
    );
  }

  Widget textWidget(TextStyle textStyle) {
    if (widget.hasBorder &&
        !isFilled &&
        !disabled &&
        widget.borderColor == null) {
      return Text(
        widget.text!,
        style: textStyle,
        overflow: TextOverflow.ellipsis,
      );
    } else {
      return Text(
        widget.text!,
        style: textStyle,
        overflow: TextOverflow.ellipsis,
      );
    }
  }

  Widget checkIcon(Color? textColor) {
    if (widget.hasBorder && !isFilled && !disabled) {
      return AnimatedCrossFade(
        duration: const Duration(milliseconds: 200),
        crossFadeState: widget.isCheck ?? isChecked
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        firstChild: Icon(
          Icons.radio_button_checked,
          color: textColor,
        ),
        secondChild: Icon(
          Icons.radio_button_off,
          color: textColor,
        ),
      );
    } else {
      return AnimatedCrossFade(
        duration: const Duration(milliseconds: 200),
        crossFadeState: widget.isCheck ?? isChecked
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        firstChild: Icon(
          Icons.radio_button_checked,
          color: textColor,
        ),
        secondChild: Icon(
          Icons.radio_button_off,
          color: textColor,
        ),
      );
    }
  }

  void _toggleCheck() {
    isChecked = !isChecked;
    widget.onPressed?.call();
    widget.onCheckChanged?.call(isChecked: isChecked);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final radius = widget.radius ?? 8.0;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Color? textColor;
    var onTap = widget.onPressed;
    if (widget.onPressed == null) {
      disabled = true;
    } else {
      disabled = widget.disabled;
    }

    if (isDark && widget.borderColor == null) {
      isFilled = true;
    } else {
      isFilled = widget.isFilled;
    }
    if (isFilled) {
      textColor = PakeColors.coolGray10;
    }
    if (widget.hasBorder) {
      textColor = PakeColors.coolGray60;
    }

    if (disabled) {
      textColor = PakeColors.coolGray10;
    }
    if (disabled) {
      onTap = null;
    }
    if (widget.isCheck != null) {
      onTap = _toggleCheck;
    }

    final mainTextStyle = TextStyle(
      fontSize: widget.textStyle.fontSize,
      fontWeight: widget.textStyle.fontWeight,
      fontFamily: widget.textStyle.fontFamily,
      color: textColor,
    );

    return Builder(
      builder: (context) {
        var style = widget.myTextStyle ?? mainTextStyle;
        if (onTap == null) {
          style = style.copyWith(color: Colors.grey);
        }
        if (widget.isText) {
          return InkWell(
            onTap: onTap,
            overlayColor: WidgetStateColor.resolveWith(
              (_) => Colors.transparent,
            ),
            child: Text(
              widget.text!,
              style: style,
            ),
          );
        }
        return InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(radius),
          child: Container(
            padding: widget.buttonPadding ?? widget.padding,
            alignment: widget.expand ? Alignment.center : null,
            decoration: BoxDecoration(
              color: disabled
                  ? isDark
                      ? PakeColors.coolGray50
                      : PakeColors.coolGray20
                  : isFilled
                      ? widget.fillColor
                      : null,
              border: (widget.fillColor != null &&
                      !isFilled &&
                      !disabled &&
                      widget.hasBorder)
                  ? Border.all(
                      color: widget.fillColor!,
                    )
                  : (widget.borderColor != null && !disabled)
                      ? Border.all(
                          color: widget.borderColor!,
                        )
                      : null,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.isCheck != null) ...[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isChecked) ...[
                        checkIcon(textColor),
                      ] else ...[
                        checkIcon(textColor),
                      ],
                      if (widget.text != null)
                        const SizedBox(
                          width: 5,
                        ),
                    ],
                  ),
                ] else ...[
                  if (widget.icon != null &&
                      (widget.buttonPosition == PakeButtonPosition.left ||
                          widget.buttonPosition == PakeButtonPosition.both))
                    iconWidget,
                ],
                if (widget.text != null)
                  Flexible(
                    child: textWidget(mainTextStyle),
                  ),
                if (widget.icon != null &&
                    (widget.buttonPosition == PakeButtonPosition.right ||
                        widget.buttonPosition == PakeButtonPosition.both))
                  if (widget.secondaryIcon != null &&
                      widget.buttonPosition == PakeButtonPosition.both)
                    secondaryIconWidget
                  else
                    iconWidget,
              ],
            ),
          ),
        );
      },
    );
  }
}

mixin _$PakeButtonStyle on StatefulWidget {
  PakeButtonSize get size;

  EdgeInsets get padding {
    return switch (size) {
      PakeButtonSize.big => const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 18,
        ),
      PakeButtonSize.large => const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 14,
        ),
      PakeButtonSize.medium => const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
      PakeButtonSize.small => const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 3,
        ),
    };
  }

  TextStyle get textStyle {
    late TextStyle style;
    switch (size) {
      case PakeButtonSize.big:
      case PakeButtonSize.large:
      case PakeButtonSize.medium:
      case PakeButtonSize.small:
        style = PakeTextStyle.bodyText16;
    }
    return style;
  }
}
