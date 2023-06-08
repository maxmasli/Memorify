import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memorify/core/domain/entities/memo_properties_entity.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/params/params.dart';
import 'package:memorify/di.dart';
import 'package:memorify/features/rating_menu/domain/use_cases/calculate_properties_use_case.dart';
import 'package:memorify/features/rating_menu/domain/use_cases/get_rating_use_case.dart';

part 'rating_menu_event.dart';

part 'rating_menu_state.dart';

class RatingMenuBloc extends Bloc<RatingMenuEvent, RatingMenuState> {
  RatingMenuBloc() : super(RatingMenuInitial()) {
    on<CalculatePropertiesEvent>(_calculateProperties);
  }

  final calculatePropertiesUseCase = getIt<CalculatePropertiesUseCase>();
  final getRatingUseCase = getIt<GetRatingUseCase>();

  Future<void> _calculateProperties(
    CalculatePropertiesEvent event,
    Emitter<RatingMenuState> emit,
  ) async {
    emit(RatingMenuLoading());

    late RatingEntity rating;
    (await getRatingUseCase(NoParams())).fold(
      (l) {
        emit(RatingMenuFailure());
        return;
      },
      (r) => rating = r,
    );

    late MemoPropertiesEntity props;
    (await calculatePropertiesUseCase(RatingParams(ratingEntity: rating))).fold(
      (l) {
        emit(RatingMenuFailure());
        return;
      },
      (r) => props = r,
    );

    emit(
      RatingMenuLoaded(
        memoPropertiesEntity: props,
      ),
    );
  }
}
