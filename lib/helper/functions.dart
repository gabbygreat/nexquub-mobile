import 'dart:developer';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:lottie/lottie.dart';
import 'package:nexquub/utils/utils.dart';

void kLog(
  Object message, {
  StackTrace? stackTrace,
  bool logCrash = false,
}) {
  if (kDebugMode) {
    log(
      '$message',
      name: 'APP LOG',
      stackTrace: stackTrace,
    );
  } else {
    if (logCrash) {
      locator<CrashlyticsService>().logError(
        message,
        stackTrace!,
      );
    }
  }
}

Future<void> showFormattedError({
  required Object error,
  StackTrace? trace,
  bool barrierDismissible = true,
  DialogErrorType? errorType,
}) async {
  BuildContext context = routes.routerDelegate.navigatorKey.currentContext!;
  final formattedError = ApiFormatter.format(
    error,
    trace: trace,
    errorType: errorType,
  );
  String? imagePath = switch (formattedError.type) {
    DialogErrorType.cancelledError => null,
    DialogErrorType.error => Assets.animation.error,
    DialogErrorType.noInternet => Assets.animation.noInternet,
    DialogErrorType.auth => Assets.animation.error,
  };

  await showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return PopScope(
        canPop: barrierDismissible,
        child: Dialog(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.sizeOf(context).width * 0.4,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 12,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  10.sbH,
                  if (imagePath != null) ...[
                    LottieBuilder.asset(
                      imagePath,
                      height: 100,
                      fit: BoxFit.fill,
                      width: 100,
                    ),
                    5.sbH,
                  ],
                  Text(
                    formattedError.message,
                    textAlign: TextAlign.center,
                  ),
                  20.sbH,
                  PakeButton.secondaryButton44.filled(
                    text: context.l10n.okay,
                    fillColor: PakeColors.red100,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

Future<void> showSuccessMessage({
  required String message,
  String? subMessage,
  bool barrierDismissible = false,
}) async {
  BuildContext context = routes.routerDelegate.navigatorKey.currentContext!;

  await showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) {
      return PopScope(
        canPop: barrierDismissible,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 10,
            sigmaY: 10,
          ),
          child: Dialog(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.sizeOf(context).width * 0.4,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    10.sbH,
                    LottieBuilder.asset(
                      Assets.animation.confetti,
                      height: 100,
                      fit: BoxFit.fill,
                      width: 100,
                    ),
                    5.sbH,
                    Text(
                      message,
                      textAlign: TextAlign.center,
                    ),
                    if (subMessage != null) ...[
                      5.sbH,
                      Text(
                        subMessage,
                        textAlign: TextAlign.center,
                      ),
                    ],
                    20.sbH,
                    PakeButton.secondaryButton44.filled(
                      text: context.l10n.okay,
                      fillColor: PakeColors.red100,
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

Future<bool?> showConfirmationModal(
  BuildContext context, {
  required String message,
  String? secondaryText,
  void Function()? secondaryAction,
}) async {
  Widget adaptiveAction({
    required BuildContext context,
    required VoidCallback onPressed,
    required Widget child,
  }) {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(
          onPressed: onPressed,
          child: child,
        );
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(
          onPressed: onPressed,
          child: child,
        );
    }
  }

  final l10n = context.l10n;
  return showAdaptiveDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 3,
          sigmaY: 3,
        ),
        child: AlertDialog.adaptive(
          title: Text(
            message,
          ),
          actions: [
            adaptiveAction(
              context: context,
              onPressed: () {
                Navigator.pop(context, false);
                secondaryAction?.call();
              },
              child: Text(
                secondaryText ?? l10n.cancel,
              ),
            ),
            adaptiveAction(
              context: context,
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                l10n.okay,
              ),
            ),
          ],
        ),
      );
    },
  );
}
