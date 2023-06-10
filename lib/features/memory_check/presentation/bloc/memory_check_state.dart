part of 'memory_check_bloc.dart';

abstract class MemoryCheckState extends Equatable {
  const MemoryCheckState();
}

class MemoryCheckInitial extends MemoryCheckState {
  @override
  List<Object> get props => [];
}

class MemoryCheckLoaded extends MemoryCheckState {
  const MemoryCheckLoaded({
    required this.memoPropertiesEntity,
    required this.wordsList,
    required this.answerWordsList,
  });

  final MemoPropertiesEntity memoPropertiesEntity;
  final List<WordEntity> wordsList;
  final List<WordEntity> answerWordsList;

  MemoryCheckLoaded copyWith({
    MemoPropertiesEntity? memoPropertiesEntity,
    List<WordEntity>? wordsList,
    List<WordEntity>? answerWordsList,
  }) {
    return MemoryCheckLoaded(
      memoPropertiesEntity: memoPropertiesEntity ?? this.memoPropertiesEntity,
      wordsList: wordsList ?? this.wordsList,
      answerWordsList: answerWordsList ?? this.answerWordsList,
    );
  }

  @override
  List<Object> get props => [memoPropertiesEntity, wordsList, answerWordsList];

}

