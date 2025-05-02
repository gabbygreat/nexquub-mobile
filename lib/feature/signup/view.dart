import 'package:nexquub/feature/reuseable/state_button.dart';
import 'package:nexquub/utils/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});
  static const path = '/signup';
  static const name = 'signup';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final SignupViewModel _viewModel;
  late AppLocalizations l10n;

  @override
  void initState() {
    super.initState();
    _viewModel = SignupViewModel(context: context);
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
      title: 'Welcome to NexQuub',
      description: 'Fill in the details to create your account',
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PakeTextInput(
                titleText: 'First Name',
                hintText: 'Enter your first name',
                controller: _viewModel.firstNameController,
                validator: _viewModel.firstNameValidation,
                enableSuggestions: true,
                textCapitalization: TextCapitalization.words,
              ),
            ),
            16.sbW,
            Expanded(
              child: PakeTextInput(
                titleText: 'Last Name',
                hintText: 'Enter your last name',
                controller: _viewModel.lastNameController,
                validator: _viewModel.lastNameValidation,
                enableSuggestions: true,
                textCapitalization: TextCapitalization.words,
              ),
            ),
          ],
        ),
        14.sbH,
        PakeTextInput(
          titleText: 'Email',
          hintText: 'Enter your email',
          controller: _viewModel.emailController,
          validator: _viewModel.emailValidation,
          enableSuggestions: true,
          keyboardType: TextInputType.emailAddress,
        ),
        16.sbH,
        PakeTextInput(
          titleText: 'Password',
          hintText: 'Enter your password',
          controller: _viewModel.passwordController,
          validator: _viewModel.passwordValidation,
          enableSuggestions: true,
          keyboardType: TextInputType.visiblePassword,
        ),
        PasswordStrengthWidget(
          controller: _viewModel.passwordController,
          onChange: _viewModel.onPasswordStrengthChange,
        ),
        40.sbH,
        MultiValueListenableBuilder(
          valueListenables: [
            _viewModel.firstNameController,
            _viewModel.lastNameController,
            _viewModel.emailController,
            _viewModel.passwordStrength,
          ],
          builder: (context, listenable, _) {
            final firstName = listenable[0] as TextEditingValue;
            final lastName = listenable[1] as TextEditingValue;
            final email = listenable[2] as TextEditingValue;
            final passwordStrength = listenable[3] as PasswordStrength;
            bool enable =
                _viewModel.firstNameValidation.validateText(
                  context,
                  firstName.text,
                ) &&
                _viewModel.lastNameValidation.validateText(
                  context,
                  lastName.text,
                ) &&
                _viewModel.emailValidation.validateText(context, email.text) &&
                _viewModel.validateStrength(passwordStrength);
            return StateButton(
              valueListenable: _viewModel.isLoading,
              child: PakeButton.secondaryButton44.filled(
                text: 'Continue',
                disabled: !enable,
                onPressed: _viewModel.signUp,
              ),
            );
          },
        ),
        40.sbH,
        OrWidget(),
        24.sbH,
      ],
    );
  }
}
