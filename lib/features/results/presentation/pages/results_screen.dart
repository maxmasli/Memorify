import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memorify/core/domain/entities/memo_properties_entity.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';
import 'package:memorify/features/results/presentation/bloc/results_bloc.dart';
import 'package:memorify/features/results/presentation/widgets/body.dart';

@RoutePage()
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    required this.wordsList,
    required this.answerWordsList,
    required this.memoPropertiesEntity,
    super.key,
  });

  final List<WordEntity> wordsList;
  final List<WordEntity> answerWordsList;
  final MemoPropertiesEntity memoPropertiesEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResultsBloc()
        ..add(
          SaveResultsEvent(
            wordsList: wordsList,
            answerWordsList: answerWordsList,
            memoPropertiesEntity: memoPropertiesEntity,
          ),
        ),
      child: const Scaffold(
        body: Body(),
      ),
    );
  }
}
