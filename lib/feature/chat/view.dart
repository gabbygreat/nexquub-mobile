import 'package:nexquub/utils/utils.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const path = '/ai-chat';
  static const name = 'ai-chat';

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final ChatViewModel _viewModel;
  late AppLocalizations l10n;

  @override
  void initState() {
    super.initState();
    _viewModel = ChatViewModel();
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
