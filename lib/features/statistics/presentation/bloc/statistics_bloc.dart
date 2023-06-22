import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/params/params.dart';
import 'package:memorify/di.dart';
import 'package:memorify/features/statistics/domain/use_cases/delete_rating_use_case.dart';
import 'package:memorify/features/statistics/domain/use_cases/get_all_rating_use_case.dart';

part 'statistics_event.dart';

part 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc() : super(StatisticsInitial()) {
    on<GetStatisticsEvent>(_getStatistics);
    on<DeleteStatisticsEvent>(_deleteStatistics);
  }

  final getAllRatingUseCase = getIt<GetAllRatingUseCase>();
  final deleteRatingUseCase = getIt<DeleteRatingUseCase>();

  Future<void> _getStatistics(
    GetStatisticsEvent event,
    Emitter<StatisticsState> emit,
  ) async {
    emit(StatisticsLoading());
    late List<RatingEntity> ratingList;
    (await getAllRatingUseCase(NoParams())).fold(
      (l) {
        emit(StatisticsFailure());
        return;
      },
      (r) => ratingList = r,
    );
    int max;
    if (ratingList.isEmpty) {
      max = 0;
    } else if (ratingList.length == 1) {
      max = ratingList[0].rating;
    } else {
      max = ratingList
          .reduce(
            (value, element) => value.rating > element.rating ? value : element,
          )
          .rating;
    }
    emit(StatisticsLoaded(ratingList: ratingList, maxRating: max));
  }

  Future<void> _deleteStatistics(
    DeleteStatisticsEvent event,
    Emitter<StatisticsState> emit,
  ) async {
    emit(StatisticsLoading());
    (await deleteRatingUseCase(NoParams())).fold(
      (l) => emit(StatisticsFailure()),
      (r) => emit(const StatisticsLoaded(maxRating: 0, ratingList: [])),
    );
  }
}
