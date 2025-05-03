import 'package:nexquub/utils/utils.dart';

class MainScreen extends StatefulWidget {
  final StatefulNavigationShell shell;

  const MainScreen({super.key, required this.shell});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SignalsMixin {
  late final MainViewModel _viewModel;
  late AppLocalizations l10n;

  @override
  initState() {
    super.initState();
    _viewModel = MainViewModel(widget.shell);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    l10n = context.l10n;

    return Scaffold(
      body: Stack(children: [Positioned.fill(child: widget.shell)]),
    );
  }
}
