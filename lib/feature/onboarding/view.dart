import 'package:nexquub/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' as indicator;

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
        title: l10n.title1,
        description: l10n.description1,
        image: Assets.images.onboarding1,
      ),
      OnboardingContent(
        title: l10n.title2,
        description: l10n.description2,
        image: Assets.images.onboarding2,
      ),
      OnboardingContent(
        title: l10n.title3,
        description: l10n.description3,
        image: Assets.images.onboarding3,
      ),
    ];

    return Scaffold(
      body: Container(
        decoration: context.appDecoration,
        child: SafeArea(
          child: ValueListenableBuilder(
            valueListenable: _viewModel.pageIndex,
            builder: (context, pageIndex, _) {
              return Row(
                children: [
                  if (!context.isNormal)
                    Expanded(
                      child: FractionallySizedBox(
                        heightFactor: 0.6,
                        child: PageView.builder(
                          controller: _viewModel.pageController,
                          itemCount: _viewModel.content.length,
                          onPageChanged: _viewModel.onPageChanged,
                          itemBuilder: (context, index) {
                            final item = _viewModel.content[index].image;
                            return AdaptiveImage(image: item);
                          },
                        ),
                      ),
                    ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.spMin),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              42.sbH,
                              Text(
                                _viewModel.content[pageIndex].title,
                                style: 20.regular.apfelGrotezk.neutralLight800
                                    .of(context),
                              ),
                              8.sbH,
                              Text(
                                _viewModel.content[pageIndex].description,
                                style: 14.regular.neutralLight600.of(context),
                              ),
                              20.sbH,
                              indicator.SmoothPageIndicator(
                                controller: _viewModel.pageController,
                                count: _viewModel.content.length,
                                effect: indicator.WormEffect(
                                  dotWidth: 80.spMin,
                                  dotHeight: 6,
                                  activeDotColor: PakeColors.primaryDark500,
                                  dotColor: PakeColors.neutralDark600.of(
                                    context,
                                  ),
                                ),
                              ),
                              50.sbH,
                            ],
                          ),
                        ),
                        if (context.isNormal)
                          Expanded(
                            child: PageView.builder(
                              controller: _viewModel.pageController,
                              itemCount: _viewModel.content.length,
                              onPageChanged: _viewModel.onPageChanged,
                              itemBuilder: (context, index) {
                                final item = _viewModel.content[index].image;
                                return AdaptiveImage(image: item);
                              },
                            ),
                          )
                        else
                          Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.spMin),
                          child: Column(
                            children: [
                              AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                child:
                                    pageIndex == _viewModel.content.length - 1
                                        ? PakeButton.secondaryButton44.filled(
                                          text: 'Log In',
                                          onPressed: _viewModel.goToLoginScreen,
                                        )
                                        : Opacity(
                                          opacity: 0,
                                          child: PakeButton.secondaryButton44
                                              .filled(
                                                text: '',
                                                onPressed: null,
                                              ),
                                        ),
                              ),
                              15.sbH,
                              AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                child:
                                    pageIndex == _viewModel.content.length - 1
                                        ? PakeButton.secondaryButton44.border(
                                          text: 'Create an account',
                                          onPressed:
                                              _viewModel.goToSignupScreen,
                                        )
                                        : PakeButton.secondaryButton44.filled(
                                          text: 'Next',
                                          onPressed: _viewModel.animateForward,
                                        ),
                              ),
                            ],
                          ),
                        ),
                        10.sbH,
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
