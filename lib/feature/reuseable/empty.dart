import 'package:lottie/lottie.dart';
import 'package:nexquub/utils/utils.dart';

class EmptyContent extends StatelessWidget {
  final String? animation;
  final String? text;
  final String? description;
  final void Function()? onTap;
  const EmptyContent({
    super.key,
    this.animation,
    this.text,
    this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SizedBox(
        width: 250.spMin,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            LottieBuilder.asset(
              animation ?? Assets.animation.empty,
              width: 120.spMin,
              height: 120.spMin,
            ),
            8.sbH,
            Text(
              text ?? l10n.ooopsYouDontHave,
              style: 14.medium.neutralLight800.of(context),
              textAlign: TextAlign.center,
            ),
            if (description != null)
              Text(
                description!,
                style: 14.regular.neutralLight300.of(context),
                textAlign: TextAlign.center,
              ),

            if (onTap != null) ...[
              24.sbH,
              PakeButton.filled(text: 'Add an item', onPressed: onTap),
            ],
          ],
        ),
      ),
    );
  }
}
