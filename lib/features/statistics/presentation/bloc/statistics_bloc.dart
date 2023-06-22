import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/params/params.dart';
import 'package:memorify/di.dart';
import 'package:memorify/features/statistics/domain/use_cases/get_all_rating_use_case.dart';

part 'statistics_event.dart';
part 'statistics_state.dart';

class StatisticsBloc extends Bloc<StatisticsEvent, StatisticsState> {
  StatisticsBloc() : super(StatisticsInitial()) {
    on<GetStatisticsEvent>(_getStatistics);
  }

  final getAllRatingUseCase = getIt<GetAllRatingUseCase>();

  Future<void> _getStatistics(
    GetStatisticsEvent event,
    Emitter<StatisticsState> emit,
  ) async {
    emit(StatisticsLoading());
    late List<RatingEntity> resultList;
    (await getAllRatingUseCase(NoParams())).fold(
      (l) {
        emit(StatisticsFailure());
        return;
      },
      (r) => resultList = r,
    );
    emit(StatisticsLoaded(ratingList: resultList));
  }
}
