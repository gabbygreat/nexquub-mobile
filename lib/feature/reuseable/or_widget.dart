import 'package:nexquub/utils/utils.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            height: 0,
            thickness: 1,
            color: PakeColors.neutralLight100.of(context),
          ),
        ),
        4.sbW,
        Text(
          'Or Create an Account With',
          style: 14.medium.neutralLight300.of(context),
        ),
        4.sbW,
        Expanded(
          child: Divider(
            height: 0,
            thickness: 1,
            color: PakeColors.neutralLight100.of(context),
          ),
        ),
      ],
    );
  }
}
