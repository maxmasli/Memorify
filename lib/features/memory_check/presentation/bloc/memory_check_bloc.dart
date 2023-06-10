import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:memorify/core/domain/entities/memo_properties_entity.dart';
import 'package:memorify/core/domain/entities/word_entity.dart';

part 'memory_check_event.dart';
part 'memory_check_state.dart';

class MemoryCheckBloc extends Bloc<MemoryCheckEvent, MemoryCheckState> {
  MemoryCheckBloc() : super(MemoryCheckInitial()) {
    on<LoadPropsEvent>(_loadProps);
    on<WordChangedEvent>(_wordChanged);
  }

  Future<void> _loadProps(
    LoadPropsEvent event,
    Emitter<MemoryCheckState> emit,
  ) async {
    emit(
      MemoryCheckLoaded(
        memoPropertiesEntity: event.memoPropertiesEntity,
        wordsList: event.wordsList,
        answerWordsList: List.generate(
          event.memoPropertiesEntity.wordsCount,
          (index) => const WordEntity(word: ''),
        ),
      ),
    );
  }

  Future<void> _wordChanged(
    WordChangedEvent event,
    Emitter<MemoryCheckState> emit,
  ) async {
    if (state is MemoryCheckLoaded) {
      final index = event.index;
      final changedWord = event.word;
      final st = state as MemoryCheckLoaded;
      emit(
        st.copyWith(
          answerWordsList: st.answerWordsList
            ..[index] = WordEntity(
              word: changedWord,
            ),
        ),
      );
    }
  }
}
