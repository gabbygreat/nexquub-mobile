import 'package:nexquub/utils/utils.dart';

class ScreenHelper {
  // Define breakpoints for screen sizes
  static const double mobileBreakpoint = 600.0;

  // Check if the screen size is mobile
  static bool normalWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobileBreakpoint;

  // Check if the screen size is mobile
  static bool bigWidth(BuildContext context) => !normalWidth(context);
}
