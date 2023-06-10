import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memorify/core/domain/entities/memo_properties_entity.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';
import 'package:memorify/di.dart';
import 'package:memorify/features/memory_game/domain/use_cases/generate_words_use_case.dart';

part 'memory_game_event.dart';

part 'memory_game_state.dart';

class MemoryGameBloc extends Bloc<MemoryGameEvent, MemoryGameState> {
  MemoryGameBloc() : super(MemoryGameInitial()) {
    on<GenerateWordsEvent>(_generateWords);
    on<StopMemoryEvent>(_stopMemory);
  }

  int _timePassed = 0;
  Timer? _timer;

  final GenerateWordsUseCase _generateWordsUseCase =
      getIt<GenerateWordsUseCase>();

  Future<void> _generateWords(
    GenerateWordsEvent event,
    Emitter<MemoryGameState> emit,
  ) async {
    emit(MemoryGameLoading());
    final props = event.memoPropertiesEntity;
    final words =
        await _generateWordsUseCase(CountParams(count: props.wordsCount));

    words.fold(
      (l) => emit(MemoryGameFailure()),
      (r) {
        emit(
          MemoryGameLoaded(
            memoPropertiesEntity: props,
            words: r,
            timeLeft: props.time,
          ),
        );
        _startTimer(props.time);
      },
    );

    //_startTimer(1000);
  }

  void _startTimer(int time) {
    _timePassed = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _timePassed++;
      if (state is MemoryGameLoaded) {
        emit(
            (state as MemoryGameLoaded).copyWith(timeLeft: time - _timePassed));
      }
      if (_timePassed >= time) {
        timer.cancel();
      }
    });
  }

  Future<void> _stopMemory(
    StopMemoryEvent event,
    Emitter<MemoryGameState> emit,
  ) async {
    _timer?.cancel();
  }
}
