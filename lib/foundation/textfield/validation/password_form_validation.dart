import 'package:nexquub/utils/utils.dart';

class PasswordFormValidation extends FormValidation {
  @override
  String? validate(BuildContext context, String value) {
    final l10n = context.l10n;
    if (!value.hasValue) {
      return l10n.pleaseEnterAPassword;
    }
    return null;
  }

  @override
  bool validateText(BuildContext context, String text) {
    return validate(context, text) == null;
  }
}
