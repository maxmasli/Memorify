part of 'statistics_bloc.dart';

abstract class StatisticsEvent extends Equatable {
  const StatisticsEvent();
}

class GetStatisticsEvent extends StatisticsEvent {
  @override
  List<Object> get props => [];
}

class DeleteStatisticsEvent extends StatisticsEvent {
  @override
  List<Object> get props => [];
}
