import 'package:lottie/lottie.dart';
import 'package:nexquub/utils/utils.dart';

class EmptyContent extends StatelessWidget {
  const EmptyContent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          LottieBuilder.asset(
            Assets.animation.empty,
          ),
          8.sbH,
          Text(
            l10n.ooopsYouDontHave,
            style: PakeTextStyle.bodyText14.red100.of(context),
          ),
        ],
      ),
    );
  }
}
