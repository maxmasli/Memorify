import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'training_menu_event.dart';

part 'training_menu_state.dart';

class TrainingMenuBloc extends Bloc<TrainingMenuEvent, TrainingMenuState> {
  TrainingMenuBloc() : super(const TrainingMenuState(time: 0, wordCount: 0)) {
    on<SetWordCountEvent>(_setWordCount);
    on<SetTimeEvent>(_setTime);
  }

  Future<void> _setWordCount(
    SetWordCountEvent event,
    Emitter<TrainingMenuState> emit,
  ) async {
    if (event.value.isEmpty) {
      emit(state.copyWith(wordCount: 0));
      return;
    }
    final intValue = int.tryParse(event.value);
    assert(intValue != null, 'Failed to parse to int: ${event.value}');
    emit(state.copyWith(wordCount: intValue));
  }

  Future<void> _setTime(
    SetTimeEvent event,
    Emitter<TrainingMenuState> emit,
  ) async {
    if (event.value.isEmpty) {
      emit(state.copyWith(time: 0));
      return;
    }
    final intValue = int.tryParse(event.value);
    assert(intValue != null, 'Failed to parse to int: ${event.value}');
    emit(state.copyWith(time: intValue));
  }
}
