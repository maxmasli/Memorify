import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memorify/features/main_menu/presentation/widgets/body.dart';

@RoutePage()
class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
