import 'package:nexquub/utils/utils.dart';

class AuthContainer extends StatelessWidget {
  final String title;
  final String? description;
  final List<Widget> children;
  final Widget? bottomWidget;
  final List<FocusNode> focusNodes;

  const AuthContainer({
    super.key,
    required this.title,
    this.description,
    required this.children,
    this.bottomWidget,
    required this.focusNodes,
  });

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    bool dismiss = parentRoute?.impliesAppBarDismissal ?? false;
    return Scaffold(
      body: Center(
        child: Container(
          decoration: context.boxDecoration,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: context.maxConstrainWidth),
              child: SafeArea(
                child: MyKeyboardActions(
                  focusNodes: focusNodes,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 16.spMin),
                    children: [
                      25.sbH,
                      if (dismiss)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: BackButton(),
                        ),
                      CircleAvatar(radius: 63 / 1.5),
                      24.sbH,
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          title,
                          style: 18.medium.neutralLight800.of(context),
                        ),
                      ),
                      if (description != null) ...[
                        8.sbH,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            description!,
                            style: 14.regular.neutralLight300.of(context),
                          ),
                        ),
                      ],
                      24.sbH,
                      ...children,
                      if (bottomWidget != null) ...[
                        40.sbH,
                        Center(child: bottomWidget!),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
