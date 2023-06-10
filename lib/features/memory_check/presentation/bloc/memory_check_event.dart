part of 'memory_check_bloc.dart';

abstract class MemoryCheckEvent extends Equatable {
  const MemoryCheckEvent();
}

class LoadPropsEvent extends MemoryCheckEvent {
  const LoadPropsEvent({
    required this.memoPropertiesEntity,
    required this.wordsList,
  });

  final MemoPropertiesEntity memoPropertiesEntity;
  final List<WordEntity> wordsList;

  @override
  List<Object> get props => [memoPropertiesEntity, wordsList];
}
