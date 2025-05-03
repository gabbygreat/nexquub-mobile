import 'package:nexquub/utils/utils.dart';

class SuccessContent extends StatefulWidget {
  final String text;
  final String description;
  final void Function()? onProceed;
  const SuccessContent({
    super.key,
    required this.text,
    required this.description,
    this.onProceed,
  });

  @override
  State<SuccessContent> createState() => _SuccessContentState();
}

class _SuccessContentState extends State<SuccessContent> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      if (!mounted) return;
      widget.onProceed?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.spMin),
      decoration: context.boxDecoration,
      child: Column(
        spacing: 30,
        children: [
          40.sbH,
          CircleAvatar(radius: 50),
          Text(
            widget.text,
            textAlign: TextAlign.center,
            style: 18.medium.neutralLight800.of(context),
          ),
          Text(
            widget.description,
            textAlign: TextAlign.center,
            style: 14.regular.neutralLight300.of(context),
          ),
        ],
      ),
    );
  }
}
