import 'package:flutter/material.dart';
import 'package:memorify/core/styles/themes.dart';
import 'package:memorify/di.dart';
import 'package:memorify/router.dart';
import 'package:talker_flutter/talker_flutter.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: createLightTheme(),
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          TalkerRouteObserver(getIt<Talker>()),
        ],
      ),
    );
  }
}