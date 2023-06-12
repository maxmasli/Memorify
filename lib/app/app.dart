import 'package:flutter/material.dart';
import 'package:memorify/core/styles/themes.dart';
import 'package:memorify/di.dart';
import 'package:memorify/router.dart';
import 'package:talker_flutter/talker_flutter.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        theme: createLightTheme(),
        routerConfig: _appRouter.config(
          navigatorObservers: () => [
            TalkerRouteObserver(getIt<Talker>()),
          ],
        ),
      ),
    );
  }
}
