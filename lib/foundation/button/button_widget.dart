part of 'button.dart';

class BasePakeButton extends StatefulWidget {
  const BasePakeButton({
    required this.onPressed,
    required this.hasBorder,
    required this.isFilled,
    required this.expand,
    super.key,
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
    bool expand = false,
    Widget? icon,
    Widget? secondaryIcon,
    Color? borderColor,
    double? radius,
    EdgeInsets? buttonPadding,
  }) : this(
         key: key,
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
    bool expand = false,
    Color? fillColor,
    Widget? icon,
    Widget? secondaryIcon,
  }) : this(
         key: key,
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
    bool expand = false,
    Color? fillColor,
    String? text,
    EdgeInsets? buttonPadding,
  }) : this(
         key: key,
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
         onPressed: onPressed,
         disabled: disabled,
         hasBorder: hasBorder,
         isFilled: isFilled,
         fillColor: fillColor,
         icon: icon,
         buttonPosition: PakeButtonPosition.left,
         expand: expand,
         buttonPadding:
             buttonPadding ??
             const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
       );

  const BasePakeButton.textButton({
    required void Function()? onPressed,
    required bool disabled,
    required String text,
    Key? key,
    bool expand = false,
    TextStyle? textStyle,
  }) : this(
         key: key,
         onPressed: onPressed,
         disabled: disabled,
         hasBorder: false,
         isFilled: false,
         expand: expand,
         myTextStyle: textStyle,
         text: text,
         isText: true,
       );

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
  late bool isChecked;
  late bool isFilled;
  late bool isDisabled;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isCheck ?? false;
  }

  void _toggleCheck() {
    setState(() => isChecked = !isChecked);
    widget.onPressed?.call();
    widget.onCheckChanged?.call(isChecked: isChecked);
  }

  TextStyle get _textStyle {
    final baseColor = _textColor;
    return widget.myTextStyle ??
        TextStyle(
          fontSize: 14.spMin,
          fontWeight: FontWeight.w500,
          fontFamily: FontFamily.plusJakartaSans,
          color: isDisabled ? Colors.grey : baseColor,
        );
  }

  Color? get _textColor {
    if (isDisabled) return PakeColors.neutralLight300.of(context);
    if (widget.hasBorder) {
      return widget.borderColor;
    }
    if (isFilled) return PakeColors.white;
    return PakeColors.primaryDark100;
  }

  bool get isDark => Theme.of(context).brightness == Brightness.dark;

  bool get isCheckable => widget.isCheck != null;

  bool get hasText => widget.text != null;

  bool get hasIcon => widget.icon != null;

  bool get hasSecondaryIcon =>
      widget.secondaryIcon != null &&
      widget.buttonPosition == PakeButtonPosition.both;

  void Function()? get _onTap =>
      isCheckable ? _toggleCheck : (isDisabled ? null : widget.onPressed);

  @override
  Widget build(BuildContext context) {
    isFilled = isDark && widget.borderColor == null ? true : widget.isFilled;
    isDisabled = widget.onPressed == null || widget.disabled;

    if (widget.isText) {
      return InkWell(
        onTap: _onTap,
        overlayColor: WidgetStateColor.resolveWith((_) => Colors.transparent),
        child: Text(widget.text ?? '', style: _textStyle),
      );
    }

    return InkWell(
      onTap: _onTap,
      borderRadius: BorderRadius.circular(widget.radius ?? 8.spMin),
      child: Container(
        padding:
            widget.buttonPadding ?? EdgeInsets.symmetric(vertical: 13.spMin),
        alignment: widget.expand ? Alignment.center : null,
        decoration: BoxDecoration(
          color: _backgroundColor(context),
          border: _buildBorder(),
          borderRadius: BorderRadius.circular(widget.radius ?? 8.spMin),
        ),
        child: buildButtonChild(),
      ),
    );
  }

  Color? _backgroundColor(BuildContext context) {
    if (isDisabled) return PakeColors.neutralLight100.of(context);
    return isFilled ? widget.fillColor : null;
  }

  Border? _buildBorder() {
    if (isDisabled || !widget.hasBorder) return null;

    final color = widget.borderColor ?? widget.fillColor;
    return color != null ? Border.all(color: color) : null;
  }

  Widget buildButtonChild() {
    List<Widget> children = [];

    if (isCheckable) {
      children.add(_checkIcon());
      if (hasText) children.add(const SizedBox(width: 5));
    } else {
      if (hasIcon &&
          (widget.buttonPosition == PakeButtonPosition.left ||
              widget.buttonPosition == PakeButtonPosition.both)) {
        children.add(_iconWithSpacing(widget.icon!));
      }
    }

    if (hasText) {
      children.add(
        Flexible(
          child: Text(
            widget.text!,
            style: _textStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }

    if (hasSecondaryIcon) {
      children.add(_iconWithSpacing(widget.secondaryIcon!));
    } else if (hasIcon &&
        (widget.buttonPosition == PakeButtonPosition.right ||
            widget.buttonPosition == PakeButtonPosition.both)) {
      children.add(_iconWithSpacing(widget.icon!));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: children,
    );
  }

  Widget _iconWithSpacing(Widget icon) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [const SizedBox(width: 10), icon, const SizedBox(width: 10)],
    );
  }

  Widget _checkIcon() {
    final icon =
        isChecked ? Icons.radio_button_checked : Icons.radio_button_off;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: Icon(icon, key: ValueKey(isChecked), color: _textColor),
    );
  }
}
