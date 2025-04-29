import 'dart:async';

import 'package:nexquub/utils/utils.dart';

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  // Constructor to set debounce delay time
  Debouncer({this.milliseconds = 1200});

  // Run the debounce action
  void run(VoidCallback action) {
    // Cancel any existing timer
    if (_timer?.isActive ?? false) _timer?.cancel();

    // Create a new timer to run the action after the debounce time
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  // Cancel the current debounce if needed
  void cancel() {
    _timer?.cancel();
  }

  // Check if the debounce is still active
  bool get isActive => _timer?.isActive ?? false;
}
