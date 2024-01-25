import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';
import 'env/env.dart';
import 'router/router.dart' show router;

void main() async {
  // await SentryFlutter.init(
  //   (options) {
  //     options.dsn = env.sentryDns;
  //     options.tracesSampleRate = 1.0;
  //   },
  //   appRunner: () => runApp(const MyApp()),
  // );

  // FlutterError.onError = (details) async {
  //   await Sentry.captureException(details.exception, stackTrace: details.stack);
  //   FlutterError.presentError(details);
  // };

  // PlatformDispatcher.instance.onError = (error, stack) {
  //   Sentry.captureException(error, stackTrace: stack);
  //   FlutterError.presentError(
  //       FlutterErrorDetails(exception: error, stack: stack));

  //   return false;
  // };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(7, 78, 146, 1)),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}
