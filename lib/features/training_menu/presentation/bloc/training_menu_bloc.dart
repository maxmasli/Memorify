import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memorify/core/domain/entities/memo_properties_entity.dart';
import 'package:memorify/core/string/app_strings.dart';
import 'package:memorify/di.dart';
import 'package:memorify/router.dart';

part 'training_menu_event.dart';

part 'training_menu_state.dart';

class TrainingMenuBloc extends Bloc<TrainingMenuEvent, TrainingMenuState> {
  TrainingMenuBloc() : super(const TrainingMenuState(time: 0, wordCount: 0)) {
    on<SetWordCountEvent>(_setWordCount);
    on<SetTimeEvent>(_setTime);
    on<StartGameEvent>(_startGame);
  }

  Future<void> _setWordCount(
    SetWordCountEvent event,
    Emitter<TrainingMenuState> emit,
  ) async {
    if (event.value.isEmpty) {
      emit(state.copyWith(wordCount: 0).nullWordCountError());
      return;
    }
    final intValue = int.tryParse(event.value);
    assert(intValue != null, 'Failed to parse to int: ${event.value}');
    emit(state.copyWith(wordCount: intValue).nullWordCountError());
  }

  Future<void> _setTime(
    SetTimeEvent event,
    Emitter<TrainingMenuState> emit,
  ) async {
    if (event.value.isEmpty) {
      emit(state.copyWith(time: 0).nullTimeError());
      return;
    }
    final intValue = int.tryParse(event.value);
    assert(intValue != null, 'Failed to parse to int: ${event.value}');
    emit(state.copyWith(time: intValue).nullTimeError());
  }

  Future<void> _startGame(
    StartGameEvent event,
    Emitter<TrainingMenuState> emit,
  ) async {
    String? wordCountError;
    String? timeError;
    var hasError = false;
    if (state.wordCount == 0) {
      wordCountError = AppStrings.wordCountError;
      hasError = true;
    }
    if (state.time == 0) {
      timeError = AppStrings.timeError;
      hasError = true;
    }

    if (hasError) {
      emit(
        state.copyWith(wordCountError: wordCountError, timeError: timeError),
      );
    } else {
      final props = MemoPropertiesEntity(
        wordsCount: state.wordCount,
        time: state.time,
        isRating: false,
      );
      await getIt<AppRouter>()
          .push(MemoryGameRoute(memoPropertiesEntity: props));
    }
  }
}
