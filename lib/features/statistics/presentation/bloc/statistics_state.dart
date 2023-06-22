part of 'statistics_bloc.dart';

abstract class StatisticsState extends Equatable {
  const StatisticsState();
}

class StatisticsInitial extends StatisticsState {
  @override
  List<Object> get props => [];
}

class StatisticsLoading extends StatisticsState {
  @override
  List<Object> get props => [];
}

class StatisticsLoaded extends StatisticsState {
  const StatisticsLoaded({
    required this.maxRating,
    required this.ratingList,
  });
  final int maxRating;
  final List<RatingEntity> ratingList;

  @override
  List<Object> get props => [ratingList];
}

class StatisticsFailure extends StatisticsState {
  @override
  List<Object> get props => [];
}
