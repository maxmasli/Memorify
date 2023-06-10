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
  }

  Future<void> _loadProps(
    LoadPropsEvent event,
    Emitter<MemoryCheckState> emit,
  ) async {
    emit(
      MemoryCheckLoaded(
        memoPropertiesEntity: event.memoPropertiesEntity,
        wordsList: event.wordsList,
      ),
    );
  }
}
