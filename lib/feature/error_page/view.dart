import 'package:flutter/foundation.dart';
import 'package:nexquub/utils/utils.dart';

class UserFacingError extends StatefulWidget {
  final FlutterErrorDetails details;
  const UserFacingError({
    super.key,
    required this.details,
  });

  @override
  State<UserFacingError> createState() => _UserFacingErrorState();
}

class _UserFacingErrorState extends State<UserFacingError> {
  late AppLocalizations l10n;
  final errorModel = UserFacingErrorViewModel();

  @override
  Widget build(BuildContext context) {
    l10n = context.l10n;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error,
                size: 64,
                color: Colors.red,
              ),
              const SizedBox(height: 16),
              Text(
                l10n.oopsUnexpectedError,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              if (kDebugMode) ...[
                Text(
                  l10n.details(widget.details.exceptionAsString()),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                if (widget.details.stack != null)
                  Text(
                    '${'${widget.details.stack}'.split(')').first})',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey),
                  ),
              ],
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: errorModel.close,
                child: Text(
                  l10n.goBack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
