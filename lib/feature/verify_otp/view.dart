import 'package:nexquub/utils/utils.dart';

class VerifyOTPScreen extends StatefulWidget {
  final OTPExpiryResponse response;
  const VerifyOTPScreen({super.key, required this.response});
  static const path = '/verify-otp';
  static const name = 'verify-otp';

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  late final VerifyOTPViewModel _viewModel;
  late AppLocalizations l10n;

  @override
  void initState() {
    super.initState();
    _viewModel = VerifyOTPViewModel(
      context: context,
      response: widget.response,
    );
  }

  @override
  dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    l10n = context.l10n;

    return AuthContainer(
      title: 'Let’s verify its you',
      focusNodes: _viewModel.focusNodes,
      description:
          'Enter the 4 digit code sent to ${widget.response.email} to set up your account',
      children: [
        PakeTextInput.pin(
          controller: _viewModel.pinController,
          validator: _viewModel.passwordValidation,
          focusNode: _viewModel.focusNodes[0],
        ),
        10.sbH,
        Align(
          alignment: Alignment.centerRight,
          child: OtpCountDown(
            notifier: _viewModel.isLoading,
            response: widget.response,
            updateIsExpired: _viewModel.updateIsExpired,
          ),
        ),
        40.sbH,
        MultiValueListenableBuilder(
          valueListenables: [_viewModel.pinController, _viewModel.isExpired],
          builder: (context, listenable, _) {
            final password = listenable[0] as TextEditingValue;
            final expired = listenable[1] as bool;
            bool enable = password.text.length == 4 && !expired;
            return StateButton(
              valueListenable: _viewModel.isLoading,
              child: PakeButton.filled(
                text: 'Verify',
                disabled: !enable,
                onPressed: _viewModel.login,
              ),
            );
          },
        ),
      ],
    );
  }
}
