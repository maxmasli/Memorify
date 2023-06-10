import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorify/core/domain/entities/memo_properties_entity.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';
import 'package:memorify/features/memory_check/presentation/bloc/memory_check_bloc.dart';
import 'package:memorify/features/memory_check/presentation/widgets/body.dart';

@RoutePage()
class MemoryCheckScreen extends StatelessWidget {
  const MemoryCheckScreen({
    required this.memoPropertiesEntity,
    required this.wordsList,
    super.key,
  });

  final MemoPropertiesEntity memoPropertiesEntity;
  final List<WordEntity> wordsList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MemoryCheckBloc()
        ..add(
          LoadPropsEvent(
            memoPropertiesEntity: memoPropertiesEntity,
            wordsList: wordsList,
          ),
        ),
      child: const Scaffold(
        body: Body(),
      ),
    );
  }
}
