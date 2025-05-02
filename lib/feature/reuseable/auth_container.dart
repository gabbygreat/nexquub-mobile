import 'package:nexquub/utils/utils.dart';

class AuthContainer extends StatelessWidget {
  final String title;
  final String description;
  final List<Widget> children;
  final Widget? bottomWidget;

  const AuthContainer({
    super.key,
    required this.title,
    required this.description,
    required this.children,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.maxConstrainWidth),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.spMin),
              children: [
                CircleAvatar(radius: 63 / 2),
                24.sbH,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: 18.medium.neutralLight800.of(context),
                  ),
                ),
                8.sbH,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    description,
                    style: 14.regular.neutralLight300.of(context),
                  ),
                ),
                24.sbH,
                ...children,
                if (bottomWidget != null) bottomWidget!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
