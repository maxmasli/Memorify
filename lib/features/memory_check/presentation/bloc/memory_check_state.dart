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
  });

  final MemoPropertiesEntity memoPropertiesEntity;
  final List<WordEntity> wordsList;

  @override
  List<Object> get props => [memoPropertiesEntity, wordsList];
}

