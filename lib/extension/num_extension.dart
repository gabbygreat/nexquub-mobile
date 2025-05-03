import 'dart:math';

import 'package:nexquub/utils/utils.dart';

extension NumExtension on num {
  SizedBox get sbH => SizedBox(height: spMin);
  Widget get sliverbH => SliverToBoxAdapter(child: SizedBox(height: spMin));
  SizedBox get sbW => SizedBox(width: spMin);
  Widget get sliverbW => SliverToBoxAdapter(child: SizedBox(width: spMin));
  double get toRadians => this * (pi / 180.0);

  Duration getDurationBasedOnWordLengthAndScrollSpeed({
    required int wordCount,
  }) {
    const constant = 0.1;
    final duration = (constant * (wordCount ~/ this)).toInt();
    return Duration(seconds: duration);
  }

  String get formatDuration {
    Duration duration = Duration(milliseconds: toInt());

    String twoDigits(int n) => n.toString().padLeft(2, '0');

    String minutes = twoDigits(duration.inMinutes);
    String seconds = twoDigits(duration.inSeconds.remainder(60));

    return '$minutes:$seconds';
  }
}
