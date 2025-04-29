import 'dart:math';

import 'package:nexquub/utils/utils.dart';

extension BuildContextExtension on BuildContext {
  bool get isNormal {
    return ScreenHelper.normalWidth(this);
  }

  double get minWidth {
    return min(300, MediaQuery.sizeOf(this).width * 0.7);
  }

  double get maxWidth {
    return max(300, MediaQuery.sizeOf(this).width * 0.6);
  }

  int get optimalCrossAxisCount {
    final width = MediaQuery.sizeOf(this).width;

    // Desired minimum width for each grid item
    const double itemMinWidth = 110.0;

    // Calculate how many items can fit
    int count = (width / itemMinWidth).floor();

    // Set sensible boundaries
    count = count.clamp(2, 8);

    return count;
  }
}
