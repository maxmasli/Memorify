import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memorify/core/domain/entities/memo_properties_entity.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';

part 'memory_game_event.dart';

part 'memory_game_state.dart';

class MemoryGameBloc extends Bloc<MemoryGameEvent, MemoryGameState> {
  MemoryGameBloc() : super(MemoryGameInitial()) {
    on<GenerateWordsEvent>(_generateWords);
  }

  int timePassed = 0;
  Timer? timer;

  Future<void> _generateWords(
    GenerateWordsEvent event,
    Emitter<MemoryGameState> emit,
  ) async {
    emit(MemoryGameLoading());
    final props = event.memoPropertiesEntity;
    final words = [
      const WordEntity(word: 'asdsad'),
      const WordEntity(word: 'kal'),
      const WordEntity(word: 'loh'),
      const WordEntity(word: 'kal'),
      const WordEntity(word: 'popsaod'),
      const WordEntity(word: 'popsaod'),
      const WordEntity(word: 'popsaod'),
      const WordEntity(word: 'popsaod'),
      const WordEntity(word: 'popsaod'),
      const WordEntity(word: 'popsaod'),
      const WordEntity(word: 'popsaod'),
      const WordEntity(word: 'popsaod'),
      const WordEntity(word: 'popsaod'),
      const WordEntity(word: 'popsaod'),
    ];
    emit(
      MemoryGameLoaded(
        memoPropertiesEntity: props,
        words: words,
        timeLeft: props.time,
      ),
    );
    //_startTimer(props.time);
    _startTimer(1000);
  }

  void _startTimer(int time) {
    timePassed = 0;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timePassed++;
      if (state is MemoryGameLoaded) {
        emit((state as MemoryGameLoaded).copyWith(timeLeft: time - timePassed));
      }
      if (timePassed >= time) {
        timer.cancel();
      }
    });
  }
}
