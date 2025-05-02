import 'package:nexquub/utils/utils.dart';

class AdaptiveImage extends StatelessWidget {
  final AssetGenImage image;
  final Alignment alignment;
  final BoxFit? fit;
  final double? width;
  final double? height;
  const AdaptiveImage({
    super.key,
    required this.image,
    this.width,
    this.height,
    this.fit,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    String darkPath =
        '${image.path.split('.').first}-dark.${image.path.split('.').last}';
    return Image.asset(
      isDark ? darkPath : image.path,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
    );
  }
}
