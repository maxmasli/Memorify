part of 'results_bloc.dart';

abstract class ResultsEvent extends Equatable {
  const ResultsEvent();
}

class SaveResultsEvent extends ResultsEvent {
  const SaveResultsEvent({
    required this.wordsList,
    required this.answerWordsList,
    required this.memoPropertiesEntity,
  });

  final List<WordEntity> wordsList;
  final List<WordEntity> answerWordsList;
  final MemoPropertiesEntity memoPropertiesEntity;

  @override
  List<Object> get props => [
        wordsList,
        answerWordsList,
        memoPropertiesEntity,
      ];
}
