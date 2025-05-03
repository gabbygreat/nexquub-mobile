import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:nexquub/utils/utils.dart';

class MyKeyboardActions extends StatefulWidget {
  final List<FocusNode> focusNodes;
  final Widget child;
  const MyKeyboardActions({
    super.key,
    required this.focusNodes,
    required this.child,
  });

  @override
  State<MyKeyboardActions> createState() => _MyKeyboardActionsState();
}

class _MyKeyboardActionsState extends State<MyKeyboardActions> {
  late AppLocalizations l10n;
  KeyboardActionsConfig buildConfig({required bool isDark}) {
    return KeyboardActionsConfig(
      keyboardBarColor: PakeColors.neutralDark50,
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      defaultDoneWidget: Text('Done', style: 14.medium.white),
      actions: [
        for (var i in widget.focusNodes) KeyboardActionsItem(focusNode: i),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    l10n = context.l10n;
    return KeyboardActions(
      config: buildConfig(isDark: isDark),
      child: widget.child,
    );
  }
}
