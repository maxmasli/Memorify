part of 'memory_game_bloc.dart';

abstract class MemoryGameState extends Equatable {
  const MemoryGameState();
}

class MemoryGameInitial extends MemoryGameState {
  @override
  List<Object> get props => [];
}

class MemoryGameLoading extends MemoryGameState {
  @override
  List<Object> get props => [];
}

class MemoryGameLoaded extends MemoryGameState {
  const MemoryGameLoaded({
    required this.memoPropertiesEntity,
    required this.wordsList,
    required this.timeLeft,
  });

  final MemoPropertiesEntity memoPropertiesEntity;
  final List<WordEntity> wordsList;
  final int timeLeft;

  @override
  List<Object> get props => [memoPropertiesEntity, wordsList, timeLeft];

  MemoryGameLoaded copyWith({
    MemoPropertiesEntity? memoPropertiesEntity,
    List<WordEntity>? words,
    int? timeLeft,
  }) {
    return MemoryGameLoaded(
      memoPropertiesEntity: memoPropertiesEntity ?? this.memoPropertiesEntity,
      wordsList: words ?? this.wordsList,
      timeLeft: timeLeft ?? this.timeLeft,
    );
  }
}

class MemoryGameFailure extends MemoryGameState {
  @override
  List<Object?> get props => [];
}
