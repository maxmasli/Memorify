import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorify/core/domain/entities/memo_properties_entity.dart';
import 'package:memorify/features/memory_game/presentation/bloc/memory_game_bloc.dart';
import 'package:memorify/features/memory_game/presentation/widgets/body.dart';

@RoutePage()
class MemoryGameScreen extends StatelessWidget {
  const MemoryGameScreen({required this.memoPropertiesEntity, super.key});

  final MemoPropertiesEntity memoPropertiesEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MemoryGameBloc()
        ..add(
          GenerateWordsEvent(memoPropertiesEntity: memoPropertiesEntity),
        ),
      child: const Scaffold(
        body: Body(),
      ),
    );
  }
}
