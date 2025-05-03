/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsAnimationGen {
  const $AssetsAnimationGen();

  /// File path: assets/animation/confetti.json
  String get confetti => 'assets/animation/confetti.json';

  /// File path: assets/animation/empty.json
  String get empty => 'assets/animation/empty.json';

  /// File path: assets/animation/error.json
  String get error => 'assets/animation/error.json';

  /// File path: assets/animation/info.json
  String get info => 'assets/animation/info.json';

  /// File path: assets/animation/no-internet.json
  String get noInternet => 'assets/animation/no-internet.json';

  /// File path: assets/animation/rocket.json
  String get rocket => 'assets/animation/rocket.json';

  /// List of all assets
  List<String> get values => [confetti, empty, error, info, noInternet, rocket];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/onboarding1-dark.png
  AssetGenImage get onboarding1Dark =>
      const AssetGenImage('assets/images/onboarding1-dark.png');

  /// File path: assets/images/onboarding1.png
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding1.png');

  /// File path: assets/images/onboarding2-dark.png
  AssetGenImage get onboarding2Dark =>
      const AssetGenImage('assets/images/onboarding2-dark.png');

  /// File path: assets/images/onboarding2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding2.png');

  /// File path: assets/images/onboarding3-dark.png
  AssetGenImage get onboarding3Dark =>
      const AssetGenImage('assets/images/onboarding3-dark.png');

  /// File path: assets/images/onboarding3.png
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/onboarding3.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    onboarding1Dark,
    onboarding1,
    onboarding2Dark,
    onboarding2,
    onboarding3Dark,
    onboarding3,
  ];
}

class $AssetsVectorsGen {
  const $AssetsVectorsGen();

  /// File path: assets/vectors/apple-dark.svg
  SvgGenImage get appleDark =>
      const SvgGenImage('assets/vectors/apple-dark.svg');

  /// File path: assets/vectors/apple.svg
  SvgGenImage get apple => const SvgGenImage('assets/vectors/apple.svg');

  /// File path: assets/vectors/eye-open-dark.svg
  SvgGenImage get eyeOpenDark =>
      const SvgGenImage('assets/vectors/eye-open-dark.svg');

  /// File path: assets/vectors/eye-open.svg
  SvgGenImage get eyeOpen => const SvgGenImage('assets/vectors/eye-open.svg');

  /// File path: assets/vectors/eye-slash-dark.svg
  SvgGenImage get eyeSlashDark =>
      const SvgGenImage('assets/vectors/eye-slash-dark.svg');

  /// File path: assets/vectors/eye-slash.svg
  SvgGenImage get eyeSlash => const SvgGenImage('assets/vectors/eye-slash.svg');

  /// File path: assets/vectors/facebook.svg
  SvgGenImage get facebook => const SvgGenImage('assets/vectors/facebook.svg');

  /// File path: assets/vectors/google.svg
  SvgGenImage get google => const SvgGenImage('assets/vectors/google.svg');

  /// File path: assets/vectors/linkedin.svg
  SvgGenImage get linkedin => const SvgGenImage('assets/vectors/linkedin.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    appleDark,
    apple,
    eyeOpenDark,
    eyeOpen,
    eyeSlashDark,
    eyeSlash,
    facebook,
    google,
    linkedin,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsAnimationGen animation = $AssetsAnimationGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsVectorsGen vectors = $AssetsVectorsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
