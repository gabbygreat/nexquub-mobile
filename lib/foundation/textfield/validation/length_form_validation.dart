import 'package:nexquub/utils/utils.dart';

class LengthFormValidation extends FormValidation {
  final int length;

  LengthFormValidation({
    required this.length,
  });
  @override
  String? validate(BuildContext context, String value) {
    final l10n = context.l10n;
    if (value.length < length) {
      return l10n.incompleteLength;
    } else if (value.length > length) {
      return l10n.onlyCharactersLength(length);
    }
    return null;
  }

  @override
  bool validateText(BuildContext context, String text) {
    return validate(context, text) == null;
  }
}
