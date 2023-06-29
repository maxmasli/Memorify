part of 'results_bloc.dart';

abstract class ResultsState extends Equatable {
  const ResultsState();
}

class ResultsInitial extends ResultsState {
  @override
  List<Object> get props => [];
}

class ResultsLoading extends ResultsState {
  @override
  List<Object> get props => [];
}

class ResultsLoaded extends ResultsState {
  const ResultsLoaded({
    required this.memoPropertiesEntity,
    required this.resultEntity,
    required this.resultWords,
    this.obtainedRating,
    this.rating,
  });

  final MemoPropertiesEntity memoPropertiesEntity;
  final ResultEntity resultEntity;
  final RatingEntity? obtainedRating;
  final RatingEntity? rating;
  final List<ResultWordEntity> resultWords;

  @override
  List<Object?> get props => [
        memoPropertiesEntity,
        resultEntity,
        resultWords,
        obtainedRating,
        rating,
      ];
}

class ResultsFailure extends ResultsState {
  @override
  List<Object> get props => [];
}
