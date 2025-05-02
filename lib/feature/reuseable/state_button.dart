import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class StateButton extends StatefulWidget {
  final ValueListenable valueListenable;
  final Widget child;
  const StateButton({
    super.key,
    required this.valueListenable,
    required this.child,
  });

  @override
  State<StateButton> createState() => _StateButtonState();
}

class _StateButtonState extends State<StateButton> {
  @override
  Widget build(BuildContext context) {
    // final buttonHeight = widget.child.height;
    return ValueListenableBuilder(
      valueListenable: widget.valueListenable,
      builder: (context, isLoading, _) {
        if (isLoading) {
          return IgnorePointer(
            ignoring: true,
            child: Stack(
              children: [
                AnimatedOpacity(
                  opacity: isLoading ? 0.5 : 1.0,
                  duration: Duration(milliseconds: 200),
                  child: Center(child: widget.child),
                ),
                if (isLoading) const CupertinoActivityIndicator(),
              ],
            ),
          );
        }
        return widget.child;
      },
    );
  }
}
