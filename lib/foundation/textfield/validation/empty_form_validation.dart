import 'package:nexquub/utils/utils.dart';

class EmptyFormValidation extends FormValidation {
  @override
  String? validate(BuildContext context, String value) {
    return null;
  }

  @override
  bool validateText(BuildContext context, String text) {
    return validate(context, text) == null;
  }
}
