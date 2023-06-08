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
    required this.words,
    required this.timeLeft,
  });

  final MemoPropertiesEntity memoPropertiesEntity;
  final List<WordEntity> words;
  final int timeLeft;

  @override
  List<Object> get props => [memoPropertiesEntity, words, timeLeft];

  MemoryGameLoaded copyWith({
    MemoPropertiesEntity? memoPropertiesEntity,
    List<WordEntity>? words,
    int? timeLeft,
  }) {
    return MemoryGameLoaded(
      memoPropertiesEntity: memoPropertiesEntity ?? this.memoPropertiesEntity,
      words: words ?? this.words,
      timeLeft: timeLeft ?? this.timeLeft,
    );
  }
}

class MemoryGameFailure extends MemoryGameState {
  @override
  List<Object?> get props => [];
}
