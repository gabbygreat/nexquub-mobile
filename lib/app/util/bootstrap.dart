import 'dart:async';
import 'package:nexquub/utils/utils.dart';

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    return UserFacingError(
      details: flutterErrorDetails,
    );
  };

  return runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      // Initialize Firebase
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      // Set up dependencies
      await setupDeps();
      runApp(await builder());
    },
    (error, stackTrace) => kLog(error, stackTrace: stackTrace, logCrash: true),
  );
}
