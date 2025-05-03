import 'package:nexquub/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const path = '/home';
  static const name = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;
  late AppLocalizations l10n;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    l10n = context.l10n;

    return Scaffold(body: Placeholder());
  }
}
