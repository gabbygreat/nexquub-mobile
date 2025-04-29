import 'package:nexquub/utils/utils.dart';

class ConfirmPasswordFormValidation extends FormValidation {
  final TextEditingController controller;

  ConfirmPasswordFormValidation({
    required this.controller,
  });

  @override
  String? validate(BuildContext context, String value) {
    final l10n = context.l10n;
    if (!value.hasValue) {
      return l10n.pleaseEnterAPassword;
    } else if (controller.text != value) {
      return l10n.passwordMismatch;
    }
    return null;
  }

  @override
  bool validateText(BuildContext context, String text) {
    return validate(context, text) == null;
  }
}
