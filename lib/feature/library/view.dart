import 'package:nexquub/utils/utils.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});
  static const path = '/library';
  static const name = 'library';

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  late final LibraryViewModel _viewModel;
  late AppLocalizations l10n;

  @override
  void initState() {
    super.initState();
    _viewModel = LibraryViewModel();
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
