part of 'training_menu_bloc.dart';

class TrainingMenuState extends Equatable {
  const TrainingMenuState({
    required this.wordCount,
    required this.time,
  });

  final int wordCount;
  final int time;

  TrainingMenuState copyWith({
    int? wordCount,
    int? time,
  }) {
    return TrainingMenuState(
      wordCount: wordCount ?? this.wordCount,
      time: time ?? this.time,
    );
  }

  @override
  List<Object> get props => [wordCount, time];
}
