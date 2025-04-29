import 'package:nexquub/utils/utils.dart';

class EmailFormValidation extends FormValidation {
  @override
  String? validate(BuildContext context, String value) {
    final l10n = context.l10n;
    if (!value.isValidEmail) {
      return l10n.emailAddressMustBeValid;
    }
    return null;
  }

  @override
  bool validateText(BuildContext context, String text) {
    return validate(context, text) == null;
  }
}
