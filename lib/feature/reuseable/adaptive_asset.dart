import 'package:nexquub/utils/utils.dart';

class AdaptiveSvg extends StatelessWidget {
  final SvgGenImage svg;
  final ColorFilter? colorFilter;
  final SvgTheme? theme;
  final Widget Function(BuildContext)? placeholderBuilder;
  final Alignment alignment;
  final BoxFit fit;
  final double? width;
  final double? height;
  final bool filled;
  const AdaptiveSvg({
    super.key,
    required this.svg,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.placeholderBuilder,
    this.theme,
    this.colorFilter,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    String darkPath =
        '${svg.path.split('.').first}-dark.${svg.path.split('.').last}';
    String filledPath =
        '${svg.path.split('.').first}-filled.${svg.path.split('.').last}';
    return SvgPicture.asset(
      filled
          ? filledPath
          : isDark
          ? darkPath
          : svg.path,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      colorFilter: colorFilter,
      theme: theme,
      placeholderBuilder: placeholderBuilder,
    );
  }
}

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
