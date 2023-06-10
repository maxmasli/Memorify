part of 'memory_game_bloc.dart';

abstract class MemoryGameEvent extends Equatable {
  const MemoryGameEvent();
}

class GenerateWordsEvent extends MemoryGameEvent {

  const GenerateWordsEvent({
    required this.memoPropertiesEntity,
  });

  final MemoPropertiesEntity memoPropertiesEntity;

  @override
  List<Object> get props => [];
}

class StopMemoryEvent extends MemoryGameEvent {
  @override
  List<Object> get props => [];
}
