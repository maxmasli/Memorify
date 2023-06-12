part of 'training_menu_bloc.dart';

abstract class TrainingMenuEvent extends Equatable {
  const TrainingMenuEvent();
}

class SetWordCountEvent extends TrainingMenuEvent {
  const SetWordCountEvent({
    required this.value,
  });

  final String value;

  @override
  List<Object> get props => [value];
}

class SetTimeEvent extends TrainingMenuEvent {
  const SetTimeEvent({
    required this.value,
  });

  final String value;

  @override
  List<Object> get props => [value];
}
