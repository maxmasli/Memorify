part of 'training_menu_bloc.dart';

class TrainingMenuState extends Equatable {
  const TrainingMenuState({
    required this.wordCount,
    required this.time,
    this.wordCountError,
    this.timeError,
  });

  final int wordCount;
  final int time;

  final String? wordCountError;
  final String? timeError;

  TrainingMenuState nullWordCountError() {
    return TrainingMenuState(
      wordCount: wordCount,
      time: time,
      wordCountError: null,
      timeError: timeError,
    );
  }

  TrainingMenuState nullTimeError() {
    return TrainingMenuState(
      wordCount: wordCount,
      time: time,
      wordCountError: wordCountError,
      timeError: null,
    );
  }

  TrainingMenuState copyWith({
    int? wordCount,
    int? time,
    String? wordCountError,
    String? timeError,
  }) {
    return TrainingMenuState(
      wordCount: wordCount ?? this.wordCount,
      time: time ?? this.time,
      wordCountError: wordCountError ?? this.wordCountError,
      timeError: timeError ?? this.timeError,
    );
  }

  @override
  List<Object?> get props => [wordCount, time, wordCountError, timeError];
}
