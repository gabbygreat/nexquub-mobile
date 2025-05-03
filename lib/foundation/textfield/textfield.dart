import 'package:nexquub/utils/utils.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';

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
    this.isPhone = false,
    this.expands = false,
    this.maxLength,
    this.autofillHints,
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
    this.titleText,
    this.fillColor,
    this.useDefaultContentPadding = false,
    this.inputBorder,
    this.inputFormatters,
    this.onCountryChanged,
  });

  const PakeTextInput.pin({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    FormValidation? validator,
  }) : this(
         key: key,
         isPinput: true,
         controller: controller,
         focusNode: focusNode,
         validator: validator,
       );

  const PakeTextInput.phone({
    Key? key,
    TextEditingController? controller,
    FocusNode? focusNode,
    FormValidation? validator,
    String? hintText,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    List<TextInputFormatter>? inputFormatters,
    void Function(Country)? onCountryChanged,
  }) : this(
         key: key,
         isPhone: true,
         controller: controller,
         focusNode: focusNode,
         validator: validator,
         hintText: hintText,
         keyboardType: keyboardType,
         textInputAction: textInputAction,
         inputFormatters: inputFormatters,
         onCountryChanged: onCountryChanged,
       );

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool readOnly;
  final bool isPinput;
  final bool isPhone;
  final bool autofocus;
  final String obscuringCharacter;
  final String? titleText;
  final bool obscureText;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final Iterable<String>? autofillHints;
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
  final void Function(Country)? onCountryChanged;

  @override
  State<PakeTextInput> createState() => _PakeTextInputState();
}

class _PakeTextInputState extends State<PakeTextInput> {
  String? _errorText;
  bool _hasUserTyped = false;
  late AppLocalizations l10n;
  final _debouncer = Debouncer();
  bool? _obscureText;

  @override
  initState() {
    super.initState();
    widget.controller?.addListener(_errorListener);
    if (widget.keyboardType == TextInputType.visiblePassword) {
      _obscureText = true;
    }
  }

  Widget get eyeIcon {
    return GestureDetector(
      onTap: _toggleObscureText,
      child: AdaptiveSvg(
        svg: switch (_obscureText) {
          true => Assets.vectors.eyeOpen,
          _ => Assets.vectors.eyeSlash,
        },
        fit: BoxFit.scaleDown,
      ),
    );
  }

  void _toggleObscureText() {
    if (_obscureText == null) return;
    _obscureText = !_obscureText!;
    setState(() {});
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
    double fieldSize = 15.0;
    l10n = context.l10n;
    bool isDark = context.isDark;

    InputDecoration decoration = InputDecoration(
      errorText: _errorText,
      errorMaxLines: 2,
      contentPadding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: fieldSize,
        bottom: fieldSize,
      ),
      hintStyle: 14.regular.neutralLight200.of(
        context,
        blackColor: PakeColors.neutralDark400,
      ),
      fillColor: PakeColors.neutralLight50.of(
        context,
        blackColor: PakeColors.primaryDark200,
      ),
      filled: true,
      prefixIcon: widget.prefixIcon,
      suffixIcon: _obscureText != null ? eyeIcon : widget.suffixIcon,
      hintText: widget.hintText,
      labelText: widget.labelText,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.spMin),
        borderSide:
            isDark
                ? BorderSide(color: PakeColors.neutralDark100, width: 0.5)
                : BorderSide(),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.spMin),
        borderSide: BorderSide(color: PakeColors.red500, width: 0.5),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.spMin),
        borderSide: BorderSide(color: PakeColors.red500, width: 0.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.spMin),
        borderSide: BorderSide(color: PakeColors.red500, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.spMin),
        borderSide: BorderSide(
          color:
              isDark ? PakeColors.primaryDark500 : PakeColors.primaryLight500,
          width: 2,
        ),
      ),
    );

    if (widget.isPinput) {
      return Pinput(
        length: 4,
        controller: widget.controller,
        focusNode: widget.focusNode,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        defaultPinTheme: PinTheme(
          height: 45.spMin,
          width: 45.spMin,
          decoration: BoxDecoration(
            color: PakeColors.neutralLight50.of(
              context,
              blackColor: PakeColors.primaryDark200,
            ),
            borderRadius: BorderRadius.circular(8.spMin),
            border:
                isDark
                    ? Border.all(color: PakeColors.neutralDark100, width: 0.5)
                    : null,
          ),
        ),
        focusedPinTheme: PinTheme(
          height: 45.spMin,
          width: 45.spMin,
          decoration: BoxDecoration(
            color: PakeColors.neutralLight50.of(
              context,
              blackColor: PakeColors.primaryDark200,
            ),
            borderRadius: BorderRadius.circular(8.spMin),
            border:
                isDark
                    ? Border.all(color: PakeColors.neutralDark100, width: 1.5)
                    : null,
          ),
        ),
        errorText: _errorText,
        errorPinTheme: PinTheme(
          height: 45.spMin,
          width: 45.spMin,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.spMin),
            border: Border.all(width: 0.5, color: PakeColors.red500),
          ),
        ),
      );
    }
    if (widget.isPhone) {
      return IntlPhoneField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        pickerDialogStyle: PickerDialogStyle(
          searchFieldInputDecoration: InputDecoration(
            hintText: 'Search Country',
          ),
        ),
        showDropdownIcon: false,
        onCountryChanged: widget.onCountryChanged,
        controller: widget.controller,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        readOnly: widget.readOnly,
        autofocus: widget.autofocus,
        obscureText: _obscureText ?? widget.obscureText,
        onChanged: (text) {
          _hasUserTyped = true;
          widget.onChanged?.call(text.completeNumber);
        },
        onTap: widget.onTap,
        autovalidateMode: widget.autovalidateMode,
        style: 14.medium.neutralLight600.of(context),
        cursorColor: PakeColors.neutralDark100,
        decoration: decoration,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.titleText != null) ...[
          Text(
            widget.titleText!,
            style: 14.medium.neutralLight800.of(
              context,
              blackColor: PakeColors.neutralDark700,
            ),
          ),
          8.sbH,
        ],
        TextFormField(
          inputFormatters: widget.inputFormatters,
          controller: widget.controller,
          focusNode: widget.focusNode,
          textCapitalization: widget.textCapitalization,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          readOnly: widget.readOnly,
          autofocus: widget.autofocus,
          obscureText: _obscureText ?? widget.obscureText,
          enableSuggestions: widget.enableSuggestions,
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          expands: widget.expands,
          autofillHints: widget.autofillHints,
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
          style: 14.medium.neutralLight600.of(context),
          cursorColor: PakeColors.neutralDark100,
          decoration: decoration,
        ),
      ],
    );
  }
}
