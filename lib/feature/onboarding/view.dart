import 'package:nexquub/utils/utils.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static const path = '/onboarding';
  static const name = 'onboarding';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingViewModel _viewModel = OnboardingViewModel();
  late AppLocalizations l10n;

  @override
  dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    l10n = context.l10n;
    _viewModel.content = [
      OnboardingContent(
        title: 'l10n.craftSpeechesWithEase',
        description: 'l10n.typePasteOrImport',
      ),
      OnboardingContent(
        title:' l10n.setYourOwnPreferences',
        description: 'l10n.haveAFontYou',
      ),
      OnboardingContent(
        title: 'l10n.organisedAndInCloud',
        description: 'l10n.haveYourScriptsAnd',
      ),
    ];

    return Scaffold(
      body: Placeholder(),
    );
  }
}
