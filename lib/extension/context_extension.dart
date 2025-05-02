import 'dart:math';

import 'package:nexquub/utils/utils.dart';

extension BuildContextExtension on BuildContext {
  bool get isNormal {
    return ScreenHelper.normalWidth(this);
  }

  bool get isDark {
    return Theme.of(this).brightness == Brightness.dark;
  }

  BoxDecoration get appDecoration {
    return BoxDecoration(
      gradient: isDark ? PakeColors.bgNight : null,
      color: isDark ? null : PakeColors.bgLight,
    );
  }

  double get minWidth {
    return min(300, MediaQuery.sizeOf(this).width * 0.7);
  }

  double get maxWidth {
    return max(300, MediaQuery.sizeOf(this).width * 0.6);
  }

  double get maxConstrainWidth {
    return 600 * 1.2;
  }
}
