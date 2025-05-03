import 'package:nexquub/utils/utils.dart';

class ResetPasswordScreen extends StatefulWidget {
  final OTPExpiryResponse response;

  const ResetPasswordScreen({super.key, required this.response});
  static const path = '/reset-password';
  static const name = 'reset-password';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late final ResetPasswordViewModel _viewModel;
  late AppLocalizations l10n;

  @override
  void initState() {
    super.initState();
    _viewModel = ResetPasswordViewModel(
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
      title: 'Reset Password',
      description:
          'Enter a new password for your account to regain secure access to Nexquub.',
      focusNodes: _viewModel.focusNodes,
      children: [
        PakeTextInput(
          titleText: 'New Password',
          hintText: 'Enter your new password',
          controller: _viewModel.passwordController,
          validator: _viewModel.passwordValidation,
          focusNode: _viewModel.focusNodes[0],
          enableSuggestions: true,
          keyboardType: TextInputType.visiblePassword,
          autofillHints: [AutofillHints.newPassword],
        ),
        PasswordStrengthWidget(
          controller: _viewModel.passwordController,
          onChange: _viewModel.onPasswordStrengthChange,
        ),
        40.sbH,
        MultiValueListenableBuilder(
          valueListenables: [_viewModel.passwordStrength],
          builder: (context, listenable, _) {
            final passwordStrength = listenable[0] as PasswordStrength;
            bool enable = _viewModel.validateStrength(passwordStrength);
            return StateButton(
              valueListenable: _viewModel.isLoading,
              child: PakeButton.filled(
                text: 'Continue',
                disabled: !enable,
                onPressed: _viewModel.resetNewPassword,
              ),
            );
          },
        ),
      ],
    );
  }
}
