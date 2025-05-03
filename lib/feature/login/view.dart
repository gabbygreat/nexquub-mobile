import 'package:flutter/gestures.dart';
import 'package:nexquub/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const path = '/login';
  static const name = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginViewModel _viewModel;
  late AppLocalizations l10n;

  @override
  void initState() {
    super.initState();
    _viewModel = LoginViewModel(context: context);
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
      title: 'Welcome Back',
      focusNodes: _viewModel.focusNodes,
      bottomWidget: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account? ',
              style: 14.regular.neutralLight600.of(context),
            ),
            TextSpan(
              text: 'Sign Up',
              style: 14.regular.primaryDark500,
              recognizer:
                  TapGestureRecognizer()..onTap = _viewModel.goToSignupScreen,
            ),
          ],
        ),
      ),
      children: [
        PakeTextInput(
          titleText: 'Email',
          hintText: 'Enter your email',
          controller: _viewModel.emailController,
          validator: _viewModel.emailValidation,
          focusNode: _viewModel.focusNodes[0],
          enableSuggestions: true,
          keyboardType: TextInputType.emailAddress,
          autofillHints: [AutofillHints.email],
        ),
        16.sbH,
        PakeTextInput(
          titleText: 'Password',
          hintText: 'Enter your password',
          controller: _viewModel.passwordController,
          validator: _viewModel.passwordValidation,
          focusNode: _viewModel.focusNodes[1],
          enableSuggestions: true,
          keyboardType: TextInputType.visiblePassword,
          autofillHints: [AutofillHints.password],
          textInputAction: TextInputAction.next,
        ),
        8.sbH,
        PakeButton.text(
          text: 'Forgot Password?',
          onPressed: _viewModel.goToForgotPassword,
          style: 12.regular.underline.neutralLight600,
        ),
        40.sbH,
        MultiValueListenableBuilder(
          valueListenables: [
            _viewModel.emailController,
            _viewModel.passwordController,
          ],
          builder: (context, listenable, _) {
            final email = listenable[0] as TextEditingValue;
            final password = listenable[1] as TextEditingValue;
            bool enable =
                _viewModel.emailValidation.validateText(context, email.text) &&
                _viewModel.passwordValidation.validateText(
                  context,
                  password.text,
                );
            return StateButton(
              valueListenable: _viewModel.isLoading,
              child: PakeButton.filled(
                text: 'Continue',
                disabled: !enable,
                onPressed: _viewModel.login,
              ),
            );
          },
        ),
        40.sbH,
        OrWidget(),
        24.sbH,
        SocialContainerGroup(onTap: _viewModel.otherLogin),
        24.sbH,
        PakeButton.border(
          text: 'Use as guest',
          onPressed: _viewModel.useAsGuest,
          borderColor: PakeColors.neutralLight100.of(context),
        ),
      ],
    );
  }
}
