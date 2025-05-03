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
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Widget child = SizedBox(key: _key, child: widget.child);
    final box = context.findRenderObject() as RenderBox?;
    final height = box?.size.height;
    return ValueListenableBuilder(
      valueListenable: widget.valueListenable,
      builder: (context, isLoading, _) {
        if (isLoading) {
          return IgnorePointer(
            ignoring: true,
            child: SizedBox(
              height: height,
              child: Stack(
                children: [
                  AnimatedOpacity(
                    opacity: isLoading ? 0.5 : 1.0,
                    duration: Duration(milliseconds: 200),
                    child: Center(child: child),
                  ),
                  if (isLoading)
                    Center(child: const CupertinoActivityIndicator()),
                ],
              ),
            ),
          );
        }
        return child;
      },
    );
  }
}
