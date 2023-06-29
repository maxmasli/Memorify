import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memorify/core/domain/entities/memo_properties_entity.dart';
import 'package:memorify/core/domain/entities/rating_entity.dart';
import 'package:memorify/core/domain/entities/result_entity.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';
import 'package:memorify/di.dart';
import 'package:memorify/features/rating_menu/domain/use_cases/calculate_properties_use_case.dart';
import 'package:memorify/features/results/domain/entity/result_word_entity.dart';
import 'package:memorify/features/results/domain/use_cases/calculate_obtained_rating_use_case.dart';
import 'package:memorify/features/results/domain/use_cases/compare_words_use_case.dart';
import 'package:memorify/features/results/domain/use_cases/save_rating_use_case.dart';

part 'results_event.dart';

part 'results_state.dart';

class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
  ResultsBloc() : super(ResultsInitial()) {
    on<SaveResultsEvent>(_saveResultsEvent);
  }

  final compareWordUseCase = getIt<CompareWordsUseCase>();
  final calculateObtainedRatingUseCase =
      getIt<CalculateObtainedRatingUseCase>();
  final saveRatingUseCase = getIt<SaveRatingUseCase>();

  Future<void> _saveResultsEvent(
    SaveResultsEvent event,
    Emitter<ResultsState> emit,
  ) async {
    emit(ResultsLoading());

    final resultEither = await compareWordUseCase(
      WordListCompareParam(
        a: event.wordsList,
        b: event.answerWordsList,
      ),
    );
    late ResultEntity resultEntity;
    resultEither.fold(
      (l) {
        emit(ResultsFailure());
        return;
      },
      (r) => resultEntity = r,
    );

    final obtainedRatingEither = await calculateObtainedRatingUseCase(
      ResultParam(resultEntity: resultEntity),
    );
    late RatingEntity obtainedRating;
    obtainedRatingEither.fold(
      (l) {
        emit(ResultsFailure());
        return;
      },
      (r) => obtainedRating = r,
    );

    final resultWords = List.generate(
      event.wordsList.length,
      (index) => ResultWordEntity(
        word: event.wordsList[index],
        answerWord: event.answerWordsList[index],
      ),
    );

    if (event.memoPropertiesEntity.isRating) {
      assert(
        event.memoPropertiesEntity.ratingEntity != null,
        'isRating = true, but ratingEntity == null',
      );

      final updatedRating = obtainedRating.rating +
          event.memoPropertiesEntity.ratingEntity!.rating;

      late RatingEntity updatedRatingEntity;
      if (updatedRating < 0) {
        updatedRatingEntity = const RatingEntity(rating: 0);
      } else {
        updatedRatingEntity = RatingEntity(rating: updatedRating);
      }
      await saveRatingUseCase(RatingParams(ratingEntity: updatedRatingEntity));

      emit(
        ResultsLoaded(
          memoPropertiesEntity: event.memoPropertiesEntity,
          resultEntity: resultEntity,
          rating: updatedRatingEntity,
          resultWords: resultWords,
          obtainedRating: obtainedRating,
        ),
      );
    } else {
      // game not ranked
      emit(
        ResultsLoaded(
          memoPropertiesEntity: event.memoPropertiesEntity,
          resultWords: resultWords,
          resultEntity: resultEntity,
        ),
      );
    }
  }
}
