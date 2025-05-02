import 'package:nexquub/utils/utils.dart';

class ContentFormValidation extends FormValidation {
  final String message;

  ContentFormValidation({required this.message});
  @override
  String? validate(BuildContext context, String value) {
    if (!value.hasValue) {
      return message;
    }
    return null;
  }

  @override
  bool validateText(BuildContext context, String text) {
    return validate(context, text) == null;
  }
}
