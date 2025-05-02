import 'package:nexquub/utils/utils.dart';

enum PakeTextInputSize {
  small(10),
  medium(18),
  big(56);

  const PakeTextInputSize(this.size);
  final double size;
}

class PakeTextInput extends StatefulWidget {
  const PakeTextInput({
    super.key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.isPinput = false,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.enabled,
    this.onTap,
    this.onTapOutside,
    this.prefixIcon,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.titleRight,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.autovalidateMode,
    this.hintStyle,
    this.style,
    this.fillColor,
    this.useDefaultContentPadding = false,
    this.inputBorder,
    this.inputFormatters,
    this.size = PakeTextInputSize.small,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
  });

  const PakeTextInput.size44({
    super.key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.autofocus = false,
    this.isPinput = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.enabled,
    this.onTap,
    this.onTapOutside,
    this.prefixIcon,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.titleRight,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.autovalidateMode,
    this.hintStyle,
    this.style,
    this.fillColor,
    this.useDefaultContentPadding = false,
    this.inputBorder,
    this.inputFormatters,
    this.size = PakeTextInputSize.medium,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
  });

  const PakeTextInput.size56({
    super.key,
    this.controller,
    this.isPinput = false,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.readOnly = false,
    this.autofocus = false,
    this.obscuringCharacter = '•',
    this.obscureText = false,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.enabled,
    this.onTap,
    this.onTapOutside,
    this.prefixIcon,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.titleRight,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
    this.autovalidateMode,
    this.hintStyle,
    this.style,
    this.fillColor,
    this.useDefaultContentPadding = false,
    this.inputBorder,
    this.inputFormatters,
    this.size = PakeTextInputSize.big,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final bool isPinput;
  final FloatingLabelBehavior floatingLabelBehavior;
  final bool autofocus;
  final String obscuringCharacter;
  final bool obscureText;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;
  final bool? enabled;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final Widget? suffixIcon;
  final Widget? titleRight;
  final FormValidation? validator;
  final TextCapitalization textCapitalization;
  final AutovalidateMode? autovalidateMode;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Color? fillColor;
  final bool useDefaultContentPadding;
  final InputBorder? inputBorder;
  final List<TextInputFormatter>? inputFormatters;
  final PakeTextInputSize size;

  @override
  State<PakeTextInput> createState() => _PakeTextInputState();
}

class _PakeTextInputState extends State<PakeTextInput> {
  String? _errorText;
  bool _hasUserTyped = false;
  late AppLocalizations l10n;
  final _debouncer = Debouncer();

  @override
  initState() {
    super.initState();
    widget.controller?.addListener(_errorListener);
  }

  @override
  dispose() {
    _debouncer.cancel();
    widget.controller?.removeListener(_errorListener);
    super.dispose();
  }

  void _errorListener() {
    if (_errorText != null) {
      _errorText = null;
      setState(() {});
    }
    assert(
      widget.controller != null && widget.validator != null,
      "Both controller and validator must be given",
    );
    _debouncer.run(() {
      if (!_hasUserTyped) {
        _errorText = null;
        setState(() {});
        return;
      }

      String text = widget.controller!.text;
      final validation = widget.validator?.validate(context, text);
      _errorText = validation;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final fieldSize = (widget.size.size) * 0.8;
    l10n = context.l10n;

    return TextFormField(
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      focusNode: widget.focusNode,
      textCapitalization: widget.textCapitalization,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      obscuringCharacter: '●',
      obscureText: widget.obscureText,
      enableSuggestions: widget.enableSuggestions,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands,
      onChanged: (text) {
        _hasUserTyped = true;
        widget.onChanged?.call(text);
      },
      onEditingComplete: widget.onEditingComplete,
      onTap: widget.onTap,
      onTapOutside: widget.onTapOutside,
      autovalidateMode: widget.autovalidateMode,
      onFieldSubmitted: widget.onSubmitted,
      enabled: widget.enabled,
      style: PakeTextStyle.caption.red100.of(context),
      cursorColor: PakeColors.red100,
      decoration: InputDecoration(
        errorText: _errorText,
        errorMaxLines: 2,
        floatingLabelBehavior: widget.floatingLabelBehavior,
        contentPadding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: fieldSize,
          bottom: fieldSize,
        ),
        hintStyle: PakeTextStyle.caption.red100.of(context),
        fillColor: widget.fillColor,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        labelText: widget.labelText,
        floatingLabelStyle: PakeTextStyle.bodyText14.red100.of(context),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: PakeColors.red100,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: PakeColors.red100,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.52,
            color: PakeColors.red100,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: PakeColors.red100,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: PakeColors.red100,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.2,
            color: PakeColors.red100,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
