import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:memorify/features/memory_game/presentation/widgets/body.dart';

@RoutePage()
class MemoryGameScreen extends StatelessWidget {
  const MemoryGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
