import 'package:nexquub/utils/utils.dart';

class SocialContainerGroup extends StatelessWidget {
  final void Function(SourceType) onTap;
  const SocialContainerGroup({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 12.spMin,
      children: [
        ...SourceType.values.map((e) => SocialContainer(type: e, onTap: onTap)),
      ],
    );
  }
}

class SocialContainer extends StatelessWidget {
  final SourceType type;
  final void Function(SourceType) onTap;

  const SocialContainer({super.key, required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(type),
      borderRadius: BorderRadius.circular(8.spMin),
      child: Container(
        height: 56.spMin,
        width: 56.spMin,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: PakeColors.neutralLight100.of(context)),
            borderRadius: BorderRadius.circular(8.spMin),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(switch (type) {
            SourceType.apple => Assets.vectors.apple.path,
            SourceType.facebook => Assets.vectors.facebook.path,
            SourceType.google => Assets.vectors.google.path,
          }, fit: BoxFit.scaleDown),
        ),
      ),
    );
  }
}
