import 'package:nexquub/utils/utils.dart';
import 'package:flutter/foundation.dart';

class ErrorScreen<T extends FutureSignal> extends StatefulWidget {
  final Object error;
  final StackTrace trace;
  final T signal;

  const ErrorScreen({
    super.key,
    required this.error,
    required this.signal,
    required this.trace,
  });

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_buildErrorMessage(), 20.sbH, _buildRetryButton()],
        ),
      ),
    );
  }

  Widget _buildErrorMessage() {
    return ErrorModal(
      error: widget.error,
      trace: widget.trace,
      showButton: false,
      height: 200,
    );
  }

  Widget _buildRetryButton() {
    if (widget.error is DioException) {
      DioException dioError = widget.error as DioException;
      if (kDebugMode) {
        return PakeButton.border(
          text: 'Retry',
          onPressed: () => widget.signal.reload(),
          expand: false,
        );
      }
      if (dioError.response?.statusCode == 404) {
        return const SizedBox.shrink();
      } else if (dioError.response?.statusCode == 401) {
        return const SizedBox.shrink();
      }
    } else if (widget.error is CustomException) {
      return const SizedBox.shrink();
    }
    return PakeButton.border(
      text: 'Retry',
      onPressed: () => widget.signal.reload(),
      expand: false,
    );
  }
}

class ErrorModal extends StatelessWidget {
  final Object error;
  final StackTrace trace;
  final double? height;
  final bool showButton;
  const ErrorModal({
    super.key,
    required this.trace,
    required this.error,
    this.showButton = true,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    ErrorModel appError = ApiFormatter.format(error, trace: trace);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(child: Text(appError.message, textAlign: TextAlign.center)),
      ],
    );
  }
}
