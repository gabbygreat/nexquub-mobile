import 'package:nexquub/utils/utils.dart';

abstract class FormValidation {
  String? validate(BuildContext context, String value);

  bool validateText(BuildContext context, String text);
}
