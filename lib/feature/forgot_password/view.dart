import 'package:nexquub/utils/utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});
  static const path = '/forgot-password';
  static const name = 'forgot-password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late final ForgotPasswordViewModel _viewModel;
  late AppLocalizations l10n;

  @override
  void initState() {
    super.initState();
    _viewModel = ForgotPasswordViewModel(context: context);
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
      focusNodes: _viewModel.focusNodes,
      title: 'Forgot Password',
      description:
          'Enter the email address linked to your account. We’ll send you a reset link to create a new password.',
      children: [
        PakeTextInput(
          titleText: 'Email',
          hintText: 'Enter your email',
          focusNode: _viewModel.focusNodes[0],
          controller: _viewModel.emailController,
          validator: _viewModel.emailValidation,
          enableSuggestions: true,
          keyboardType: TextInputType.emailAddress,
          autofillHints: [AutofillHints.email],
        ),
        40.sbH,
        MultiValueListenableBuilder(
          valueListenables: [_viewModel.emailController],
          builder: (context, listenable, _) {
            final email = listenable[0] as TextEditingValue;
            bool enable = _viewModel.emailValidation.validateText(
              context,
              email.text,
            );
            return StateButton(
              valueListenable: _viewModel.isLoading,
              child: PakeButton.filled(
                text: 'Continue',
                disabled: !enable,
                onPressed: _viewModel.forgotPassword,
              ),
            );
          },
        ),
      ],
    );
  }
}
